Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EFB6446BF5;
	Fri,  4 Sep 2026 12:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788523691; cv=none; b=nu4wGMuTM8VoV7JzzWu93rvaGw5IbgL2DZvcAZ6iZPuhvF8IcrplZlYpfQ+Vds4i5hR56jgbk+2cDGoxZPiAw3h0Rd+lRpsJeQfgwT8iz0RUUKkUQZ8M8op246DwvdhPK7MrFK/snUZJObj/vNg5WBY14+JCY/NuPIiJ+rYp6IU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788523691; c=relaxed/simple;
	bh=7a82eK/GXYNlzsnZTNHwIPuh4/n3DCLZ6mUvjWfch64=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WSqBtE4rPv2yQJq4GlEdN1FMnVSJZw/D1He/NcaJ+J6ui+0m/rP2iOIcrbArHnYKCwj1Lnv0aLXDKc/CqAR0NohRm9GR0IH6nD+U97Hp/Uc4CKjz+q6OOdhmUHPPyKqAyUIlKARPXRUPgCyNFA+Zk/AMzBtKZWRkrn952yy4txk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WTHcgBvS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WTHcgBvS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F4BA1F00A3D;
	Fri,  4 Sep 2026 12:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788523690;
	bh=c1AFesoZfZtFQlyGMqV1mw7bX7NCxyE2uJkgFK0+kKc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WTHcgBvSeBOXRNGec6uJ3lJQDmoPCSBYbELjMpUDZ5H6KKICI1Ajg9k0WNrbxSfd6
	 m7Q5UfYXS00pUm31oDuspW5XaoNYCUpml7fgoAASwWY/m+SqBHg42bjOop/HNr5XdQ
	 onlK1UY2P4jC/uYS9XA3aL7X2yPLOUt4oWo9LxRy4vtUZXccJgvn6JRvPylrHGLQJb
	 KKpexkxHJB6YYHPKukHY0s10CF8BNyxkb5SsPeLV1TbcHZujFc0PZXSUN8DKwURlVB
	 NsVoMRoXFqkI8+WGhDXqYFOD73WNOMLum50xDFSxGiMWFn+DClcBJ+hsSYqRGMwYEj
	 K+mwQFrtmFhEA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v15 4/4] media: qcom: camss: Add support for PHY API
 devices
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QnJ5YW4gTydEb25vZ2h1ZQ==?= <bryan.odonoghue@linaro.org>
Cc: linux-phy@lists.infradead.org, vkoul@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org, robh@kernel.org, linux-clk@vger.kernel.org, media-ci@linuxtv.org, olteanv@gmail.com
In-Reply-To: <20260904-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v15-4-68b7916e7a3f@linaro.org>
References: <20260904-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v15-0-68b7916e7a3f@linaro.org>
 <20260904-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v15-4-68b7916e7a3f@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 12:08:09 +0000
Message-Id: <20260904120809.6F4BA1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [High] Unchecked return value from `phy_mipi_dphy_get_default_config_for_=
hsclk` leads to uninitialized PHY configuration and potential divide-by-zer=
o kernel panic.
- [Medium] The Kconfig symbol `PHY_QCOM_MIPI_CSI2` selected by `VIDEO_QCOM_=
CAMSS` does not exist.
- [Medium] Missing `phy_exit()` on probe error paths leads to a PHY state r=
esource leak.

Pre-existing issues:
- [Critical] Missing bounds check on the device tree port number leads to a=
 heap out-of-bounds write.
--

commit 26d58015dee86032083946c737ad4b615540ce3c
Author: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

media: qcom: camss: Add support for PHY API devices
   =20
Add the ability to use a PHY pointer which interacts with the standard PHY
API.
   =20
In the first instance the code will try to use the new PHY interface. If no
PHYs are present in the DT then the legacy method will be attempted.

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
Does the Kconfig symbol PHY_QCOM_MIPI_CSI2 exist? Selecting a non-existent
Kconfig symbol has no effect or causes unmet dependency warnings, which can
omit required features from the build.

> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/m=
edia/platform/qcom/camss/camss-csiphy.c
> index 539ac4888b608..e00748dd83b02 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
[ ... ]
> @@ -306,11 +308,88 @@ static int csiphy_stream_on(struct csiphy_device *c=
siphy)
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
> +	if (link_freq < 0) {
> +		dev_err(dev,
> +			"Cannot get CSI2 transmitter's link frequency\n");
> +		return -EINVAL;
> +	}
> +
> +	phy_mipi_dphy_get_default_config_for_hsclk(link_freq, num_lanes, dphy_c=
fg);

[Severity: High]
If camss_get_link_freq() returns 0, phy_mipi_dphy_get_default_config_for_hs=
clk()
will return -EINVAL. Does this code ignore the return value, leaving dphy_o=
pts
uninitialized?=20

Passing an all-zero struct to phy_configure() could cause the PHY driver to=
=20
attempt a division by hs_clk_rate (which is 0), leading to a kernel panic.

> +
> +	phy_set_mode(csiphy->phy, PHY_MODE_MIPI_DPHY);
> +
> +	ret =3D phy_configure(csiphy->phy, &dphy_opts);
> +	if (ret) {
> +		dev_err(dev, "failed to configure MIPI D-PHY\n");
> +		goto error;
> +	}
> +
> +	return phy_power_on(csiphy->phy);
> +
> +error:
> +	return ret;
> +}
[ ... ]
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index 2123f6388e3d7..84097d82d99c9 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -4799,8 +4799,43 @@ static int camss_parse_ports(struct camss *camss)
[ ... ]
>  		if (IS_ERR(csd)) {
>  			ret =3D PTR_ERR(csd);
>  			goto err_cleanup;
>  		}
> =20
>  		ret =3D camss_parse_endpoint_node(dev, ep, csd);

[Severity: Critical]
This is a pre-existing issue, but does camss_parse_endpoint_node() lack bou=
nds
checking on the device tree port number?

When camss_parse_endpoint_node() reads the port number into
csd->interface.csiphy_id, it appears to be used as an index into the
camss->csiphy array in camss_subdev_notifier_bound() without verifying it is
less than camss->res->csiphy_num:

camss_subdev_notifier_bound() {
    u8 id =3D csd->interface.csiphy_id;
    struct csiphy_device *csiphy =3D &camss->csiphy[id];
    ...
    csiphy->cfg.csi2 =3D &csd->interface.csi2;
}

Can a malformed device tree with a large port number cause a heap out-of-bo=
unds
write here?

>  		if (ret < 0)
>  			goto err_cleanup;
>  	}
> =20
>  	return 0;
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

[Severity: Medium]
If msm_csiphy_subdev_init() fails on a subsequent iteration (or if a later =
probe
step fails and jumps to err_genpd_cleanup in camss_probe), do we leak the
initialized PHY state?

msm_csiphy_subdev_init() explicitly initializes the PHY with phy_init(), wh=
ich
establishes the requirement for a subsequent phy_exit(). When returning her=
e,
camss_unregister_entities() is skipped, which appears to leak the PHY resou=
rces
initialized in earlier loop iterations.

>  		}
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904-b4-linux-n=
ext-25-03-13-dtsi-x1e80100-camss-v15-0-68b7916e7a3f@linaro.org?part=3D4
