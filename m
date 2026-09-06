Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E80E2C15B0;
	Sun,  6 Sep 2026 14:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788705159; cv=none; b=QFfT2bb/zln2it9+3xCn8CSeGrEOo63AGuKBO+m6s5M7rE29AgF4m01/5ZLWjfkFzTcNKC55V9vEaWx598hiG2I2FyyrAFHDpILI965HEuMkGzYDUMwEjfvurT6WIBds+ilLgjJaS1IqYU+KG+A19jEaFHdeZy4h3nDjkP9fsVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788705159; c=relaxed/simple;
	bh=DGPe4aOP1AagD4XeveSJcP+v6TFFlajcLTKJ7GrnILw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZmOlyOLkRN9fwRAdC08pMtRgdY3gO/mbeCjeFRgt1fPgUqweu+i+KD6GnvEoIBPWkQItcPRQSaHj5Y19D6ah/QtncZwZFyP2cyt0JT6lKsFQdfb6Yn2JMhlDaN5GOCgEj46hh0Mc20Ynlaq0wTvfUbrX4wFi153WKtJyW8TLy78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JaaHYcFh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JaaHYcFh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 523A21F00A3A;
	Sun,  6 Sep 2026 14:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788705153;
	bh=hYlU9slo2AdfTZdkflGPEyEjS1r8Sh9sxlLoD1PyPjI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JaaHYcFhcQAIFgwwlOG52BLNL97LGGxyL1mZIDqllf+soBi3ebOglmWR7UCcuyf/e
	 J2XXfqeO0d0Dl+NthyVmyEE0yt8yC5OlljbOXypcxFUL3zFweMzq3w3uMJJyu2ujbm
	 hTBVBTp1CaEMJhKJOdYUqBr9+TFir1jL0xoCRfmjHKVjkdH9eDzDixl1vWkBQ9PFPH
	 WzGV4yAHplNsZRW34JzaMrO3eCafCrAVJdvJSwktwHAH6CBQfBoLtz8tId0Wv71flt
	 FPgMKjnYW0SGoRoLmKoatVfI7mpDsMxRHerKg2QOArefK7KfW4wVSDmXNMZ58vdMu5
	 ovTI/vkho6U8g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v17 4/5] media: qcom: camss: Add support for PHY API
 devices
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QnJ5YW4gTydEb25vZ2h1ZQ==?= <bryan.odonoghue@linaro.org>
Cc: olteanv@gmail.com, neil.armstrong@linaro.org, devicetree@vger.kernel.org, media-ci@linuxtv.org, linux-clk@vger.kernel.org, linux-phy@lists.infradead.org, vkoul@kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260906-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v17-4-e2197a3e2551@linaro.org>
References: <20260906-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v17-0-e2197a3e2551@linaro.org>
 <20260906-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v17-4-e2197a3e2551@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 06 Sep 2026 14:32:32 +0000
Message-Id: <20260906143233.523A21F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Selects a non-existent Kconfig symbol PHY_QCOM_MIPI_CSI2.
- [High] Hardware PHY state and resources are leaked on early probe and reg=
istration error paths.
- [Medium] Missing return value checks for phy_mipi_dphy_get_default_config=
_for_hsclk() and phy_set_mode() can lead to uninitialized PHY configuration.
--

commit cc3786ea5902bcb687c49374e8e8db29c5127496
Author: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

media: qcom: camss: Add support for PHY API devices

Add the ability to use a PHY pointer which interacts with the standard PHY
API. In the first instance the code will try to use the new PHY interface.
If no PHYs are present in the DT then the legacy method will be attempted.

> diff --git a/drivers/media/platform/qcom/camss/Kconfig b/drivers/media/pl=
atform/qcom/camss/Kconfig
> index 4eda48cb1adf0..1edc5e5a1829e 100644
> --- a/drivers/media/platform/qcom/camss/Kconfig
> +++ b/drivers/media/platform/qcom/camss/Kconfig
> @@ -7,3 +7,4 @@ config VIDEO_QCOM_CAMSS
>  	select VIDEO_V4L2_SUBDEV_API
>  	select VIDEOBUF2_DMA_SG
>  	select V4L2_FWNODE
> +	select PHY_QCOM_MIPI_CSI2

[Severity: High]
Does this select a nonexistent config symbol? Selecting a symbol that isn't
defined anywhere in the kernel causes a silent build dependency failure,
which will leave the required PHY infrastructure unbuilt.

[ ... ]

> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/m=
edia/platform/qcom/camss/camss-csiphy.c
> index 539ac4888b608..e00748dd83b02 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.c

[ ... ]

> @@ -306,11 +308,88 @@ static int csiphy_stream_on(struct csiphy_device *c=
siphy)
> +	link_freq =3D camss_get_link_freq(&csiphy->subdev.entity, bpp, num_lane=
s);
> +
> +	if (link_freq < 0) {
> +		dev_err(dev,
> +			"Cannot get CSI2 transmitter's link frequency\n");
> +		return -EINVAL;
> +	}
> +
> +	phy_mipi_dphy_get_default_config_for_hsclk(link_freq, num_lanes, dphy_c=
fg);
> +
> +	phy_set_mode(csiphy->phy, PHY_MODE_MIPI_DPHY);
> +
> +	ret =3D phy_configure(csiphy->phy, &dphy_opts);

[Severity: Medium]
Should we check the return values of phy_mipi_dphy_get_default_config_for_h=
sclk()
and phy_set_mode() here?=20

If link_freq evaluates to 0, it appears phy_mipi_dphy_get_default_config_fo=
r_hsclk()
could return -EINVAL and leave the output dphy_opts structure zero-filled. =
Passing
this uninitialized configuration directly to phy_configure() could lead to
erratic hardware behavior.

[ ... ]

> @@ -709,6 +788,56 @@ int msm_csiphy_subdev_init(struct camss *camss,
> +	ret =3D phy_init(csiphy->phy);
> +	if (ret)
> +		dev_err(dev, "%s init fail %d\n", csiphy->name, ret);
> +
> +done:
> +	return ret;
> +}

[ ... ]

> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index 2123f6388e3d7..84097d82d99c9 100644
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

[Severity: High]
Does this error path leak the PHY initialization state?

When msm_csiphy_subdev_init() succeeds, it calls phy_init() to acquire the =
PHY.
If a subsequent iteration of this loop fails, or if a later initialization =
step
like camss_probe() fails, the code returns immediately or goes to an error =
label
without rolling back the previously initialized PHYs (which require phy_exi=
t()).

Additionally, in msm_csiphy_register_entity() located in camss-csiphy.c:

	ret =3D csiphy_init_formats(sd, NULL);
	if (ret < 0) {
		dev_err(dev, "Failed to init format: %d\n", ret);
		return ret;
	}

A failure here returns early without calling phy_exit(). When the calling c=
ode
in camss_register_entities() rolls back, it decrements the index and skips =
this
failing entity, which seems to permanently leak its PHY initialization stat=
e.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260906-b4-linux-n=
ext-25-03-13-dtsi-x1e80100-camss-v17-0-e2197a3e2551@linaro.org?part=3D4
