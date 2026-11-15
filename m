Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794732318;
	b=0A1qlc5o1LKP+fn3CkQeRtK7b2TI1AEBd3erTWSstPFhmdE2Mfu/Cy/6CX9TGYJ3izVB
	 gGven+efx8q5XU25SRW0hSHxBEcnf6v5+sOqaGTMs3ALDTt2kM1mmYkCFazr1k813qTey
	 GWz9xcPVQeKcAF9AFXy3THSPnvAJqMsNmXJKpef0+yjLJi6cE13rFZfHyop1/bYMi/IIm
	 ni+Cru1T0fyCWQwbjxTAViAzneUfcR9JGc552Mkzu0wWwP4PHKfxDUl8mOcjOzS6EVC0w
	 +HuaUCnjVHsbWhc2YjXLsO8/dEF8TN+xPa6cbG+qAMDjkIj/GtIQ45QhwR0UxZhd2Lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794732318;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=sl3ENFVut8t5qMTHdF6RBfGlKCPZn/jBme3iUREMuIs=;
	b=F/okrnXNGfsLxYuDD/KhJubxG2Fmxg3Qz0gG0DoKqR+AT7eg2GP7NHbyLyzfvA3ahVE7
	 XxdSsxiz5p8McB5zix2U79MxMl6SgRsPwtBg2H8XMK57jpDq6mEH9V4/vxqXjTXS8efKt
	 EZAJ/8XG8hPwxLht+9qXRTxGqMaNeGvVlQINdI+5aFMNQldUZX2u1XgtAmaY8Q4SHEKYL
	 jqsBXGgjUFCD46/bpUAehZB42rlQdTKvL5ecN5hiEysp03RZMutSYs8ZYz23flm25yqH3
	 AIG6tBQUV15ekhEj4Gu9KQkV1kL7+a4I7xmmD2rH3o/wbm9bVTqm6pXZwOXe0pqY1kg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Io+ZnHsJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438EE606A31E;
	Sun, 15 Nov 2026 08:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Io+ZnHsJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6A651F000C4;
	Sun, 15 Nov 2026 08:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794732318;
	bh=sl3ENFVut8t5qMTHdF6RBfGlKCPZn/jBme3iUREMuIs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Io+ZnHsJarvHD3y9dFfqNiLkdJmhu8nIqDLeA1X3hgvDeLon1bgh7XvdKJ4N/ZQDC
	 1HvZEIPvSMbHOC86kMNZJFuv41Y8kqQhi6cifHEXB6g5m3NL5tXTTQaveKg/1wXCFn
	 gazsWAvsUMkSvwzNhHuMM/vLk4k4PMysgQ17dSaSByEm/J00259t4FZxPMY6C0TIs6
	 mDCcHozVJfax5GySGBuT58F4ZVo7j1Jv3kHyiyPTybJfBvrhnyEZcFXEl92U+1UZyp
	 RU0sIU7+Nu9YW3/NL2o3egpSZVgJHZd7tWR2aEW+M3t0hDR92vB/OPFLVQWRD/YXfI
	 o5fFw+8d+GLzA==
Message-ID: <sashiko-outbox-215303@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] clk: sunxi-ng: h616: Gate the PLLs with their output
 enable bit
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arun Iyengar" <aiyengar1990@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-sunxi@lists.linux.dev
In-Reply-To: <20261115-h616-pll-output-gate-v1-1-4cb3fc4d6c48@gmail.com>
References: <20261115-h616-pll-output-gate-v1-1-4cb3fc4d6c48@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 08:45:16 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] clk: sunxi-ng: h616: sun50i_h616_ccu_probe() leaves BIT(27)
  forced on in loop
It also noticed 1 related pre-existing issue this patch does not
introduce:
- [High] clk: sunxi-ng: h616: wrong GPU notifier registration order in
  sun50i_h616_ccu_probe() [1]
--

commit 733f137b19620733cea59e88a8f5b18ba7301d4a
Author: Arun Iyengar <aiyengar1990@gmail.com>

clk: sunxi-ng: h616: Gate the PLLs with their output enable bit

This commit changes the H616 PLL clocks to gate using their output enable
bit (BIT(27)) instead of the PLL enable bit (BIT(31)), and powers up the
PLLs in sun50i_h616_ccu_probe().

> diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c b/drivers/clk/sunxi-n=
g/ccu-sun50i-h616.c
> index 955c614830fae..da4156b39c2cc 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun50i-h616.c

[ ... ]

> @@ -1214,6 +1214,13 @@ static int sun50i_h616_ccu_probe(struct platform_d=
evice *pdev)
>  	val |=3D BIT(0);
>  	writel(val, reg + SUN50I_H616_PLL_AUDIO_REG);
> =20
> +	/* Keep the PLLs powered and gate them with bit 27 (manual 3.3.3.6). */
> +	for (i =3D 0; i < ARRAY_SIZE(pll_regs); i++) {
> +		val =3D readl(reg + pll_regs[i]);
> +		val |=3D BIT(31);
> +		writel(val, reg + pll_regs[i]);
> +	}
> +
>  	/*
>  	 * Set the input-divider for the gpu1 clock to 3, to reach a safe 400 M=
Hz.
>  	 */

[Severity: Medium]
Should the existing pll_regs loop earlier in sun50i_h616_ccu_probe() be
updated to set BIT(31) | BIT(29) instead of adding this second loop?

drivers/clk/sunxi-ng/ccu-sun50i-h616.c:sun50i_h616_ccu_probe() {
    ...
	/* Enable the lock bits and the output enable bits on all PLLs */
	for (i =3D 0; i < ARRAY_SIZE(pll_regs); i++) {
		val =3D readl(reg + pll_regs[i]);
		val |=3D BIT(29) | BIT(27);
		writel(val, reg + pll_regs[i]);
	}
    ...
}

Leaving that first loop setting BIT(27) unconditionally ungates the output
of all 12 PLLs before the video and audio PLL dividers are configured and
before disabled PLLs are powered up via BIT(31), and causes the clock
framework to see every PLL as already enabled at registration time.

[Severity: High]
This problem wasn't introduced by this patch, but later in
sun50i_h616_ccu_probe() the GPU clock mux notifier is registered before
the GPU PLL notifier [1]:

drivers/clk/sunxi-ng/ccu-sun50i-h616.c:sun50i_h616_ccu_probe() {
    ...
	/* Reparent GPU during GPU PLL rate changes */
	ccu_mux_notifier_register(pll_gpu_clk.common.hw.clk,
				  &sun50i_h616_gpu_nb);

	/* Re-lock the GPU PLL after any rate changes */
	ccu_pll_notifier_register(&sun50i_h616_pll_gpu_nb);
    ...
}

Because both notifiers use priority 0, they run in registration order.
On POST_RATE_CHANGE during GPU frequency scaling, ccu_mux_notifier_cb()
reparents gpu0_clk back to pll_gpu_clk before ccu_pll_notifier_cb()
re-enables and waits for the PLL to lock, driving the GPU from an
unlocked PLL.

[1] https://sashiko.dev/#/bug/linux-b48c9987-4bbf-4231-b1fc-24d8ccdf62d9

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261115-h616-pll-o=
utput-gate-v1-1-4cb3fc4d6c48@gmail.com?part=3D1
