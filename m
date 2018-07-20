Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-ua0-f194.google.com ([209.85.217.194]:33589 "EHLO
        mail-ua0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727233AbeGTMJA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 20 Jul 2018 08:09:00 -0400
MIME-Version: 1.0
References: <1531924476-23261-1-git-send-email-phil.edworthy@renesas.com>
In-Reply-To: <1531924476-23261-1-git-send-email-phil.edworthy@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 20 Jul 2018 13:21:01 +0200
Message-ID: <CAMuHMdVEgj7kJFxNuR8w468FoGRaP_mEDv6JqB_7deuQjsed_Q@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: r9a06g032: Avoid needless probe deferring
To: Phil Edworthy <phil.edworthy@renesas.com>
Cc: Simon Horman <horms@verge.net.au>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Phil,

On Wed, Jul 18, 2018 at 4:34 PM Phil Edworthy <phil.edworthy@renesas.com> wrote:
> To avoid all SoC peripheral drivers deferring their probes, both clock and
> pinctrl drivers should already be probed. Since the pinctrl driver requires
> a clock to access the registers, the clock driver should be probed before
> the pinctrl driver.
>
> Therefore, move the clock driver from subsys_initcall to core_initcall.
>
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>

Thanks for your patch!

The (not yet upstreamed) pinctrl driver uses postcore_initcall(), right?

> --- a/drivers/clk/renesas/r9a06g032-clocks.c
> +++ b/drivers/clk/renesas/r9a06g032-clocks.c
> @@ -877,17 +877,18 @@ static const struct of_device_id r9a06g032_match[] = {
>         { }
>  };
>
> -static struct platform_driver r9a06g032_clock_driver = {
> +static struct platform_driver r9a06g032_clock_driver __refdata = {
>         .driver         = {
>                 .name   = "renesas,r9a06g032-sysctrl",
>                 .of_match_table = r9a06g032_match,
>         },
> +       .probe = r9a06g032_clocks_probe,
>  };
>
>  static int __init r9a06g032_clocks_init(void)
>  {
> -       return platform_driver_probe(&r9a06g032_clock_driver,
> -                       r9a06g032_clocks_probe);
> +       platform_driver_register(&r9a06g032_clock_driver);
> +       return 0;
>  }

Why are all of the above changes needed?
Shouldn't the platform_driver_probe() keep on working?
If it does not, it means the clock driver has some other dependency, and
cannot be bound immediately.  This is potentially a dangerous situation,
as r9a06g032_clocks_probe() is __init, but can still be called at any time
later.  Hence using platform_driver_probe() is the safe thing to do,
possibly with a different reshuffling of the clock and pinctrl initcall
priorities.

> -subsys_initcall(r9a06g032_clocks_init);
> +core_initcall(r9a06g032_clocks_init);

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
