Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 292AD37F8CA;
	Sun, 27 Sep 2026 15:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790522585; cv=none; b=XxnJcYG7c9MHExWkFtq8jAOmCPoYKwb8W73DJnZd7ukXqKHX6ojjit5zNSMzO6X3OqfMZ2wC7pvlG72bE1KaxUE4cv59xb1btkWOC4CrVz4hPQLtd6rzcheScIShBAm3VPtAV4eXeMMan8pUPwOmFWbyHOUaJIw6yfSBbZrQKnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790522585; c=relaxed/simple;
	bh=ZLcCy9kKCwD+7TI57IdQ6PrbpDpvYPgIyWFlQt9nOE8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=COwYKSZuoL1bEz9WZyVJ8k3jLiatEyKoGsYIOnxbkMnXDs2zHAWySvP2y+XsMZPQ+YMenl1aw2X6l+RVpLYI7Q5SPcgDRxGE2J44SUJgIElNxu0bh0PtKq3INLeEF5Frq984U6/iMPWlgQHPD0jrC+Hkjye936KHKn7nDs2ZKEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S6PcT37t; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S6PcT37t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90B2E1F000FF;
	Sun, 27 Sep 2026 15:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790522583;
	bh=FPRAxUouJ/t0cbjIyU37agVG4PAMX20JZ6+gxy6Kqmw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=S6PcT37thu/c3y4zZbzSsFMxkI0VcpaORQ3yYV0cQfFFdyP++nbZFaL+xqUKDyj4l
	 W53IT1mhMpsSoWnIb8TAmWzmN4MvpqnUa2JhgjMTXr7Isplpkx2J6/WYTLQmThSLAS
	 GL1wETzyefV6jKA856HOlLaGYjjzK+ePgOuqCtDznKCSnMPoUkBQBwnKJSQKCh5Ap5
	 oTwg8AL1OPl0c8qdW29+SE/4dg37YrsQgGQEX7l2eBnQWmZNZ+E8shOTkvxjEVQEpl
	 bV8X0uXUk/qTzC9/bej07jCh3JGmmsA/PFrJvcBKi4TSE59O+FZlq91wPhlWNShNzK
	 k3f+kFmDnAyOg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 02/11] clk: sunxi-ng: add Allwinner B288 CCU driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pablo Mazzini" <pmazzini@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-sunxi@lists.linux.dev
In-Reply-To: <20260927151016.186493-3-pmazzini@gmail.com>
References: <20260927151016.186493-1-pmazzini@gmail.com>
 <20260927151016.186493-3-pmazzini@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 27 Sep 2026 15:23:03 +0000
Message-Id: <20260927152303.90B2E1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] clk: sunxi-ng: pll-ddr0/1 lack required update bit logic causing=
 rate desync
--

commit e45a1df66351c0556d843abaca74cd27fa7b5854
Author: Pablo Mazzini <pmazzini@gmail.com>

clk: sunxi-ng: add Allwinner B288 CCU driver

This commit introduces the Clock Control Unit (CCU) driver for the Allwinne=
r=20
B288 SoC. It covers the PLLs, the CPU/AHB/APB tree, the module clocks, and=
=20
the bus gates and resets.

> diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-b288.c b/drivers/clk/sunxi-ng=
/ccu-sun8i-b288.c
> new file mode 100644
> index 0000000000000..3327517c4c36e
> --- /dev/null
> +++ b/drivers/clk/sunxi-ng/ccu-sun8i-b288.c

[ ... ]

> +/*
> + * PLL_DDR0 @ 0x020 -- DIVERGES FROM A64, which is NKM with N[12:8] K[5:=
4].
> + * The B288 has a 7-bit N and no K: the value boot0 leaves here sets
> + * bit 13, which the A64's 5-bit N field cannot hold.
> + *
> + * The vendor's bit-30 apply/update has no mainline equivalent and is not
> + * modelled, nor are the sigma-delta patterns at 0x2ac..0x2b8.
> + */
> +static SUNXI_CCU_NM_WITH_GATE_LOCK(pll_ddr0_clk, "pll-ddr0",
> +				   "osc24M", 0x020,
> +				   8, 7,	/* N */
> +				   0, 2,	/* M */
> +				   BIT(31),	/* gate */
> +				   BIT(28),	/* lock */
> +				   CLK_SET_RATE_UNGATE);

[Severity: Medium]
Does this configuration break frequency scaling for pll-ddr0?=20

The pll-ddr0 clock is registered with the CLK_SET_RATE_UNGATE flag but reli=
es=20
on ccu_nm_ops. If a driver or subsystem (such as devfreq) calls clk_set_rat=
e()=20
on pll-ddr0, it will write new M/N factors to the registers but fail to tog=
gle=20
the required update bit (bit 30).

This causes the hardware to ignore the new configuration while the kernel=20
state reflects the new frequency, breaking clock tree consistency. Since th=
e=20
comment above mentions the vendor's bit-30 apply/update has no mainline=20
equivalent and is not modelled, how does the driver intend to handle rate=20
updates safely?

[ ... ]

> +/* PLL_DDR1 @ 0x04c -- B288 only. Same layout; this is the one feeding D=
RAM. */
> +static SUNXI_CCU_NM_WITH_GATE_LOCK(pll_ddr1_clk, "pll-ddr1",
> +				   "osc24M", 0x04c,
> +				   8, 7,	/* N */
> +				   0, 2,	/* M */
> +				   BIT(31),	/* gate */
> +				   BIT(28),	/* lock */
> +				   CLK_SET_RATE_UNGATE);

[Severity: Medium]
Does pll-ddr1 also suffer from the missing bit 30 update logic during=20
frequency scaling?

Similar to pll_ddr0_clk, this clock uses the same operations and exposes a=
=20
set_rate callback, but appears to lack the necessary mechanism to toggle=20
the bit-30 update bit when writing the new configuration.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260927151016.1864=
93-1-pmazzini@gmail.com?part=3D2
