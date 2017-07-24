Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.csie.ntu.edu.tw ([140.112.30.61]:53606 "EHLO
        smtp.csie.ntu.edu.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751086AbdGXEJj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 24 Jul 2017 00:09:39 -0400
MIME-Version: 1.0
In-Reply-To: <20170723102749.17323-10-icenowy@aosc.io>
References: <20170723102749.17323-1-icenowy@aosc.io> <20170723102749.17323-10-icenowy@aosc.io>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 24 Jul 2017 12:09:14 +0800
Message-ID: <CAGb2v65B10VuG6YDKuFmx-7Z5R-PRLiN51g484MA_959y=Le5Q@mail.gmail.com>
Subject: Re: [linux-sunxi] [PATCH 09/10] ARM: sun8i: h2+: add SY8113B
 regulator used by Orange Pi Zero board
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Maxime Ripard <maxime.ripard@free-electrons.com>,
        Chen-Yu Tsai <wens@csie.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:THERMAL" <linux-pm@vger.kernel.org>,
        linux-sunxi <linux-sunxi@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Sun, Jul 23, 2017 at 6:27 PM, Icenowy Zheng <icenowy@aosc.io> wrote:
> Orange Pi Zero board has a SY8113B regulator, which is controlled via
> GPIO and capable of outputing 1.1V when the PL6 GPIO is set to output 0
> or 1.3V when the PL6 GPIO is set to input or output 1, and the output is
> the power supply of the ARM cores in H2+ SoC.
>
> Add the device tree node of this regulator and set the cpu's cpu-supply
> property to it.
>
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> ---
>  arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>
> diff --git a/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts b/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts
> index 6713d0f2b3f4..28b4433bd7f7 100644
> --- a/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts
> +++ b/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts
> @@ -94,6 +94,27 @@
>                 reset-gpios = <&r_pio 0 7 GPIO_ACTIVE_LOW>;
>                 post-power-on-delay-ms = <200>;
>         };
> +
> +       reg_sy8113b: gpio-regulator {
> +               compatible = "regulator-gpio";
> +

No need for the newline.

> +               regulator-name = "vdd-cpux";
> +               regulator-type = "voltage";
> +               regulator-boot-on;
> +               regulator-always-on;
> +               regulator-min-microvolt = <1100000>;
> +               regulator-max-microvolt = <1300000>;
> +               regulator-ramp-delay = <50>; /* 4ms */

You should also add "enable-active-high". The driver might not
honor the GPIO_ACTIVE_HIGH flag. AFAIK this was a problem with
the old GPIO API.

ChenYu

> +
> +               gpios = <&r_pio 0 6 GPIO_ACTIVE_HIGH>; /* PL6 */
> +               gpios-states = <0x1>;
> +               states = <1100000 0x0
> +                         1300000 0x1>;
> +       };
> +};
> +
> +&cpu0 {
> +       cpu-supply = <&reg_sy8113b>;
>  };
>
>  &ehci0 {
> --
> 2.13.0
>
> --
> You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe@googlegroups.com.
> For more options, visit https://groups.google.com/d/optout.
