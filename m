Return-Path: <maxime.ripard@free-electrons.com>
Date: Mon, 29 Feb 2016 23:12:53 -0800
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Vishnu Patekar <vishnupatekar0510@gmail.com>
Cc: robh+dt@kernel.org, corbet@lwn.net, pawel.moll@arm.com,
	mark.rutland@arm.com, ijc+devicetree@hellion.org.uk,
	galak@codeaurora.org, linux@arm.linux.org.uk, emilio@elopez.com.ar,
	jenskuske@gmail.com, hdegoede@redhat.com, wens@csie.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com,
	linux-gpio@vger.kernel.org, linus.walleij@linaro.org,
	mturquette@baylibre.com, sboyd@codeaurora.org, patchesrdh@mveas.com,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 13/13] ARM: sunxi: Introduce MACH_SUN8I_A83T option
Message-ID: <20160301071253.GI8418@lukather>
References: <1456672738-4993-1-git-send-email-vishnupatekar0510@gmail.com>
 <1456672738-4993-14-git-send-email-vishnupatekar0510@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nEsDIrWrg+hrB7l1"
In-Reply-To: <1456672738-4993-14-git-send-email-vishnupatekar0510@gmail.com>
List-ID: <linux-clk.vger.kernel.org>


--nEsDIrWrg+hrB7l1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Feb 28, 2016 at 11:18:58PM +0800, Vishnu Patekar wrote:
> A83T has CPUS clock similar to A80's. currently, a80 cpus clock only
> compiled for A80. So, Introduce MACH_SUN8I_A83T to compile it for
> A83T as well.
>=20
> Signed-off-by: Vishnu Patekar <vishnupatekar0510@gmail.com>
> ---
>  arch/arm/mach-sunxi/Kconfig | 5 +++++
>  drivers/clk/sunxi/Makefile  | 3 +++
>  2 files changed, 8 insertions(+)
>=20
> diff --git a/arch/arm/mach-sunxi/Kconfig b/arch/arm/mach-sunxi/Kconfig
> index c124d65..424b76d 100644
> --- a/arch/arm/mach-sunxi/Kconfig
> +++ b/arch/arm/mach-sunxi/Kconfig
> @@ -41,6 +41,11 @@ config MACH_SUN8I
>  	select ARM_GIC
>  	select MFD_SUN6I_PRCM
> =20
> +config MACH_SUN8I_A83T
> +	bool "Allwinner A83T (sun8i) SoCs support"
> +	default ARCH_SUNXI
> +	select ARM_GIC
> +
>  config MACH_SUN9I
>  	bool "Allwinner (sun9i) SoCs support"
>  	default ARCH_SUNXI
> diff --git a/drivers/clk/sunxi/Makefile b/drivers/clk/sunxi/Makefile
> index 3fd7901..2aabfc4 100644
> --- a/drivers/clk/sunxi/Makefile
> +++ b/drivers/clk/sunxi/Makefile
> @@ -20,6 +20,9 @@ obj-y +=3D clk-usb.o
>  obj-$(CONFIG_MACH_SUN9I) +=3D clk-sun8i-apb0.o
>  obj-$(CONFIG_MACH_SUN9I) +=3D clk-sun9i-cpus.o
> =20
> +obj-$(CONFIG_MACH_SUN8I_A83T) +=3D clk-sun8i-apb0.o
> +obj-$(CONFIG_MACH_SUN8I_A83T) +=3D clk-sun9i-cpus.o
> +

This is not how it should be done. You should rather create a Kconfig
option for these clocks, and use def_bool CONFIG_MACH_SUN8I || CONFIG_MACH_=
SUN9I

Switching to Kconfig for the clocks has been on my todo-list for quite
some time, I guess these two clocks would be a good start.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--nEsDIrWrg+hrB7l1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJW1UD1AAoJEBx+YmzsjxAgaHoP/iLw7krEC7c8HoO5pzPmW0hm
JTaXdpnfTImZR9btm66y5XeVU7vqTOMO1KFbI5zjwj9y/OaC5svUgVsFzl8dEhM3
tfDon/YS0i9kplDwJa748jNKvwGGaGt1ccXrlkk6B6vGYrNkNDJrAdWMqk0AK+yK
fS31eWYWEiKXDDTpAMcFcOPUxXLnhTZNpjcC6O0caCe4+wy6bicyW4O+tmxZCd8B
OU42+eEoGXpIFJlajMNJVlZ+Urw+K+K2G4cVG7xKbyebvSQa54uMmJw5O3gMcDay
VTt5nSmVBrmdWSyskc4v3eARaJhbmi/CyBYtr3cmX22xNNHqgJiOrG+eOOivPZDg
HcSJTFGdyw02Mieh0MjfNXGC5xrmyJO+AW38FmA/KB3Z8chOj6oXiyf6U6QPfGl7
n5vje5wiPbFYJ4xJSSASS5vukAnTvSMS1U6TlAMZGQ0SVvpO4BtkzucQuf6u5Q7a
iD/dF5em563QaDWy4Nw2D1yIr3NlgqJb0fDbV7lP0qW4MyHWN2j7Bb/ZVU/LoZ16
8gzzVDsg9ctryGUulT8eoN2Nba6MRykyThHDAb+VdlUbvZ+mG3MnY+YCad/rIiu7
p7sa9Lj0osFMQaYV0+lLLTmqTmC21ISFz5O+pkWgQemcqebaW1RJRN1oMscbuYUQ
qNrBA4TfJvQmH7czpLg/
=O1Ae
-----END PGP SIGNATURE-----

--nEsDIrWrg+hrB7l1--
