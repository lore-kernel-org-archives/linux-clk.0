Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 960932472AE;
	Sun, 27 Sep 2026 21:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790543128; cv=none; b=dpG8kCRYgPjPTAwzcUCordFcgr4Gep3jyTbO/FunGOChNRyIfxKPeImD6IXoj/fL+iglL2s8DNeuVXFsTMkgUoh7KYlPaoWh8eaRRNSMe2aBSAxwyxqiB0IBTeTwnI2WF5+gbCCIRcKJvTteMzS02LHDbDRpoz/6aWqcnCbJlEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790543128; c=relaxed/simple;
	bh=2ULQhFk2dc9UmjdLYD/XY5ey5A4Vo31E3uQyiqi9EFY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fwxhVhz25QbKDtzgm6qCKl08TM/uu+KsrllL82PAA1yi9HPyLPXNYEXbKWK3iIs95NEpbytyA6CNnwZNFgtBzvMpGLWmnzmhAezjsMWmlx2kFxVgE9otHKELvsuw5PzzF4FowICVIiOWa+sFTYXU6ztTv6SHM9l5FDBMISIiJ5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MTvn3IuL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MTvn3IuL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A632B1F000FF;
	Sun, 27 Sep 2026 21:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790543127;
	bh=E56r9AJFQyJKksoqgtO02DwFpMWfx3pLf3SSN9eIVNQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MTvn3IuLLUwBvTGDSZ18ifxFNqKvbYU+Tm5atPKmxIf4xtaJOcXU5yvtUnQ87316u
	 E17GBVmCfqpmUqe8Xamuv5mApqzdWj3l3eI9snvqK2gxPWTFd0uFYL531+E4Yjl29/
	 WuQsQetvSts80GP+aVCaCUEU2pfVDmjYsx61RsRH8Ne2DncsLJ8A2prJIxlwIWfjC9
	 wrE/UwOeLj0onzx6VsCZqt2bkH1xmlhnrhPu2cRgH/JSkBLZ5Gubsp2gjV7TlQRirL
	 fWX/yB1sid244jHR8asdcbzktyKLKa8kQ+nZfXNBrw2NVXRCQY1tqlBRQOMTXfH7ix
	 ePuWNeJYlxGkg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 10/13] clk: zte: Introduce a driver for zx297520v3
 matrix clocks
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3RlZmFuIETDtnNpbmdlcg==?= <stefandoesinger@gmail.com>
Cc: linux-clk@vger.kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com, linux-phy@lists.infradead.org, conor+dt@kernel.org, devicetree@vger.kernel.org, vkoul@kernel.org, mfd@lists.linux.dev, robh@kernel.org, lee@kernel.org
In-Reply-To: <20260927-zx29clk-v13-10-70d8f673386c@gmail.com>
References: <20260927-zx29clk-v13-0-70d8f673386c@gmail.com>
 <20260927-zx29clk-v13-10-70d8f673386c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 27 Sep 2026 21:05:26 +0000
Message-Id: <20260927210526.A632B1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] clk: zx297520v3: orphaned firmware clocks due to NULL dev->of_node
- [Low] clk: zx297520v3: compilation failure due to const initializers
--

commit 1f05d5e802fc7c2765df7aa9b0a1ac54ff100e45
Author: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

    clk: zte: Introduce a driver for zx297520v3 matrix clocks

This commit introduces a clock controller driver for the zx297520v3 matrix
clocks, covering high-speed devices like CPU, DMA, RAM, SDIO, and Ethernet.
It defines fixed dividers, muxes, and gates for the matrix clock tree.

> diff --git a/drivers/clk/zte/clk-zx297520v3.c b/drivers/clk/zte/clk-zx297=
520v3.c
> index 68bfeab84d745..d5f8bc4064bd4 100644
> --- a/drivers/clk/zte/clk-zx297520v3.c
> +++ b/drivers/clk/zte/clk-zx297520v3.c
[ ... ]
> @@ -812,6 +812,528 @@ static const struct zx_clk_data zx297520v3_topclk_d=
ata =3D {
[ ... ]
> +static const struct zx_parent_desc matrix_unk =3D PARENT_FW("wclk-osc26m=
");
[ ... ]
> +static const struct zx_clock zx297520v3_matrix_clocks[] =3D {
[ ... ]
> +	[ZX_CLK_CPU_WCLK]         =3D GATE("cpu-wclk", PARENT_ID(ZX_CLK_CPU_MUX=
), 0x24, 1,
> +					 CLK_IS_CRITICAL),
> +	[ZX_CLK_CPU_PCLK]         =3D GATE("cpu-pclk", clk_main[0], 0x24, 2, CL=
K_IS_CRITICAL),

[Severity: Low]
Is this code valid C?

The array element clk_main[0] is being used as a static struct initializer.
In C, unlike C++, array elements and const variables are not constant
expressions, which will produce a fatal "initializer element is not constan=
t"
build error.

[ ... ]
> +	[ZX_CLK_PDCFG_WCLK]       =3D GATE("pdcfg-wclk", matrix_unk, 0x88, 0, C=
LK_IS_CRITICAL),

[Severity: Low]
Does this initializer also fail to build?

Similar to the above, matrix_unk is a const variable and cannot be used
as a static struct initializer in C.

[ ... ]
> +static const struct zx_clk_data zx297520v3_matrixclk_data =3D {
> +	.init =3D zx297520v3_matrix_init,
> +	.clocks =3D zx297520v3_matrix_clocks,
> +	.num_clocks =3D ARRAY_SIZE(zx297520v3_matrix_clocks),
> +	.exports =3D zx297520v3_matrix_exports,
> +	.num_exports =3D ARRAY_SIZE(zx297520v3_matrix_exports),
> +};
> +
>  static int clk_zx297520v3_probe(struct platform_device *pdev)
>  {
>  	const struct platform_device_id *id =3D platform_get_device_id(pdev);
> =20
>  	if (!id)
>  		return -ENODEV;
> =20
>  	return zx_clk_common_probe(&pdev->dev, pdev->dev.parent->of_node,
>  				   (const struct zx_clk_data *)id->driver_data);
>  }

[Severity: High]
Does this code leave all firmware-based clocks orphaned?

The parent's of_node is passed explicitly to zx_clk_common_probe() for
validation and provider registration, but it is never assigned to
pdev->dev.of_node. Since the matrix clock controller is an MFD child device
without an of_compatible, its pdev->dev.of_node will be NULL.

When registering the clocks, the Common Clock Framework relies on dev->of_n=
ode
to resolve fw_name parents. For example, in zx_clk_register_fixed_div() in
drivers/clk/zte/clk-zx.c:

	case ZX_PARENT_FW:
		return devm_clk_hw_register_fixed_factor_fwname(dev, NULL,
				desc->name, p->fw_name,
				CLK_SET_RATE_PARENT, 1, desc->div);

Because dev->of_node is NULL, clk_core_fill_parent()'s of_clk_get_by_name()
will instantly return -ENOENT.

Should pdev->dev.of_node be assigned before probing so the CCF can resolve
the clock tree?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260927-zx29clk-v1=
3-0-70d8f673386c@gmail.com?part=3D10
