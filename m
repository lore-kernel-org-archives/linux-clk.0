Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9256D420E7C;
	Sun,  6 Sep 2026 12:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788696430; cv=none; b=ueFBr4NM7WA/v3eWRGL6XluSsdVbJDq6jEasKLfJpuGVMMfFX//4x5v89XXtW2AWeaXGCQjwJQkIy38hJ5QDw0/cvVldSL/RZTytuHh3iWOyjGximIG/09ZESfuGS9Nqf48R+QAThWK6WHVSPbiDGxFGlKcw3pdVGjNDUfPdNv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788696430; c=relaxed/simple;
	bh=jczEVkCdFdYSTKPAj+Achaj3rl7Tcw1tClUXjJIbtPE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DoVcQsAbGj4GVByF0NBO5KljbcSAy3L0dJLR7CJJMDI/8PdZWtXNQiwqY+YmbcU2PJkMRzZC2bRRpZL9d/QQThAW3tuycgdbEW5KwiTgKvTREft9t+/OtX48+GIpvRJBPmck4VibZJjSPl/bc94dCmMycnf+23CPIIGGxCGtyns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EEQ0PWH5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EEQ0PWH5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BCE81F00A3A;
	Sun,  6 Sep 2026 12:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788696429;
	bh=iR0+L0QmhoAp7HQQtHO7+OxujEkvH8+H3e0YT2JKDWs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EEQ0PWH55UlTvVbt0ZptNSRFrwqhvwOyGckwODh27bX9YQMblxDxq4TXvt7M0V0p9
	 lHvmCPbxovlzyOBUeCzkDKouLFQvJzmW478PP48QfgfoQBOJ+p8m46ufetzLkATUrG
	 BEsG82PaTwNiBFry4WpvvrugaFAaP91Igs6+GwdFmXO/CukreNqZhzvmeahlS7Ic9q
	 LUF/+ZEI3oEq8QzS5AwahK5ciMHp84XK+SffzG7t5PtGO9bMVM9FaurTbyWWWy5KCh
	 zl25naNvdE5mQUvXj3qOvw8FktJM/tN4KZm9NrCgJhO4D6HL9PGOJqLuhb+/irnOGA
	 feohlkficrgOQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v16 4/5] media: qcom: camss: Add support for PHY API
 devices
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QnJ5YW4gTydEb25vZ2h1ZQ==?= <bryan.odonoghue@linaro.org>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, conor+dt@kernel.org, linux-phy@lists.infradead.org, robh@kernel.org, vkoul@kernel.org, media-ci@linuxtv.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20260906-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v16-4-f7bd68b5369f@linaro.org>
References: <20260906-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v16-0-f7bd68b5369f@linaro.org>
 <20260906-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v16-4-f7bd68b5369f@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 06 Sep 2026 12:07:07 +0000
Message-Id: <20260906120708.8BCE81F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [High] The Kconfig selects a non-existent symbol `PHY_QCOM_MIPI_CSI2`.
- [High] Missing `phy_exit()` cleanup for successfully initialized PHYs on =
probe and registration error paths.
- [Medium] Ignored return values from PHY API configuration functions.

Pre-existing issues:
- [High] Potential NULL pointer dereference of `csiphy->cfg.csi2` if stream=
ing is started before the sensor subdevice is bound.
--

commit 55545599c66ba86b7d549259aecbc5a1c20f76a5
Author: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

media: qcom: camss: Add support for PHY API devices

This commit adds the ability to use a PHY pointer which interacts with the
standard PHY API. If no PHYs are present in the DT, it falls back to the
legacy configuration method.

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
Does the symbol PHY_QCOM_MIPI_CSI2 exist in the kernel tree?

Selecting a non-existent Kconfig symbol can cause unmet direct dependency
warnings and potentially silent build failures, leaving required features
disabled.

[ ... ]

> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/m=
edia/platform/qcom/camss/camss-csiphy.c
> index 539ac4888b608..e00748dd83b02 100644
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

[Severity: High]
This isn't a bug introduced by this patch, but could this code dereference
csiphy->cfg.csi2 while it is NULL?

If userspace opens a video node and issues VIDIOC_STREAMON before the sensor
subdevice binds (or if the sensor never binds), csiphy->cfg.csi2 will remain
uninitialized. The code here dereferences it to read lncfg->num_data before
validating if a sensor is actually present.

> +	s64 link_freq;
> +	int ret;
> +
> +	dphy_cfg =3D &dphy_opts.mipi_dphy;
> +
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
Should the return values of phy_mipi_dphy_get_default_config_for_hsclk() and
phy_set_mode() be checked?

If phy_mipi_dphy_get_default_config_for_hsclk() fails (for example, with a
bad link_freq), dphy_opts will remain untouched. Passing this zero-initiali=
zed
structure to phy_configure() could then misconfigure the hardware.

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

When msm_csiphy_subdev_init() succeeds, it calls phy_init(). If a later
csiphy iteration fails, or if a subsequent subdevice like vfe fails to
initialize, camss_init_subdevices() returns early. This jumps to the
err_genpd_cleanup path in camss_probe(), completely bypassing
camss_unregister_entities(), and leaving earlier successfully initialized
PHYs without a balancing phy_exit().

[ ... ]

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

[Severity: High]
Does this error path also miss calling phy_exit() for some initialized PHYs?

Because this registration cleanup loop only iterates backward from the fail=
ing
index `i`, any csiphys from `i` onward (which were initialized during the
earlier camss_init_subdevices() phase but had not reached registration yet)
will not have their msm_csiphy_unregister_entity() cleanup called. This lea=
ves
their PHY references leaked.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260906-b4-linux-n=
ext-25-03-13-dtsi-x1e80100-camss-v16-0-f7bd68b5369f@linaro.org?part=3D4
