Return-Path: <maxime.ripard@free-electrons.com>
Date: Thu, 26 Jan 2017 11:14:05 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH 06/11] clk: sunxi-ng: Add A80 USB CCU
Message-ID: <20170126101405.npxzp2bmto5oeyex@lukather>
References: <20170124023230.3990-1-wens@csie.org>
 <20170124023230.3990-7-wens@csie.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dzto6hprgehagboz"
In-Reply-To: <20170124023230.3990-7-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>


--dzto6hprgehagboz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Jan 24, 2017 at 10:32:25AM +0800, Chen-Yu Tsai wrote:
> Add support for the USB clock controls found on the A80.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---
>  .../devicetree/bindings/clock/sun9i-usb.txt        |  24 ++++
>  drivers/clk/sunxi-ng/Makefile                      |   1 +
>  drivers/clk/sunxi-ng/ccu-sun9i-a80-usb.c           | 144 +++++++++++++++=
++++++
>  drivers/clk/sunxi-ng/ccu-sun9i-a80-usb.h           |  25 ++++
>  include/dt-bindings/clock/sun9i-a80-usb.h          |  59 +++++++++
>  include/dt-bindings/reset/sun9i-a80-usb.h          |  56 ++++++++
>  6 files changed, 309 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/sun9i-usb.txt
>  create mode 100644 drivers/clk/sunxi-ng/ccu-sun9i-a80-usb.c
>  create mode 100644 drivers/clk/sunxi-ng/ccu-sun9i-a80-usb.h
>  create mode 100644 include/dt-bindings/clock/sun9i-a80-usb.h
>  create mode 100644 include/dt-bindings/reset/sun9i-a80-usb.h
>=20
> diff --git a/Documentation/devicetree/bindings/clock/sun9i-usb.txt b/Docu=
mentation/devicetree/bindings/clock/sun9i-usb.txt
> new file mode 100644
> index 000000000000..c2d38626eaaa
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/sun9i-usb.txt
> @@ -0,0 +1,24 @@
> +Allwinner A80 USB Clock Control Binding
> +------------------------------------
> +
> +Required properties :
> +- compatible: must contain one of the following compatibles:
> +		- "allwinner,sun9i-a80-usb-clocks"
> +
> +- reg: Must contain the registers base address and length
> +- clocks: phandle to the clocks feeding the USB subsystem. Two are neede=
d:
> +  - "bus": the bus clock for the whole USB subsystem
> +  - "hosc": the high frequency oscillator (usually at 24MHz)
> +- clock-names: Must contain the clock names described just above
> +- #clock-cells : must contain 1
> +- #reset-cells : must contain 1
> +
> +Example:
> +usb_clocks: clock@00a08000 {
> +	compatible =3D "allwinner,sun9i-a80-usb-clks";
> +	reg =3D <0x00a08000 0x8>;
> +	clocks =3D <&ccu CLK_BUS_USB>, <&osc24M>;
> +	clock-names =3D "bus", "hosc";
> +	#clock-cells =3D <1>;
> +	#reset-cells =3D <1>;
> +};
> diff --git a/drivers/clk/sunxi-ng/Makefile b/drivers/clk/sunxi-ng/Makefile
> index 126bb7c1c3f7..8f37ef7fb67d 100644
> --- a/drivers/clk/sunxi-ng/Makefile
> +++ b/drivers/clk/sunxi-ng/Makefile
> @@ -26,3 +26,4 @@ obj-$(CONFIG_SUN8I_A33_CCU)	+=3D ccu-sun8i-a33.o
>  obj-$(CONFIG_SUN8I_H3_CCU)	+=3D ccu-sun8i-h3.o
>  obj-$(CONFIG_SUN8I_V3S_CCU)	+=3D ccu-sun8i-v3s.o
>  obj-$(CONFIG_SUN9I_A80_CCU)	+=3D ccu-sun9i-a80.o
> +obj-$(CONFIG_SUN9I_A80_CCU)	+=3D ccu-sun9i-a80-usb.o
> diff --git a/drivers/clk/sunxi-ng/ccu-sun9i-a80-usb.c b/drivers/clk/sunxi=
-ng/ccu-sun9i-a80-usb.c
> new file mode 100644
> index 000000000000..1d76f24f7df3
> --- /dev/null
> +++ b/drivers/clk/sunxi-ng/ccu-sun9i-a80-usb.c
> @@ -0,0 +1,144 @@
> +/*
> + * Copyright (c) 2016 Chen-Yu Tsai. All rights reserved.
> + *
> + * This software is licensed under the terms of the GNU General Public
> + * License version 2, as published by the Free Software Foundation, and
> + * may be copied, distributed, and modified under those terms.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/clk-provider.h>
> +#include <linux/of_address.h>
> +#include <linux/platform_device.h>
> +
> +#include "ccu_common.h"
> +#include "ccu_gate.h"
> +#include "ccu_reset.h"
> +
> +#include "ccu-sun9i-a80-usb.h"
> +
> +static SUNXI_CCU_GATE(bus_hci0_clk, "bus-hci0", "bus-usb", 0x0, BIT(1), =
0);
> +static SUNXI_CCU_GATE(usb_ohci0_clk, "usb-ohci0", "osc24M", 0x0, BIT(2),=
 0);
> +static SUNXI_CCU_GATE(bus_hci1_clk, "bus-hci1", "bus-usb", 0x0, BIT(3), =
0);
> +static SUNXI_CCU_GATE(bus_hci2_clk, "bus-hci2", "bus-usb", 0x0, BIT(5), =
0);
> +static SUNXI_CCU_GATE(usb_ohci2_clk, "usb-ohci2", "osc24M", 0x0, BIT(6),=
 0);

In the current !sunxi-ng driver, there's a clock at offset 4, did you
forget it?

Thanks,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--dzto6hprgehagboz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYicvpAAoJEBx+YmzsjxAgWdoP/Rz8OmNJGbC5G/rP4TAZuUPQ
Xa5dlPJ9X/wr0wxj6LdNIn/JizuCOmgYSmcheXaIfAGZBUR2KhVcAH/VQpYsa6h7
dLa4XS5Ay3uZcCaH2/e+3qY1Lim11Cgr9FbiVWyD9Fco6/kY3sMBqzxzYm5ASi+U
63VydG3YuUepFXE7XXF3RLYUMaeIMuxo+3KL0iM0lH54N7YK8e+w+A7yRdQWWy9/
WkJj/8pgY0heZRNnD0c6Al1gNtSrRBnUDKuAFkqm9IN8hsbJmgYYI5zpfH9SDFa2
t4++/DXDBB9bwX2il5z5wb4hUq0aWTnXX/T0mUc4gxTVt6/xuWHeuFvrzhlJl46A
yqzjdh4bIEKwpft0mlLGiuPz0O7K5Lbh2iH2ClGpWvzgmB30Rrvxg6vrOBf8gxfg
CWPZ4QXDtNcuEVPKUI0er76nexwbNfvUVGY9o/fl+GYyb3VWe98nrBKPWoFcqurl
HIZzzd1ryoO+uFIp3J/ykpLdUzXmeFhW90m/hzvg4L+3xamD+Et2XfNFW+ZDt1Ef
L+B76xNaYQH9S5egrMveq6Z8VPbkTcS8gYTEbiJO4N5eOpySMHv8WPWSF/UP8NtE
TVim+N330LxScX2R2YNEzIB9FWSyUcmRJZvbP8+JNXMwY9TDabXtbH4sywuL7iVq
+OvWQU06VRUEZOxUkGRx
=ziQo
-----END PGP SIGNATURE-----

--dzto6hprgehagboz--
