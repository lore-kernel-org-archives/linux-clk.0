Return-Path: <SRS0=Dsg5=MG=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AC99C433F4
	for <linux-clk@archiver.kernel.org>; Mon, 24 Sep 2018 09:09:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DD98D208E3
	for <linux-clk@archiver.kernel.org>; Mon, 24 Sep 2018 09:09:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD98D208E3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728090AbeIXPLC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 24 Sep 2018 11:11:02 -0400
Received: from mail-vs1-f65.google.com ([209.85.217.65]:34088 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728126AbeIXPLB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 24 Sep 2018 11:11:01 -0400
Received: by mail-vs1-f65.google.com with SMTP id m10-v6so7864652vsk.1;
        Mon, 24 Sep 2018 02:09:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aBEd/n/mpLQO32B+rUWmDxH5K2cg1yhH8bYyJMhR1Ak=;
        b=iA0nxChg4xMCtH8g5R/IIQ9FH5GvmuIuMtYYGIG2bp9DSzGvu1xdvQ+o/ZS2u0QeUE
         tGg6jBi65UpCNlwS3Oez/pVf+nwnpE3YojvxRjr7jqvAj9GnBeUI0VTgsa8zXu2KwKoL
         AF6o2ZmWNsSHTJNdGM/3r/XSSkY9DxCaWwTa2osmODFLV/Ezs2K6yMdIS8eSl4wXKYdv
         6iZnFOfkgKsmgiwPLtiO6q1u8S7sNVHGZzZwgj3nHnBQjBiyAytUBuRTQNOvjvxIL/0P
         thcYLVOLc4NE730sGRdGg6ScyWE7AT9ho8TsBAR6a8h1iOS+WqgIxgeQEmYKhJAh/TIU
         Mqxg==
X-Gm-Message-State: APzg51CLNyRoK+wjNhJH68QYcA9xt+V7oOrSjfxZlTmLS0500T2C8NU8
        3sY9ixr7X5/HvGcK+INzbG8BePd58qmlj/1d2F0=
X-Google-Smtp-Source: ANB0VdaiIES6TDqaYgKhoqRSlfXyMXt5UiA8aQo8ng7zlKC28wVJR/iDyOiFvoLJbOdf/q4vj6KcaNGK4oFYd3sZk4s=
X-Received: by 2002:a67:7893:: with SMTP id t141-v6mr1852973vsc.11.1537780196811;
 Mon, 24 Sep 2018 02:09:56 -0700 (PDT)
MIME-Version: 1.0
References: <20180921152054.117774-1-chris.brandt@renesas.com> <20180921152054.117774-3-chris.brandt@renesas.com>
In-Reply-To: <20180921152054.117774-3-chris.brandt@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 24 Sep 2018 11:09:45 +0200
Message-ID:
 <CAMuHMdUbMJwgQ5-UQuHAMszHnQf+4m0sSws4pW-vA8di+L2RQQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: renesas: r7s9210: Convert some clocks to early
To:     Chris Brandt <chris.brandt@renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms+renesas@verge.net.au>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org
Message-ID: <20180924090945.3J25qqCz7ySADRrVtn1AhJlRmmtv35Gno-bqOt_H72o@z>

Hi Chris,

On Fri, Sep 21, 2018 at 5:21 PM Chris Brandt <chris.brandt@renesas.com> wrote:
> The OSTM timer driver for RZ/A2 uses TIMER_OF_DECLARE which requires the
> ostm module clocks to be registers early in boot.
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/r7s9210-cpg-mssr.c
> +++ b/drivers/clk/renesas/r7s9210-cpg-mssr.c
> @@ -55,25 +55,25 @@ enum clk_ids {

I'd put the early core clocks here ...

>  static struct cpg_core_clk r7s9210_core_clks[] = {
>         /* External Clock Inputs */
> -       DEF_INPUT("extal",     CLK_EXTAL),
> +       /*        ".extal"  exists as early clock */
>
>         /* Internal Core Clocks */
> -       DEF_BASE(".main",       CLK_MAIN, CLK_TYPE_RZA_MAIN, CLK_EXTAL),
> -       DEF_BASE(".pll",       CLK_PLL, CLK_TYPE_RZA_PLL, CLK_MAIN),
> +       /*        ".main"   exists as early clock */
> +       /*        ".pll"    exists as early clock */

... so comments like the above are not needed.

>
>         /* Core Clock Outputs */
>         DEF_FIXED("i",      R7S9210_CLK_I,     CLK_PLL,          2, 1),
>         DEF_FIXED("g",      R7S9210_CLK_G,     CLK_PLL,          4, 1),
>         DEF_FIXED("b",      R7S9210_CLK_B,     CLK_PLL,          8, 1),
>         DEF_FIXED("p1",     R7S9210_CLK_P1,    CLK_PLL,         16, 1),
> -       DEF_FIXED("p1c",    R7S9210_CLK_P1C,   CLK_PLL,         16, 1),
> +       /*        "p1c"     exists as early clock */
>         DEF_FIXED("p0",     R7S9210_CLK_P0,    CLK_PLL,         32, 1),
>  };
>

Same for early module clocks...

>  static const struct mssr_mod_clk r7s9210_mod_clks[] __initconst = {
> -       DEF_MOD_STB("ostm2",     34,    R7S9210_CLK_P1C),
> -       DEF_MOD_STB("ostm1",     35,    R7S9210_CLK_P1C),
> -       DEF_MOD_STB("ostm0",     36,    R7S9210_CLK_P1C),
> +       /*          "ostm2"      36     exists as early clock */
> +       /*          "ostm1"      35     exists as early clock */
> +       /*          "ostm0"      34     exists as early clock */

... and these comments.

>
>         DEF_MOD_STB("scif4",     43,    R7S9210_CLK_P1C),
>         DEF_MOD_STB("scif3",     44,    R7S9210_CLK_P1C),

> +/* The clock dividers in the table vary based on DT and register settings */
> +static void r7s9210_update_clk_table(struct clk *extal_clk, void __iomem *base)
> +{

[...]

> +}
> +
>  struct clk * __init rza2_cpg_clk_register(struct device *dev,
>         const struct cpg_core_clk *core, const struct cpg_mssr_info *info,
>         struct clk **clks, void __iomem *base,
> @@ -99,9 +164,6 @@ struct clk * __init rza2_cpg_clk_register(struct device *dev,
>         struct clk *parent;
>         unsigned int mult = 1;
>         unsigned int div = 1;
> -       u16 frqcr;
> -       u8 index;
> -       int i;
>
>         parent = clks[core->parent];
>         if (IS_ERR(parent))
> @@ -123,47 +185,8 @@ struct clk * __init rza2_cpg_clk_register(struct device *dev,
>         }
>
>         /* Adjust the dividers based on the current FRQCR setting */
> -       if (core->id == CLK_MAIN) {

[...]

> -       }
> +       if (core->id == CLK_MAIN)
> +               r7s9210_update_clk_table(parent, base);

While factoring out this block into its own function is a good idea, it's not
related to this patch, is it? So I think it should be done in a separate patch.

> @@ -181,9 +204,25 @@ const struct cpg_mssr_info r7s9210_cpg_mssr_info __initconst = {
>         .num_mod_clks = ARRAY_SIZE(r7s9210_mod_clks),
>         .num_hw_mod_clks = 11 * 32, /* includes STBCR0 which doesn't exist */
>
> +       /* Early Core Clocks */
> +       .early_core_clks = r7s9210_early_core_clks,
> +       .num_early_core_clks = ARRAY_SIZE(r7s9210_early_core_clks),
> +
> +       /* Early Module Clocks */
> +       .early_mod_clks = r7s9210_early_mod_clks,
> +       .num_early_mod_clks = ARRAY_SIZE(r7s9210_early_mod_clks),

All early clocks at the top?

> +
>         /* Callbacks */
>         .cpg_clk_register = rza2_cpg_clk_register,
>
>         /* RZ/A2 has Standby Control Registers */
>         .stbyctrl = true,
>  };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
