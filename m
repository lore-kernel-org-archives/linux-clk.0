Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D4043D4E6
	for <linux-clk@vger.kernel.org>; Fri,  5 Jun 2026 07:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780645343; cv=none; b=lB3OKkfN5cBr91Mj6q1br8F2HPysrHfnRMtFiPw5X3jAW7qecmMq5XmY9TBbUnSQArLb6P6m/U8K6+CmBErz+2FTnh/+V38YSpl13HBmwY6QKJdsehWteg3wS+hfpvMvwthPZjknb2N/+2p4XZzYkI1z9T9g3lMS6bSQLehU7tE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780645343; c=relaxed/simple;
	bh=e5UX+o3Ku7JIQHG4csWXu1S6QXVTcVMCPLgKWMI7c8Y=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Vtz6duzyzDU1NTUWeVhXEiosmfqR1oCXM5+7ezO0+OlGs/Qqei9Sgur+1MDpUBiPK1Utp45h05UNYCec99/7cNic+pvI/QpDG9tx4iftbaW08SiBox4xuCVudW5n9YiOuFtViMvnJ7FC5UMl4j8AMPMlOwDSpyc/mcZe6Yd0bqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wVPBx-0001an-EM; Fri, 05 Jun 2026 09:42:09 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wVPBw-001Cpv-25;
	Fri, 05 Jun 2026 09:42:08 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wVPBw-000000002rx-2NXJ;
	Fri, 05 Jun 2026 09:42:08 +0200
Message-ID: <78e26b2459b89b107b24bf9f86d251ba16be3848.camel@pengutronix.de>
Subject: Re: [PATCH v2 4/5] clk: cix: add sky1 audss clock controller
From: Philipp Zabel <p.zabel@pengutronix.de>
To: joakim.zhang@cixtech.com, mturquette@baylibre.com, sboyd@kernel.org, 
	bmasney@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, 	gary.yang@cixtech.com
Cc: cix-kernel-upstream@cixtech.com, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Date: Fri, 05 Jun 2026 09:42:08 +0200
In-Reply-To: <20260605032225.523669-5-joakim.zhang@cixtech.com>
References: <20260605032225.523669-1-joakim.zhang@cixtech.com>
	 <20260605032225.523669-5-joakim.zhang@cixtech.com>
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

On Fr, 2026-06-05 at 11:22 +0800, joakim.zhang@cixtech.com wrote:
> From: Joakim Zhang <joakim.zhang@cixtech.com>
>=20
> Add a platform driver for the Cix Sky1 Audio Subsystem (AUDSS) internal
> clock controller. The driver binds to a cix,sky1-audss-clock device tree
> node under the AUDSS syscon, obtains the parent regmap via
> syscon_node_to_regmap(), and registers mux/divider/gate composite clocks
> for DSP, SRAM, HDA, DMAC, watchdog, timer, mailbox and I2S outputs. Six
> SoC-level audio reference clocks are brought up as inputs to the tree.
>=20
> Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
> ---
>  drivers/clk/Kconfig              |    1 +
>  drivers/clk/Makefile             |    1 +
>  drivers/clk/cix/Kconfig          |   16 +
>  drivers/clk/cix/Makefile         |    3 +
>  drivers/clk/cix/clk-sky1-audss.c | 1129 ++++++++++++++++++++++++++++++
>  5 files changed, 1150 insertions(+)
>  create mode 100644 drivers/clk/cix/Kconfig
>  create mode 100644 drivers/clk/cix/Makefile
>  create mode 100644 drivers/clk/cix/clk-sky1-audss.c
>=20
[...]
> diff --git a/drivers/clk/cix/clk-sky1-audss.c b/drivers/clk/cix/clk-sky1-=
audss.c
> new file mode 100644
> index 000000000000..899452d5ed14
> --- /dev/null
> +++ b/drivers/clk/cix/clk-sky1-audss.c
> @@ -0,0 +1,1129 @@
[...]
> +/* register sky1 audio subsystem clocks */
> +static int sky1_audss_clk_probe(struct platform_device *pdev)
> +{
> +	const struct sky1_audss_clks_devtype_data *devtype_data;
> +	struct sky1_audss_clks_priv *priv;
> +	struct device_node *parent_np;
> +	struct device *dev =3D &pdev->dev;
> +	struct reset_control *rst_noc;
> +	struct clk_hw **clk_table;
> +	struct regmap *regmap_cru;
> +	int i, ret;
> +
> +	parent_np =3D of_get_parent(pdev->dev.of_node);
> +	regmap_cru =3D syscon_node_to_regmap(parent_np);
> +	of_node_put(parent_np);
> +	if (IS_ERR(regmap_cru))
> +		return dev_err_probe(dev, PTR_ERR(regmap_cru),
> +				     "unable to get audss cru regmap");
> +
> +	devtype_data =3D device_get_match_data(dev);
> +	if (!devtype_data)
> +		return -ENODEV;
> +
> +	priv =3D devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	spin_lock_init(&priv->lock);
> +
> +	priv->clk_data =3D devm_kzalloc(&pdev->dev,
> +				      struct_size(priv->clk_data, hws, AUDSS_MAX_CLKS),
> +				      GFP_KERNEL);
> +	if (!priv->clk_data)
> +		return -ENOMEM;
> +
> +	priv->clk_data->num =3D AUDSS_MAX_CLKS;
> +	clk_table =3D priv->clk_data->hws;
> +
> +	priv->dev =3D dev;
> +	priv->regmap_cru =3D regmap_cru;
> +	priv->devtype_data =3D devtype_data;
> +
> +	ret =3D sky1_audss_clks_get(priv);
> +	if (ret)
> +		return ret;
> +
> +	rst_noc =3D devm_reset_control_get(dev, NULL);

Please use devm_reset_control_get_exclusive() directly.

[...]
> +static int __maybe_unused sky1_audss_clk_runtime_suspend(struct device *=
dev)
> +{
> +	struct sky1_audss_clks_priv *priv =3D dev_get_drvdata(dev);
> +	const struct sky1_audss_clks_devtype_data *devtype_data =3D priv->devty=
pe_data;
> +	unsigned long flags;
> +	int i;
> +
> +	spin_lock_irqsave(&priv->lock, flags);
> +	for (i =3D 0; i < devtype_data->reg_save_size; i++)
> +		regmap_read(priv->regmap_cru,
> +			    devtype_data->reg_save[i][0], &devtype_data->reg_save[i][1]);
> +	spin_unlock_irqrestore(&priv->lock, flags);
> +
> +	sky1_audss_clks_disable(priv);
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused sky1_audss_clk_runtime_resume(struct device *d=
ev)
> +{
> +	struct sky1_audss_clks_priv *priv =3D dev_get_drvdata(dev);
> +	const struct sky1_audss_clks_devtype_data *devtype_data =3D priv->devty=
pe_data;
> +	unsigned long flags;
> +	int i, ret;
> +
> +	ret =3D sky1_audss_clks_enable(priv);
> +	if (ret) {
> +		dev_err(dev, "failed to enable clocks\n");
> +		return ret;
> +	}
> +
> +	reset_control_deassert(priv->rst_noc);

Deasserted on resume but not asserted on suspend, is this on purpose?

regards
Philipp
