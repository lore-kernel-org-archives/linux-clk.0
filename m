Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5E02C3259
	for <linux-clk@vger.kernel.org>; Fri,  9 Jan 2026 18:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767984332; cv=none; b=NsNUKeeM2GsEMC1DUMFmR7fLh+02CEakbz1xxEXmuLSftMNmpb6wEw/5DiKTp3W/xHVpON4oxd9WAgS/Z+lmc9FBAq01ikMBlri+qII0rSwjBFS+yWSLIomniYB8v0XnlkUAihvjmV223/kLC6ewHKJ6BIaNgJQqk7LiZh7ZwZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767984332; c=relaxed/simple;
	bh=FforcZHx+WfqiWtBEUyUVqYbzjzY+TSio1HjgEUFkao=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nrrt/0UKQDVvuJKE5Vq9sKBRXT6fPH/+jKuIWBBEQZSoTZ1KvTK+z/Y0e9AzmYDsDOyS+VlLbNeeFaXysQg+yG3E0U1rE3A7KJvrOmDo9QP05fhbZlplAyGjD/Fl4tXBwwnHsQ3l50ru29p1dB4DLu6UW+rdKh7iKAoQ99dcQnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-34ccb7ad166so2660757a91.2
        for <linux-clk@vger.kernel.org>; Fri, 09 Jan 2026 10:45:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767984330; x=1768589130;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=owKRR1yw9zmwxecUjh86QCCGN7unQ2k03XZJfdt7ufo=;
        b=kLG2fRbB0Xb91ZJ3n8hlyTHPSyNNbBBxhsGIECVjEocmPE/8tcYPtwf0pONQOVZOqB
         mi971CGX4E0hmkhE28BMIRndWtVJJGoDoYRwtdMKwPxK0PFSAnu8WmVWWGBznJO7EPbr
         0ilVs1SIvJX16zi45D8CaDA/5rQxmEp5fH3N4VeYVAoYxTmGmoA37pxGVXyhaQ/jB/Mk
         JfNO9dMVpt7TuUf3iombe7gIwDpF/GcHCO+4SPpngOT+6v0NnjmUNulAY5RMQ/6UecSx
         OmXHj1odCVYUikCbPBmqVCugHD+L4IdJ9zVa0ANcLBmg2AvagBjn7Q3Pnx+ph/N8onJB
         QI/w==
X-Forwarded-Encrypted: i=1; AJvYcCU+CRz9zuU+2X4h6CU3dk3mTmGlQHP0zWcDDXP8mOEg014VkIsul0/cBA3XJ+fW74vRbgmn+/1lL9U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzY4bJuKDGn4ty7W+3ynHTTpGbCdaq+ESc9b2PHrO6PuZonFk+H
	vZOqy4H8azWucg21Kuruuuq4xCCRWvNqVDbXWJtsb42ZEb3TFxg/jUorNzidyDCG
X-Gm-Gg: AY/fxX6eOkGcYEDTjbB4HV95Hk4hC5eSthvbqECXI6WXb2x/GkW/TNGIQmxa44/VN6E
	+AlwROO/abcHsGzwhEvE4sHzkKqnsyFWLxeYFkPnmUcABbAYOkwG5fnxXFgaAiHhoQj3KV98rKc
	6nnSRIYcg3lw120QPfO8bWLXbQGVddHnizoOSxW/X15V5LYrglfGhMT+MOMYCZpm34wvEWaWTH7
	O5SYNCFjNJlASmRQLDEmWziX4LWvmtAkzW+oGUbemizkod/YGPmy69noh9SNOibuZmGqs0UFfxP
	LzYFLSOuQAlJTNJNdQsCIpwniXnBTmbSc+aKj5LhKl5N6Ik8JFbst3zTU4WRxqohInHR69Ew1rA
	wl2JhnhQhU1UH7Dykmm1yvcAcKY4KBttXITUiKi7rsKcSwkFPB5J1wC4Tf86iFW/NYGk6y1jKF0
	GiLrcckRHL//gD8WZ9kSKrG1SiFgNT4xiVU1aClc9TgZS5Oj4Pxko=
X-Google-Smtp-Source: AGHT+IHH0at+l19HPu1kk3qc6DWqzpOhnau/8y3++jwZ4rpsSGKbeYezguDVZGORYVQ2eFFBksLVIw==
X-Received: by 2002:a17:90b:5867:b0:341:abdc:8ea2 with SMTP id 98e67ed59e1d1-34f68c47b0emr10605172a91.37.1767984330479;
        Fri, 09 Jan 2026 10:45:30 -0800 (PST)
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com. [74.125.82.181])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f5f6db356sm11204105a91.0.2026.01.09.10.45.30
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jan 2026 10:45:30 -0800 (PST)
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2b0ea1edf11so10632452eec.0
        for <linux-clk@vger.kernel.org>; Fri, 09 Jan 2026 10:45:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUEh1jPePCBIJV+GxM76BcRbPWOrXjxylu5F8XdeCsB2g6faaG5apzUxWr7HLo6Rf3wNqFn7WJ8wFY=@vger.kernel.org
X-Received: by 2002:a05:6102:3e86:b0:5db:eeb6:812c with SMTP id
 ada2fe7eead31-5ecbb161af3mr3548015137.43.1767983931089; Fri, 09 Jan 2026
 10:38:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1764165783.git.tommaso.merciai.xr@bp.renesas.com> <cdd044968c1d199ad41ec84ed71162725cb2ec66.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <cdd044968c1d199ad41ec84ed71162725cb2ec66.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 9 Jan 2026 19:38:40 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVpgnCXVzuZ7ZJQ8dy4Yae=zse3pq=r-g3frymbSVRpVg@mail.gmail.com>
X-Gm-Features: AZwV_QjPxiRlZoVjD9lDA1offfLVFh-eBcX3h9n60XoTGjHhb5ZXNJrajC-uZ0U
Message-ID: <CAMuHMdVpgnCXVzuZ7ZJQ8dy4Yae=zse3pq=r-g3frymbSVRpVg@mail.gmail.com>
Subject: Re: [PATCH 06/22] clk: renesas: r9a09g047: Add support for SMUX2_DSI{0,1}_CLK
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Tommaso,

On Wed, 26 Nov 2025 at 15:10, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> Add support for the SMUX2_DSI0_CLK and SMUX2_DSI1_CLK clock muxes
> present on the r9a09g047 SoC.
>
> These muxes select between CDIV7_DSI{0,1}_CLK and CSDIV_2to16_PLLDSI{0,1}
> using the CPG_SSEL3 register (SELCTL0 and SELCTL1 bits).
>
> According to the hardware manual, when LVDS0 or LVDS1 outputs are used,
> SELCTL0 or SELCTL1 must be set accordingly.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/r9a09g047-cpg.c
> +++ b/drivers/clk/renesas/r9a09g047-cpg.c
> @@ -64,6 +64,8 @@ enum clk_ids {
>         CLK_SMUX2_GBE0_RXCLK,
>         CLK_SMUX2_GBE1_TXCLK,
>         CLK_SMUX2_GBE1_RXCLK,
> +       CLK_SMUX2_DSI0_CLK,
> +       CLK_SMUX2_DSI1_CLK,

Please move these up, before CLK_SMUX2_GBE0_TXCLK.

>         CLK_PLLDTY_DIV16,
>         CLK_PLLVDO_CRU0,
>         CLK_PLLVDO_GPU,
> @@ -143,6 +145,8 @@ RZG3E_CPG_PLL_DSI1_LIMITS(rzg3e_cpg_pll_dsi1_limits);
>  #define PLLDSI1                PLL_PACK_LIMITS(0x160, 1, 1, &rzg3e_cpg_pll_dsi1_limits)
>
>  /* Mux clock tables */
> +static const char * const smux2_dsi0_clk[] = { ".plldsi0_div7", ".plldsi0_csdiv" };
> +static const char * const smux2_dsi1_clk[] = { ".plldsi1_div7", ".plldsi1_csdiv" };
>  static const char * const smux2_gbe0_rxclk[] = { ".plleth_gbe0", "et0_rxclk" };
>  static const char * const smux2_gbe0_txclk[] = { ".plleth_gbe0", "et0_txclk" };
>  static const char * const smux2_gbe1_rxclk[] = { ".plleth_gbe1", "et1_rxclk" };
> @@ -218,6 +222,10 @@ static const struct cpg_core_clk r9a09g047_core_clks[] __initconst = {
>                        CSDIV1_DIVCTL3, dtable_2_16_plldsi),
>         DEF_FIXED(".plldsi0_div7", CLK_PLLDSI0_DIV7, CLK_PLLDSI0, 1, 7),
>         DEF_FIXED(".plldsi1_div7", CLK_PLLDSI1_DIV7, CLK_PLLDSI1, 1, 7),
> +       DEF_PLLDSI_SMUX(".smux2_dsi0_clk", CLK_SMUX2_DSI0_CLK,
> +                       SSEL3_SELCTL0, smux2_dsi0_clk),
> +       DEF_PLLDSI_SMUX(".smux2_dsi1_clk", CLK_SMUX2_DSI1_CLK,
> +                       SSEL3_SELCTL1, smux2_dsi1_clk),

Why can't these use the existing DEF_SMUX()?
>
>         /* Core Clocks */
>         DEF_FIXED("sys_0_pclk", R9A09G047_SYS_0_PCLK, CLK_QEXTAL, 1, 1),

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
