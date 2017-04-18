Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-io0-f174.google.com ([209.85.223.174]:34446 "EHLO
        mail-io0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752847AbdDRN7l (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 18 Apr 2017 09:59:41 -0400
MIME-Version: 1.0
In-Reply-To: <20170416165709.27449-2-marek.vasut+renesas@gmail.com>
References: <20170416165709.27449-1-marek.vasut+renesas@gmail.com> <20170416165709.27449-2-marek.vasut+renesas@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 18 Apr 2017 15:59:38 +0200
Message-ID: <CAMuHMdXFUkLypckz2n27or268xiMXCpX+YB3+-beTt92EFA=rQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: r8a7791: Add GyroADC bindings
To: Marek Vasut <marek.vasut@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Content-Type: text/plain; charset=UTF-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Marek,

On Sun, Apr 16, 2017 at 6:57 PM, Marek Vasut <marek.vasut@gmail.com> wrote:
> Add bindings for the GyroADC block and it's associated clock.

bindings??

> --- a/arch/arm/boot/dts/r8a7791.dtsi
> +++ b/arch/arm/boot/dts/r8a7791.dtsi
> @@ -776,6 +776,15 @@
>                 status = "disabled";
>         };
>
> +       adc: adc@e6e54000 {
> +               compatible = "renesas,r8a7791-gyroadc", "renesas,rcar-gyroadc";
> +               reg = <0 0xe6e54000 0 64>;
> +               clocks = <&mstp9_clks R8A7791_CLK_GYROADC>, <&adc_clk>;
> +               clock-names = "fck", "if";
> +               power-domains = <&sysc R8A7791_PD_ALWAYS_ON>;
> +               status = "disabled";
> +       };
> +
>         scif2: serial@e6e58000 {
>                 compatible = "renesas,scif-r8a7791", "renesas,rcar-gen2-scif",
>                              "renesas,scif";
> @@ -1133,6 +1142,13 @@
>                         clock-frequency = <0>;
>                 };
>
> +               /* GyroADC clock */
> +               adc_clk: adc_clk {
> +                       compatible = "fixed-clock";
> +                       #clock-cells = <0>;
> +                       clock-frequency = <65000000>;
> +               };

Why do you have to add a clock?
I think you should just refer to the on-SoC peripheral clock: &cp_clk.

> +
>                 /* Special CPG clocks */
>                 cpg_clocks: cpg_clocks@e6150000 {
>                         compatible = "renesas,r8a7791-cpg-clocks",
> @@ -1432,6 +1448,7 @@
>                                  <&hp_clk>, <&hp_clk>;

Missing addition of the parent clock for the newly added module clock.
Perhaps this should be the peripheral clock (<&cp_clk>)?

Oops, that means there's no need to have two clock inputs in the adc device
node, and thus we screwed up when reviewing the GyroADC bindings :-(

>                         #clock-cells = <1>;
>                         clock-indices = <
> +                               R8A7791_CLK_GYROADC
>                                 R8A7791_CLK_GPIO7 R8A7791_CLK_GPIO6 R8A7791_CLK_GPIO5 R8A7791_CLK_GPIO4
>                                 R8A7791_CLK_GPIO3 R8A7791_CLK_GPIO2 R8A7791_CLK_GPIO1 R8A7791_CLK_GPIO0
>                                 R8A7791_CLK_RCAN1 R8A7791_CLK_RCAN0 R8A7791_CLK_QSPI_MOD R8A7791_CLK_I2C5
> @@ -1439,6 +1456,7 @@
>                                 R8A7791_CLK_I2C1 R8A7791_CLK_I2C0
>                         >;
>                         clock-output-names =
> +                               "gyroadc",
>                                 "gpio7", "gpio6", "gpio5", "gpio4", "gpio3", "gpio2", "gpio1", "gpio0",
>                                 "rcan1", "rcan0", "qspi_mod", "i2c5", "i2c6", "i2c4", "i2c3", "i2c2",
>                                 "i2c1", "i2c0";

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
