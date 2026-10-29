Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793279276;
	b=reEZhtm/Bxxb6GULAl7k/2LACPSOFZH72bTDFNIXRC8RhLoUvwPU1wIbf80oylt3hTcP
	 7Q1eOfwJUEMaCBkX22EFOefFLmHTRp/d6t/m6I/4FryIfQnMXLNrEOxm/G+oI/nUt8Wza
	 Val1qrkM70LIoycGf4snIIDsNjPdqw+6/lD7uSFxNZWLGxumPi3fEHooDx89RelsEcfGI
	 rxxReQR4s33zZS+8M1iOi07nmuHSPREfZocdWg2auKSrzt1Sa0LOQsPKhYQt3y3B2OZ2g
	 elezLZIVCL0UYeeI6sGmSoNO94kfwdMGvVlZKUXrn7XuG3DtvYw8ab1x2B8CqezUGCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793279276;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ri2/5CSLYZBwJZyC2QWqefLo3bxzysg7cheeyIAphZk=;
	b=3VcfmbOCFHgXfc5L9IFVBCRUc+KZYUe1saV1+YKD3tWwlqlhWit+jwjHc1xONvlGQEdj
	 thRroECbZvRxIkSv+X22jN/ro5oGIWwJfXBJYIHu4YR2p9yaRK7si/vjl3Shm/AP0mCXm
	 X2WB7O3NebS+3/FHza1E20pnm16JktYn0l6n4xDwTeKZjWm0yOYvq7t9v28c4/VRyvQSh
	 8SBxdVs8rfFGtRWPr2GEz3/LFXWMkU6HEmeAUXhGCas5OIawdpF4ER3UcqK8zFzh+c6l0
	 IX0ehGEpjfhPNZkZU7d5XtZqCbbBG0lXSotIINGUI5FqECSHA2YPMaeClzMRmaXgvJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MUWEBOFc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 693B7606A31A
	for <linux-clk@vger.kernel.org>; Thu, 29 Oct 2026 13:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MUWEBOFc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2A571F01825;
	Thu, 29 Oct 2026 13:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793279275;
	bh=ri2/5CSLYZBwJZyC2QWqefLo3bxzysg7cheeyIAphZk=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=MUWEBOFcC3dWvFPGLh8nUGxBoR67RfLVDvNn4aRdRpZfp6zr20qbYtfW8XeJqnEEo
	 7bGhA+51EVa2cn1duiK/xTuZ5bstJCq+Sp+mL2YJd1v+JZA7dxVJ7wmlRmcj1kHctn
	 805EzokYyk8IP37girDNGQtFV2S//Db6y2uNf+OvqIX4K4icBtjiF/VPLAOoQzTz4f
	 GNOFa4QpCwM4DIPy8WY8YVxygsD0MvG+T0P7MZ7fZTs8+l0D1AX5Vgq2/wj+vnok0v
	 Hb4bll5CnQuEoBMVfYmu+e9G2j/8jDcKxSo7G33HMaKN6LA+eXrBqSkVWZEiksW/Fw
	 xzZyNSxlsMOSw==
Message-ID: <sashiko-outbox-189353@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] clk: samsung: exynos5-subcmu: Defer probe until
 power domains are available
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marek Szyprowski" <m.szyprowski@samsung.com>, linux-clk@vger.kernel.org
In-Reply-To: <20261029125118.3191455-4-m.szyprowski@samsung.com>
References: <20261029125118.3191455-1-m.szyprowski@samsung.com>
 <CGME20261029125130eucas1p28348b477be508aac4d38b8eb808459e4@eucas1p2.samsung.com>
 <20261029125118.3191455-4-m.szyprowski@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 29 Oct 2026 13:07:55 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] clk: samsung: exynos5-subcmu: section mismatch and init UAF in exy=
nos5_subcmu_probe()
--

commit dee821466f03d766741ba105807d778f3d7a60f1
Author: Marek Szyprowski <m.szyprowski@samsung.com>

clk: samsung: exynos5-subcmu: Defer probe until power domains are available

This commit defers exynos5_clk_probe() until all available power domain
platform devices are instantiated so that sub-CMU devices can be properly
added to their power domains. To support deferred probing, it also drops the
__init and __refdata annotations from the probe functions and platform
drivers in clk-exynos5-subcmu.c.

> diff --git a/drivers/clk/samsung/clk-exynos5-subcmu.c b/drivers/clk/samsu=
ng/clk-exynos5-subcmu.c
> index 1d7eb98b72cf8..fe67c3066f2ef 100644
> --- a/drivers/clk/samsung/clk-exynos5-subcmu.c
> +++ b/drivers/clk/samsung/clk-exynos5-subcmu.c

[ ... ]

> @@ -96,7 +97,7 @@ static int __maybe_unused exynos5_subcmu_resume(struct =
device *dev)
>  	return 0;
>  }
> =20
> -static int __init exynos5_subcmu_probe(struct platform_device *pdev)
> +static int exynos5_subcmu_probe(struct platform_device *pdev)
>  {
>  	struct device *dev =3D &pdev->dev;
>  	struct exynos5_subcmu_info *info =3D dev_get_drvdata(dev);

[Severity: High]
Does removing __init from exynos5_subcmu_probe() introduce a section mismat=
ch
and a potential use-after-free of init memory if probing is deferred past
free_initmem()?

In drivers/clk/samsung/clk-exynos5-subcmu.c, exynos5_subcmu_probe() calls
samsung_clk_register_div() and samsung_clk_register_gate(), passing
info->div_clks and info->gate_clks:

    ctx->dev =3D dev;
    samsung_clk_register_div(ctx, info->div_clks, info->nr_div_clks);
    samsung_clk_register_gate(ctx, info->gate_clks, info->nr_gate_clks);
    ctx->dev =3D NULL;

However, in drivers/clk/samsung/clk.c, both registration helpers are still
marked __init:

    void __init samsung_clk_register_div(struct samsung_clk_provider *ctx,
                    const struct samsung_div_clock *list,
                    unsigned int nr_clk)

    void __init samsung_clk_register_gate(struct samsung_clk_provider *ctx,
                    const struct samsung_gate_clock *list,
                    unsigned int nr_clk)

In addition, the sub-CMU clock arrays passed through info->div_clks and
info->gate_clks in drivers/clk/samsung/clk-exynos5250.c
(exynos5250_disp_gate_clks) and drivers/clk/samsung/clk-exynos5420.c
(exynos5x_disp_div_clks, exynos5x_disp_gate_clks, exynos5x_gsc_div_clks,
exynos5x_gsc_gate_clks, exynos5x_g3d_gate_clks, exynos5x_mfc_div_clks,
exynos5x_mfc_gate_clks, exynos5x_mscl_gate_clks, exynos5x_mscl_div_clks, and
exynos5800_mau_gate_clks) are still marked __initconst.

Should the __init and __initconst annotations also be removed from those
registration functions and clock tables so they remain valid when
exynos5_subcmu_probe() runs from normal .text or after init memory is freed?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261029125118.3191=
455-1-m.szyprowski@samsung.com?part=3D3
