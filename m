Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5A7390220
	for <linux-clk@vger.kernel.org>; Wed,  8 Apr 2026 09:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775639968; cv=none; b=YlHzEmgd6FiyJ/bsB/bMbIicwcPU5TkdgEcU9JHfCFmAyOPLobnelnDGFQ3gOgowh2VC6wKiNJPLMUOHARbP1zOPOsDmPFAbFd1HfCYWS9joYkTiIaTKCRx/8quf6YxaLpmeTVXwPyQac076U2x0g7nje1xJ9HQHrnW5bk60Z1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775639968; c=relaxed/simple;
	bh=BPgXj+sJRlfZoWE+gKU2Z0yrWHn8FJfF/+ZjKZA2Tk0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hH+6ahqrS1AAaS69nRlUc0a1kp0knHpSkj8cMqTGPSa7zl+YVkjysARjD5qdfU5sImwK2236J+sgpKTVkHV1Mpx060S34GInm/7JHVznCkl9qAOwJZUSA9wMFgxrnz51fmRzDqGHcyVupc9vLTvvwxiV4SPvOnN/wRVoCdssM/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wAP48-00034B-2A; Wed, 08 Apr 2026 11:19:16 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wAP47-004KKS-0I;
	Wed, 08 Apr 2026 11:19:15 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wAP47-000000007MM-00EF;
	Wed, 08 Apr 2026 11:19:15 +0200
Message-ID: <883ab53ae7e7ce3b894fef10e982deb1ea24c872.camel@pengutronix.de>
Subject: Re: [PATCH 3/3] reset: eswin: Add eic7700 HSP reset driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: dongxuyang@eswincomputing.com, mturquette@baylibre.com,
 sboyd@kernel.org, 	robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, 	linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 huangyifeng@eswincomputing.com
Cc: ningyu@eswincomputing.com, linmin@eswincomputing.com, 
	pinkesh.vaghela@einfochips.com
Date: Wed, 08 Apr 2026 11:19:14 +0200
In-Reply-To: <20260403093628.780-1-dongxuyang@eswincomputing.com>
References: <20260403093459.612-1-dongxuyang@eswincomputing.com>
	 <20260403093628.780-1-dongxuyang@eswincomputing.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org

On Fr, 2026-04-03 at 17:36 +0800, dongxuyang@eswincomputing.com wrote:
> From: Xuyang Dong <dongxuyang@eswincomputing.com>
>=20
> Add auxiliary driver to support ESWIN EIC7700 high-speed peripherals
> system. The reset controller is created using the auxiliary device
> framework and set up in the clock driver.
>=20
> Signed-off-by: Xuyang Dong <dongxuyang@eswincomputing.com>
> ---
>  drivers/reset/Kconfig             |  13 +++
>  drivers/reset/Makefile            |   1 +
>  drivers/reset/reset-eic7700-hsp.c | 151 ++++++++++++++++++++++++++++++
>  3 files changed, 165 insertions(+)
>  create mode 100644 drivers/reset/reset-eic7700-hsp.c
>=20
> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> index 7ce151f6a7e4..50bb0cd069ba 100644
> --- a/drivers/reset/Kconfig
> +++ b/drivers/reset/Kconfig
> @@ -83,6 +83,19 @@ config RESET_EIC7700
>  	  The driver supports eic7700 series chips and provides functionality f=
or
>  	  asserting and deasserting resets on the chip.
> =20
> +config RESET_EIC7700_HSP
> +	tristate "EIC7700 HSP Reset controller"
> +	depends on ARCH_ESWIN || COMPILE_TEST
> +	depends on COMMON_CLK_EIC7700_HSP

Why?

Please make this buildable under COMPILE_TEST without enabling the
clock driver.

[...]
> diff --git a/drivers/reset/reset-eic7700-hsp.c b/drivers/reset/reset-eic7=
700-hsp.c
> new file mode 100644
> index 000000000000..fe9822078bcc
> --- /dev/null
> +++ b/drivers/reset/reset-eic7700-hsp.c
> @@ -0,0 +1,151 @@
[...]
> +static int eic7700_hsp_reset_assert(struct reset_controller_dev *rcdev,
> +				    unsigned long id)
> +{
> +	struct eic7700_hsp_reset_data *data =3D to_eic7700_hsp_reset(rcdev);
> +	int ret;
> +
> +	if (eic7700_hsp_reset[id].active_low)
> +		ret =3D regmap_clear_bits(data->regmap, eic7700_hsp_reset[id].reg,
> +					eic7700_hsp_reset[id].bit);
> +	else
> +		ret =3D regmap_set_bits(data->regmap, eic7700_hsp_reset[id].reg,
> +				      eic7700_hsp_reset[id].bit);

This is essentially regmap_assign_bits() open-coded.

> +
> +	return ret;
> +}
> +
> +static int eic7700_hsp_reset_deassert(struct reset_controller_dev *rcdev=
,
> +				      unsigned long id)
> +{
> +	struct eic7700_hsp_reset_data *data =3D to_eic7700_hsp_reset(rcdev);
> +	int ret;
> +
> +	if (eic7700_hsp_reset[id].active_low)
> +		ret =3D regmap_set_bits(data->regmap, eic7700_hsp_reset[id].reg,
> +				      eic7700_hsp_reset[id].bit);
> +	else
> +		ret =3D regmap_clear_bits(data->regmap, eic7700_hsp_reset[id].reg,
> +					eic7700_hsp_reset[id].bit);

Same as above.

> +
> +	return ret;
> +}
> +
> +static int eic7700_hsp_reset_reset(struct reset_controller_dev *rcdev,
> +				   unsigned long id)
> +{
> +	int ret;
> +
> +	ret =3D eic7700_hsp_reset_assert(rcdev, id);
> +	if (ret)
> +		return ret;
> +
> +	usleep_range(10, 15);
> +
> +	return eic7700_hsp_reset_deassert(rcdev, id);
> +}

Does any of the consumer drivers (SATA, USB) actually use
reset_control_reset()? If not, don't implement this.

> +
> +static const struct reset_control_ops eic7700_hsp_reset_ops =3D {
> +	.reset =3D eic7700_hsp_reset_reset,
> +	.assert =3D eic7700_hsp_reset_assert,
> +	.deassert =3D eic7700_hsp_reset_deassert,
> +};
> +
> +static int eic7700_hsp_reset_probe(struct auxiliary_device *adev,
> +				   const struct auxiliary_device_id *id)
> +{
> +	struct eic7700_hsp_reset_data *data;
> +	struct device *dev =3D &adev->dev;
> +
> +	data =3D devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->regmap =3D devm_regmap_init_mmio
> +			(dev, (__force void __iomem *)adev->dev.platform_data,

Consider letting the parent clk driver create the regmap und using
dev_get_regmap().

> +			&eic7700_hsp_regmap_config);
> +	if (IS_ERR(data->regmap))
> +		return dev_err_probe(dev, PTR_ERR(data->regmap),
> +				     "failed to get regmap!\n");
> +
> +	data->rcdev.owner =3D THIS_MODULE;
> +	data->rcdev.ops =3D &eic7700_hsp_reset_ops;
> +	data->rcdev.of_node =3D dev->parent->of_node;
> +	data->rcdev.of_reset_n_cells =3D 1;

No need to set of_reset_n_cells, this value is ignored if of_xlate
isn't also set.

regards
Philipp
