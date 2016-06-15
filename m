Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Kevin Hilman <khilman@baylibre.com>, 
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <m2d1njsikh.fsf@baylibre.com>
Cc: linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org,
 carlo@endlessm.com, victor.wan@amlogic.com, jerry.cao@amlogic.com,
 xing.xu@amlogic.com
References: <1465518774-26924-1-git-send-email-mturquette@baylibre.com>
 <m2d1njsikh.fsf@baylibre.com>
Message-ID: <20160615014103.5467.86678@quark.deferred.io>
Subject: Re: [PATCH 0/7] Add support for AmLogic GXBB clock controller
Date: Tue, 14 Jun 2016 18:41:03 -0700
List-ID: <linux-clk.vger.kernel.org>

Hi Kevin,

Quoting Kevin Hilman (2016-06-14 11:59:10)
> Hi Mike,
> =

> Michael Turquette <mturquette@baylibre.com> writes:
> =

> > This series is based on the AmLogic Meson8b rewrite/cleanup[0]. The
> > AmLogic GXBB is an ARMv8-based SoC, fed by a 24MHZ xtal, and it provides
> > several PLLs, muxes dividers and gates to drive CPUs and peripherals.
> >
> > While based on the Meson8b clock controller driver, this series adds
> > supports for Multi-phase Locked Loops (mpll) and support for PLLs with
> > fractional rates.
> >
> > This series introduces the clock controller driver for the gxbb,
> > including the DT binding description and accompanying change in the gxbb
> > dtsi. Only three clocks are exposed via the headers in the dt-bindings
> > include-chroot. More can be added later, but since these values
> > represent an ABI I wanted to start small. I'm not sure about the names
> > for the gate clocks, so I especially tried to avoid putting those in the
> > binding (with the exception of the Ethernet gate, which Kevin has needed
> > for a while).
> =

> I tested this on top of my integration branch for v4.7-rc[1] along with
> the ethernet driver.
> =

> First, I modified the ethernet node to use the new clock[2], and then I
> added the ethernet driver to the build as modules[3] since
> unloading/reloading the module is testing the clock API[3].
> =

> Then, I tested unloading/reloading the dwmac-meson module on
> meson-gxbb-p200 and meson-gxbb-odroidc2 and found that the system hung
> on module reload.
> =

> As you suggested off-list, this might be because it's walking up the
> tree and disabling clk81, which would cause such a problem, so I added
> CLK_IS_CRITICAL to clk81, and that got things working just fine.

Great! I'm glad that fixed the problem.

> =

> With that change, I can now unload/reload the ethernet module (which is
> prepare/enable'ing and unprepare/disable'ing the clocks.
> =

> Tested-by: Kevin Hilman <khilman@baylibre.com>

Cool, thanks for testing. I'll fold your change to set the
CLK_IS_CRITICAL flag in below on v2, which I'll push to the list early
next week after I return from travel.

Regards,
Mike

> =

> Kevin
> =

> [1] https://git.kernel.org/cgit/linux/kernel/git/khilman/linux-amlogic.gi=
t/log/?h=3Dv4.7/integ
> [2]
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi b/arch/arm64/boo=
t/dts/amlogic/meson-gxbb.dtsi
> index e3210eb89bc8..834258a36cfb 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
> @@ -45,6 +45,7 @@
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/gpio/meson-gxbb-gpio.h>
>  #include <dt-bindings/reset/amlogic,meson-gxbb-reset.h>
> +#include <dt-bindings/clock/gxbb-clkc.h>
>  =

>  / {
>         compatible =3D "amlogic,meson-gxbb";
> @@ -332,7 +333,7 @@
>                                0x0 0xc8834540 0x0 0x4>;
>                         interrupts =3D <0 8 1>;
>                         interrupt-names =3D "macirq";
> -                       clocks =3D <&xtal>;
> +                       clocks =3D <&clkc CLKID_ETH>;
>                         clock-names =3D "stmmaceth";
>                         phy-mode =3D "rgmii";
>                         status =3D "disabled";
> =

> [3]
> CONFIG_STMMAC_ETH=3Dm
> CONFIG_PHYLIB=3Dm
> CONFIG_MICREL_PHY=3Dm
> CONFIG_REALTEK_PHY=3Dm
> =

> [4]
> diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
> index 26c78a2a614d..007b7157cf4b 100644
> --- a/drivers/clk/meson/gxbb.c
> +++ b/drivers/clk/meson/gxbb.c
> @@ -558,7 +558,7 @@ static struct clk_gate gxbb_clk81 =3D {
>                 .ops =3D &clk_gate_ops,
>                 .parent_names =3D (const char *[]){ "mpeg_clk_div" },
>                 .num_parents =3D 1,
> -               .flags =3D (CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED),
> +               .flags =3D (CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED | CLK=
_IS_CRITICAL),
>         },
>  };
