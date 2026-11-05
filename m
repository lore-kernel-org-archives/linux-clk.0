Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793886203;
	b=gXGb98TMlUThjStwnpGZSwVFw/iJBpZ/jTpEyUKboRKI0mSBAA9RxOlKdMSktHjbrc5F
	 XzTLFqhKzzR4b4fxpGrAEFUHke4BenZyAK34c2cilxGw7Qk7sxsEau/EeDsXWvyDk2ubc
	 OP27efIdrPTXiv4pM16ZgdawRLEbzJeFPG4wpPO3ZpjvtRtnSkWpNYWIvngZ/127QiUMM
	 lA6TTeuqjwItDZAxSsBTQlKZu4A5AxH+jh+a4qUlCnBB++8bnC/WIXCdO4CTNCvKcDgZm
	 WEAOLWwtqXNz+RHYvIhdbYsXW1GKw1EBTKtXY2nEGSD/X11mHtTFt5wxrRnCjM60uEQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793886203;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=5InNLlTBW1+FHMMXtqNCm652eEhZdNBTTArid9tphss=;
	b=yW/QXNGdP30mGCssq6EM25i/2kqisRTYECWir4RJ4wKjv+lIoqQF2TkB7/tBth6Ky6TW
	 njpmCFiJaw++lO24lFg2n+PNe3GortB9Jm7bkdA8FwxPKMAK9Jwgbp8We/v1L4uNZB3Uz
	 WZ0CAsn50FuCD6TT1muCYkBIKFtxytw6DDR5RigdAAGISPVxQgPTSrFcVdBcWmvaSX6V3
	 OBnPy4XgNQ3xB32deVpTyjiGgC/RoJPlKYyGWDAx4JseJ/di9c/fqPIs+1LSX7Qss0jJP
	 UGkm7q4BjwVE7Aqtgy9mo+4gCQpBumsdo43MzzW9PWgtnv0rhQosAXfNVqEOszsS7zg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mmurvqvT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4091C606A328
	for <linux-clk@vger.kernel.org>; Thu,  5 Nov 2026 13:43:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4091C606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mmurvqvT
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso17535415e9.3
        for <linux-clk@vger.kernel.org>; Thu, 05 Nov 2026 05:43:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793886201; cv=none;
        d=google.com; s=arc-20260327;
        b=kKi1bnc8NBzWd8RUyGxVspmG0KTiTpDvvKM2Y+3sC2cPA2Vh6hxBgWNYACwpSrsCNC
         OBvInGyw8dt1qBgZRYqZ4PJZdEdbrp0UIx+EYzsDhyLI9RZpbfg06boBwDKHwuMZg3me
         gdtCJmmSJvlJr6qFDXW/pPNxyU9QJfZpWSEUr3F1/v/Ddxq0YbCIH0W2vCpGMxKV1GqT
         Pmafcv0IfayICPUHceb4yPXe+uUoyGU/UUXbkYAQS9uE548ZXXoNal2Oj+/OeiMv/Nhg
         6Hr8oSqiYqR/reRyrc5yFnRN5NtuL6Q4DEWkUrMYvOMwieMPpGowBIhML8wyPYMjAELt
         j5FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5InNLlTBW1+FHMMXtqNCm652eEhZdNBTTArid9tphss=;
        fh=+IsMAGO7rMXidw7gi5yw/PK9aDGsAaKmzR62tTREoCQ=;
        b=f3aXO4E+be9Q/lVYayw6kv6X9BrPDlJL7U62CVrT9kSdWkZY4TRRWfcgRTDkft2rWF
         L0lNtz+ysiu43LjJHFyKAQJV+3FOuWDXAlGrk67SjDHI94S9/L3WgJ+zMbnzXihWRsZS
         k2fM7cS0CgoT0h2eUP+B6QEmQ2GCr3fmPlHFT0VpUiu6DxajfdiKlputTtuKwsT0A5MV
         i1xqYZVhA7BY9nOivhHO4cdy3YGRg0/XCmeazCrSZfmffwcfd7j/q0lC0rYqZb9jNHNP
         oEmgMXTnonG5l/LON0Rub6KaKDGPwiw78g7kmzPaivcZYMasdeAOkwBYhCajE9lpGRWr
         x+vA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793886201; x=1794491001; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5InNLlTBW1+FHMMXtqNCm652eEhZdNBTTArid9tphss=;
        b=mmurvqvT+z3WqxIrFi6mIwXiICJd076DFKfZ9ie+T9w7n+pCZ6rvIwh7bplFf3ytGe
         +NawPJ/F4zbKYPTahV/wRXW2lQCTq8P/Omu2hRB15SavqkKWNxPtxTdwgfUiMLwSN8Ay
         ClkO17wxr2uYAqnLmC5k+hfbdq0fyUVVSxuRCd8zwZqWrdoG3xg2lzG2OOdHvZXc/3HT
         W7U/Ue7LRBeuV4gLSiHju4akKZStC6q2uAnKHD88lbWrE50csXiL3JRC8NaL7W0Ap75H
         A9gSDo8S1ywxIfdHde0Ojb/RXbwWkhYNJ2z1H/H+Ky7XvnzfmwQtrGs+RbYufT0hJodT
         ASCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793886201; x=1794491001;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5InNLlTBW1+FHMMXtqNCm652eEhZdNBTTArid9tphss=;
        b=yGr+IzZTJ/r6uJrVD1MkJp7I+vnJl6NzllfuMReFG241P2PrrEgrRfjpOfSF/pN1rk
         R+ivxClm3FMUV1LgE0A+720iSmPVTxyPpsAoLLa9YDeLI9dMlpbRBUZlTXFRgT7p1axo
         b2kxiBcJhVzFGVDgitgLwCNP3iseCNaO+QyuZw1xfbA5vc5oQnpniwQLQ4whFIPFLbkF
         y8/DiHs+eVaXyabV+39jSJpgABitiEakJXeAvO9/K2uoNa5yP4oFWqhI7+XIU/XmU5JR
         ZewQSbkkglLfBWEE3p3fo3MJZeSh904wPR36vaPRKvXIfUF++gs5vBWECxPEASjbpXHP
         xmrg==
X-Forwarded-Encrypted: i=1; AKwUvBzW+Mfj6k4+u1yeprEwnp5033V0vQ4tQ0ZwCqg0S0r15HTeXFrV7pYHt81YKw9aFr6LTMhxpcwngbM=@vger.kernel.org
X-Gm-Message-State: APuU4Z88fomiI2Kv7mQDUXjSeWMRH9LmNHnPoByd5/3v5bsVgi1foM4n
	ylSC3y0UqryapiTQk3y+x+EIseTDbJIBm5MsoKVad11X9l58YLnDaB68VVmpvUJRB7bk528rl0W
	7TrLNneJiA8xO6PI3miGePPFjzelrQ7WDByGnl8M=
X-Gm-Gg: AYBFou15UD/d98Ew/0G67eh5terR3OFtWcJAKGvYeS6uO1AxFdA7R0YI6HkFHBHBVjC
	pilFCGfpKTqIV57z6qeQpPMuWrGmCOe31vTHTkzZ+6c2RUZmOiyQQeYETMrUdWmMsEIjZaNX08L
	CibNkkkh2NM5PGudye0Gg2jMfWSR77anYnDZ8AFt8npZYgi+XSl4kK+vDCDho/lzOmnyrolyk62
	12m95hiEzOdpOYQLCUylX3X4XOia74ZUaUniQVIjTTNE6MbWTx47g+DhmFZSEd2VPEt9GfJIgKl
	upfHtr1b0N8cg55naaMHdQ3kuLokAqo0SObCLq/Mm68O7Vg2oI7g50yLCAo5mErz3DZDh7oYI66
	g5F28javldESsYBbh8kgfYOv/GoD0h6Lc1vhoQ0sn/8WAZeU0PQUll9ol17l7oVIYzqB54xCwKt
	d8PxayX9t6+84LPKwQboWXC0Vn
X-Received: by 2002:a05:600c:3554:b0:4a4:7a8d:c436 with SMTP id
 5b1f17b1804b1-4ac17470fdbmr428347465e9.11.1793886201331; Thu, 05 Nov 2026
 05:43:21 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260929113921.119489-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260929113921.119489-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdV5Sn9FaMNEaxQKF7_rm5hvM-pfC2-KU14=96DFGp85jg@mail.gmail.com>
In-Reply-To: <CAMuHMdV5Sn9FaMNEaxQKF7_rm5hvM-pfC2-KU14=96DFGp85jg@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 5 Nov 2026 13:42:55 +0000
X-Gm-Features: AclHuK_NJQNESWK0guGnOVGqynMZyFihFGeP8KPEUxdd-p_NokaiWz_ftQoKZDo
Message-ID: <CA+V-a8u=W+74U-+=k6MdhQsS8wZYkbuvueun15M3AiiA1=T58Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] clk: renesas: r9a09g057: Add ADC clocks and reset
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar <prabhakar.csengg+renesas@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Wed, Nov 4, 2026 at 4:42=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> Hi Prabhakar,
>
> On Tue, 29 Sept 2026 at 13:39, Prabhakar <prabhakar.csengg@gmail.com> wro=
te:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add clocks and reset entries for the ADC controller.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/drivers/clk/renesas/r9a09g057-cpg.c
> > +++ b/drivers/clk/renesas/r9a09g057-cpg.c
>
> > @@ -173,11 +183,18 @@ static const struct cpg_core_clk r9a09g057_core_c=
lks[] __initconst =3D {
> >         DEF_PLL(".pllgpu", CLK_PLLGPU, CLK_QEXTAL, PLLGPU),
> >
> >         /* Internal Core Clocks */
> > +       DEF_FIXED(".pllcm33_div2", CLK_PLLCM33_DIV2, CLK_PLLCM33, 1, 2)=
,
> >         DEF_FIXED(".pllcm33_div3", CLK_PLLCM33_DIV3, CLK_PLLCM33, 1, 3)=
,
> >         DEF_FIXED(".pllcm33_div4", CLK_PLLCM33_DIV4, CLK_PLLCM33, 1, 4)=
,
> >         DEF_FIXED(".pllcm33_div5", CLK_PLLCM33_DIV5, CLK_PLLCM33, 1, 5)=
,
> >         DEF_FIXED(".pllcm33_div16", CLK_PLLCM33_DIV16, CLK_PLLCM33, 1, =
16),
> >         DEF_DDIV(".pllcm33_gear", CLK_PLLCM33_GEAR, CLK_PLLCM33_DIV4, C=
DDIV0_DIVCTL1, dtable_2_64),
> > +       DEF_CSDIV(".adc_pclk_gear", CLK_PLLCM33_ADC_PCLK_GEAR, CLK_PLLC=
M33_DIV2,
>
> ".pllcm33_adc_pclk_gear"?
>
> > +                 CSDIV1_DIVCTL0, dtable_8_10),
> > +       DEF_FIXED(".adc_pclk_gear_div2", CLK_PLLCM33_ADC_PCLK_DIV2,
>
> ".pllcm33_adc_pclk_gear_div2"?
>
> > +                 CLK_PLLCM33_ADC_PCLK_GEAR, 1, 2),
> > +       DEF_CSDIV(".adc_adclk_gear", CLK_PLLCM33_ADC_ADCLK_GEAR, CLK_PL=
LCM33_ADC_PCLK_GEAR,
>
> ".pllcm33_adc_adclk_gear"?
>
> > +                 CSDIV1_DIVCTL1, dtable_2_16),
>
> >         DEF_SMUX(".smux2_xspi_clk0", CLK_SMUX2_XSPI_CLK0, SSEL1_SELCTL2=
, smux2_xspi_clk0),
> >         DEF_SMUX(".smux2_xspi_clk1", CLK_SMUX2_XSPI_CLK1, SSEL1_SELCTL3=
, smux2_xspi_clk1),
> >         DEF_CSDIV(".pllcm33_xspi", CLK_PLLCM33_XSPI, CLK_SMUX2_XSPI_CLK=
1, CSDIV0_DIVCTL3,
>
> > @@ -669,6 +690,7 @@ static const struct rzv2h_reset r9a09g057_resets[] =
__initconst =3D {
> >         DEF_RST(13, 13, 6, 14),         /* GPU_0_RESETN */
> >         DEF_RST(13, 14, 6, 15),         /* GPU_0_AXI_RESETN */
> >         DEF_RST(13, 15, 6, 16),         /* GPU_0_ACE_RESETN */
> > +       DEF_RST(15, 6, 7, 7),           /* ADC_ADRST_N */
>
> ADC_0_ADRST_N?
>
Ok, I'll rename this (and all the above).

Cheers,
Prabhakar

> >         DEF_RST(15, 7, 7, 8),           /* TSU_0_PRESETN */
> >         DEF_RST(15, 8, 7, 9),           /* TSU_1_PRESETN */
> >  };
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds
