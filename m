Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0505F3EC829;
	Wed, 23 Sep 2026 18:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790189053; cv=none; b=CXpNle/yWWxakOA/VsVIyY89aCwUnRAyHOdlhfsVCmctbY+jeurSHwPp90KG6BgyMTmVDd637cY1xWW1ht7bUhSQLBsk8us9nZ/9gu54rsOGn72FFeHDiVdfqNAojdmbM35NMCfOB4Ow7srBQGNdFEr9XHzbYmrisGQvObjT3TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790189053; c=relaxed/simple;
	bh=41ZHGsW33/tzXVFTZqMTTTCWYXlRyug2WT07iFnVSOI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LSg/5S7ulBup6leKAVmCRFX/1tNbO7Q7rsyFHWP07vd25CZOSfRkGC2IoO5zg0ArtFO5+t2jeFWLKgDjsrsmxJwA8GXFw6PJw33fIP/EYRsJGe9J4UI6P73gRrxQhv/D32wZPpot4RgfCGEiBLyGpXno5OG4rftKSCCaaVNhyV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yy10ClU2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yy10ClU2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03FC81F00898;
	Wed, 23 Sep 2026 18:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790189042;
	bh=vY+fV+5XhRrH8ORseBN/5+X0cHjWElspRWHxqy28BNk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Yy10ClU228CUQlF9cmx5ZUnXCNAcEh+VeMv3hifsnBeNa/usGDnGZueePPJmyi6M1
	 mIJpXXv+qBXVWmsKFPwWFLbzklZ0fZhNa8oF09A/c5yuKMSIRsCfNRZD/dfOPe9u9U
	 zPCcWtSUGTQ3po31RXGApubv7+lI/URSzsInxtD+BCO3MKZiKtu6zteKtn7zOa7YpH
	 RkutzVaFBjEv0nUAAW6eY7fBcZmljIH1oz1sFiGWBYo0j0rgC8LUFXvp89AqGQb2NS
	 VMV2zZ4NyCLFn01YKis+QaWj6ceVRfe75iqht29vFWQXCQzhwqO0TNXdk5e3PhQYr2
	 WiG1eyXxKJvHg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 08/12] clk: zte: Introduce a driver for zx297520v3
 top clocks
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3RlZmFuIETDtnNpbmdlcg==?= <stefandoesinger@gmail.com>
Cc: olteanv@gmail.com, lee@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, mfd@lists.linux.dev, vkoul@kernel.org, linux-phy@lists.infradead.org, linux-clk@vger.kernel.org, neil.armstrong@linaro.org, robh@kernel.org
In-Reply-To: <20260923-zx29clk-v12-8-9c243796b6d2@gmail.com>
References: <20260923-zx29clk-v12-0-9c243796b6d2@gmail.com>
 <20260923-zx29clk-v12-8-9c243796b6d2@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 18:44:01 +0000
Message-Id: <20260923184402.03FC81F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] clk: zte: clock provider registered with NULL of_node breaks DT co=
nsumers
--

commit 941de7b2f6e4b79d334d74edd0d2dd9620fabd7e
Author: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

clk: zte: Introduce a driver for zx297520v3 top clocks

This commit introduces a new clock driver for the ZTE zx297520v3 SoC top
clocks, which control core devices like PLLs, AHB bus, timers, and USB.
It registers as an MFD child device and provides various clock gates,
dividers, and muxes to the system.

> diff --git a/drivers/clk/zte/Kconfig b/drivers/clk/zte/Kconfig
> index 152c2423b8f02..0ccc6edf3c5b1 100644
> --- a/drivers/clk/zte/Kconfig
> +++ b/drivers/clk/zte/Kconfig
> @@ -15,3 +15,14 @@ config COMMON_CLK_ZTE
>  	  of this.
> =20
>  	  Enable this if you are building a kernel for a ZTE designed board.
> +
> +config CLK_ZTE_ZX297520V3
> +	tristate "Clock driver for ZTE zx297520v3 based SoCs"
> +	depends on COMMON_CLK_ZTE && (MFD_ZTE_ZX297520V3_CRM || COMPILE_TEST)

[Severity: Medium]
This is a pre-existing issue, but will enabling this new configuration caus=
e=20
linker errors on builds where CONFIG_RATIONAL is not selected elsewhere?

Building the kernel with CONFIG_COMMON_CLK_ZTE=3Dy (which is forced by this=
 new=20
config) without CONFIG_RATIONAL causes an undefined reference to=20
rational_best_approximation.

The failure occurs in drivers/clk/zte/pll-zx.c:zx29_pll_calc_values():

        rational_best_approximation(vco, parent_rate,
                                    (1 << hweight32(ZX29_PLL_FBDIV_MASK)) -=
 1,
                                    (1 << hweight32(ZX29_PLL_REFDIV_MASK)) =
- 1,
                                    &fbdiv, &refdiv);

Should RATIONAL be explicitly selected by this new config, or perhaps added=
 to=20
COMMON_CLK_ZTE directly?

> diff --git a/drivers/clk/zte/clk-zx297520v3.c b/drivers/clk/zte/clk-zx297=
520v3.c
> new file mode 100644
> index 0000000000000..68bfeab84d745
> --- /dev/null
> +++ b/drivers/clk/zte/clk-zx297520v3.c

[ ... ]

> +static int clk_zx297520v3_probe(struct platform_device *pdev)
> +{
> +	const struct platform_device_id *id =3D platform_get_device_id(pdev);
> +
> +	if (!id)
> +		return -ENODEV;
> +
> +	return zx_clk_common_probe(&pdev->dev, pdev->dev.parent->of_node,
> +				   (const struct zx_clk_data *)id->driver_data);
> +}

[Severity: High]
Since this driver is an MFD child, will registering the clock provider usin=
g=20
the child's device pointer result in a NULL device tree node?

In clk_zx297520v3_probe, the code correctly passes pdev->dev.parent->of_nod=
e=20
to zx_clk_common_probe to handle regmap lookups. However, the device pointe=
r=20
passed is still pdev->dev:

drivers/clk/zte/clk-zx297520v3.c:clk_zx297520v3_probe()
        return zx_clk_common_probe(&pdev->dev, pdev->dev.parent->of_node,
                                   (const struct zx_clk_data *)id->driver_d=
ata);

When zx_clk_common_probe registers the provider, it uses the passed device=
=20
structure which lacks an of_node:

drivers/clk/zte/clk-zx.c:zx_clk_common_probe()
        return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, expo=
rts);

Because the MFD child cell doesn't have an explicit device tree node,=20
dev->of_node is NULL. Could this cause device tree consumers to fail to fin=
d=20
and acquire these clocks during boot?

Should pdev->dev.of_node be explicitly assigned to pdev->dev.parent->of_nod=
e=20
prior to calling zx_clk_common_probe?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923-zx29clk-v1=
2-0-9c243796b6d2@gmail.com?part=3D8
