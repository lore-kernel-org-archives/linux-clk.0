Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795005435;
	b=xK1ryjC0JZKfc9qS5mTQgkJkf9e1rslH8GVmJkMXzt2zDUIEv4wEEzP/wRAJccFW66N+
	 2BL3SIU5ZIY6yLBsGLrAE35u68jTXR228fH0adjGDswfLtk3F7+7N5UCcKy3fRd1qWzMW
	 rZ/XCWhSH3YvgxAtBWiv+TWxfR+rsO5w755vKbeX6RQOCrq1y2NcZRNthatZniEAXgFLp
	 cZtZkByGTpHtDn3neSulscgj3Vq1oYg9zj6dbjlD5ajaDhk5Zrh3LRGy3Vg6FAqrWav60
	 WxIxb7Jp77WF3ZmfsWVNmSG3Q1TR0QI3aVawVPLAas0wlm+8I8Qmq91zINaDbEFYRIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795005435;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=jSREI4xVzC4eLiiJGIJsm9Z8aTlDSjYCXz8XIyOzlgE=;
	b=j9F1OXHtfrDVYsbkLWAGEnh8EQsAiSHSb80LMiIHj4YNnb4lTKn2pYHcvHbWjT8Yw4Xb
	 z0pNfPsin/ysW6uVUzUQ8Hv91IjbTINeyfztVpGuivurH/DRUpDe4TflVr4TdjNDSUOLL
	 48LaBbYMT+sD4bJug+kC+MHM9fkPZN+LjiVueq7CAyBOEwZvPLRr/oXvQIMZZx8eRnG3/
	 LZDnJJEdgrrI3XzOzTs3Tm19kKzySBMtwheMetnBIreCZp29ZHFkaV3h2xl35R9tcaDj6
	 njV7uuplKQCoIs+fxtbVyr3SwbWb2yKDCIy4nQ13xQmN1LTtWmxUw2jEBqjvqtpU6mQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eCklFraS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D0F606A31C;
	Wed, 18 Nov 2026 12:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eCklFraS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E93451F000C4;
	Wed, 18 Nov 2026 12:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795005435;
	bh=jSREI4xVzC4eLiiJGIJsm9Z8aTlDSjYCXz8XIyOzlgE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eCklFraSWKy2xd84VKGRtj6uMO/agDG3AfpWvyqYOSXall9PA7xUx2drQkWvaHotx
	 uoMp6S5CK0EKKRRPodmfcsr29DIYjAcuh5Z2mA60k1h0YHaj7HeiW4l94uvwtdcETh
	 jI4k/5J39+0QMbz4mKSzEO3/y7U8tV/OoNgYRpu35E3Q1NuRrghNHCZsqwlXZhFkc7
	 O6vu2LOFIh184r3DF0XFmnEuqEdnCKs2X3mIVbl2oEdbaX4lznjSLTjIvQ6icnqpo+
	 zaI80cPsPXNUYJLbv8IObzjcaHrlx2Vqg+/wZvHUgAlNkjHZHxqYa6st7wGxMqr9+B
	 K/oM9zosUZYvA==
Message-ID: <sashiko-outbox-220918@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/6] soc: st: stm32mp2-syscfg: register the syscon
 regmap
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gabriel Fernandez" <gabriel.fernandez@foss.st.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261118-ups_mp25_clk_syscfg-v3-2-935de791a4ce@foss.st.com>
References: <20261118-ups_mp25_clk_syscfg-v3-0-935de791a4ce@foss.st.com>
 <20261118-ups_mp25_clk_syscfg-v3-2-935de791a4ce@foss.st.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 12:37:14 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [Medium] soc: st: leak of ioremap and regmap on -EEXIST in
  stm32mp2_syscfg_probe()
- [Medium] soc: st: dangling regmap in syscon_list on
  stm32mp2_syscfg_probe() failure
- [Medium] soc: st: stm32mp2-syscfg: fw_devlink and initcall order let
  consumers create clock-attached syscon regmap first
--

commit 3074d10104a5aee141b2e91cda96d7c4ea358a2e
Author: Gabriel Fernandez <gabriel.fernandez@foss.st.com>

soc: st: stm32mp2-syscfg: register the syscon regmap

This commit creates an MMIO regmap in stm32mp2_syscfg_probe() and registers
it with the syscon core before populating subnodes so that syscon does not
attach the node's first clock to the regmap.

> diff --git a/drivers/soc/st/stm32mp2-syscfg.c b/drivers/soc/st/stm32mp2-s=
yscfg.c
> index 770321a4a6f71..0d45fdef46b73 100644
> --- a/drivers/soc/st/stm32mp2-syscfg.c
> +++ b/drivers/soc/st/stm32mp2-syscfg.c
> @@ -3,13 +3,55 @@
>   * Copyright 2026 Marek Vasut
>   */
> =20
> +#include <linux/mfd/syscon.h>
>  #include <linux/module.h>
>  #include <linux/of_platform.h>
>  #include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +
> +static const struct regmap_config stm32mp2_syscfg_regmap_config =3D {
> +	.reg_bits =3D 32,
> +	.val_bits =3D 32,
> +	.reg_stride =3D 4,
> +};
> =20
>  static int stm32mp2_syscfg_probe(struct platform_device *pdev)
>  {
> -	return devm_of_platform_populate(&pdev->dev);
> +	struct regmap_config config =3D stm32mp2_syscfg_regmap_config;
> +	struct device *dev =3D &pdev->dev;
> +	struct regmap *regmap;
> +	struct resource *res;
> +	void __iomem *base;
> +	int ret;
> +
> +	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!res)
> +		return -ENODEV;
> +
> +	/* Not requested: the SDMMC delay blocks lie in the SYSCFG range */
> +	base =3D devm_ioremap(dev, res->start, resource_size(res));
> +	if (!base)
> +		return -ENOMEM;
> +
> +	config.max_register =3D resource_size(res) - config.reg_stride;
> +
> +	regmap =3D devm_regmap_init_mmio(dev, base, &config);
> +	if (IS_ERR(regmap))
> +		return dev_err_probe(dev, PTR_ERR(regmap),
> +				     "failed to init the regmap\n");
> +
> +	/*
> +	 * The SYSCFG registers need no clock, but the generic syscon regmap
> +	 * would enable the first clock of the node, the LTDC kernel clock
> +	 * which is only a parent of the pixel clock mux, around each access.
> +	 */
> +	ret =3D of_syscon_register_regmap(dev->of_node, regmap);
> +	if (ret =3D=3D -EEXIST)
> +		dev_warn(dev, "syscon regmap already created, its clock stays attached=
\n");

[Severity: Medium]
Does the -EEXIST path leave the newly mapped base and regmap allocated on
dev?

When a consumer has already called syscon_node_to_regmap(),
stm32mp2_syscfg_probe() logs a warning and returns 0 via
devm_of_platform_populate(dev) without releasing regmap or unmapping base.
Because the driver is built-in with suppress_bind_attrs =3D true, the
duplicate 64 KiB mapping, regmap, and debugfs entry remain allocated for
the lifetime of the system, and dev_get_regmap(dev, NULL) points to the
unused regmap instead of the active one in syscon_list.

> +	else if (ret)
> +		return dev_err_probe(dev, ret, "failed to register the regmap\n");
> +
> +	return devm_of_platform_populate(dev);

[Severity: Medium]
If devm_of_platform_populate(dev) fails after of_syscon_register_regmap()
has succeeded, can syscon_list be left with a dangling regmap pointer?

There is no API to unregister a regmap from syscon_list, while a negative
return from stm32mp2_syscfg_probe() triggers devres_release_all(dev),
freeing regmap and unmapping base.  Any later syscon lookup for this node
then returns the freed regmap pointer and causes a use-after-free.

>  }
> =20
>  static const struct of_device_id stm32mp2_syscfg_ids[] =3D {
> @@ -23,10 +65,12 @@ static struct platform_driver stm32mp2_syscfg_driver =
=3D {
>  	.driver =3D {
>  		.name	=3D "stm32mp2_syscfg",
>  		.of_match_table =3D stm32mp2_syscfg_ids,
> +		/* The consumers keep using the regmap */
> +		.suppress_bind_attrs =3D true,
>  	},
>  	.probe =3D stm32mp2_syscfg_probe,
>  };
> -module_platform_driver(stm32mp2_syscfg_driver);
> +builtin_platform_driver(stm32mp2_syscfg_driver);

[Severity: Medium]
Will consumers still create the clock-attached syscon regmap before
stm32mp2_syscfg_probe() runs?

Once the SYSCFG DT node lists clocks =3D <&rcc CK_KER_LTDC>, <&lvds>,
<&clk_dsi_txbyte>, fw_devlink creates supplier links from rcc (and lvds
when enabled) to syscfg.  Because rcc depends on scmi_clk, it is not bound
when device_initcall runs through drivers/phy/, drivers/pci/, and
drivers/soc/.  Built-in consumers such as phy-stm32-combophy and
pcie-stm32 defer on rcc ahead of syscfg, have no fw_devlink dependency on
syscfg (they look it up via syscon_regmap_lookup_by_compatible() or vendor
properties), and probe first once rcc binds.  Because the syscfg node
retains "syscon" in its compatible list, syscon_node_to_regmap() creates
the generic regmap with CK_KER_LTDC attached instead of returning
-EPROBE_DEFER:

drivers/mfd/syscon.c:syscon_node_to_regmap() {
	return device_node_get_regmap(np, of_device_is_compatible(np, "syscon"), t=
rue);
}

As a result, stm32mp2_syscfg_probe() hits -EEXIST and CK_KER_LTDC stays
prepared and toggled on every SYSCFG access; in addition, if lvds is
enabled without a consumer cycle (for example when CONFIG_DRM_STM_LVDS is
disabled or modular), fw_devlink blocks stm32mp2_syscfg_probe() and delays
populating the USB2 PHY child nodes.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118-ups_mp25_c=
lk_syscfg-v3-0-935de791a4ce@foss.st.com?part=3D2
