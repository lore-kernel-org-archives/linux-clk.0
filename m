Return-Path: <wens@csie.org>
MIME-Version: 1.0
In-Reply-To: <1430565879-28113-8-git-send-email-maxime.ripard@free-electrons.com>
References: <1430565879-28113-1-git-send-email-maxime.ripard@free-electrons.com>
 <1430565879-28113-8-git-send-email-maxime.ripard@free-electrons.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Thu, 14 May 2015 20:43:00 +0800
Message-ID: <CAGb2v67bmTpSE9amrMK+yNnZtSpd_M7EZOrMrC+S=t0HnoNsgw@mail.gmail.com>
Subject: Re: [PATCH 7/8] ARM: sunxi: Add codec clock support
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Mike Turquette <mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>,
	Emilio Lopez <emilio@elopez.com.ar>, Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Sat, May 2, 2015 at 7:24 PM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:
> From: Emilio L=C3=B3pez <emilio@elopez.com.ar>
>
> This commit adds the codec clock definition to the sun4i, sun5i and
> sun7i device trees. The codec clock is used in the analog codec block.
>
> Signed-off-by: Emilio L=C3=B3pez <emilio@elopez.com.ar>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>

> ---
>  arch/arm/boot/dts/sun4i-a10.dtsi | 9 +++++++++
>  arch/arm/boot/dts/sun5i.dtsi     | 9 +++++++++
>  arch/arm/boot/dts/sun7i-a20.dtsi | 9 +++++++++
>  3 files changed, 27 insertions(+)
>
> diff --git a/arch/arm/boot/dts/sun4i-a10.dtsi b/arch/arm/boot/dts/sun4i-a=
10.dtsi
> index 2ed3a0b43131..f4dead8cde2c 100644
> --- a/arch/arm/boot/dts/sun4i-a10.dtsi
> +++ b/arch/arm/boot/dts/sun4i-a10.dtsi
> @@ -50,6 +50,7 @@
>
>  #include <dt-bindings/thermal/thermal.h>
>
> +#include <dt-bindings/clock/sun4i-a10-pll2.h>
>  #include <dt-bindings/dma/sun4i-a10.h>
>  #include <dt-bindings/pinctrl/sun4i-a10.h>
>
> @@ -457,6 +458,14 @@
>                         clocks =3D <&osc24M>, <&pll6 1>, <&pll5 1>;
>                         clock-output-names =3D "spi3";
>                 };
> +
> +               codec_clk: clk@01c20140 {
> +                       #clock-cells =3D <0>;
> +                       compatible =3D "allwinner,sun4i-a10-codec-clk";
> +                       reg =3D <0x01c20140 0x4>;
> +                       clocks =3D <&pll2 SUN4I_A10_PLL2_1X>;
> +                       clock-output-names =3D "codec";
> +               };
>         };
>
>         /*
> diff --git a/arch/arm/boot/dts/sun5i.dtsi b/arch/arm/boot/dts/sun5i.dtsi
> index b291c165966f..38cb77c378ec 100644
> --- a/arch/arm/boot/dts/sun5i.dtsi
> +++ b/arch/arm/boot/dts/sun5i.dtsi
> @@ -49,6 +49,7 @@
>
>  #include "skeleton.dtsi"
>
> +#include <dt-bindings/clock/sun4i-a10-pll2.h>
>  #include <dt-bindings/dma/sun4i-a10.h>
>  #include <dt-bindings/pinctrl/sun4i-a10.h>
>
> @@ -298,6 +299,14 @@
>                         clock-output-names =3D "usb_ohci0", "usb_phy";
>                 };
>
> +               codec_clk: clk@01c20140 {
> +                       #clock-cells =3D <0>;
> +                       compatible =3D "allwinner,sun4i-a10-codec-clk";
> +                       reg =3D <0x01c20140 0x4>;
> +                       clocks =3D <&pll2 SUN4I_A10_PLL2_1X>;
> +                       clock-output-names =3D "codec";
> +               };
> +
>                 mbus_clk: clk@01c2015c {
>                         #clock-cells =3D <0>;
>                         compatible =3D "allwinner,sun5i-a13-mbus-clk";
> diff --git a/arch/arm/boot/dts/sun7i-a20.dtsi b/arch/arm/boot/dts/sun7i-a=
20.dtsi
> index 7c850dc1b197..8a5418a0e795 100644
> --- a/arch/arm/boot/dts/sun7i-a20.dtsi
> +++ b/arch/arm/boot/dts/sun7i-a20.dtsi
> @@ -52,6 +52,7 @@
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/thermal/thermal.h>
>
> +#include <dt-bindings/clock/sun4i-a10-pll2.h>
>  #include <dt-bindings/dma/sun4i-a10.h>
>  #include <dt-bindings/pinctrl/sun4i-a10.h>
>
> @@ -472,6 +473,14 @@
>                         clock-output-names =3D "spi3";
>                 };
>
> +               codec_clk: clk@01c20140 {
> +                       #clock-cells =3D <0>;
> +                       compatible =3D "allwinner,sun4i-a10-codec-clk";
> +                       reg =3D <0x01c20140 0x4>;
> +                       clocks =3D <&pll2 SUN4I_A10_PLL2_1X>;
> +                       clock-output-names =3D "codec";
> +               };
> +
>                 mbus_clk: clk@01c2015c {
>                         #clock-cells =3D <0>;
>                         compatible =3D "allwinner,sun5i-a13-mbus-clk";
> --
> 2.3.6
>
