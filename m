Return-Path: <maxime.ripard@free-electrons.com>
Date: Wed, 10 Feb 2016 13:53:33 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Jean-Francois Moine <moinejf@free.fr>
Cc: Chen-Yu Tsai <wens@csie.org>, Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Jens Kuske <jenskuske@gmail.com>,
	Vishnu Patekar <vishnupatekar0510@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v4] clk: sunxi: Refactor A31 PLL6 so that it can be reused
Message-ID: <20160210125333.GC31506@lukather>
References: <1454358000-13594-1-git-send-email-maxime.ripard@free-electrons.com>
 <20160204120507.GC4270@lukather>
 <20160204162545.f806fcb64a826d2c3313985b@free.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Q7MaAb+MMjzLKrXy"
In-Reply-To: <20160204162545.f806fcb64a826d2c3313985b@free.fr>
List-ID: <linux-clk.vger.kernel.org>


--Q7MaAb+MMjzLKrXy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 04, 2016 at 04:25:45PM +0100, Jean-Francois Moine wrote:
> On Thu, 4 Feb 2016 13:05:07 +0100
> Maxime Ripard <maxime.ripard@free-electrons.com> wrote:
>=20
> > On Mon, Feb 01, 2016 at 09:20:00PM +0100, Maxime Ripard wrote:
> > > Remove the fixed dividers from the PLL6 driver to be able to have a
> > > reusable driver that can be used across several SoCs that share the s=
ame
> > > controller, but don't have the same set of dividers for this clock, a=
nd to
> > > also be reused multiple times in the same SoC, since we're droping the
> > > clock name.
> > >=20
> > > Acked-by: Chen-Yu Tsai <wens@csie.org>
> > > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> >=20
> > Applied.
> >=20
> > Maxime
>=20
> I don't agree:
> - you changed the DTs of many SoCs without any valid reason,

I did give you a significant number of reasons [1]. The fact that you
chose to ignore them is up to you.

> - you complexified the treatment of the pll6 in clk-sunxi.c while
>   defining a x2 rate instead of the single rate would also work for
>   the other pll periphs (pll8).

I've not used in this patch anything that is not already in there, so
I'm not really sure how it complexifies anything. Feel free to
enlighten me.

>=20
> Here is a simpler patch:
>=20
> --- a/arch/arm/boot/dts/sun8i-h3.dtsi	2016-02-01 08:24:06.179396522 +0100
> +++ b/arch/arm/boot/dts/sun8i-h3.dtsi	2016-02-04 16:18:05.911509291 +0100
> @@ -137,12 +137,23 @@
>  			clock-output-names =3D "pll6d2";
>  		};
> =20
> -		/* dummy clock until pll6 can be reused */
> +		pll8x2: clk@01c20044 {			/* PLL_PERIPH1 */
> +			#clock-cells =3D <0>;
> +			compatible =3D "allwinner,pll-periphx2-clk";
> +			reg =3D <0x01c20044 0x4>;
> +			clocks =3D <&osc24M>;
> +			clock-output-names =3D "pll8x2";
> +		};
> +
>  		pll8: pll8_clk {
>  			#clock-cells =3D <0>;
> -			compatible =3D "fixed-clock";
> -			clock-frequency =3D <1>;
> +			compatible =3D "fixed-factor-clock";
> +			clock-div =3D <2>;
> +			clock-mult =3D <1>;
> +			clocks =3D <&pll8x2>;
>  			clock-output-names =3D "pll8";
> +			assigned-clocks =3D <&pll8x2>;
> +			assigned-clock-rates =3D <1200000000>;
>  		};
> =20
>  		cpu: cpu_clk@01c20050 {
> --- a/drivers/clk/sunxi/clk-sunxi.c	2016-02-01 08:24:06.199396132 +0100
> +++ b/drivers/clk/sunxi/clk-sunxi.c	2016-02-04 16:03:41.056322804 +0100
> @@ -714,6 +714,12 @@
>  	.name =3D "pll6",
>  };
> =20
> +static const struct factors_data pll_periphx2_data __initconst =3D {
> +	.enable =3D 31,
> +	.table =3D &sun6i_a31_pll6_config,
> +	.getter =3D sun6i_a31_get_pll6_factors,
> +};
> +
>  static const struct factors_data sun6i_a31_pll6_data __initconst =3D {
>  	.enable =3D 31,
>  	.table =3D &sun6i_a31_pll6_config,
> @@ -1110,6 +1116,7 @@
>  	{.compatible =3D "allwinner,sun5i-a13-ahb-clk", .data =3D &sun5i_a13_ah=
b_data,},
>  	{.compatible =3D "allwinner,sun4i-a10-apb1-clk", .data =3D &sun4i_apb1_=
data,},
>  	{.compatible =3D "allwinner,sun7i-a20-out-clk", .data =3D &sun7i_a20_ou=
t_data,},
> +	{.compatible =3D "allwinner,pll-periphx2-clk", .data =3D &pll_periphx2_=
data,},
>  	{}
>  };

Except that it doesn't match the hardware and that the parenthood
relationship is inversed. The pll6 output is 24 MHz * n * k / 2, as
seen in any datasheet that uses it. Your clock driver doesn't
represent that fact.

Maxime

[1]: http://www.spinics.net/lists/arm-kernel/msg479744.html

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--Q7MaAb+MMjzLKrXy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWuzLNAAoJEBx+YmzsjxAg7eMQAIS3vYVvpfLgGncx8MBHjc9G
H87+J6qe02ldMCzIiKzQx39J9Zj2GgeR5sOlqSeHwpZncBGutcUv9h5dFCvZKxsi
lEu4xTPFB6PPJiiV83wbvre9DZqaLxczMSyCtFuatyCripEvdXxM2HSolHmtKxo9
bnuIodWG6LCAR6jK7IAkfozJ2QNaULXWlPifhFe8d3CzGg7N41pKjlGEHT3OpKeE
w95KFdXbQPddvj5MLEHgiLO8fbscJrPe2skSbbZ3it0AfTQwj1yFkfIXUexrnOY3
zkJZ9GlPsVsuNrTTNRbFje/zk/IVwpoHzCtMQ1hpc9u4LOSBiS2OEaOxsFpSHMMo
790K8VOwcqPtGfKoj+izxxsGm5Bl8fQ0iYeLAgCTSPbQhoGGYSi83WZPyabe5Brj
ix6aLCKtXfhoXiuYnbMAVTV3r4tkrM6TbRFWUSS0N9PqNaeNbLH5MTIINmIjNaEJ
0G37ul/k3JLLoitZV3znWozWdvxwLlHOM7+CuN4eyWYQfahrpNWYKaQS0nG3iDZ/
XUtrwXT6gTJM9vWI1ZNIwevuPskz4pqgFp47cJfQaM86N9cE3wn6Fc1VXq2Orazs
+Z1Ut+rhRE4SXGdrejzxE04ZxgxUYMNF7wGqE8DN/CtL7kYOtWVdW/Sh7LeUj6tT
RhvVP4Cjsb4OLBp2WuCV
=qutP
-----END PGP SIGNATURE-----

--Q7MaAb+MMjzLKrXy--
