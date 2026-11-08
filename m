Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794154443;
	b=qZCyHFbQIqaVddMWmn2FyrWWXi/1SI6UKeaUaLrSSWYBHL5+yNQ28Vkg9F9yo9hsh5ae
	 3iaZjuBbAb/4WqzMBBzsIn/t1Y1UNZ+p5YVPDtbmIdg27TIERrfYq/Uo3xME7SQAWCOca
	 HcRjQC2RBHLCNenJbNaFxzUZ9kjz7bBsaYBXmelfAY/e6vDHoPQ10I9BvQ8v33OX3Rcct
	 zvazX0fEeiLXpkPKbI18eO9UYvgz3GrEi9wHRmy+fKxtKE05yyr1y+Q+FYdRvBY07Cdty
	 Eedz+OuxwAknEMQ193og0Z6hi1I8aKCJgjmRmmvd+4grsUjt4mFCvyZuLUrsi657o5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794154443;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=askK0awtZ82cbUrKG17ixHUgaRp2DGTd/dVTglU5zFI=;
	b=jDa+4CAaC+JpMmHIrD/QiwkgaYts3f8vxTG5tDo/snzuGIJqF5sLNdDxYzamu7MFHthv
	 O6I/PYp9I6FXltPpUEIzutYEnuuFUQsY+uNQRJP7fycjmGiIb51lqDQsp2qWFzf5Y35ho
	 zjZIABmyud3zp06Pah2kCUkNIg7g/WoQQQ71wdtfxNWwAZrirFaaPlEK1KrJ0nWesf81n
	 diWU1rymyCIjbg925vn3EAZaZlzeaa/fpKz5Cw0lVTPOak1NybptfApBFciEKB5zOaA0T
	 pkKv6jfD4veO0i4oPTUJcmQ0SJMzDaGb9RckrjjhjvEpcS4MKxX6Ov0NaH4qFWOJX2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hQEHJT6v;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACEB9606A31C;
	Sun,  8 Nov 2026 16:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hQEHJT6v
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 080771F0089F;
	Sun,  8 Nov 2026 16:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794154442;
	bh=askK0awtZ82cbUrKG17ixHUgaRp2DGTd/dVTglU5zFI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hQEHJT6vlwAoENk0uKMb1T1DgP7F1h+RfkJwgiDsGsO1ndmEIeNnFbQS6kK0vWhal
	 oR9pitgOAD9AFDGqp264bDuK0qtznv8dw2AYvS5PHpeFkyyZ536t/KFwERLTFMeby1
	 nYTMmarQarBitRDRbLj3tFAidV7lgqVVbyjkfMijjBE0ff4seysZyYj92sTGreaqrx
	 1DD6UhL2CpsusUX0P0o+Pe/tNNADLrBvQ6I+cHvJNe35JWAqC+UziU2jP/ktMHNKKq
	 kVapV+frbknfGWHI+PCmYUzvIu5Lg6Jq6SME8PgWwYNBVNbk9SmJi0n/0/MtSDBmJw
	 DOdMwJjbWrqQw==
Message-ID: <sashiko-outbox-203874@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] clk: sunxi-ng: add Allwinner B288 CCU driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pablo Mazzini" <pmazzini@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-sunxi@lists.linux.dev
In-Reply-To: <20261108155702.361022-4-pmazzini@gmail.com>
References: <20261108155702.361022-1-pmazzini@gmail.com>
 <20261108155702.361022-4-pmazzini@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 08 Nov 2026 16:14:01 +0000
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
- [High] clk: sunxi-ng: missing CPUX mux and PLL notifiers in
  sun8i-b288-ccu
- [Low] clk: sunxi-ng: inconsistent module object name for
  sun8i-b288-ccu
--

commit 2d968133b3c297b695cc7e5349c65174d952448b
Author: Pablo Mazzini <pmazzini@gmail.com>

clk: sunxi-ng: add Allwinner B288 CCU driver

This commit adds a table-based sunxi-ng Clock Control Unit driver for the
Allwinner B288 (sun8iw10p1) SoC.

> diff --git a/drivers/clk/sunxi-ng/Makefile b/drivers/clk/sunxi-ng/Makefile
> index 796f443f4d765..debae396555f6 100644
> --- a/drivers/clk/sunxi-ng/Makefile
> +++ b/drivers/clk/sunxi-ng/Makefile
> @@ -41,6 +41,7 @@ obj-$(CONFIG_SUN4I_A10_CCU)	+=3D sun4i-a10-ccu.o
>  obj-$(CONFIG_SUN5I_CCU)		+=3D sun5i-ccu.o
>  obj-$(CONFIG_SUN6I_A31_CCU)	+=3D sun6i-a31-ccu.o
>  obj-$(CONFIG_SUN6I_RTC_CCU)	+=3D sun6i-rtc-ccu.o
> +obj-$(CONFIG_SUN8I_B288_CCU)	+=3D ccu-sun8i-b288.o
>  obj-$(CONFIG_SUN8I_A23_CCU)	+=3D sun8i-a23-ccu.o
>  obj-$(CONFIG_SUN8I_A33_CCU)	+=3D sun8i-a33-ccu.o
>  obj-$(CONFIG_SUN8I_A83T_CCU)	+=3D sun8i-a83t-ccu.o

[Severity: Low]
Should this build sun8i-b288-ccu.o (with sun8i-b288-ccu-y +=3D
ccu-sun8i-b288.o below) like the other drivers in this Makefile?  Adding
ccu-sun8i-b288.o directly names the module ccu-sun8i-b288.ko instead of
sun8i-b288-ccu.ko.

> diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-b288.c b/drivers/clk/sunxi-ng=
/ccu-sun8i-b288.c
> new file mode 100644
> index 0000000000000..6e12ed8248f20
> --- /dev/null
> +++ b/drivers/clk/sunxi-ng/ccu-sun8i-b288.c

[ ... ]

> +static const struct ccu_tbl_clk sun8i_b288_clks[CLK_NUMBER] =3D {
> +	/*
> +	 * PLL_24M @ 0x034 -- B288 only. It feeds the PLLs 24 MHz whatever
> +	 * the crystal: it converts a 26 MHz one and is bypassed with a
> +	 * 24 MHz one.
> +	 */
> +	CCU_TBL_FIXED_RATE(CLK_PLL_24M, "pll-24m", CCU_TBL_HOSC, 24000000),
> +
> +	CCU_TBL_STD1(CLK_PLL_CPUX, "pll-cpux", PLL_CPU, CLK_PLL_24M, UNGATE),

[ ... ]

> +	CCU_TBL_STD(CLK_CPUX, "cpux", CPUX, cpux_parents, CRIT | RATE_PARENT),

[Severity: High]
Can changing the rate of CLK_CPUX hang the system because no CPU mux or
PLL rate-change notifiers are registered?

CLK_CPUX sets CLK_SET_RATE_PARENT, so clk_set_rate() propagates to
pll-cpux and updates its A31-style NKMP factors in place while the CPU is
running from it.  Other A31-family CCU drivers that allow rate propagation
from cpux to pll-cpux (such as ccu-sun50i-a64.c, ccu-sun8i-a33.c and
ccu-sun8i-h3.c) register ccu_mux_notifier_register() to temporarily
reparent cpux to the 24 MHz oscillator during the rate change and
ccu_pll_notifier_register() to gate and ungate the PLL after updating its
factors, whereas sunxi_ccu_table_platform_probe() registers neither.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261108155702.3610=
22-1-pmazzini@gmail.com?part=3D3
