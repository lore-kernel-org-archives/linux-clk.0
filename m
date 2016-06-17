Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Kevin Hilman <khilman@baylibre.com>, 
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <m2ziqnr3d9.fsf@baylibre.com>
Cc: linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org,
 carlo@endlessm.com, victor.wan@amlogic.com, jerry.cao@amlogic.com,
 xing.xu@amlogic.com
References: <1465518467-23939-1-git-send-email-mturquette@baylibre.com>
 <m2ziqnr3d9.fsf@baylibre.com>
Message-ID: <20160617044856.27203.7659@quark.deferred.io>
Subject: Re: [PATCH 00/10] meson8b clock driver rewrite/cleanup
Date: Thu, 16 Jun 2016 21:48:56 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Kevin Hilman (2016-06-14 12:12:50)
> Michael Turquette <mturquette@baylibre.com> writes:
> =

> > This series came about while writing the clock driver for the AmLogic
> > GXBB clock controller. GXBB shares much of the same clock controller IP
> > as the Meson8b clock controller and the source for the drivers is very
> > similar. However, I wanted the GXBB driver to actually be a real
> > platform_driver, and not an early initcall, which led to the same
> > changes in the Meson8b driver. From there a lot of other changes came
> > about.
> >
> > This series improves documentation, refactors statically initialized
> > data, removes unnecessary registration functions and converts the
> > meson8b clock controller code into a proper platform_driver. It also
> > changes up the Kconfig bits to prepare for the gxbb clock controller.
> > The diffstat is -190, which is nice as well.
> >
> > As a consequence of the shift to platform_driver, all of clocks are
> > registered at module_init time. If any are needed very early during boot
> > then the OF_CLK_DECLARE stuff can be added back in, but I doubt it is
> > necessary.
> >
> > Additionally this series makes use of some of the nice clk_hw helper
> > introduced by Stephen, especially clk_hw_onecell_data.
> =

> Not sure if it qualifies as much of a clock test, but I at least boot
> tested this on meson8b-odroidc1 and nothing exploded, and the
> clk_summary looks sane:
> =

> / # cat /debug/clk/clk_summary
>    clock                         enable_cnt  prepare_cnt        rate   ac=
curacy   phase
>    ----------------------------------------------------------------------=
------------------
>     xtal                                     0            0    24000000  =
 0 0
>        sys_pll                               0            0  1200000000  =
 0 0
>           cpu_clk                            0            0  1200000000  =
 0 0
>        vid_pll                               0            0   732000000  =
 0 0
>        fixed_pll                             0            0  2550000000  =
 0 0
>           fclk_div7                          0            0   364285714  =
 0 0
>           fclk_div5                          0            0   510000000  =
 0 0
>           fclk_div4                          0            0   637500000  =
 0 0
>              mpeg_clk_sel                    0            0   637500000  =
 0 0
>                 mpeg_clk_div                 0            0   159375000  =
 0 0
>                    clk81                     0            0   159375000  =
 0 0
>           fclk_div3                          0            0   850000000  =
 0 0
>           fclk_div2                          0            0  1275000000  =
 0 0

Thanks Kevin. I'll take that as a Tested-by.

Regards,
Mike

> =

> Kevin
