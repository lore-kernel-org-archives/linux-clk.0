Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2E840683F
	for <linux-clk@vger.kernel.org>; Fri, 10 Jul 2026 15:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783698614; cv=none; b=rjef8kzj3d2LzFK7KhZ2HCYGnanfiYyz6srXQydwA/BWC9FJ4wJsN0wovZxAAMfITs98H+tcBFwbny1mP8ZPtGuCgBd5F94WrloPfZWB14PDDurR9zAplGN7op0JF1quvP8p50EOBYcDrm7wx3Q7Y72jPMz8krpS5E871PHefV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783698614; c=relaxed/simple;
	bh=Tq17+D31KkbBK0QvQb6lo28PCl8sTSJAnVSEdBHLiAs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m0R1tBS6zbZ7hl8/vkwBYpecGO2KU4vucKYO7fYOds0LZCMDBM01UqMXP+22vLU41R02ijKDBKTsR+6bMqBc8NMh2OXiBDEkyVPg0HiReRKqFHwCgMatKONVpaLnT9pnWPwXCzIoYyRqSA2x+ccHnmAsrWUDVg0e86QHc2h4uWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5bdc4fc26bfso794864e0c.0
        for <linux-clk@vger.kernel.org>; Fri, 10 Jul 2026 08:50:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783698612; x=1784303412;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4pUJAfk6hstEUL5r9lz9Y/QmHdN8S/TdC3nHKlmz3p4=;
        b=HPzxRJbK7lwFc+uu4JDDPxG2ZbfWgSMU1vHOjx8j9fJ3HTD8cGK9/mzu2YwpO9l6Ag
         oK3/Ss5+c/Y0HbNJJOCTZ+u60arqI87oNiq61leEPE1WhKTLtskyFv5ZVKFjgzSImiPB
         mPCGhdHU0cOxZ88wpgvloGPpN23hlGA/15sgEFONbJbLuGjbv0TQcMJyT4o6Rc3Q6PuU
         kT3OuJ6IGhYFjCJnSJnYFj9MEt5XSypCbTRP3NfaedTmTG7Rzd+Y7ioPDWvmmtnTRja5
         370Ym9MA92s6Vp0KnVYO3/pPZTBAD9qQIscZ2qv4/GJZlFLc5Cmzr4J9CsuglMCPpdFx
         3/Jw==
X-Forwarded-Encrypted: i=1; AHgh+RqQWJDtY87jtXnwXlZk5Cmf6AAG3hrWDawzbe0Y+YnBA4AFtIuTYcKmJZc8d+V9Pyposc1dpDYv5Qs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzm8c16a6R/iPmJGBQGUn8pbfi5m6+YBRpdeqbKSsx3BFjGUm9T
	4bni9I/rdLclUetOLWWtOmqBeDdttn/5RZPH4VfP24++68+lvYn/o1fgQRSDCbAD
X-Gm-Gg: AfdE7ck0uHAZu+wkSfG9owxACe5zi3BtJOS9fD6/Z0tWpVci8Lj5cqIHg12sSB7Yl/7
	n+sCvFRLSZCcY6KKkON6d/59tDvRx86coKlXLh6ykIBSFLsUK6t7Kxm4dUN7Sc/Epv5/GuH1mfn
	X1yUE6i+7uoRp5nvp1m/MVlvqofRd07YH1zSL9O79z5ET6PpniyLOgR1pJRLgUfTID3WtGOe5sP
	NoZ3Kr+zkluqzLxg9qlj0SngdZ7UH9jT9EWrReRn++5dFIHu25HiYD46lXc3vTT3hSkKyogLaWj
	nCwKXppcNTjzgXnp6LkLcpBFYk5c7mG0tRByafNnJZvTl16g/R79Eynkwhko75+QVbpGnvDcoRO
	gVbkOCYOpqxvsi2iiS9l1dkjZ9Heco2WzGybSMePVUvx7L/zoYd0mHUZh2WXHD+Sxrdt131zpnU
	36qX9UmSzQjRFk5Oe/wio4asl8p5Z7Zqn/COqtBBC5Z86qnEISAjyahqqnCyns
X-Received: by 2002:a05:6122:c9c:b0:5bd:b0a7:47e7 with SMTP id 71dfb90a1353d-5bfa544db9emr2481615e0c.3.1783698611971;
        Fri, 10 Jul 2026 08:50:11 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bf6f8f4283sm5018575e0c.17.2026.07.10.08.50.10
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 08:50:11 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-73a8ac9cd52so682624137.0
        for <linux-clk@vger.kernel.org>; Fri, 10 Jul 2026 08:50:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoNVCy/qMsPJ1yYLzKtSsnt6LqZWtT8oWz3qeswEV3FVi1BtMZuN7BJMsXaukhipg9EVWuY23G4Yg4=@vger.kernel.org
X-Received: by 2002:a05:6102:1a15:10b0:6cd:b43f:72fd with SMTP id
 ada2fe7eead31-7450cbc02c2mr1897086137.22.1783698610437; Fri, 10 Jul 2026
 08:50:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260619164030.380098-1-biju.das.jz@bp.renesas.com> <20260619164030.380098-6-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260619164030.380098-6-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 10 Jul 2026 17:49:58 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWR15XdcQkncnwov6B7KbQHXpvk1jBPOQr4f5zwtR09dA@mail.gmail.com>
X-Gm-Features: AUfX_mxHw8t6FHfw4QItlFOI1qA8p9h3PYZrH4NBbu-mU_RDK2R6hPa3dqc-gts
Message-ID: <CAMuHMdWR15XdcQkncnwov6B7KbQHXpvk1jBPOQr4f5zwtR09dA@mail.gmail.com>
Subject: Re: [PATCH 5/6] clk: renesas: r9a08g046-cpg: Add MIPI DSI and LCDC
 clock/reset entries
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Brian Masney <bmasney@redhat.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

Thanks for your patch!

s/r9a08g046-cpg/r9a08g046/

On Fri, 19 Jun 2026 at 18:40, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add clock and reset entries for the MIPI DSI and LCDC peripherals on the
> RZ/G3L (R9A08G046) SoC.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  drivers/clk/renesas/r9a08g046-cpg.c | 62 +++++++++++++++++++++++++++++
>  1 file changed, 62 insertions(+)
>
> diff --git a/drivers/clk/renesas/r9a08g046-cpg.c b/drivers/clk/renesas/r9a08g046-cpg.c
> index 4488bd1988e8..7cea2c6d2c42 100644
> --- a/drivers/clk/renesas/r9a08g046-cpg.c
> +++ b/drivers/clk/renesas/r9a08g046-cpg.c
> @@ -19,22 +19,26 @@
>  #define G3L_CPG_PL3_DDIV               (0x208)
>  #define G3L_CPG_SDHI_DDIV              (0x218)
>  #define G3L_CPG_GE3D_DDIV              (0x224)
> +#define G3L_CPG_DSI_DDIV               (0x228)
>  #define G3L_CPG_CA55CORE_DDIV          (0x234)
>  #define G3L_CPG_RSCI_DDIV              (0x238)
>  #define G3L_CPG_RSPI_DDIV              (0x23c)
>  #define G3L_CPG_SDHI_DSEL              (0x244)
>  #define G3L_CLKDIVSTATUS               (0x280)
>  #define G3L_CLKSELSTATUS               (0x284)
> +#define G3L_CPG_DSI_SSEL               (0x408)
>  #define G3L_CPG_GE3D_SSEL              (0x40c)
>  #define G3L_CPG_ETH_SSEL               (0x410)
>  #define G3L_CPG_RSCI_SSEL              (0x414)
>  #define G3L_CPG_RSPI_SSEL              (0x418)
> +#define G3L_CPG_DSI_SDIV               (0x430)
>  #define G3L_CPG_ETH_SDIV               (0x434)
>
>  /* RZ/G3L Specific division configuration.  */
>  #define G3L_DIVPL2A            DDIV_PACK(G3L_CPG_PL2_DDIV, 0, 2)
>  #define G3L_DIVPL2B            DDIV_PACK(G3L_CPG_PL2_DDIV, 4, 2)
>  #define G3L_DIVPL3A            DDIV_PACK(G3L_CPG_PL3_DDIV, 0, 2)
> +#define G3L_DIVPL3B            DDIV_PACK(G3L_CPG_PL3_DDIV, 4, 2)
>  #define G3L_DIV_SDHI0          DDIV_PACK(G3L_CPG_SDHI_DDIV, 0, 2)
>  #define G3L_DIV_SDHI1          DDIV_PACK(G3L_CPG_SDHI_DDIV, 4, 2)
>  #define G3L_DIV_SDHI2          DDIV_PACK(G3L_CPG_SDHI_DDIV, 8, 2)
> @@ -54,11 +58,14 @@
>  #define G3L_SDIV_ETH_B         DDIV_PACK(G3L_CPG_ETH_SDIV, 4, 1)
>  #define G3L_SDIV_ETH_C         DDIV_PACK(G3L_CPG_ETH_SDIV, 8, 2)
>  #define G3L_SDIV_ETH_D         DDIV_PACK(G3L_CPG_ETH_SDIV, 12, 1)
> +#define G3L_SDIV_DSI_C_SET     DDIV_PACK(G3L_CPG_DSI_SDIV, 8, 1)
> +#define G3L_DIV_DSI            DDIV_PACK(G3L_CPG_DSI_DDIV, 0, 2)

Please preserve sort order for both newly-added lines.

>
>  /* RZ/G3L Clock status configuration. */
>  #define G3L_DIVPL2A_STS                DDIV_PACK(G3L_CLKDIVSTATUS, 4, 1)
>  #define G3L_DIVPL2B_STS                DDIV_PACK(G3L_CLKDIVSTATUS, 5, 1)
>  #define G3L_DIVPL3A_STS                DDIV_PACK(G3L_CLKDIVSTATUS, 8, 1)
> +#define G3L_DIVPL3B_STS                DDIV_PACK(G3L_CLKDIVSTATUS, 9, 1)
>  #define G3L_DIV_CA55_CORE0_STS DDIV_PACK(G3L_CLKDIVSTATUS, 12, 1)
>  #define G3L_DIV_CA55_CORE1_STS DDIV_PACK(G3L_CLKDIVSTATUS, 13, 1)
>  #define G3L_DIV_CA55_CORE2_STS DDIV_PACK(G3L_CLKDIVSTATUS, 14, 1)
> @@ -78,6 +85,7 @@
>  #define G3L_SEL_SDHI1_STS      SEL_PLL_PACK(G3L_CLKSELSTATUS, 17, 1)
>  #define G3L_SEL_SDHI2_STS      SEL_PLL_PACK(G3L_CLKSELSTATUS, 18, 1)
>  #define G3L_DIV_GE3D_STS       DDIV_PACK(G3L_CLKDIVSTATUS, 27, 1)
> +#define G3L_DIV_DSI_STS                DDIV_PACK(G3L_CLKDIVSTATUS, 28, 1)
>
>  /* RZ/G3L Specific clocks select. */
>  #define G3L_SEL_SDHI0          SEL_PLL_PACK(G3L_CPG_SDHI_DSEL, 0, 2)
> @@ -101,6 +109,7 @@
>  #define G3L_SEL_RSPI0          SEL_PLL_PACK(G3L_CPG_RSPI_SSEL, 0, 2)
>  #define G3L_SEL_RSPI1          SEL_PLL_PACK(G3L_CPG_RSPI_SSEL, 2, 2)
>  #define G3L_SEL_RSPI2          SEL_PLL_PACK(G3L_CPG_RSPI_SSEL, 4, 2)
> +#define G3L_SEL_DSI            SEL_PLL_PACK(G3L_CPG_DSI_SSEL, 0, 1)

Sort order?

> @@ -347,6 +388,7 @@ static const struct cpg_core_clk r9a08g046_core_clks[] __initconst = {
>         DEF_G3S_DIV("G", R9A08G046_CLK_G, CLK_SEL_GE3D, G3L_DIV_GE3D, G3L_DIV_GE3D_STS,
>                     dtable_1_32, 0, 0, 0, NULL),
>         DEF_FIXED("OSCCLK", R9A08G046_OSCCLK, CLK_EXTAL, 1, 1),
> +       DEF_FIXED("dsi_pllclk", R9A08G046_MIPI_DSI_PLLCLK, R9A08G046_CLK_M4, 1, 1),

"mipi_dsi_pllclk"

>  };
>
>  static const struct rzg2l_mod_clk r9a08g046_mod_clks[] = {
> @@ -400,6 +442,22 @@ static const struct rzg2l_mod_clk r9a08g046_mod_clks[] = {
>                                         MSTOP(BUS_PERI_VIDEO, BIT(12))),
>         DEF_MOD("ge3d_ace_clk",         R9A08G046_GE3D_ACE_CLK, R9A08G046_CLK_P1, 0x558, 2,
>                                         MSTOP(BUS_PERI_VIDEO, BIT(12))),
> +       DEF_MOD("dsi_sysclk",           R9A08G046_MIPI_DSI_SYSCLK, R9A08G046_CLK_M5, 0x568, 1,

"mipi_dsi_sysclk"

> +                                       MSTOP(BUS_PERI_VIDEO, BIT(5) | BIT(6))),
> +       DEF_MOD("dsi_aclk",             R9A08G046_MIPI_DSI_ACLK, R9A08G046_CLK_P1, 0x568, 2,

"mipi_dsi_aclk"

> +                                       MSTOP(BUS_PERI_VIDEO, BIT(5) | BIT(6))),
> +       DEF_MOD("dsi_pclk",             R9A08G046_MIPI_DSI_PCLK, R9A08G046_CLK_P2, 0x568, 3,

"mipi_dsi_pclk"

> +                                       MSTOP(BUS_PERI_VIDEO, BIT(5) | BIT(6))),
> +       DEF_MOD("dsi_vclk",             R9A08G046_MIPI_DSI_VCLK, R9A08G046_CLK_M3, 0x568, 4,

"mipi_dsi_vclk"

> +                                       MSTOP(BUS_PERI_VIDEO, BIT(5) | BIT(6))),
> +       DEF_MOD("dsi_lpclk",            R9A08G046_MIPI_DSI_LPCLK, R9A08G046_CLK_M1, 0x568, 5,

"mipi_dsi_lpclk"


> +                                       MSTOP(BUS_PERI_VIDEO, BIT(5) | BIT(6))),
> +       DEF_MOD("lcdc_clk_a",           R9A08G046_LCDC_CLK_A, R9A08G046_CLK_P1, 0x56c, 0,
> +                                       MSTOP(BUS_PERI_VIDEO, BIT(7) | BIT(8) | BIT(9))),
> +       DEF_MOD("lcdc_clk_d",           R9A08G046_LCDC_CLK_D, R9A08G046_CLK_M3, 0x56c, 1,
> +                                       MSTOP(BUS_PERI_VIDEO, BIT(7) | BIT(8) | BIT(9))),
> +       DEF_MOD("lcdc_clk_p",           R9A08G046_LCDC_CLK_P, R9A08G046_CLK_P2, 0x56c, 2,
> +                                       MSTOP(BUS_PERI_VIDEO, BIT(7) | BIT(8) | BIT(9))),
>         DEF_MOD("ssi0_pclk2",           R9A08G046_SSI0_PCLK2, R9A08G046_CLK_P0, 0x570, 0,
>                                         MSTOP(BUS_MCPU1, BIT(10))),
>         DEF_MOD("ssi0_pclk_sfr",        R9A08G046_SSI0_PCLK_SFR, R9A08G046_CLK_P0, 0x570, 1,

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
