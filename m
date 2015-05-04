Return-Path: <maxime.ripard@free-electrons.com>
Date: Mon, 4 May 2015 15:05:46 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Lee Jones <lee.jones@linaro.org>,
	Mike Turquette <mturquette@linaro.org>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/5] ARM: dts: sun9i: Add A80 PRCM clocks and reset
 control nodes
Message-ID: <20150504130546.GC3274@lukather>
References: <1430410206-4410-1-git-send-email-wens@csie.org>
 <1430410206-4410-5-git-send-email-wens@csie.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hOcCNbCCxyk/YU74"
In-Reply-To: <1430410206-4410-5-git-send-email-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>


--hOcCNbCCxyk/YU74
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 01, 2015 at 12:10:05AM +0800, Chen-Yu Tsai wrote:
> This adds the PRCM clocks and reset controls to the A80 dtsi.
>=20
> The list of apbs clock gates is incomplete. Tests show that bits 0~20
> are mutable. We will need documents from Allwinner to complete the
> support.
>=20
> Also update clock and reset phandles for r_uart.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---
>  arch/arm/boot/dts/sun9i-a80.dtsi | 64 ++++++++++++++++++++++++++++++++++=
+++++-
>  1 file changed, 63 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/arm/boot/dts/sun9i-a80.dtsi b/arch/arm/boot/dts/sun9i-a=
80.dtsi
> index d3dece2eea72..f0869ff8006f 100644
> --- a/arch/arm/boot/dts/sun9i-a80.dtsi
> +++ b/arch/arm/boot/dts/sun9i-a80.dtsi
> @@ -169,6 +169,14 @@
>  					     "usb_phy2", "usb_hsic_12M";
>  		};
> =20
> +		pll3: clk@06000008 {
> +			/* placeholder until implemented */
> +			#clock-cells =3D <0>;
> +			compatible =3D "fixed-clock";
> +			clock-rate =3D <0>;
> +			clock-output-names =3D "pll3";
> +		};
> +
>  		pll4: clk@0600000c {
>  			#clock-cells =3D <0>;
>  			compatible =3D "allwinner,sun9i-a80-pll4-clk";
> @@ -751,13 +759,67 @@
>  			interrupts =3D <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
>  		};
> =20
> +		prcm@08001400 {
> +			compatible =3D "allwinner,sun9i-a80-prcm";
> +			reg =3D <0x08001400 0x200>;
> +
> +			cpus_clk: cpus_clk {

I wonder whether it would not be more readable to have this as
clk@<prcm_offset>, just like all the other clocks?

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--hOcCNbCCxyk/YU74
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVR26qAAoJEBx+YmzsjxAgjnwQAKewMB2u3Pz9f8hhzBfqjis9
CsLgBWbFyUL1UusHbnyEwVwIZsqpoepAKoFn04bfZUNK1mS7jw8v4L7Mao3ec7NK
U25Xya2mULxEmYC/SwGGsuvlLRFuheS8k37BxDPb2CyLSOUTJNhQr8NQTQ03MMa8
xBISANVCFxW/u0OylcOyRhw4ifQPdRwZvgWcS8jbnqUX39sk4cOyfZWv9GLcCRDH
MSl6EtHKzzfUzOHa7+MYQCjP6a7gMaBzqVaB0+QsB12iNi6sxqd+Aj90zg/UVSIJ
tgEC3XqV5d1GmUmA68J//vQc2oYW/nyxwj4s5VBTh1A99mVzJKK2UuwRlOvyK8Tj
n892vperBYsswqPTOpCav4qchpJOdFKUIN9Yg8hFFc0Ry2R+gPXLGUwEbUI/9itX
EYNhZRluHs7NscIlR1iQaVI318DmVyZBdVXwMQKSLjPMW5QCimKsR83xyDjE4m3v
zqmacLlIvElRjbcsnu3rsGVoOLg/e7egHVDuZhhEtgP5OXJ9yd7RR6cZvxRSRAYe
0+zbId9kTdVYKw3qJ+3cBz9bJbSzxZJKkU0LF9msUnLpCO/p7+r8Go5KqCn/jwzk
FDkoTQAKEt17GITxJ6HzV8yoXqNSCAEI0xrlHLNrS5aXl+qwbOFnLrgjXF7mcD4o
DJsxdtIeWzofT/jDn+6L
=MpoD
-----END PGP SIGNATURE-----

--hOcCNbCCxyk/YU74--
