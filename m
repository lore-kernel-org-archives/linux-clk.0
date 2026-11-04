Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793785753;
	b=v9RHB53CrxZsU5ho7VsYJH6bjyi8K1qvfMhQ3zTT66g1dw98eL2b2Y7DV/A2BSdsE4RQ
	 jq3YMsqsrpdkcBhz9hEe82LhFUy3K5HLoy8rhKdYAUyg1wFf3Zxkiu2OmRw4Sdb08j70W
	 JG40MXY8Y4ZEqxDvwXfR1U7xf8/kp9bSgBzBqGEzrnf/bn7plOAL/bHYbORtgFSa9f2BN
	 ISAk34Qi5kYtbl+5P/R7ej55lwrJVEUnf3rSJPcf2xSq5M6hRexJrRMBERM6je7mJrzUg
	 JMH0IrdkgAakdkuoubzt9bsICvA4UlPIOqppsOGgl8MFv14BVlVXnS4yA5Pawze04gg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793785753;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=QvnqhMiQKHRR27GMYC+YdENygmxCKW4KOUosSBxSS88=;
	b=j6FYn/q+yngLaDD5kFFO1YMgtTpOeh6WPW9GJWnHAjg64dbxRKO96FV2w2B51wBAORZO
	 EPoTfMtWBSNG+ZKzhZ/jxYrg5xvPGXyZuiAL49A3mYMn19Qtbe6X8RlJibNU7q9QIsgoE
	 L6yBr8cg/I3lyAgJpo69Z/Kx+BRBe+NS5HT+CNqCBqw7nVHuZgtlTof3qaAarJV3mb1/l
	 dESMXdtpn4ezau9Mp8i2MCR9x5Tfw/rkJghFBli/vjN9bqFreiJIhAL/PD1mzg+0Tm5I0
	 BUOT78XRPOsnhiw+ggxKrUsgdjua7TLaLuLDokBU6sM7UqTboHuufm/TC2L8nvWQMzg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=IkfaS74c;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E03606A31B;
	Wed,  4 Nov 2026 09:49:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18E03606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=IkfaS74c
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 65847200B28;
	Wed, 04 Nov 2026 10:49:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793785748;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QvnqhMiQKHRR27GMYC+YdENygmxCKW4KOUosSBxSS88=;
	b=IkfaS74c65eAhcryPily3TNci+GwLLswrwIgHLKmGkh6XtLSi7UwQWvc7tG8QW38Fftb22
	bUSwln1AZjFvIOwvy/nxy8leW+jinWUhyp2uBonlcX2oituKJDhumLXLgmZ6hN0BzJBaRx
	D18DyM5rtn34BSDD0e6wUZEUz7MqKNxF8FpDyt/vCiovThE7XHNTwKSBYGigyoXR7ObCNq
	9oVFRCSOztP61HTOTXY3corPxyKQHOzc7mldiRSG+7KfpLiWd4GMnUhuqBS5v/fSWK6REV
	CwinXIYMtDL3EP8UyAzVUJUqupPTsPsVXG2mP6UkBbVZDvh0tdghwgzJ/8+XVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793785748;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QvnqhMiQKHRR27GMYC+YdENygmxCKW4KOUosSBxSS88=;
	b=UY68rmlj89SL9bNmW212Hale4W1eQlcxzP8pgvdEVw9xSbBCA2Q1JHbSo2+P6l3H5CtGed
	EFEaLSuh9gJUmZJQWbHYx58DW7lS3FKcdK7Ka5qg/+7/ZXpJB1rqqvwOoOUtHlQnWPkxl7
	zsQd1yILz6/d+qnd8dc1Xw7XRFyn7mHDItJVPAnPu1XED60PKrilpBFYaBSL3KXYBNm5Ux
	nKwhnVRx5bx6P87n+kb/TBn42OEROcTLoA36FbbwmxkhyX8rOgIcEAfrSt4MObO8Ae/G2Z
	gQdrFtIVocRRG9OARVMZPZ2G4vpQEVIizU3J4WSbH/1Vy1qWQiQaDpwJdkqUXw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1793785748; a=rsa-sha256;
	cv=none;
	b=eA9bFlkYULuczfBtzogxkGzAgRbJbmGzr7VDRWd/stxclJjCpVXH6xt+wr1EqVpwST16dq
	hO9p1dOSCGRc94Gbgi3BnlQwHTrZChRT/TkJlyKpg5SonHaXUQK0Q4QG0lbDYFZ39/ieeJ
	vBkfayiqjcuNRZFilSPJ+7JJT9IpmIZTQf0hyASn6yFGI38sNqBhKVPIgJbaeFjP0igY3B
	Bt62ZpiASMVFtm6sz8hGe7P3bTa9GqfrjD+ee2CCnCdh7XGw8oLXZpoJXYRZ4V3UUVIBtR
	+Mxb6MFCfSlBtMk1NOmIt340QO1oajx878JOlDCwOKWNO6wvRVtxiZ86jSfWIQ==
Message-ID: <783234169f479ba1e8c4dd19896de1cd4755eec1.camel@pengutronix.de>
Subject: Re: [PATCH 4/4] reset: toshiba: introduce a TC9564 SoC reset driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Alex Elder <elder@riscstar.com>, sboyd@kernel.org,
 bmasney+clk@redhat.com, 	jbrunet+clk@baylibre.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org
Cc: daniel@riscstar.com, mohd.anwar@oss.qualcomm.com, 
	lorenzo.bianconi@oss.qualcomm.com, fabrice.gasnier@foss.st.com, 
	alexandre.torgue@foss.st.com, marex@nabladev.com, 
	changhuang.liang@starfivetech.com, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Wed, 04 Nov 2026 10:49:08 +0100
In-Reply-To: <20261104004332.2141282-5-elder@riscstar.com>
References: <20261104004332.2141282-1-elder@riscstar.com>
	 <20261104004332.2141282-5-elder@riscstar.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Di, 2026-11-03 at 18:43 -0600, Alex Elder wrote:
> Define a new platform driver that manages reset signals implemented by
> the Toshiba TC9564 SoC.  There are 13 reset signals available, but
> currently only the resets that are (or will soon be) used are defined
> to be controllable.
>=20
> Two registers manage the state of the resets.  The registers are
> accessed via a regmap supplied by a system controller.  Access to
> the memory region is provided via a BAR on a PCIe endpoint function
> embedded in the TC9564 SoC.
>=20
> Co-developed-by: Daniel Thompson <daniel@riscstar.com>
> Signed-off-by: Daniel Thompson <daniel@riscstar.com>
> Signed-off-by: Alex Elder <elder@riscstar.com>
> ---
>  MAINTAINERS                  |   7 ++
>  drivers/reset/Kconfig        |  12 ++++
>  drivers/reset/Makefile       |   1 +
>  drivers/reset/reset-tc9564.c | 135 +++++++++++++++++++++++++++++++++++
>  4 files changed, 155 insertions(+)
>  create mode 100644 drivers/reset/reset-tc9564.c
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ee01aed56508d..8389b11fe6e1a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -28355,6 +28355,13 @@ F:	Documentation/devicetree/bindings/soc/toshiba=
/toshiba,tc9564-config-syscon.ya
>  F:	drivers/soc/toshiba/tc9564-syscon.c
>  F:	include/dt-bindings/soc/toshiba,tc9564.h
> =20
> +TOSHIBA TC9564 RESET DRIVER
> +M:	Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
> +M:	Alex Elder <elder@kernel.org>
> +M:	Daniel Thompson <danielt@kernel.org>
> +S:	Maintained
> +F:	drivers/reset/reset-tc9564.c
> +
>  TOSHIBA WMI HOTKEYS DRIVER
>  M:	Azael Avalos <coproscefalo@gmail.com>
>  L:	platform-driver-x86@vger.kernel.org
> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> index eda9c698a95f3..8c1b08f4eebe6 100644
> --- a/drivers/reset/Kconfig
> +++ b/drivers/reset/Kconfig
> @@ -358,6 +358,18 @@ config RESET_SUNXI
>  	help
>  	  This enables the reset driver for Allwinner SoCs.
> =20
> +config RESET_TC9564
> +	tristate "Toshiba TC9564 reset support"
> +	depends on SOC_TOSHIBA_TC9564_SYSCON
> +	select MFD_SYSCON
> +	default SOC_TOSHIBA_TC9564_SYSCON
> +	help
> +	  This enables support for the reset controller embedded in the
> +	  Toshiba TC9564 SoC.  The state of reset lines is controlled
> +	  via MMIO to a region managed by a system controller; this
> +	  ensures access to the region is coordinated between this and
> +	  the clock and XGMAC (stmmac) drivers.

Drop the second sentence, explaining driver details to a user that just
needs to decide whether to enable the driver or not is not helpful.

> +
>  config RESET_TENSTORRENT_ATLANTIS
>  	tristate "Tenstorrent atlantis reset driver"
>  	depends on ARCH_TENSTORRENT || COMPILE_TEST
> diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
> index 489fafd6bbe3f..6ddded26309ef 100644
> --- a/drivers/reset/Makefile
> +++ b/drivers/reset/Makefile
> @@ -45,6 +45,7 @@ obj-$(CONFIG_RESET_SKY1_AUDSS) +=3D reset-sky1-audss.o
>  obj-$(CONFIG_RESET_SOCFPGA) +=3D reset-socfpga.o
>  obj-$(CONFIG_RESET_SUNPLUS) +=3D reset-sunplus.o
>  obj-$(CONFIG_RESET_SUNXI) +=3D reset-sunxi.o
> +obj-$(CONFIG_RESET_TC9564) +=3D reset-tc9564.o
>  obj-$(CONFIG_RESET_TENSTORRENT_ATLANTIS) +=3D reset-tenstorrent-atlantis=
.o
>  obj-$(CONFIG_RESET_TH1520) +=3D reset-th1520.o
>  obj-$(CONFIG_RESET_TI_SCI) +=3D reset-ti-sci.o
> diff --git a/drivers/reset/reset-tc9564.c b/drivers/reset/reset-tc9564.c
> new file mode 100644
> index 0000000000000..fcd58d5f1962f
> --- /dev/null
> +++ b/drivers/reset/reset-tc9564.c
> @@ -0,0 +1,135 @@
[...]
> +static void reset_manage(struct reset_controller_dev *rcdev,
> +			 unsigned long id, bool assert)
> +{
> +	const struct tc9564_reset *reset =3D &tc9564_reset[id];
> +	struct regmap *regmap =3D dev_get_drvdata(rcdev->dev);
> +	u32 mask =3D reset->mask;
> +
> +	regmap_update_bits(regmap, reset->offset, mask, assert ? mask : 0);

Just propagating the error value ...

> +}
> +
> +static int reset_assert(struct reset_controller_dev *rcdev, unsigned lon=
g id)
> +{
> +	reset_manage(rcdev, id, true);
> +
> +	return 0;

... makes this even shorter.

> +}
> +
> +static int reset_deassert(struct reset_controller_dev *rcdev, unsigned l=
ong id)
> +{
> +	reset_manage(rcdev, id, false);
> +
> +	return 0;
> +}
> +
> +static int reset_status(struct reset_controller_dev *rcdev, unsigned lon=
g id)
> +{
> +	const struct tc9564_reset *reset =3D &tc9564_reset[id];
> +	struct regmap *regmap =3D dev_get_drvdata(rcdev->dev);
> +	u32 val;
> +
> +	regmap_read(regmap, reset->offset, &val);
> +
> +	return val & reset->mask ? 1 : 0;

Consider using regmap_test_bits() here.

> +}
> +
> +static const struct reset_control_ops reset_control_ops =3D {
> +	.assert =3D reset_assert,
> +	.deassert =3D reset_deassert,
> +	.status =3D reset_status,
> +};
> +
> +static int tc9564_reset_probe(struct platform_device *pdev)
> +{
> +	struct reset_controller_dev *rcdev;
> +	struct device *dev =3D &pdev->dev;
> +	struct device_node *parent_np;
> +	struct regmap *regmap;
> +	int ret;
> +
> +	parent_np =3D dev_of_node(dev->parent);
> +	if (!parent_np)
> +		return dev_err_probe(dev, -EINVAL, "no devicetree node\n");
> +
> +	/* Note: MMIO regmap (no error checking needed when used) */

I suggest you just add the unneeded error checks and drop this comment.

> +	regmap =3D device_node_to_regmap(parent_np);

Can't you just use "dev_get_regmap(dev->parent, NULL)" ?

regards
Philipp
