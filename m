Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4DD7364934
	for <linux-clk@vger.kernel.org>; Thu, 23 Apr 2026 09:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776937181; cv=none; b=JGhGBC7Ah19tJqfbp+48J3lOr+kiufIdw9nW8FknR7FaJZ98MYmurUf18LRNA7XWOHb7n2PHc9WDRtWcQ0qs9GIk8SDewu4Zd/O5txQZzmHYMkXiNfAGpgR7+f8ClzYMr4RqP5DRambzibYnQStTY8F2YotqTmjkdTdaiymZxJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776937181; c=relaxed/simple;
	bh=8KfRKWnC2a8QhyOPBB1Am1veLoXXyq9MoBmrXeFLDAc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=laBo9xtQt2fnoGDf2aRfyifZabLc7iXfpAyagHtfKiqnHE9ZdhiqTUnZpfTKzWfhTVmamnc248fiBsaMdoUC3YoNZW1aK3bGpxhxesVc3WDaVQ6S1ubTs3G9g68jeFQ08E6e6dHA+eZn7Ij2xNL823VYx0TNEIB2PtCXpWQ6Jbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-6108228a851so2163333137.0
        for <linux-clk@vger.kernel.org>; Thu, 23 Apr 2026 02:39:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776937176; x=1777541976;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=go1WMIAsem5LEjre+Mt82iaNq/eWdJ4DT2hUHXWyutw=;
        b=Sl5KqaUhVYerz+xjLpZt7TBDpfLLBB+qv70+vNpa/zPyG79luhnuuu9SztFdhFHq/N
         SYgCuMaruEepjak0mdi5VxbAoUpbLzhxQQzauCiNawa9gNFUhfGyzRC5//KzwAhh16S6
         alTRgVy4camtJjg0973+XtaD3doY1ijKNh7G7Kz8272L1rSrRJufkPomf/IKWnCVuzG8
         DyMcX8AqrMreJQuE4JLGIyN28G0/GpnPDI8xMrh0EkqbiEcgoPdGBwhF/7NXwPZoZgkS
         RJ9Pdwk+1PEQ8sCfeq6M2z8Bu3pwHPQL54EwzRAxhOKeUDz9e0LWX2z0tGG6IWE/q8Vb
         V8lQ==
X-Forwarded-Encrypted: i=1; AFNElJ+XifqL2wv2ic9AemFzhlJ7xtvRIR8axJto/RiJV/YySVisQCO+nC9HBqI8aXdAxZKerkM/lBcgeGo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0cmdyZcrclwviacfZXDa5hSodsK4S4VK7mQlaRnMqPAaY6huz
	4DD4odymYq9xUIbDYtOhyghlpFsdP1zRD4SQwItDq96A7Ly0plYAUV6xybkoLNqiWk0=
X-Gm-Gg: AeBDieuq33FfrA7DmgaA/D2wuC4AlznTVuZlbhTKDZSG+dHg57R1Hw2krsd8hwcEuLq
	nkTfeGNktaWOsLsfNbyJcAtqmhcr/Gx/SbP4UGjta6nxekL0hvECrS1cyBkOE5QXWu9H/eGYyNc
	uMr1KNDLUY0YDdWMCOuYd+tpX0VJCuehBigXeXzulYWGMUOs5Y8tpU+VlyG0ojWV4S20kQm06NK
	XMwH3pjYFo1vBxDLfV3JL8D1M4aQ4g4VKdM0Yu6qrl4ps2QKAsI+pqMraHUX9cd2UypwStcgW+L
	vVqgi8rsnKr4r/g8534tSlh1Gjb8iNqRnC71n2rVP0wmZynbz4jh1//fwkxRKq5JW31WlkY5XTH
	8Cs449+a0klGAgDxKxum/yrMvadUVioOEOIhrGakK5LSfAx2lvQqdytkht3CmUX0vp0D+f1kCAC
	RlvKJ1D1I0F9Ok3NPFQCuz0YzirS4jR+ED+o3aRlYpDZGJYatHZrYT/lbACA7HjWvPbLLvcc4=
X-Received: by 2002:a05:6102:6b02:b0:602:a9f3:74d8 with SMTP id ada2fe7eead31-616f74063a4mr12564245137.25.1776937176384;
        Thu, 23 Apr 2026 02:39:36 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-61745c9e53esm9378724137.5.2026.04.23.02.39.35
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 02:39:36 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-9569825dc57so945670241.2
        for <linux-clk@vger.kernel.org>; Thu, 23 Apr 2026 02:39:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/WG3ulEOz9aY2jmHJauOkuaXXhVtebLhyJrISVs9Vqpvb3UpTT4xiJNx1P19AZxVGgpoOEE3A2Y38=@vger.kernel.org
X-Received: by 2002:a05:6102:41a6:b0:60a:8515:9097 with SMTP id
 ada2fe7eead31-616f4741ef9mr12358337137.3.1776937175679; Thu, 23 Apr 2026
 02:39:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326110648.29389-1-biju.das.jz@bp.renesas.com> <20260326110648.29389-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260326110648.29389-5-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 23 Apr 2026 11:39:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU4wqFCNobN7mkMNCArP41cGmnbEi5cmuc576EdUL6+bQ@mail.gmail.com>
X-Gm-Features: AQROBzCRF5GnRj_CGoI5SvJDP-G6tqsoc-CT24ZWU0ZSnYkK6CwPToD4dB2ND5E
Message-ID: <CAMuHMdU4wqFCNobN7mkMNCArP41cGmnbEi5cmuc576EdUL6+bQ@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] clk: renesas: r9a08g046: Add clock and reset
 signals for the GBETH IPs
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Thu, 26 Mar 2026 at 12:06, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add clock and reset entries for the Gigabit Ethernet Interfaces
> (GBETH 0-1) IPs found on the RZ/G3L SoC. This includes various dividers
> and mux clocks needed by these two GBETH IPs. Also add tx, tx-180, rx,
> rx-180, rmii, rmii-tx and rmii-rx clocks to r9a08g046_no_pm_mod_clk
> table to avoid enabling both normal and rmii clocks by the PM framework.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/r9a08g046-cpg.c
> +++ b/drivers/clk/renesas/r9a08g046-cpg.c

> @@ -86,6 +140,17 @@ static const struct cpg_core_clk r9a08g046_core_clks[] __initconst = {
>                     500000000UL),
>         DEF_FIXED(".pll2_div2", CLK_PLL2_DIV2, CLK_PLL2, 1, 2),
>         DEF_FIXED(".pll3_div2", CLK_PLL3_DIV2, CLK_PLL3, 1, 2),
> +       DEF_FIXED(".pll6_div10", CLK_PLL6_DIV10, CLK_PLL6, 1, 10),
> +       DEF_MUX(".sel_eth0_tx", CLK_SEL_ETH0_TX, G3L_SEL_ETH0_TX, sel_eth0_tx),
> +       DEF_MUX(".sel_eth0_rx", CLK_SEL_ETH0_RX, G3L_SEL_ETH0_RX, sel_eth0_rx),
> +       DEF_MUX(".sel_eth0_rm", CLK_SEL_ETH0_RM, G3L_SEL_ETH0_RM, sel_eth0_rm),
> +       DEF_MUX(".sel_eth1_tx", CLK_SEL_ETH1_TX, G3L_SEL_ETH1_TX, sel_eth1_tx),
> +       DEF_MUX(".sel_eth1_rx", CLK_SEL_ETH1_RX, G3L_SEL_ETH1_RX, sel_eth1_rx),
> +       DEF_MUX(".sel_eth1_rm", CLK_SEL_ETH1_RM, G3L_SEL_ETH1_RM, sel_eth1_rm),
> +       DEF_DIV(".div_eth0_tr", CLK_ETH0_TR, CLK_PLL6, G3L_SDIV_ETH_A, dtable_4_200),
> +       DEF_DIV(".div_eth1_tr", CLK_ETH1_TR, CLK_PLL6, G3L_SDIV_ETH_C, dtable_4_200),
> +       DEF_DIV(".div_eth0_rm", CLK_ETH0_RM, CLK_SEL_ETH0_RM, G3L_SDIV_ETH_B, dtable_2_20),
> +       DEF_DIV(".div_eth1_rm", CLK_ETH1_RM, CLK_SEL_ETH1_RM, G3L_SDIV_ETH_D, dtable_2_20),
>
>         /* Core output clk */
>         DEF_G3S_DIV("P0", R9A08G046_CLK_P0, CLK_PLL2_DIV2, G3L_DIVPL2B, G3L_DIVPL2B_STS,
> @@ -94,6 +159,21 @@ static const struct cpg_core_clk r9a08g046_core_clks[] __initconst = {
>                     dtable_4_128, 0, 0, 0, NULL),
>         DEF_G3S_DIV("P3", R9A08G046_CLK_P3, CLK_PLL2_DIV2, G3L_DIVPL2A, G3L_DIVPL2A_STS,
>                     dtable_4_128, 0, 0, 0, NULL),
> +       DEF_FIXED("HP", R9A08G046_CLK_HP, CLK_PLL6_DIV10, 1, 1),
> +       DEF_MUX_FLAGS("ETHTX01", R9A08G046_CLK_ETHTX01, G3L_SEL_ETH0_CLK_TX_I, sel_eth0_clk_tx_i,
> +                     CLK_SET_RATE_PARENT),
> +       DEF_MUX_FLAGS("ETHRX01", R9A08G046_CLK_ETHRX01, G3L_SEL_ETH0_CLK_RX_I, sel_eth0_clk_rx_i,
> +                     CLK_SET_RATE_PARENT),
> +       DEF_MUX_FLAGS("ETHTX11", R9A08G046_CLK_ETHTX11, G3L_SEL_ETH1_CLK_TX_I, sel_eth1_clk_tx_i,
> +                     CLK_SET_RATE_PARENT),
> +       DEF_MUX_FLAGS("ETHRX11", R9A08G046_CLK_ETHRX11, G3L_SEL_ETH1_CLK_RX_I, sel_eth1_clk_rx_i,
> +                     CLK_SET_RATE_PARENT),
> +       DEF_FIXED("ETHRM0", R9A08G046_CLK_ETHRM0, CLK_ETH0_RM, 1, 1),

Shouldn't the parent be CLK_SEL_ETH0_RM (i.e. before the 1/2 or 1/20 divider)?

> +       DEF_FIXED("ETHTX02", R9A08G046_CLK_ETHTX02, CLK_SEL_ETH0_TX, 1, 1),
> +       DEF_FIXED("ETHRX02", R9A08G046_CLK_ETHRX02, CLK_SEL_ETH0_RX, 1, 1),
> +       DEF_FIXED("ETHRM1", R9A08G046_CLK_ETHRM1, CLK_ETH1_RM, 1, 1),

Likewise, CLK_SEL_ETH1_RM?

If you agree, I can fix this up while applying.

> +       DEF_FIXED("ETHTX12", R9A08G046_CLK_ETHTX12, CLK_SEL_ETH1_TX, 1, 1),
> +       DEF_FIXED("ETHRX12", R9A08G046_CLK_ETHRX12, CLK_SEL_ETH1_RX, 1, 1),
>  };
>
>  static const struct rzg2l_mod_clk r9a08g046_mod_clks[] = {
> @@ -107,6 +187,50 @@ static const struct rzg2l_mod_clk r9a08g046_mod_clks[] = {
>                                         MSTOP(BUS_REG1, BIT(2))),
>         DEF_MOD("dmac_pclk",            R9A08G046_DMAC_PCLK, R9A08G046_CLK_P3, 0x52c, 1,
>                                         MSTOP(BUS_REG1, BIT(3))),
> +       DEF_MOD("eth0_clk_axi",         R9A08G046_ETH0_CLK_AXI, R9A08G046_CLK_P1, 0x57c, 0,
> +                                       MSTOP(BUS_PERI_COM, BIT(2))),
> +       DEF_MOD("eth1_clk_axi",         R9A08G046_ETH1_CLK_AXI, R9A08G046_CLK_P1, 0x57c, 1,
> +                                       MSTOP(BUS_PERI_COM, BIT(3))),
> +       DEF_MOD("eth0_clk_chi",         R9A08G046_ETH0_CLK_CHI, R9A08G046_CLK_P1, 0x57c, 2,
> +                                       MSTOP(BUS_PERI_COM, BIT(2))),
> +       DEF_MOD("eth1_clk_chi",         R9A08G046_ETH1_CLK_CHI, R9A08G046_CLK_P1, 0x57c, 3,
> +                                       MSTOP(BUS_PERI_COM, BIT(3))),
> +       DEF_COUPLED("eth0_tx_i",        R9A08G046_ETH0_CLK_TX_I, R9A08G046_CLK_ETHTX01, 0x57c, 4,
> +                                       MSTOP(BUS_PERI_COM, BIT(2))),
> +       DEF_COUPLED("eth0_tx_180_i", R9A08G046_ETH0_CLK_TX_180_I, R9A08G046_CLK_ETHTX02, 0x57c, 4,
> +                                       MSTOP(BUS_PERI_COM, BIT(2))),
> +       DEF_COUPLED("eth1_tx_i",        R9A08G046_ETH1_CLK_TX_I, R9A08G046_CLK_ETHTX11, 0x57c, 5,
> +                                       MSTOP(BUS_PERI_COM, BIT(3))),
> +       DEF_COUPLED("eth1_tx_180_i", R9A08G046_ETH1_CLK_TX_180_I, R9A08G046_CLK_ETHTX12, 0x57c, 5,

Inconsistent alignment (more below).

> +                                       MSTOP(BUS_PERI_COM, BIT(3))),
> +       DEF_COUPLED("eth0_rx_i",        R9A08G046_ETH0_CLK_RX_I, R9A08G046_CLK_ETHRX01, 0x57c, 6,
> +                                       MSTOP(BUS_PERI_COM, BIT(2))),
> +       DEF_COUPLED("eth0_rx_180_i", R9A08G046_ETH0_CLK_RX_180_I, R9A08G046_CLK_ETHRX02, 0x57c, 6,
> +                                       MSTOP(BUS_PERI_COM, BIT(2))),
> +       DEF_COUPLED("eth1_rx_i",        R9A08G046_ETH1_CLK_RX_I, R9A08G046_CLK_ETHRX11, 0x57c, 7,
> +                                       MSTOP(BUS_PERI_COM, BIT(3))),
> +       DEF_COUPLED("eth1_rx_180_i", R9A08G046_ETH1_CLK_RX_180_I, R9A08G046_CLK_ETHRX12, 0x57c, 7,
> +                                       MSTOP(BUS_PERI_COM, BIT(3))),
> +       DEF_MOD("eth0_ptp_ref_i",       R9A08G046_ETH0_CLK_PTP_REF_I, R9A08G046_CLK_HP, 0x57c, 8,
> +                                       MSTOP(BUS_PERI_COM, BIT(2))),
> +       DEF_MOD("eth1_ptp_ref_i",       R9A08G046_ETH1_CLK_PTP_REF_I, R9A08G046_CLK_HP, 0x57c, 9,
> +                                       MSTOP(BUS_PERI_COM, BIT(3))),
> +       DEF_MOD("eth0_rmii_i",          R9A08G046_ETH0_CLK_RMII_I, R9A08G046_CLK_ETHRM0, 0x57c, 10,
> +                                       MSTOP(BUS_PERI_COM, BIT(2))),
> +       DEF_MOD("eth1_rmii_i",          R9A08G046_ETH1_CLK_RMII_I, R9A08G046_CLK_ETHRM1, 0x57c, 11,
> +                                       MSTOP(BUS_PERI_COM, BIT(3))),
> +       DEF_COUPLED("eth0_tx_i_rmii",

Inconsistent line break / alignment (more below).

> +                               R9A08G046_ETH0_CLK_TX_I_RMII, R9A08G046_CLK_ETHTX01, 0x57c, 12,
> +                                       MSTOP(BUS_PERI_COM, BIT(2))),
> +       DEF_COUPLED("eth0_rx_i_rmii",
> +                               R9A08G046_ETH0_CLK_RX_I_RMII, R9A08G046_CLK_ETHRX01, 0x57c, 12,
> +                                       MSTOP(BUS_PERI_COM, BIT(2))),
> +       DEF_COUPLED("eth1_tx_i_rmii",
> +                               R9A08G046_ETH1_CLK_TX_I_RMII, R9A08G046_CLK_ETHTX11, 0x57c, 13,
> +                                       MSTOP(BUS_PERI_COM, BIT(3))),
> +       DEF_COUPLED("eth1_rx_i_rmii",
> +                               R9A08G046_ETH1_CLK_RX_I_RMII, R9A08G046_CLK_ETHRX11, 0x57c, 13,
> +                                       MSTOP(BUS_PERI_COM, BIT(3))),
>         DEF_MOD("scif0_clk_pck",        R9A08G046_SCIF0_CLK_PCK, R9A08G046_CLK_P0, 0x584, 0,
>                                         MSTOP(BUS_MCPU2, BIT(1))),
>  };

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
