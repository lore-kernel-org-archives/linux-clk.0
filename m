Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E372A4EF13F
	for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2026 11:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791891312; cv=none; b=kSnO956ow0biFrpyZAdqpN+DxZFl6u5y5v8UdpAhsi0mTDWa+5YN5wWVx5ILuKU19+R/DTw/d0oh4VgFnXW6anbtfoFw99+5Y/b72qwRc7ZTZvxzDSFIHTnYMsGtEIhtHDijYHr2X/rvSTeLj+N+IjrnL41/6UzYoGsyb/jkDpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791891312; c=relaxed/simple;
	bh=eq78BI1b8aHQ8AAJBU6bJ/Gcgf05g89TrYsdBkgz/G8=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date; b=OPmPtm8AjCJQwpRDlenqZB2OCXef0ECK86oMxo0vn3No0UnssmjYKzo/G4k5m361j3bKnlefw+eGbB7V1urCKuudN0x4DygGQgl1KBHB+so6TY10CA/XdCeTo4DQDlQCNmmQ+yavlPZ/cp74zegPbmr4GxZY+xLWIcXIcrUwLvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aa4Lk40S; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aa4Lk40S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FB861F000FF;
	Tue, 13 Oct 2026 11:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791891309;
	bh=24REupCt5Xa1xGdLSdH6D9z8G+KTWLkowPgHJoTc5Ts=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=aa4Lk40SqwZ3lo2SwsU9P4XZP2cKoOB85qPKoXk8AcFJv8yvUieg30tXKGEZXdHA3
	 oC8qK30gk2KpZAgG/opBhj2ei2XB1n4k2ejTq6ZF+1PApvcCnxT5AvrdfV3iWjgMZg
	 8MJeuZy8QeJukqig3waF9HCFBMNNgxtsmhoK/B9yWNakc+43ie+QXrVwNDgnvRg65z
	 8mAWLNH38r8Trnd9PolhlP0aB9n57lD12731CqLWmYnZTRqxoGyb/Clo1+e8Ok1K3a
	 47rw3Dy99xhYQFlE99bq6HA3pIxp5wojkAfmLwYLVreBaM0NWaaGr94sNlPMW7kr0Z
	 pmLPjEHIsafXg==
Message-ID: <sashiko-outbox-169634@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] clk: samsung: exynos5-subcmu: Defer probe until power
 domains are available
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marek Szyprowski" <m.szyprowski@samsung.com>, linux-clk@vger.kernel.org
In-Reply-To: <20261013111840.3645724-1-m.szyprowski@samsung.com>
References: <CGME20261013111847eucas1p24df37631cc74fa27879f7d979348a1e1@eucas1p2.samsung.com>
 <20261013111840.3645724-1-m.szyprowski@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 11:35:08 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Critical] clk: samsung: UAF panic via -EPROBE_DEFER in __init probe func=
tion
- [High] clk: samsung: async pm_runtime_get in subcmu probe causes unpowere=
d reg reads
- [Medium] clk: samsung: sub-CMU registered without PM domain for disabled =
nodes
- [Medium] clk: samsung: missing of_genpd_add_device() error check
--

commit b224f204096c564d4ab18ceac4426ac6bc78aaed
Author: Marek Szyprowski <m.szyprowski@samsung.com>

clk: samsung: exynos5-subcmu: Defer probe until power domains are available
   =20
Sub-CMU devices are added to their power domains with of_genpd_add_device()
during exynos5_clk_probe(). Its return value is ignored, so if the power
domain provider is not registered yet, the sub-CMU device is silently left
outside of its power domain.

Since commit c09a3e6c97f0 ("soc: samsung: pm_domains: Convert to regular
platform driver"), power domain providers are registered only when their
platform devices are probed, which happens after exynos5_clk_probe() has
already been called.

When a sub-CMU device is outside of its power domain, its runtime PM
callbacks race with the power domain state changes, which might result in
losing the proper hardware state. In practice, some clock muxes are left
switched to the oscillator instead of the respective PLLs.

Fix this by deferring exynos5_clk_probe() until the platform devices for
all available power domains are instantiated.

> diff --git a/drivers/clk/samsung/clk-exynos5-subcmu.c b/drivers/clk/samsu=
ng/clk-exynos5-subcmu.c
> index 3731298473013..587fe6e3bbed2 100644
> --- a/drivers/clk/samsung/clk-exynos5-subcmu.c
> +++ b/drivers/clk/samsung/clk-exynos5-subcmu.c

[ ... ]

> @@ -155,11 +156,25 @@ static int __init exynos5_clk_register_subcmu(struc=
t device *parent,
> =20
>  static int __init exynos5_clk_probe(struct platform_device *pdev)
>  {
> +	static const char pd_node_name[] =3D "samsung,exynos4210-pd";
>  	struct device_node *np;
>  	const char *name;
>  	int i;
> =20
> -	for_each_compatible_node(np, NULL, "samsung,exynos4210-pd") {
> +	/* Defer until all needed power domains are registered */
> +	for_each_compatible_node(np, NULL, pd_node_name) {
> +		if (of_device_is_available(np)) {
> +			struct platform_device *pd =3D of_find_device_by_node(np);
> +
> +			if (!pd) {
> +				of_node_put(np);
> +				return -EPROBE_DEFER;

[Severity: Critical]
Since exynos5_clk_probe() is marked __init, will returning -EPROBE_DEFER
cause a use-after-free panic?

When probe deferral is triggered, the probe function is queued for retry.
Because the function resides in the __init section, its memory is freed
after boot. When the deferred probe workqueue eventually retries probing
the device, the kernel will jump into freed memory.

(The modpost section mismatch warning that would normally prevent assigning
an __init function to a platform driver's probe callback is masked by the
__refdata annotation on exynos5_clk_driver).

> +			}
> +			put_device(&pd->dev);
> +		}
> +	}
> +
> +	for_each_compatible_node(np, NULL, pd_node_name) {
>  		if (of_property_read_string(np, "label", &name) < 0)
>  			continue;
>  		for (i =3D 0; i < nr_cmus; i++)
>  			if (strcmp(cmu[i]->pd_name, name) =3D=3D 0)
>  				exynos5_clk_register_subcmu(&pdev->dev,
>  							    cmu[i], np);

[Severity: Medium]
Since this second loop doesn't have the of_device_is_available() check
used in the first loop, could this instantiate sub-CMU devices for disabled
PM domains?

For disabled nodes, this will extract the label, find a matching sub-CMU,
and call exynos5_clk_register_subcmu(). Because the PM domain provider for
the disabled node is never registered, of_genpd_add_device() will fail.

[Severity: Medium]
Will masking the return value of exynos5_clk_register_subcmu() leave the
hardware in an invalid state?

If of_genpd_add_device() or platform_device_alloc() fails in
exynos5_clk_register_subcmu(), the error is ignored. The device is register=
ed
without its power domain attached, which can cause runtime PM callbacks to
race with domain state changes, leaving clock muxes in an incorrect state.

>  	}
>  	return 0;
>  }

I also noticed another issue with runtime PM in this driver:

drivers/clk/samsung/clk-exynos5-subcmu.c:exynos5_subcmu_probe() {
    ...
    pm_runtime_set_suspended(dev);
    pm_runtime_enable(dev);
    pm_runtime_get(dev);

    ctx->dev =3D dev;
    samsung_clk_register_div(ctx, info->div_clks, info->nr_div_clks);
    ...
}

[Severity: High]
Does this asynchronous pm_runtime_get() cause unpowered register reads?

It queues the device power-on but does not wait, and then the immediately
following clock registration functions access the hardware registers. The
Common Clock Framework initialization synchronously reads the clock registe=
rs
via .recalc_rate ops (e.g., clk_divider_recalc_rate()).

Because the device resume and genpd power-on are queued asynchronously,
these register reads occur while the power domain is physically off. This
can cause an imprecise external abort (bus fault) or return zeros, leading
to a corrupted clock tree state.

Should this use pm_runtime_get_sync() to ensure the hardware is ready before
access?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013111840.3645=
724-1-m.szyprowski@samsung.com?part=3D1
