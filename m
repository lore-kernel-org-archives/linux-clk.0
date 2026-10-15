Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24514E36CB
	for <linux-clk@vger.kernel.org>; Thu, 15 Oct 2026 12:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792065697; cv=none; b=mHfjtBtZVmWSbPw1Slb8NaEEgavnd7V6I0UI8eOwVoHFHxB05MslaXq64doyWgBB/nHBu/79/HmVASUNMG0YNLvib1JycBzzv3Z8ozX62QgruhzUX3io9bhF5bdjMRgcHv45i3XoMhokn5JGmj4Det/ERkrCerbgLyJMjQULyKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792065697; c=relaxed/simple;
	bh=JTpFEcQYCRRyKBnTmjwY1iJ/72WurTkplKEibS7le8E=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date; b=oJYkGD6EojZTRC/5VMxUCfrqMKcTFFCLfglIPn1jyGNkTEtfw1My7l+LcqjoqtAR4rArgMNCzv85vL3rTAyOlTirnoBnZzq3k3ua60H/iKMlFFhv4u1COXkB+txk3CvaRFbBDIFI4aHJ+Pbr/o889IXUtJ6Ov2sf0AfHnlPfH6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e4mnBQXx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e4mnBQXx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CC391F000C4;
	Thu, 15 Oct 2026 12:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792065696;
	bh=QpO7Jc2fy2zFD00Bw5t1XJ/ZaAr7bCIXFaEWMYKH3a0=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=e4mnBQXxalMFFmtGQ3ECRa9AGvA4ilw81CgDWZAg2Sf6YuaHBI2+jDT5iAAr0SRJD
	 rkncL8ZyIh39ZLYLUsNK1h9xhFGScyNPHzAOtsi8umxg9PeRSKr7+dylqXSl6xn1XF
	 7fiQUrqibnaSVyaCtcFNJvfO3iCimSvsIqGYovyixeHNSGfo78TE4XmPCzcyrp+VY6
	 SgG2PT0YvfV0RP3eTE2Xih7cgX4ynmXtonzi3fYWApyleP69SZblVPsSpB6iOR5sM5
	 oFdTzFSeBIjrifjg+mpx1hVco814UscKsl40XfP0gYPfFJ0rrUS0c6yk1VI9JyKzUb
	 vE/awqfLbxDFw==
Message-ID: <sashiko-outbox-172780@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] clk: samsung: exynos5-subcmu: Use pm_runtime_get_sync()
 during probe
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marek Szyprowski" <m.szyprowski@samsung.com>, linux-clk@vger.kernel.org
In-Reply-To: <20261015115008.600082-1-m.szyprowski@samsung.com>
References: <CGME20261015115020eucas1p1652dcb97079fc506b99422994680d76e@eucas1p1.samsung.com>
 <20261015115008.600082-1-m.szyprowski@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 12:01:36 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] pm: missing error check for pm_runtime_get_sync() allows unpowered=
 register access
- [High] clk: samsung: exynos5-subcmu: race condition on global ctx->dev
--

commit fe90e32911f3916661d4731141c07feca831815e
Author: Marek Szyprowski <m.szyprowski@samsung.com>

clk: samsung: exynos5-subcmu: Use pm_runtime_get_sync() during probe

This commit changes the probe function to use pm_runtime_get_sync() instead
of pm_runtime_get(). This ensures that the device and its power domain are
fully active before accessing clock registers during registration.

> diff --git a/drivers/clk/samsung/clk-exynos5-subcmu.c b/drivers/clk/samsu=
ng/clk-exynos5-subcmu.c
> index 3731298473013..1d7eb98b72cf8 100644
> --- a/drivers/clk/samsung/clk-exynos5-subcmu.c
> +++ b/drivers/clk/samsung/clk-exynos5-subcmu.c
> @@ -103,7 +103,7 @@ static int __init exynos5_subcmu_probe(struct platfor=
m_device *pdev)
> =20
>  	pm_runtime_set_suspended(dev);
>  	pm_runtime_enable(dev);
> -	pm_runtime_get(dev);
> +	pm_runtime_get_sync(dev);

[Severity: High]
Is it safe to ignore the return value of pm_runtime_get_sync()?

If it returns a negative error code (e.g. hardware failure, regulator
issue, or timeout), proceeding to call samsung_clk_register_div() and
samsung_clk_register_gate() will read unpowered hardware registers, which
can cause a synchronous external abort or data corruption.

Should this check the return value, abort the probe, and roll back PM
operations on failure?

> =20
>  	ctx->dev =3D dev;
>  	samsung_clk_register_div(ctx, info->div_clks, info->nr_div_clks);
>  	samsung_clk_register_gate(ctx, info->gate_clks, info->nr_gate_clks);
>  	ctx->dev =3D NULL;

[Severity: High]
Does assigning and clearing the shared global ctx->dev without locking
introduce a race condition during concurrent asynchronous probes?

If asynchronous probing is enabled via driver_async_probe, multiple
exynos5-subcmu devices could probe concurrently. Since pm_runtime_get_sync()
can sleep, this widens the race window where concurrent threads could
overwrite ctx->dev or prematurely clear it to NULL while another thread is
still registering its clocks.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015115008.6000=
82-1-m.szyprowski@samsung.com?part=3D1
