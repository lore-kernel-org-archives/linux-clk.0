Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 237073B19DB
	for <linux-clk@vger.kernel.org>; Thu, 20 Aug 2026 08:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787215190; cv=pass; b=p14bLM+PS5tThLsFbwRAsSL1UhBVh43kALueL7tf8RDpFcv02wIoz2oqy8gyW2Ni9pWO4hM5mdRy0ub7U/Fh0zKSexxpntTs4ffFygNdGgeJKCvYMfu0zvWrHnTR4PK6tWvwQ5HVP7oxxpPEtOPWTcLwoELvMTmkuLGoQASCqLw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787215190; c=relaxed/simple;
	bh=pQG5lg6IAnMoUd28bub9VEUEm0NZwaRtUmCnAkN1MK0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hWR5q42ZeL9WJnUlGCZhHqY2+8EJHVNcpksSCJ/EX0ir466qwmtzRR8n+O0O83AT+G1IvcQ1SKjbmVkkx045Er1Io6xYQRIysM7ZNY0wk+oiBtanNF5MTYjAfS47+tAkBP4n1t+UTDmYS89bhiGWO3/AJxPVgmd1CR0Dlwbxh2E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=asseily.com; spf=pass smtp.mailfrom=asseily.com; dkim=pass (2048-bit key) header.d=asseily.com header.i=@asseily.com header.b=asN4MSZh; arc=pass smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=asseily.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asseily.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asseily.com header.i=@asseily.com header.b="asN4MSZh"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-836d2861a39so30190107b3.2
        for <linux-clk@vger.kernel.org>; Thu, 20 Aug 2026 01:39:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787215188; cv=none;
        d=google.com; s=arc-20260327;
        b=PBalzNQC+sVQ5vBTvt896MAc5o05Tnf/dL5nWyRn8QjHFU+GWeiLC0aTl5L04xJIcl
         jdcNJ8wspif+Qw5H4nVmk6nZmAJK9Db6ldJBNgwL2bvFE5urdmqaJ0KltLojl5PXbfnG
         39++7f3EAiZ+N8/9ic7BZsu6QpW/ItAIdH2o7T+gmIrq5MAGqnWgFavT5fOBm9tQ3VeV
         +O9RgwiShSqEbVQNqIfQ8faCUPA3Mi6baNcpCtM9cxQFXiQh7rim9oMMxLAcd8Fewuh3
         LwnB5TGrPCm8Ig1jd7jbbR3sFB6TTizsCaEChSbmwL+n+BQQ2dKCWvB6+wBiMxZgnI1b
         jFhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bPkfI3IDNTID47/UVl4zqm8cNnUO3oY3o1tY2rxayrw=;
        fh=rMMJU8MaWmb31kDZu12P0sfqI43KkPJF5RiclfWhYvA=;
        b=W5aPr2POCkgYZJGXhCEeELMXqNyR+r6pG4U3HOEYbR3irPKU0p5k8kbz1mPifwWYmo
         DFJSkuJmJFdAx9hu2IoFIo0N6LC/gtnySSW9LDvU+zwAd2dwIjErEH2WYC6bNkF7foYk
         2aRiCmZA2DxfJFb7G9KMI5jObWBh5XXRcFGPwlvqghtjuYVZrLUqM2sNa6kWxtLH+eV0
         eUy7bNRJgX0Slg3AFWK7h7UqZSSt0BWxnBENQiaEygSfMVv80XcccfIGUgDuAXQHmYxh
         tHR6M9roRU/X5lIZ98PxohrFcXJMDqT3g9a6dtQZ5GrWjd6jeKM1/w3VuyP8y45CHt7S
         HGTA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asseily.com; s=google; t=1787215188; x=1787819988; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bPkfI3IDNTID47/UVl4zqm8cNnUO3oY3o1tY2rxayrw=;
        b=asN4MSZhMxz1KuRTXbxNO7cv+2b/Y81priy7Rx/FFNuPSLmcQM3YJ+C/RnA4PA4c7k
         qLOOAxDertvd+FkqeyOHjjmBXyzRLmpSNbvhifr15atF/eQHJsrzRdfEPB96gHazSezd
         Qip0ydMLtCmwiMjVItqrmNJHa9rOkPVlG4qpIymE2jRhIe2OtHAUtu042MU3C77mxFPs
         QPeK5uGWXDdiBFNr80v/a/VbtOTtSQGA3nWBnHUbPa+L+S02lJv/QrgX9SphGVe8chBP
         XO8d6LQJDxsKi7yxG/KCCcbGCRFizG0w/QW72f5N1VK8qcQ9AtP3S+ZRmJ991S+dOCEv
         x7zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787215188; x=1787819988;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bPkfI3IDNTID47/UVl4zqm8cNnUO3oY3o1tY2rxayrw=;
        b=FdpJlyA1n70a0E/1SpjQSMNt40LftdNddRY+dwcBeqKFQLj0dotfAinRqCaFyDCnFJ
         0ChIcrTb2TxWUsLj1cEvYcJYz0LPWNcRTZzPostpV8JHvpbaYscIgVETCf8hetuYrTjL
         21KcegUXSClKjOnRh9ZBtxy1ShhPnBrg72z3LDts0r3BzN8ljiPZlWnTjLFrSE+M4lKL
         VXtqn/FQVhht8p6mZVKTgtm7nl64VhG8sg+50Y5Q7vaDnGqQotzOOhBX2kbCu9AGesFH
         aTTCB71ovnFVuhlhHVCJBqDDdVTV4KWUsis4fTo3W2zxC8ryVggmfiZwlgDyIFkbsqO8
         Dk3g==
X-Forwarded-Encrypted: i=1; AHgh+Rp70uZDgQEfy+kI2cddsAAMwD6r8+6esTWQMWZ1YY1jGZI8o8dcGp9Q6MgKaMn1FAxYMILaBDpqCa0=@vger.kernel.org
X-Gm-Message-State: AFuF++mR9cgg72OGFePLyMFI418TBwwgFQzqy+RhO+uxvgyRkXNVW41J
	ZlTAldNQF0K5SD4iYCGQG0qVz13ucHhC0qIdLkupj36o/NMk0Y3tSeo1hpwu3hTa50AhXueTbtd
	GVOLNAzoSLUIjjUXI+U58et1NLUevrXvTPh8uch7JSg==
X-Gm-Gg: AR+sD10Wp2KUA8fGN2o8TS04uCoC/ZA05zlo4Bvg+qqJV81IFsUKlrEAzLhvvUPcf9i
	OoVPz6vcPjN3orI9REmjuLskaCA/A36kN5x1oTtgHkHApHdDp6pw82ELK1AkkjfWeBDm/xbPvXC
	YEqQQ+vBKJBvP0lrySpJ20QdfKHrFHMRFe6jHsI6U1fgx0Huc1Nym0EwHai1+Tp0Xn5BymT2ghh
	osPPiGLr4WGICZUvLhOVAallrqdXh4ZeEUNJswXSdv5nNDzrVQGYm8UsbDQ2PBJgPt6Ith20C2U
	G1Aojq+6+8rVlQ2pdlG1wn/WimCAq3bRZiJrWRzcryFA0xUit6/rI/buqY1YdUCdVHZWbwCKIYD
	Z
X-Received: by 2002:a05:690e:803:20b0:667:b314:aeba with SMTP id
 956f58d0204a3-66ccb53611dmr2826265d50.5.1787215187958; Thu, 20 Aug 2026
 01:39:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260820075427.67050-1-karl@asseily.com>
In-Reply-To: <20260820075427.67050-1-karl@asseily.com>
From: Karl Asseily <karl@asseily.com>
Date: Thu, 20 Aug 2026 11:39:37 +0300
X-Gm-Features: AcwNN1XuFpjrLHh4no0BJ3vL9VS_J2vNnUUzNm52YHAD3fGNRJEb3zzTPlR_AqM
Message-ID: <CA+gvwbo2Brc+JLBZZxn03OyD51=7hw3-j08-5x4YoXG2Cx1z9g@mail.gmail.com>
Subject: Re: [PATCH] clk: rockchip: rk3588: let MCLK_SPDIF* rate requests
 reach the divider
To: mturquette@baylibre.com, sboyd@kernel.org, heiko@sntech.de
Cc: bmasney@redhat.com, linux-clk@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Please drop this patch. It is a no-op and my analysis was wrong.

rockchip_clk_register_branch() adds CLK_SET_RATE_PARENT to every
branch_gate at registration:

case branch_gate:
flags |=3D CLK_SET_RATE_PARENT;

so the MCLK_SPDIF* gates already propagate and the flags column in the
branch table makes no difference.

The behaviour I was chasing was real, but the cause is elsewhere:
simple-audio-card only calls the CPU DAI's set_sysclk() when the card
node has an mclk-fs property, and rk_spdif_set_sysclk() is the only
caller of clk_set_rate() in the S/PDIF path. Without mclk-fs no rate
request is ever made, MCLK stays at whatever the bootloader left, and
44.1 kHz material goes out at 48 kHz. Adding mclk-fs to my card node
fixed it. The before/after rates I quoted belong to that change, not
to this one.

Sorry for the noise.

Karl

On Thu, Aug 20, 2026 at 10:54=E2=80=AFAM Karl Asseily <karl@asseily.com> wr=
ote:
>
> Every MCLK_SPDIFn gate is declared with flags 0, while the CLK_SPDIFn mux
> immediately above it already carries CLK_SET_RATE_PARENT. The rockchip
> S/PDIF driver calls clk_set_rate() on the gate, which has no .set_rate of
> its own and, without CLK_SET_RATE_PARENT, no way to pass the request up.
> The clock core therefore computes "new rate =3D=3D current rate", returns=
 0,
> and changes nothing.
>
> The visible effect is that S/PDIF is stuck on whatever divider the
> bootloader left behind. On a board whose audio PLL is parked on the
> 48 kHz family, every 44.1 kHz source goes out at 48 kHz, silently, with
> nothing reporting an error. Measured on an RK3588 board playing 44.1 kHz
> material, before and after:
>
>   mclk_spdif0   12287999 Hz    48000 x 256
>   mclk_spdif0   11289598 Hz    44100 x 256
>
> Add CLK_SET_RATE_PARENT to all eight MCLK_SPDIF gates so the request
> propagates to the fractional divider that can satisfy it.
>
> Propagation stops there. Each chain terminates at CLK_SPDIFn_SRC, which
> is declared with flags 0, so a rate request cannot reach a shared PLL and
> pull unrelated consumers off frequency.
>
> Two pairs of gates share a divider - mclk_spdif2 and mclk_spdif2_dp0 both
> sit on clk_spdif2_dp0, and mclk_spdif5 and mclk_spdif5_dp1 on
> clk_spdif5_dp1 - so a rate set on one moves the other. That sharing is in
> the hardware and is not introduced here; before this change neither of
> them could set a rate at all.
>
> Signed-off-by: Karl Asseily <karl@asseily.com>
> ---
>
> Notes:
>     Generated against broonie/sound.git for-next. clk-rk3588.c
>     carries no ASoC changes, so this should apply to any current tree.
>
>     Tested on RK3588 hardware running 7.1.3: without this a 44.1 kHz stre=
am leaves
>     the S/PDIF transmitter at 48 kHz; with it mclk_spdif0 retunes and the=
 receiver
>     locks at 44.1 kHz.
>
>     checkpatch --strict reports "Alignment should match open parenthesis"=
 on the
>     touched lines. That continuation indentation is unchanged by this pat=
ch and
>     matches every other clock entry in the file; realigning only these ei=
ght would
>     make them the inconsistent ones.
>
>  drivers/clk/rockchip/clk-rk3588.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/clk/rockchip/clk-rk3588.c b/drivers/clk/rockchip/clk=
-rk3588.c
> index 2ba9976654c..b3d577dccfc 100644
> --- a/drivers/clk/rockchip/clk-rk3588.c
> +++ b/drivers/clk/rockchip/clk-rk3588.c
> @@ -960,7 +960,7 @@ static struct rockchip_clk_branch rk3588_early_clk_br=
anches[] __initdata =3D {
>                         RK3588_CLKSEL_CON(33), 0,
>                         RK3588_CLKGATE_CON(9), 0, GFLAGS,
>                         &rk3588_spdif0_fracmux),
> -       GATE(MCLK_SPDIF0, "mclk_spdif0", "clk_spdif0", 0,
> +       GATE(MCLK_SPDIF0, "mclk_spdif0", "clk_spdif0", CLK_SET_RATE_PAREN=
T,
>                         RK3588_CLKGATE_CON(9), 1, GFLAGS),
>
>         GATE(HCLK_SPDIF1, "hclk_spdif1", "hclk_audio_root", 0,
> @@ -973,7 +973,7 @@ static struct rockchip_clk_branch rk3588_early_clk_br=
anches[] __initdata =3D {
>                         RK3588_CLKSEL_CON(35), 0,
>                         RK3588_CLKGATE_CON(9), 4, GFLAGS,
>                         &rk3588_spdif1_fracmux),
> -       GATE(MCLK_SPDIF1, "mclk_spdif1", "clk_spdif1", 0,
> +       GATE(MCLK_SPDIF1, "mclk_spdif1", "clk_spdif1", CLK_SET_RATE_PAREN=
T,
>                         RK3588_CLKGATE_CON(9), 5, GFLAGS),
>
>         COMPOSITE(ACLK_AV1_ROOT, "aclk_av1_root", gpll_cpll_aupll_p, 0,
> @@ -1868,9 +1868,9 @@ static struct rockchip_clk_branch rk3588_early_clk_=
branches[] __initdata =3D {
>                         RK3588_CLKSEL_CON(123), 0,
>                         RK3588_CLKGATE_CON(57), 4, GFLAGS,
>                         &rk3588_spdif2_dp0_fracmux),
> -       GATE(MCLK_SPDIF2_DP0, "mclk_spdif2_dp0", "clk_spdif2_dp0", 0,
> +       GATE(MCLK_SPDIF2_DP0, "mclk_spdif2_dp0", "clk_spdif2_dp0", CLK_SE=
T_RATE_PARENT,
>                         RK3588_CLKGATE_CON(57), 5, GFLAGS),
> -       GATE(MCLK_SPDIF2, "mclk_spdif2", "clk_spdif2_dp0", 0,
> +       GATE(MCLK_SPDIF2, "mclk_spdif2", "clk_spdif2_dp0", CLK_SET_RATE_P=
ARENT,
>                         RK3588_CLKGATE_CON(57), 6, GFLAGS),
>         COMPOSITE(CLK_SPDIF5_DP1_SRC, "clk_spdif5_dp1_src", gpll_aupll_p,=
 0,
>                         RK3588_CLKSEL_CON(124), 7, 1, MFLAGS, 2, 5, DFLAG=
S,
> @@ -1880,9 +1880,9 @@ static struct rockchip_clk_branch rk3588_early_clk_=
branches[] __initdata =3D {
>                         RK3588_CLKSEL_CON(125), 0,
>                         RK3588_CLKGATE_CON(57), 9, GFLAGS,
>                         &rk3588_spdif5_dp1_fracmux),
> -       GATE(MCLK_SPDIF5_DP1, "mclk_spdif5_dp1", "clk_spdif5_dp1", 0,
> +       GATE(MCLK_SPDIF5_DP1, "mclk_spdif5_dp1", "clk_spdif5_dp1", CLK_SE=
T_RATE_PARENT,
>                         RK3588_CLKGATE_CON(57), 10, GFLAGS),
> -       GATE(MCLK_SPDIF5, "mclk_spdif5", "clk_spdif5_dp1", 0,
> +       GATE(MCLK_SPDIF5, "mclk_spdif5", "clk_spdif5_dp1", CLK_SET_RATE_P=
ARENT,
>                         RK3588_CLKGATE_CON(57), 11, GFLAGS),
>         COMPOSITE_NOMUX(CLK_AUX16M_0, "clk_aux16m_0", "gpll", 0,
>                         RK3588_CLKSEL_CON(117), 0, 8, DFLAGS,
> @@ -2059,7 +2059,7 @@ static struct rockchip_clk_branch rk3588_early_clk_=
branches[] __initdata =3D {
>                         RK3588_CLKSEL_CON(149), 0,
>                         RK3588_CLKGATE_CON(63), 6, GFLAGS,
>                         &rk3588_spdif3_fracmux),
> -       GATE(MCLK_SPDIF3, "mclk_spdif3", "clk_spdif3", 0,
> +       GATE(MCLK_SPDIF3, "mclk_spdif3", "clk_spdif3", CLK_SET_RATE_PAREN=
T,
>                         RK3588_CLKGATE_CON(63), 7, GFLAGS),
>         COMPOSITE(CLK_SPDIF4_SRC, "clk_spdif4_src", gpll_aupll_p, 0,
>                         RK3588_CLKSEL_CON(150), 7, 1, MFLAGS, 2, 5, DFLAG=
S,
> @@ -2069,7 +2069,7 @@ static struct rockchip_clk_branch rk3588_early_clk_=
branches[] __initdata =3D {
>                         RK3588_CLKSEL_CON(151), 0,
>                         RK3588_CLKGATE_CON(63), 10, GFLAGS,
>                         &rk3588_spdif4_fracmux),
> -       GATE(MCLK_SPDIF4, "mclk_spdif4", "clk_spdif4", 0,
> +       GATE(MCLK_SPDIF4, "mclk_spdif4", "clk_spdif4", CLK_SET_RATE_PAREN=
T,
>                         RK3588_CLKGATE_CON(63), 11, GFLAGS),
>         COMPOSITE(MCLK_SPDIFRX0, "mclk_spdifrx0", gpll_cpll_aupll_p, 0,
>                         RK3588_CLKSEL_CON(152), 7, 2, MFLAGS, 2, 5, DFLAG=
S,
> --
> 2.34.1
>
