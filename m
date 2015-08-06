Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-oi0-f47.google.com ([209.85.218.47]:34223 "EHLO
	mail-oi0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755573AbbHFLTS (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Thu, 6 Aug 2015 07:19:18 -0400
Received: by oip136 with SMTP id 136so35480118oip.1
        for <linux-clk@vger.kernel.org>; Thu, 06 Aug 2015 04:19:17 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1438857590-9605-1-git-send-email-rajan.vaja@gmail.com>
References: <1438857590-9605-1-git-send-email-rajan.vaja@gmail.com>
Date: Thu, 6 Aug 2015 13:19:17 +0200
Message-ID: <CAMuHMdXqn3=9PYs3nOS6sdbOFh0F4e0_rF5sXF81v-sA6ivk_A@mail.gmail.com>
Subject: Re: [PATCH] clk: shmobile: div6: Fix memory leaks in cpg_div6_clock_init()
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Rajan Vaja <rajan.vaja@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Thu, Aug 6, 2015 at 12:39 PM, Rajan Vaja <rajan.vaja@gmail.com> wrote:
> Found memory leak while doing static analysis with cppcheck:
> [drivers/clk/shmobile/clk-div6.c:194]: (error) Memory leak: clock
>
> This patch fixes this memory leak as well other memory leaks found
> in same function.

We didn't bother adding those, as the system is completely busted if any of
these error paths are taken.

> Signed-off-by: Rajan Vaja <rajan.vaja@gmail.com>
> ---
>  drivers/clk/shmobile/clk-div6.c |    8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/shmobile/clk-div6.c b/drivers/clk/shmobile/clk-div6.c
> index 036a692..9affdfa 100644
> --- a/drivers/clk/shmobile/clk-div6.c
> +++ b/drivers/clk/shmobile/clk-div6.c
> @@ -191,6 +191,7 @@ static void __init cpg_div6_clock_init(struct device_node *np)
>         if (num_parents < 1) {
>                 pr_err("%s: no parent found for %s DIV6 clock\n",
>                        __func__, np->name);
> +               kfree(clock);
>                 return;
>         }
>
> @@ -198,8 +199,12 @@ static void __init cpg_div6_clock_init(struct device_node *np)
>                 GFP_KERNEL);
>         parent_names = kmalloc_array(num_parents, sizeof(*parent_names),
>                                 GFP_KERNEL);
> -       if (!parent_names)
> +       if (!clock->parents || !parent_names) {
> +               kfree(clock->parents);
> +               kfree(parent_names);
> +               kfree(clock);
>                 return;
> +       }
>
>         /* Remap the clock register and read the divisor. Disabling the
>          * clock overwrites the divisor, so we need to cache its value for the
> @@ -278,6 +283,7 @@ static void __init cpg_div6_clock_init(struct device_node *np)
>  error:
>         if (clock->reg)
>                 iounmap(clock->reg);
> +       kfree(clock->parents);
>         kfree(parent_names);
>         kfree(clock);
>  }

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
