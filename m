Return-Path: <maxime.ripard@bootlin.com>
Date: Thu, 27 Sep 2018 19:17:47 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Icenowy Zheng <icenowy@aosc.io>,
	Jernej Skrabec <jernej.skrabec@siol.net>,
	Vasily Khoruzhick <anarsoul@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will.deacon@arm.com>, David Airlie <airlied@linux.ie>,
	dri-devel@lists.freedesktop.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	Michael Trimarchi <michael@amarulasolutions.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH 12/12] arm64: dts: allwinner: bananapi-m64: Bananapi
 S070WV20-CT16 DSI panel
Message-ID: <20180927171747.wqdt5eiwktyyoefz@flea>
References: <20180927114850.24565-1-jagan@amarulasolutions.com>
 <20180927114850.24565-13-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20180927114850.24565-13-jagan@amarulasolutions.com>
List-ID: <linux-clk.vger.kernel.org>

On Thu, Sep 27, 2018 at 05:18:50PM +0530, Jagan Teki wrote:
> This patch add support for Bananapi S070WV20-CT16 DSI panel to
> BPI-M64 board.
>=20
> DSI panel connected via board DSI port with,
> - DC1SW as AVDD supply
> - DCDC1 as DVDD supply
> - PD6 gpio for reset pin
> - PD5 gpio for backlight enable pin
> - PD7 gpio for backlight vdd supply
>=20
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
>  .../dts/allwinner/sun50i-a64-bananapi-m64.dts | 42 +++++++++++++++++++
>  1 file changed, 42 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dts b/=
arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dts
> index ef1c90401bb2..c0be949be68d 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dts
> @@ -45,6 +45,7 @@
>  #include "sun50i-a64.dtsi"
> =20
>  #include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/pwm/pwm.h>
> =20
>  / {
>  	model =3D "BananaPi-M64";
> @@ -56,6 +57,24 @@
>  		serial1 =3D &uart1;
>  	};
> =20
> +	vdd_bl: regulator@0 {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "bl-3v3";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		gpio =3D <&pio 3 7 GPIO_ACTIVE_HIGH>; /* PD7 */
> +		enable-active-high;
> +	};
> +
> +	backlight_dsi: backlight-dsi {
> +		compatible =3D "pwm-backlight";
> +		pwms =3D <&r_pwm 0 50000 PWM_POLARITY_INVERTED>;
> +		brightness-levels =3D <0 10 20 30 40 50 60 70 80 90 100>;

The brightness levels should be increasing linearly from a user point
of view. Usually, with a PWM backlight, a quadratic rule works much
better.

MMaxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
