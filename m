Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 924542BFC7B;
	Thu,  3 Sep 2026 23:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788477296; cv=none; b=WjsFiF1S2e+6ELO4+deplUZkjmAx0jVrHFlwiveSsMBwGM43sCGm4W2UVJiamo5O54cAhp0MU74GHcNQsZtsd0JqWixHQ/XrSYYjrHNFilcUMVsarxa0WShdYffFm0LWvoC19XWnMvsJvt5Sr/bhCB8bCcKKlkZeyG1OKid03Xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788477296; c=relaxed/simple;
	bh=CL7iZ/BeTokLaIvZlj0KogQBKIo6IwH0FkJa+50oP3A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ci3JxB4VZUse/u7Y0/xCTBThViI0Ey+IUUjDhBTg0KGqzHnMhAW7Fstd1R4pOZI+vvECZt+VuL6ETA4HnsaouS8GSF4UU89rPX8G1oDJ+Xg+jtiH9IrMbAOjQ5IK6n3+jKpzGXZ4c5Z0+UAKPQ8r31tHNHvTSEBKeL+HEUcAmy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Az3+5AU1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Az3+5AU1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA9321F000E9;
	Thu,  3 Sep 2026 23:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788477295;
	bh=TRghEdnx3gqfkVD9icW/T9NrPQTeDKGKNaNxbM3ms3Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Az3+5AU1F7XcCmlRMAHQb5Xovknp+pMIzADTGe++FapptFEWfUgw3EiqylM8qRRY8
	 q7AzR1n8UzagXe3c4ddk8otpCIgiAoNlXBmNCpYv6m75t70Zkmy2mD5r1berhaJyoK
	 vSYl+Ll4IIPs4GUe+CwCXZyANoItH1akYQtFJs2kL6mgX4LcAgbgQbJA9iaUngzuCW
	 rhJuSfEKRTGmnbFUH4hmSAo6G829Ng9lQyP4Ztsk1iGzQpPgzGdgox1b1SmKu3uSg5
	 erAqpoyylNeiNQUjpijTXL+oZRz8eVXkCUZyMgJv+H9KYjwk7T+uYALpe1LwDdQSaL
	 3PhOLVKzFqBug==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v14 4/4] media: qcom: camss: Add support for PHY API
 devices
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QnJ5YW4gTydEb25vZ2h1ZQ==?= <bryan.odonoghue@linaro.org>
Cc: linux-phy@lists.infradead.org, conor+dt@kernel.org, olteanv@gmail.com, neil.armstrong@linaro.org, devicetree@vger.kernel.org, vkoul@kernel.org, robh@kernel.org, linux-clk@vger.kernel.org, media-ci@linuxtv.org
In-Reply-To: <20260903-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v14-4-01ef1eced075@linaro.org>
References: <20260903-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v14-0-01ef1eced075@linaro.org>
 <20260903-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v14-4-01ef1eced075@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 23:14:54 +0000
Message-Id: <20260903231454.CA9321F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Kconfig symbol `VIDEO_QCOM_CAMSS` selects a non-existent configura=
tion `PHY_QCOM_MIPI_CSI2`.
- [Medium] Missing `phy_exit()` cleanup on error paths leading to leaked PH=
Y hardware state.
- [Medium] Unchecked return value of `phy_mipi_dphy_get_default_config_for_=
hsclk()` leads to uninitialized PHY configuration.
--

commit 23536801ceab899563c72768f20e4c404c373978
Author: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

media: qcom: camss: Add support for PHY API devices

This commit adds the ability to use a PHY pointer which interacts with the
standard PHY API. In the first instance the code will try to use the new
PHY interface, falling back to the legacy method if no PHYs are present in
the DT.

> diff --git a/drivers/media/platform/qcom/camss/Kconfig b/drivers/media/pl=
atform/qcom/camss/Kconfig
> --- a/drivers/media/platform/qcom/camss/Kconfig
> +++ b/drivers/media/platform/qcom/camss/Kconfig
> @@ -7,3 +7,4 @@ config VIDEO_QCOM_CAMSS
>  	select VIDEO_V4L2_SUBDEV_API
>  	select VIDEOBUF2_DMA_SG
>  	select V4L2_FWNODE
> +	select PHY_QCOM_MIPI_CSI2

[Severity: High]
Does the config PHY_QCOM_MIPI_CSI2 actually exist?

Selecting a non-existent symbol can leave the required PHY driver unbuilt,
leading to silent dependency failures where the hardware driver will lack i=
ts
required PHY counterpart at runtime.

> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/m=
edia/platform/qcom/camss/camss-csiphy.c
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.c

[ ... ]

> @@ -306,11 +308,88 @@ static int csiphy_stream_on(struct csiphy_device *c=
siphy)
>  {
>  	u8 bpp =3D csiphy_get_bpp(csiphy->res->formats->formats, csiphy->res->f=
ormats->nformats,
>  				csiphy->fmt[MSM_CSIPHY_PAD_SINK].code);
>  	struct csiphy_lanes_cfg *lncfg =3D &csiphy->cfg.csi2->lane_cfg;
>  	struct phy_configure_opts_mipi_dphy *dphy_cfg;
>  	union phy_configure_opts dphy_opts =3D { 0 };
>  	struct device *dev =3D csiphy->camss->dev;
>  	u8 num_lanes =3D lncfg->num_data;
>  	s64 link_freq;
>  	int ret;
> =20
>  	dphy_cfg =3D &dphy_opts.mipi_dphy;
> =20
>  	link_freq =3D camss_get_link_freq(&csiphy->subdev.entity, bpp, num_lane=
s);
> =20
>  	if (link_freq < 0) {
>  		dev_err(dev,
>  			"Cannot get CSI2 transmitter's link frequency\n");
>  		return -EINVAL;
>  	}
> =20
>  	phy_mipi_dphy_get_default_config_for_hsclk(link_freq, num_lanes, dphy_c=
fg);
> =20
>  	phy_set_mode(csiphy->phy, PHY_MODE_MIPI_DPHY);
> =20
>  	ret =3D phy_configure(csiphy->phy, &dphy_opts);

[Severity: Medium]
Should we check the return value of
phy_mipi_dphy_get_default_config_for_hsclk() here in csiphy_stream_on()?

If this calculation helper fails, for example due to an unsupported link
frequency, it returns a negative error code and leaves dphy_cfg
zero-initialized. Because the error isn't checked, the zeroed configuration
would be passed down to phy_configure(), risking an invalid hardware state =
or
a failure to start the video stream.

> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c

[ ... ]

> @@ -4832,14 +4890,21 @@ static int camss_init_subdevices(struct camss *ca=
mss)
>  	unsigned int i;
>  	int ret;
> =20
> +	camss_detect_legacy_phy(camss);
> +
>  	for (i =3D 0; i < camss->res->csiphy_num; i++) {
> -		ret =3D msm_csiphy_subdev_init(camss, &camss->csiphy[i],
> -					     &res->csiphy_res[i],
> -					     res->csiphy_res[i].csiphy.id);
> +		if (!camss->legacy_phy) {
> +			ret =3D msm_csiphy_subdev_init(camss, i);
> +		} else {
> +			ret =3D msm_csiphy_subdev_init_legacy(camss,
> +							    &camss->csiphy[i],
> +							    &res->csiphy_res[i],
> +							    res->csiphy_res[i].csiphy.id);
> +		}
> +
>  		if (ret < 0) {
> -			dev_err(camss->dev,
> -				"Failed to init csiphy%d sub-device: %d\n",
> -				i, ret);
> +			dev_err(camss->dev, "csiphy %d init fail\n",
> +				res->csiphy_res[i].csiphy.id);
>  			return ret;
>  		}
>  	}

[Severity: Medium]
If msm_csiphy_subdev_init() fails on a later iteration, does this loop leak
the PHY hardware state of the previously initialized PHYs?

The msm_csiphy_subdev_init() function now calls phy_init(). If we return
early here, we never call phy_exit() for the PHYs that successfully
initialized in prior loop iterations.

Additionally, this initialization state appears to leak on other error paths
too. For example, if camss_register_entities() fails:

> @@ -5131,8 +5207,10 @@ static int camss_register_entities(struct camss *c=
amss)
> =20
>  	i =3D camss->res->csiphy_num;
>  err_reg_csiphy:
> -	for (i--; i >=3D 0; i--)
> -		msm_csiphy_unregister_entity(&camss->csiphy[i]);
> +	for (i--; i >=3D 0; i--) {
> +		if (csiphy_enabled(camss, &camss->csiphy[i]))
> +			msm_csiphy_unregister_entity(&camss->csiphy[i]);
> +	}
> =20
>  	return ret;
>  }

If camss_register_entities() fails on the very first PHY (i=3D0), the clean=
up
loop skips msm_csiphy_unregister_entity() for all PHYs because i becomes -1.

Since msm_csiphy_unregister_entity() is what currently calls phy_exit(), th=
is
means all PHYs that were phy_init()ed during camss_init_subdevices() are
never torn down, leaking their initialization state and reference counts.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903-b4-linux-n=
ext-25-03-13-dtsi-x1e80100-camss-v14-0-01ef1eced075@linaro.org?part=3D4
