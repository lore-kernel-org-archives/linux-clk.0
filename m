Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F88030E0CD
	for <linux-clk@vger.kernel.org>; Fri, 24 Oct 2025 10:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761300527; cv=none; b=tOc5hbEtGCvktTsjsqi488FGR8OcIE5Ixv0WLSckBSUj87h9izsXMKxfVCxZpXHn0MigFw8gajV4GqcNXf639tYxjc5N2WHxJYQU8ZBtjs2gver1kyDEWGu7oZtQ86rLaHrN0ePrVGdccDPpzDOA+1FG+ErhuZpHp7LUbA+BeUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761300527; c=relaxed/simple;
	bh=elTVsWdrRVyZXb9CeT0gn7vy7OzlSmdqPnuj0bdN97A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=etjzJ3H3qVdAC0oXJvdw3xFvBbiLpQwQ33WHN1dgHDYb/JcNWJdwlioMAMGX/XlB8WtjJNgTCkAbIszBnOaX+xefSCf6frXa7sDnpNCnYQaxV2RtLmIaaJsOCqxnw0SpZq1I0EAl8848LWkjUIu7BUKhdJ41zMQxXAvUJ3JHiqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-934ad40c2c2so697785241.3
        for <linux-clk@vger.kernel.org>; Fri, 24 Oct 2025 03:08:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761300524; x=1761905324;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sUKThFRYge9/VpHdBSfe3W40P3TpedrdMNHqtfWCInw=;
        b=RHBe57HrlhzIzMWXfF/PrQc47UI64/L16CwT+wvP2qAlxigV4JtSAJBDHowhMFGX1i
         yHN+6JK8OGJnSOAceKAnc05VQ3d2Ip1KZ5cW3x3a+NIkxjcJMJaJ+RPuHfeEgvEOH53h
         6yGnH8Bht4kdQ/Do3zjNil/l5Gv+s270PAk7heE3R9sCWyKLGdJky3VBeAm6V9XFkD74
         9nEMTUeFbsptfB2UdZtl19gYtZ06LccaQ5klWqoZzKaRHcXl3vt8wfOlb978phzxv0mw
         DSOsLEIuM+QIfZx4Ja4mdhobc6olceLD75+XkQ7zHT5my8EuxPe/s2Rn7sV3DUH6LQyT
         Op7w==
X-Forwarded-Encrypted: i=1; AJvYcCUBNx/0s8wnhfihdgg5MOx/N+x5fy7Cm3mGKmoOc9fp/y3Kg4vTeeNbGaj/5IRlhJxbna6nhdFTC84=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyKOMx61t232nIjxVF4Mrl46F4N0FyYihTUIk7h9arXoZk1GHm
	qDREmasD3CMvrxmBSoIk/Em8kZuFX9eVt5DzRs5rq81hBg2FtTuDLjyrjSSpIYE8
X-Gm-Gg: ASbGncv8XsTaaH9v7ByxMC7KfK45U0eQbN6J7P9fYRJw1mDOxZMAHhwIPPAV9X9SPq4
	xgP2heApFtboCYNp9bPakyRCcSUFGYb9Zr/lttz8r3VwAlF8OXoE65Sb+AB5d/IpC9o9sWTXcuY
	HWttIyG1XgwgItwatEXvhLylChDwMFiDDcD5OEHHhzWEFlZKKr4ihzxN7orxtWrvxyQN8VL7/y0
	9ARjSkOwVMh+O9iGJIM6TLRKlnnXK8zE+yQ8cZvBOWs7OgQBOX7KEdgV/TS2UHGx2UwRDssnXOG
	FLyL1WU/fMcrm//5aEyz1gfg+cmJcSwHisg9MY1TCqk/M9s3AmvfOm3Sf+uky+Jiw36zKGCfX1s
	BtSYwHfQ4x7fJFIVjqu8upyT/GPJQ2JwXzLrbPXrtQ8VPDX/ifzbhneQ6D7x4Q4pCIgvx4oQCd7
	782CExXK/jddqiv3/KWvkbkmAcUEgY2OmL60IMGQ==
X-Google-Smtp-Source: AGHT+IH4LSeW1CsMRsi3td3vqXykk5i+TTvpIARvE5zhwogC2Qw7QxDMgVS2plOFdba3fVuDxw9BuQ==
X-Received: by 2002:a05:6122:8d4:b0:54a:71f6:900f with SMTP id 71dfb90a1353d-5564eca636emr7702261e0c.0.1761300524203;
        Fri, 24 Oct 2025 03:08:44 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-557bd89ad54sm1851780e0c.4.2025.10.24.03.08.41
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Oct 2025 03:08:41 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-5d980e08e06so1159988137.0
        for <linux-clk@vger.kernel.org>; Fri, 24 Oct 2025 03:08:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUAtxQSJmSTlMK4t6GIcJB6ES7mFTT77G+ZC+z5sdMHO0qtvXBCLq9BJhEzZ5BYSigI+N4qXn5fue4=@vger.kernel.org
X-Received: by 2002:a05:6102:4496:b0:5db:2715:d01c with SMTP id
 ada2fe7eead31-5db2715d982mr2364430137.10.1761300521275; Fri, 24 Oct 2025
 03:08:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251014151325.160062-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20251014151325.160062-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251014151325.160062-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 24 Oct 2025 12:08:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXU_aOg+bfRBJ7UOQW59QUxqa4a7WXTj27RyCyiNHV8qA@mail.gmail.com>
X-Gm-Features: AS18NWDbAhl5j_H8OBpJGyjSPEBVaeQiqbN7vBJIAehOjNFs55YsioHkWFr2qYM
Message-ID: <CAMuHMdXU_aOg+bfRBJ7UOQW59QUxqa4a7WXTj27RyCyiNHV8qA@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: renesas: r9a09g077: Add xSPI core and module clocks
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Tue, 14 Oct 2025 at 17:13, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add module and core clocks used by xSPI (Expanded SPI) IP on the
> R9A09G077 SoC.
>
> The xSPI block uses PCLKH as its bus clock, while the operation clock
> (XSPI_CLKn) is derived from PLL4. To support this, define new selectors
> and dividers (FSELXSPI0/1 and DIVSEL_XSPI0/1) in SCKCR.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/r9a09g077-cpg.c
> +++ b/drivers/clk/renesas/r9a09g077-cpg.c

> @@ -105,6 +113,15 @@ static const struct clk_div_table dtable_1_2[] = {
>         {0, 0},
>  };
>
> +static const struct clk_div_table dtable_6_8_16_32_64[] = {
> +       {6, 64},
> +       {5, 32},
> +       {4, 16},
> +       {3, 8},
> +       {2, 6},
> +       {0, 0},
> +};
> +
>  static const struct clk_div_table dtable_24_25_30_32[] = {
>         {0, 32},
>         {1, 30},
> @@ -119,6 +136,7 @@ static const char * const sel_clk_pll0[] = { ".loco", ".pll0" };
>  static const char * const sel_clk_pll1[] = { ".loco", ".pll1" };
>  static const char * const sel_clk_pll2[] = { ".loco", ".pll2" };
>  static const char * const sel_clk_pll4[] = { ".loco", ".pll4" };
> +static const char * const sel_clk_pll4d1_div3_div4[] = { ".pll4d1_div3", ".pll4d1_div4" };
>
>  static const struct cpg_core_clk r9a09g077_core_clks[] __initconst = {
>         /* External Clock Inputs */
> @@ -154,6 +172,15 @@ static const struct cpg_core_clk r9a09g077_core_clks[] __initconst = {
>         DEF_DIV(".sci5async", CLK_SCI5ASYNC, CLK_PLL4D1, DIVSCI5ASYNC,
>                 dtable_24_25_30_32),
>
> +       DEF_FIXED(".pll4d1_div3", CLK_PLL4D1_DIV3, CLK_PLL4D1, 3, 1),
> +       DEF_FIXED(".pll4d1_div4", CLK_PLL4D1_DIV4, CLK_PLL4D1, 4, 1),
> +       DEF_MUX(".divselxspi0", CLK_DIVSELXSPI0_SCKCR, DIVSEL_XSPI0,
> +               sel_clk_pll4d1_div3_div4,
> +               ARRAY_SIZE(sel_clk_pll4d1_div3_div4), CLK_MUX_HIWORD_MASK),
> +       DEF_MUX(".divselxspi1", CLK_DIVSELXSPI1_SCKCR, DIVSEL_XSPI1,
> +               sel_clk_pll4d1_div3_div4,
> +               ARRAY_SIZE(sel_clk_pll4d1_div3_div4), CLK_MUX_HIWORD_MASK),
> +
>         /* Core output clk */
>         DEF_DIV("CA55C0", R9A09G077_CLK_CA55C0, CLK_SEL_CLK_PLL0, DIVCA55C0,
>                 dtable_1_2),
> @@ -178,9 +205,15 @@ static const struct cpg_core_clk r9a09g077_core_clks[] __initconst = {
>         DEF_FIXED("ETCLKC", R9A09G077_ETCLKC, CLK_SEL_CLK_PLL1, 10, 1),
>         DEF_FIXED("ETCLKD", R9A09G077_ETCLKD, CLK_SEL_CLK_PLL1, 20, 1),
>         DEF_FIXED("ETCLKE", R9A09G077_ETCLKE, CLK_SEL_CLK_PLL1, 40, 1),
> +       DEF_DIV("XSPI_CLK0", R9A09G077_XSPI_CLK0, CLK_DIVSELXSPI0_SCKCR,
> +               FSELXSPI0, dtable_6_8_16_32_64),
> +       DEF_DIV("XSPI_CLK1", R9A09G077_XSPI_CLK1, CLK_DIVSELXSPI1_SCKCR,
> +               FSELXSPI1, dtable_6_8_16_32_64),
>  };

Perhaps we need a custom clock for this?
According to Section 7.3.1 "SCKCR : System Clock Control Register",
some divider combinations are prohibited:
  - 4 x 6,
  - 4 x 32,
  - 4 x 64.
The last two are probably not an issue iff the xSPI driver never tries
to set the corresponding clock rates.
However, the first one may be an issue, as both 3 x 8 (valid) and 4 x 6
(prohibited) yield the same resulting divider, and I believe we cannot
be sure the clock core will never pick the prohibited combination.

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
