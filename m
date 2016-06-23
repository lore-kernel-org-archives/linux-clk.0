Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: linux-clk@vger.kernel.org
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <1465518467-23939-1-git-send-email-mturquette@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, khilman@baylibre.com, carlo@endlessm.com,
 victor.wan@amlogic.com, jerry.cao@amlogic.com, xing.xu@amlogic.com
References: <1465518467-23939-1-git-send-email-mturquette@baylibre.com>
Message-ID: <146664765420.35033.6148572558563627206@resonance>
Subject: Re: [PATCH 00/10] meson8b clock driver rewrite/cleanup
Date: Wed, 22 Jun 2016 19:07:34 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Michael Turquette (2016-06-09 17:27:37)
> This series came about while writing the clock driver for the AmLogic
> GXBB clock controller. GXBB shares much of the same clock controller IP
> as the Meson8b clock controller and the source for the drivers is very
> similar. However, I wanted the GXBB driver to actually be a real
> platform_driver, and not an early initcall, which led to the same
> changes in the Meson8b driver. From there a lot of other changes came
> about.

Applied to clk-next.

Regards,
Mike

> =

> This series improves documentation, refactors statically initialized
> data, removes unnecessary registration functions and converts the
> meson8b clock controller code into a proper platform_driver. It also
> changes up the Kconfig bits to prepare for the gxbb clock controller.
> The diffstat is -190, which is nice as well.
> =

> As a consequence of the shift to platform_driver, all of clocks are
> registered at module_init time. If any are needed very early during boot
> then the OF_CLK_DECLARE stuff can be added back in, but I doubt it is
> necessary.
> =

> Additionally this series makes use of some of the nice clk_hw helper
> introduced by Stephen, especially clk_hw_onecell_data.
> =

> Michael Turquette (10):
>   clk: meson8b: rectify reg offsets with datasheet
>   clk: meson8b: clean up fixed rate clocks
>   clk: meson8b: clean up pll clocks
>   clk: meson8b: clean up fixed factor clocks
>   clk: meson8b: clean up cpu clocks
>   clk: meson8b: remove mali clk
>   clk: meson8b: clean up composite clocks
>   clk: meson8b: convert to platform_driver
>   arm: meson: explicitly select clk drivers
>   clk: meson: only build selected platforms
> =

>  arch/arm/mach-meson/Kconfig              |   3 +
>  drivers/clk/Kconfig                      |   1 +
>  drivers/clk/Makefile                     |   2 +-
>  drivers/clk/meson/Kconfig                |  12 +
>  drivers/clk/meson/Makefile               |   4 +-
>  drivers/clk/meson/clk-cpu.c              |  73 +-----
>  drivers/clk/meson/clk-pll.c              |  72 +----
>  drivers/clk/meson/clkc.c                 | 249 ------------------
>  drivers/clk/meson/clkc.h                 | 150 ++---------
>  drivers/clk/meson/meson8b-clkc.c         | 436 +++++++++++++++++++++++++=
------
>  include/dt-bindings/clock/meson8b-clkc.h |   4 +-
>  11 files changed, 408 insertions(+), 598 deletions(-)
>  create mode 100644 drivers/clk/meson/Kconfig
>  delete mode 100644 drivers/clk/meson/clkc.c
> =

> -- =

> 2.1.4
>=20
