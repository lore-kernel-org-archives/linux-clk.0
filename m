Return-Path: <maxime.ripard@free-electrons.com>
Date: Mon, 29 May 2017 09:58:33 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@googlegroups.com
Subject: Re: [PATCH 3/3] ARM: sun8i: a83t: Add device node for PRCM
Message-ID: <20170529075833.6dc4uqwa6uxtzs5y@flea.lan>
References: <20170526080025.28532-1-wens@csie.org>
 <20170526080025.28532-4-wens@csie.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xssk3n67pxvhqels"
In-Reply-To: <20170526080025.28532-4-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>


--xssk3n67pxvhqels
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, May 26, 2017 at 04:00:25PM +0800, Chen-Yu Tsai wrote:
> The A83T's PRCM has the same set of clocks and resets as the A64.
> However, a few dividers are different. And due to the lack of a low
> speed 32.768 kHz oscillator, a few of the clock parents are different.
>=20
> The PRCM also has controls for various power domains. These are not
> supported yet, neither in software nor in the device tree binding.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---
>  arch/arm/boot/dts/sun8i-a83t.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/sun8i-a83t.dtsi b/arch/arm/boot/dts/sun8i-=
a83t.dtsi
> index 1dc4cfe81534..8089f36deeff 100644
> --- a/arch/arm/boot/dts/sun8i-a83t.dtsi
> +++ b/arch/arm/boot/dts/sun8i-a83t.dtsi
> @@ -270,5 +270,14 @@
>  			#interrupt-cells =3D <3>;
>  			interrupts =3D <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_HI=
GH)>;
>  		};
> +
> +		r_ccu: clock@1f01400 {
> +			compatible =3D "allwinner,sun8i-a83t-r-ccu";
> +			reg =3D <0x01f01400 0x400>;
> +			clocks =3D <&osc24M>, <&osc16Md512>, <&osc16M>;

I applied patches 1 and 2, but that made me realise that the
pll-periph0 is also a parent and should be listed there.

Can you send a patch adjusting the binding documentation so that we
can have it in time for 4.12, and patches for the A64 / H3 DTSs ?

Thanks,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--xssk3n67pxvhqels
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZK9SpAAoJEBx+YmzsjxAgrW0QAJC5NGGBoTsv0yfL9J2lAekw
+WUPlMQP3u7akrB5ksqesOugp6AJFSv6ybNSfyxbD2efmqUEq9s5vrxJwAGWazYC
s0PJNbO2GXy+Wr1ItiFOp0wP6PXG1WVxG/DPNeAfMbbxxIl57liu7UDpg4hx4CBK
vw3V2YWekyMI2i5Q8pZzm1+BPVZ/GJ5Hrd2YknuGcg+nibIhv8c7K2dat0GswZAB
rk0I9t/qVD4zteS43LwqypYYzmBgNdVQbAJxgQVY0kyzIEeLuz1RH2NqZtV3q8HW
JppvRupiXNnH+enJn4p3dkISl3oHaqM4NnkVrIWxcvMat9QMT/9dbe4ZNjUE3wL7
5moo3WiSAhtXjQxV3ICdw1LSfl6c8dl9fPYzM/R7OXSh1V/BC2OJn8/yC/he/+PO
3eFo07Rk+R/c8A87MYBgOyYw5RnZfS3HXLEnOyhFqqrq9GPWtBd9FK3Lu8Vb2moC
Q2wZTopgK111Jq3OQeoSYPqoyjprFKZuqBlPrHDydWDxmvUiI9QEwNlMw+UZMEuB
fPL+WGeOVlZn/WnSZ3Tu1Y/wEo9xuol66gY2/GfHO/gaBoMKRBA5h256Vrc6U3vD
wW2jloJgKUUlzGvkiYCcorKwPKYybCKsxNhl2JEICZzDy+UivdPOwOPt9N6PSFO4
JpBfeUF3eLBQ/azpwFdT
=+1Mz
-----END PGP SIGNATURE-----

--xssk3n67pxvhqels--
