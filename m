Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794569049;
	b=G4BwiWKK5vPLWNg1DTLFdfGGOQOClztkLVxEDDKzloMJx9eDn9CLcLjyXu/5202FSEvr
	 XpPNUvzpuO07hhXQRDYX8ST1svVSmRZgUBJfHdSjBvUMFBy+8UvK+0ncJ05wCeO4NmVZ9
	 Yl9jdSzuSxj0Zn9rBiUrg/aT/s+ihrnbC4Z2ZSOflb3Mu6Nu7a7Dptvw/8sY6out8Pid2
	 T2VFh80hzXmoYovvUj5U7CVc+A1422RNEALuHf0yax2ii4Lh3RB20giJEZKgoDcTnD5Yw
	 ZxGVC8ak9i59ZeTWCFDndstW7vSsA7xfrLGeHO6B4jK21xgu9yZTRUl95ygqVy9looA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794569049;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=esHi9Jl9r/e/B+A/8aDlJfOciGV79Ba0QhT6F94neVY=;
	b=aVkwcfhjuiVTtxtlOT7FGWEY+T179M3Swh9o6cQudYfPZYQ83RXai15x7bmAo174Bz59
	 ytbyWW06dYx25FN6KF0fDO7tlblYDDxzfNqBmKKnhAt7tYvn9ZcmZK5uYkOWcQAgS5oTw
	 zmcti8jH3vcQeRfAXgwC8tuAx6Jhy4XX+BvtL578ZYoYnT4jefQzHtgRKLr6l2NRbnMFO
	 oQVVOaLrvisUfstdgdqu8Z1YGKJPqSBkWc3NgZBpa0I2Rd6z/rpsO8A0ziVvrUGm/uHxt
	 nf4mu1SH0PS2Sd/f3DyRZjFrVvWbIGWKHOSi1XZju7M/iLkxEf4kVubdZAagCzb67Kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Va+JA+tZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 067F4606A321;
	Fri, 13 Nov 2026 11:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Va+JA+tZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84DB81F000C4;
	Fri, 13 Nov 2026 11:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794569048;
	bh=esHi9Jl9r/e/B+A/8aDlJfOciGV79Ba0QhT6F94neVY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Va+JA+tZPB+I7TptcB+3yCdDkmTL0968Hqnmk5xtxxUS7V0gBPbUtGw7XOWf6Apl1
	 DDQPQ2qScLKx50lh93875605v62rLIYo2/SUfxd42YG4ZPhIn9CpmCEgY/noqAov8u
	 PMvmf7k6GBG+CsB18DYeu7pm0JP6rPQuNMS8+nAxB3KL9XuzYJ975UIj/0ISBWy1mf
	 flmrPRoAr0RVa+Q+bVpAX/vz6r+PMywUdnVp8E8yrZpBhres2UzTq0SMY3rGej79wX
	 X8FzrVFpW4jc89CAwvtp7t1ZU0tWzZcZUwvFrL0FOWFmcC67AmUao8bDJzxU5iltXb
	 ZSdPHGIZI6aAw==
Message-ID: <sashiko-outbox-212713@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 07/14 RESEND] clk: samsung: exynos8855: add block top
 and peric clock support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Raghav Sharma" <raghav.s@samsung.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261113110612.3265841-8-raghav.s@samsung.com>
References: <20261113110612.3265841-1-raghav.s@samsung.com>
 <CGME20261113104850epcas5p4ef9292af100475b1f12a2601bf5e1a84@epcas5p4.samsung.com>
 <20261113110612.3265841-8-raghav.s@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 11:24:08 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] clk: samsung: exynos8855: wrong parent clock for
  CLK_GOUT_UART_DBG_PERIC
- [Low] clk: samsung: exynos8855: duplicate cmu-top entry in
  exynos8855_cmu_of_match
--

commit 2beaee0a6e639b45324bd65007b59d1e589e9da3
Author: Raghav Sharma <raghav.s@samsung.com>

clk: samsung: exynos8855: add block top and peric clock support

This commit adds Common Clock Framework support for the CMU_TOP and
CMU_PERIC clock management units on the Samsung Exynos 8855 SoC.

> diff --git a/drivers/clk/samsung/clk-exynos8855.c b/drivers/clk/samsung/c=
lk-exynos8855.c
> new file mode 100644
> index 0000000000000..dcf58f2459b0f
> --- /dev/null
> +++ b/drivers/clk/samsung/clk-exynos8855.c

[ ... ]

> +static void __init exynos8855_cmu_top_init(struct device_node *np)
> +{
> +	exynos_arm64_register_cmu(NULL, np, &top_cmu_info);
> +}
> +
> +/* Register CMU_TOP early, as it's a dependency for other early domains =
*/
> +CLK_OF_DECLARE(exynos8855_cmu_top, "samsung,exynos8855-cmu-top",
> +	       exynos8855_cmu_top_init);

[ ... ]

> +static const struct samsung_gate_clock peric_gate_clks[] __initconst =3D=
 {
> +	GATE(CLK_GOUT_CMU_PERIC, "gout_cmu_peric",
> +	     "dout_clkcmu_peric_nocp",
> +	     CMU_PERIC_CLK_CON_GAT_BLK_PERIC_UID_CMU_PERIC_IPCLKPORT_PCLK,
> +	     21, 0, 0),
> +	GATE(CLK_GOUT_SYSREG_PERIC, "gout_sysreg_peric",
> +	     "dout_clkcmu_peric_nocp",
> +	     CMU_PERIC_CLK_CON_GAT_BLK_PERIC_UID_SYSREG_PERIC_IPCLKPORT_PCLK,
> +	     21, 0, 0),
> +	GATE(CLK_GOUT_UART_DBG_PERIC, "gout_uart_dbg_peric",
> +	     "dout_clkcmu_peric_uart_dbg",
> +	     CMU_PERIC_CLK_CON_GAT_BLK_PERIC_UID_UART_DBG_IPCLKPORT_PCLK,
> +	     21, 0, 0),
> +	GATE(CLK_GOUT_USI_PERIC, "gout_usi_peric",
> +	     "dout_clkcmu_peric_nocp",
> +	     CMU_PERIC_CLK_CON_GAT_BLK_PERIC_UID_USI00_USI_IPCLKPORT_PCLK,
> +	     21, 0, 0),
> +};

[Severity: Medium]
Should CLK_GOUT_UART_DBG_PERIC have dout_clkcmu_peric_nocp as its parent
instead of dout_clkcmu_peric_uart_dbg?

CMU_PERIC_CLK_CON_GAT_BLK_PERIC_UID_UART_DBG_IPCLKPORT_PCLK is the APB
PCLK gate register, and all other IPCLKPORT_PCLK gates in peric_gate_clks
(including gout_usi_peric) are parented to the APB bus clock
dout_clkcmu_peric_nocp.  Parenting this PCLK gate to the UART baud clock
divider reports the wrong PCLK rate and does not propagate enable counts
to dout_clkcmu_peric_nocp.

[ ... ]

> +static const struct of_device_id exynos8855_cmu_of_match[] =3D {
> +	{
> +		.compatible =3D "samsung,exynos8855-cmu-peric",
> +		.data =3D &peric_cmu_info,
> +	}, {
> +		.compatible =3D "samsung,exynos8855-cmu-top",
> +		.data =3D &top_cmu_info,
> +	},
> +	{ }
> +};

[Severity: Low]
Should "samsung,exynos8855-cmu-top" be dropped from
exynos8855_cmu_of_match?

CMU_TOP is already registered early via CLK_OF_DECLARE(), which marks the
device node OF_POPULATED so the platform driver match entry is unused
during normal boot, and if a matching platform device were ever probed via
exynos8855_cmu_probe(), samsung_cmu_register_one() would attempt to
register top_cmu_info a second time and panic in
samsung_clk_of_add_provider().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113110612.3265=
841-1-raghav.s@samsung.com?part=3D7
