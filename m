Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A083B42EB;
	Fri, 18 Sep 2026 14:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789741180; cv=none; b=Xie+Yc3TkCV/pRvntBVp6VXHtqWghCGlZzWUBQKqZs9amQgxFkii9x/TSmUi6TablDb6A3MQIYUTQYQ/a6xesNfzt66kAEXiAQ1GRZTYcgILvDbfkBchSiNnSLjGo+Gew78V/VjQ8K29ql6RDT6gOzIxEVBJ1OFUQ4oQI3v13MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789741180; c=relaxed/simple;
	bh=txavSXflCJ6B5E6G91PIsDCeWaOy6S7RCcpR2ErJo8Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NSxcJdmRQWNREhfJHo4hRyrStTlDFUqxTfPuaRaYa4JIdak2NnuczoDlw6Q6XtDF0vnUU2oKpT6JcmFVne5tcm5RiqiNw/WxOZ78/yu8zbTjCvi+z4vFdkkQdDo6JsPWZuF/JnVHGJUp85Xzdp1aQN40qupyfsp9Bj8rhyQspd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jFWLfmkX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jFWLfmkX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 227071F00898;
	Fri, 18 Sep 2026 14:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789741178;
	bh=oBUlQpynhDAHb3Svjo0JkzyxPK6EYJ+2dxCIisYZPQg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jFWLfmkXO6EySpquV6kUrbXtDS7BYGtSrKeXlnLaSfLJgJJwvIlTE4VTjrvE+vAPo
	 tvXCXPNzHX2Wne5YO7whkSvu/So05pWe3SMMYqJePsZUkvpO/P7ZitqidxTOsPPZHs
	 x9hs59cyXIRVRsqEbX6tEi3vImtK96+I06UsWXnQMD4gyP+N7FT6F/H2/hsL9h8w4h
	 kPCopeVIkllVSH1nWTlvYfuezMONXqOzuLWzgMdW7eGSVkPIdct8kiqtAR7Q9zPR5z
	 P+wKjR4Hfb+JjCaCbOJuFFG9whwkROZbkxWvzBcaZmAdL0eu6JNhExRlL0gPhwuzGL
	 EUEr4H5YxJWoA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v20 5/6] media: qcom: camss: Add support for PHY API
 devices
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QnJ5YW4gTydEb25vZ2h1ZQ==?= <bryan.odonoghue@linaro.org>
Cc: olteanv@gmail.com, conor+dt@kernel.org, robh@kernel.org, vkoul@kernel.org, devicetree@vger.kernel.org, linux-phy@lists.infradead.org, linux-clk@vger.kernel.org, media-ci@linuxtv.org, neil.armstrong@linaro.org
In-Reply-To: <20260918-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v20-5-dc244e124e71@linaro.org>
References: <20260918-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v20-0-dc244e124e71@linaro.org>
 <20260918-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v20-5-dc244e124e71@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 14:19:37 +0000
Message-Id: <20260918141938.227071F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] media: camss: incorrect data rate passed to PHY config
- [Medium] kconfig: select of non-existent symbol PHY_QCOM_MIPI_CSI2
--

commit 53c91247e8179ba522478e54bb98836c106cd0ee
Author: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

media: qcom: camss: Add support for PHY API devices

Add the ability to use a PHY pointer which interacts with the standard PHY
API.

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

[Severity: Medium]
Does this Kconfig symbol exist? I am unable to find PHY_QCOM_MIPI_CSI2 anyw=
here
in the kernel tree.=20

Selecting a non-existent symbol has no effect. This could lead to a silent
failure where the required PHY driver is not built, potentially leaving the
hardware non-functional when relying on this driver.

> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/m=
edia/platform/qcom/camss/camss-csiphy.c
> index 539ac4888b608..aaed7d0309dd6 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
[ ... ]
> +static int csiphy_stream_on(struct csiphy_device *csiphy)
> +{
> +	u8 bpp =3D csiphy_get_bpp(csiphy->res->formats->formats, csiphy->res->f=
ormats->nformats,
> +				csiphy->fmt[MSM_CSIPHY_PAD_SINK].code);
> +	struct csiphy_lanes_cfg *lncfg =3D &csiphy->cfg.csi2->lane_cfg;
> +	struct phy_configure_opts_mipi_dphy *dphy_cfg;
> +	union phy_configure_opts dphy_opts =3D { 0 };
> +	struct device *dev =3D csiphy->camss->dev;
> +	u8 num_lanes =3D lncfg->num_data;
> +	s64 link_freq;
> +	int ret;
> +
> +	dphy_cfg =3D &dphy_opts.mipi_dphy;
> +
> +	link_freq =3D camss_get_link_freq(&csiphy->subdev.entity, bpp, num_lane=
s);
> +
> +	if (link_freq <=3D 0) {
> +		dev_err(dev,
> +			"Cannot get CSI2 transmitter's link frequency\n");
> +		return -EINVAL;
> +	}
> +
> +	ret =3D phy_mipi_dphy_get_default_config_for_hsclk(link_freq, num_lanes,
> +							 dphy_cfg);

[Severity: High]
Are we passing the correct data rate here? The V4L2 camss_get_link_freq()
helper returns the MIPI D-PHY link frequency (the clock lane frequency in H=
z).

However, the generic PHY framework's phy_mipi_dphy_get_default_config_for_h=
sclk()
function expects its hs_clk_rate argument to be the data rate per lane in b=
its
per second.

Since MIPI D-PHY uses Double Data Rate, the data rate is exactly twice the
clock frequency. Passing the clock frequency directly during csiphy_stream_=
on()
causes the calculated Unit Interval (UI) to be twice its correct value. This
will result in completely incorrect MIPI D-PHY timing parameters (hs_prepar=
e,
hs_settle) and could cause physical layer synchronization failures with the
sensor.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260918-b4-linux-n=
ext-25-03-13-dtsi-x1e80100-camss-v20-0-dc244e124e71@linaro.org?part=3D5
