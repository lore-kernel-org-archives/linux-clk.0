Return-Path: <maxime.ripard@free-electrons.com>
Date: Thu, 3 Nov 2016 09:15:16 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: =?iso-8859-1?Q?Andr=E9?= Przywara <andre.przywara@arm.com>
Cc: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, Chen-Yu Tsai <wens@csie.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH v6 4/4] arm64: dts: add Pine64 support
Message-ID: <20161103081516.gvf4mdudarxtyxfj@lukather>
References: <cover.6088b64645bde9b847d2fede5ecb15a0e204a9dd.1478123413.git-series.maxime.ripard@free-electrons.com>
 <45ddd059d22233c3e07852f4f71ee7ad7ed48542.1478123413.git-series.maxime.ripard@free-electrons.com>
 <83b8ff39-91f0-4e5c-61a5-e21f31c909ff@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7k7g43xkcnipynkz"
In-Reply-To: <83b8ff39-91f0-4e5c-61a5-e21f31c909ff@arm.com>
List-ID: <linux-clk.vger.kernel.org>


--7k7g43xkcnipynkz
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 02, 2016 at 10:05:09PM +0000, Andr=E9 Przywara wrote:
> On 02/11/16 21:50, Maxime Ripard wrote:
> > From: Andre Przywara <andre.przywara@arm.com>
> >=20
> > The Pine64 is a cost-efficient development board based on the
> > Allwinner A64 SoC.
> > There are three models: the basic version with Fast Ethernet and
> > 512 MB of DRAM (Pine64) and two Pine64+ versions, which both
> > feature Gigabit Ethernet and additional connectors for touchscreens
> > and a camera. Or as my son put it: "Those are smaller and these are
> > missing." ;-)
> > The two Pine64+ models just differ in the amount of DRAM
> > (1GB vs. 2GB). Since U-Boot will figure out the right size for us and
> > patches the DT accordingly we just need to provide one DT for the
> > Pine64+.
> >=20
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > [Maxime: Removed the common DTSI and include directly the pine64 DTS]
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> > ---
> >  arch/arm64/boot/dts/Makefile                             |  1 +-
> >  arch/arm64/boot/dts/allwinner/Makefile                   |  5 +-
> >  arch/arm64/boot/dts/allwinner/sun50i-a64-pine64-plus.dts | 50 ++++++-
> >  arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts      | 74 ++++++++=
+-
> >  4 files changed, 130 insertions(+), 0 deletions(-)
> >  create mode 100644 arch/arm64/boot/dts/allwinner/Makefile
> >  create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-a64-pine64-plu=
s.dts
> >  create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
> >=20
> > diff --git a/arch/arm64/boot/dts/Makefile b/arch/arm64/boot/dts/Makefile
> > index 6684f97c2722..080232b0270e 100644
> > --- a/arch/arm64/boot/dts/Makefile
> > +++ b/arch/arm64/boot/dts/Makefile
> > @@ -1,4 +1,5 @@
> >  dts-dirs +=3D al
> > +dts-dirs +=3D allwinner
> >  dts-dirs +=3D altera
> >  dts-dirs +=3D amd
> >  dts-dirs +=3D amlogic
> > diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/d=
ts/allwinner/Makefile
> > new file mode 100644
> > index 000000000000..1e29a5ae8282
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/allwinner/Makefile
> > @@ -0,0 +1,5 @@
> > +dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-a64-pine64-plus.dtb sun50i-a64-pi=
ne64.dtb
> > +
> > +always		:=3D $(dtb-y)
> > +subdir-y	:=3D $(dts-dirs)
> > +clean-files	:=3D *.dtb
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64-plus.dts b=
/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64-plus.dts
> > new file mode 100644
> > index 000000000000..790d14daaa6a
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64-plus.dts
> > @@ -0,0 +1,50 @@
> > +/*
> > + * Copyright (c) 2016 ARM Ltd.
> > + *
> > + * This file is dual-licensed: you can use it either under the terms
> > + * of the GPL or the X11 license, at your option. Note that this dual
> > + * licensing only applies to this file, and not this project as a
> > + * whole.
> > + *
> > + *  a) This library is free software; you can redistribute it and/or
> > + *     modify it under the terms of the GNU General Public License as
> > + *     published by the Free Software Foundation; either version 2 of =
the
> > + *     License, or (at your option) any later version.
> > + *
> > + *     This library is distributed in the hope that it will be useful,
> > + *     but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > + *     GNU General Public License for more details.
> > + *
> > + * Or, alternatively,
> > + *
> > + *  b) Permission is hereby granted, free of charge, to any person
> > + *     obtaining a copy of this software and associated documentation
> > + *     files (the "Software"), to deal in the Software without
> > + *     restriction, including without limitation the rights to use,
> > + *     copy, modify, merge, publish, distribute, sublicense, and/or
> > + *     sell copies of the Software, and to permit persons to whom the
> > + *     Software is furnished to do so, subject to the following
> > + *     conditions:
> > + *
> > + *     The above copyright notice and this permission notice shall be
> > + *     included in all copies or substantial portions of the Software.
> > + *
> > + *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> > + *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
> > + *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> > + *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
> > + *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
> > + *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> > + *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> > + *     OTHER DEALINGS IN THE SOFTWARE.
> > + */
> > +
> > +#include "sun50i-a64-pine64.dts"
> > +
> > +/ {
> > +	model =3D "Pine64+";
> > +	compatible =3D "pine64,pine64-plus", "allwinner,sun50i-a64";
> > +
> > +	/* TODO: Camera, Ethernet PHY, touchscreen, etc. */
> > +};
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts b/arch=
/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
> > new file mode 100644
> > index 000000000000..9f127b3d0e33
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
> > @@ -0,0 +1,74 @@
> > +/*
> > + * Copyright (c) 2016 ARM Ltd.
> > + *
> > + * This file is dual-licensed: you can use it either under the terms
> > + * of the GPL or the X11 license, at your option. Note that this dual
> > + * licensing only applies to this file, and not this project as a
> > + * whole.
> > + *
> > + *  a) This library is free software; you can redistribute it and/or
> > + *     modify it under the terms of the GNU General Public License as
> > + *     published by the Free Software Foundation; either version 2 of =
the
> > + *     License, or (at your option) any later version.
> > + *
> > + *     This library is distributed in the hope that it will be useful,
> > + *     but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > + *     GNU General Public License for more details.
> > + *
> > + * Or, alternatively,
> > + *
> > + *  b) Permission is hereby granted, free of charge, to any person
> > + *     obtaining a copy of this software and associated documentation
> > + *     files (the "Software"), to deal in the Software without
> > + *     restriction, including without limitation the rights to use,
> > + *     copy, modify, merge, publish, distribute, sublicense, and/or
> > + *     sell copies of the Software, and to permit persons to whom the
> > + *     Software is furnished to do so, subject to the following
> > + *     conditions:
> > + *
> > + *     The above copyright notice and this permission notice shall be
> > + *     included in all copies or substantial portions of the Software.
> > + *
> > + *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> > + *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
> > + *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> > + *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
> > + *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
> > + *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> > + *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> > + *     OTHER DEALINGS IN THE SOFTWARE.
> > + */
> > +
> > +/dts-v1/;
> > +
> > +#include "sun50i-a64.dtsi"
> > +
> > +/ {
> > +	model =3D "Pine64";
> > +	compatible =3D "pine64,pine64", "allwinner,sun50i-a64";
> > +
> > +	aliases {
> > +		serial0 =3D &uart0;
> > +	};
> > +
> > +	chosen {
> > +		stdout-path =3D "serial0:115200n8";
> > +	};
> > +};
> > +
> > +&uart0 {
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&uart0_pins_a>;
> > +	status =3D "okay";
> > +};
> > +
> > +&i2c1 {
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&i2c1_pins>;
> > +	status =3D "okay";
> > +};
> > +
> > +&i2c1_pins {
> > +	allwinner,pull =3D <SUN4I_PINCTRL_PULL_UP>;
>=20
> which should translate to:
> 	bias-pull-up;
> in the generic binding, right?

Fixed and applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--7k7g43xkcnipynkz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYGvITAAoJEBx+YmzsjxAgoMsP/iOF3AJV0r+9gYpebM8MnSxJ
wA2LdHwRyyxhKJ4HpKZV4xcN12+qrPRqzWUon+UK6EPyOo04Xru+hayn/nAGBLru
97cU3Kb5iQd/Xsh2YmcM6QkoybALS69quWptIRISIWr95I76Is5y7Q3I/2LvQcaE
8bGPKZNOy+ZrfhBSNMGZKGO0+zb3LNI+NSCceWyksBo2WnPx818ojEs46rr0v/hE
d6ke7Twjz9QYg3l2tBVcQpzy9P6xprY0NVvrg2PfFtjqqBRow3pEoRjCYeabrB7w
IOH1/wJySaCsuU+HgIxqKwU9Bd7wFSbIGQmeC/TVQOE471IxXneTj6qIboYmYE13
4PCg4Kiu48cO/mCC9HZxme6Y+LPk39cM3MjGKd4iGaGEb9KMmDgfMIy+XjHZECG9
IvO6uEDpcQk02mD3d7YWONDZkuZOG00Luy/46PRxXTwPyeK8l7a5YIzYlMiZBxeu
1LcAJd06Cde9EJNci1NUyPfZm/PtDP30Oqtr3Y+K07315lWxWji9KZF/99rW6nyA
pnH/hQotESXfpBASpZ8OqTsbqVvEQDAeDe2uqPC6qWU3U10NpTrEsjeJ04Oh4EDg
kE0jiqLo9DjgowPfkWbuzG+DYROw5BLOvoCQr5EEYAboNxXp+T9QfkEsa27MfuKH
8J3t316SNNdzfvFfZ9jc
=6naJ
-----END PGP SIGNATURE-----

--7k7g43xkcnipynkz--
