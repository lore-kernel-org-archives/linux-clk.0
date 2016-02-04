Return-Path: <moinejf@free.fr>
Date: Thu, 4 Feb 2016 16:25:45 +0100
From: Jean-Francois Moine <moinejf@free.fr>
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Mike Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, Jens Kuske <jenskuske@gmail.com>,
 Vishnu Patekar <vishnupatekar0510@gmail.com>, Hans de Goede
 <hdegoede@redhat.com>, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH v4] clk: sunxi: Refactor A31 PLL6 so that it can be
 reused
Message-Id: <20160204162545.f806fcb64a826d2c3313985b@free.fr>
In-Reply-To: <20160204120507.GC4270@lukather>
References: <1454358000-13594-1-git-send-email-maxime.ripard@free-electrons.com>
	<20160204120507.GC4270@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
List-ID: <linux-clk.vger.kernel.org>

On Thu, 4 Feb 2016 13:05:07 +0100
Maxime Ripard <maxime.ripard@free-electrons.com> wrote:

> On Mon, Feb 01, 2016 at 09:20:00PM +0100, Maxime Ripard wrote:
> > Remove the fixed dividers from the PLL6 driver to be able to have a
> > reusable driver that can be used across several SoCs that share the same
> > controller, but don't have the same set of dividers for this clock, and=
 to
> > also be reused multiple times in the same SoC, since we're droping the
> > clock name.
> >=20
> > Acked-by: Chen-Yu Tsai <wens@csie.org>
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
>=20
> Applied.
>=20
> Maxime

I don't agree:
- you changed the DTs of many SoCs without any valid reason,
- you complexified the treatment of the pll6 in clk-sunxi.c while
  defining a x2 rate instead of the single rate would also work for
  the other pll periphs (pll8).

Here is a simpler patch:

--- a/arch/arm/boot/dts/sun8i-h3.dtsi	2016-02-01 08:24:06.179396522 +0100
+++ b/arch/arm/boot/dts/sun8i-h3.dtsi	2016-02-04 16:18:05.911509291 +0100
@@ -137,12 +137,23 @@
 			clock-output-names =3D "pll6d2";
 		};
=20
-		/* dummy clock until pll6 can be reused */
+		pll8x2: clk@01c20044 {			/* PLL_PERIPH1 */
+			#clock-cells =3D <0>;
+			compatible =3D "allwinner,pll-periphx2-clk";
+			reg =3D <0x01c20044 0x4>;
+			clocks =3D <&osc24M>;
+			clock-output-names =3D "pll8x2";
+		};
+
 		pll8: pll8_clk {
 			#clock-cells =3D <0>;
-			compatible =3D "fixed-clock";
-			clock-frequency =3D <1>;
+			compatible =3D "fixed-factor-clock";
+			clock-div =3D <2>;
+			clock-mult =3D <1>;
+			clocks =3D <&pll8x2>;
 			clock-output-names =3D "pll8";
+			assigned-clocks =3D <&pll8x2>;
+			assigned-clock-rates =3D <1200000000>;
 		};
=20
 		cpu: cpu_clk@01c20050 {
--- a/drivers/clk/sunxi/clk-sunxi.c	2016-02-01 08:24:06.199396132 +0100
+++ b/drivers/clk/sunxi/clk-sunxi.c	2016-02-04 16:03:41.056322804 +0100
@@ -714,6 +714,12 @@
 	.name =3D "pll6",
 };
=20
+static const struct factors_data pll_periphx2_data __initconst =3D {
+	.enable =3D 31,
+	.table =3D &sun6i_a31_pll6_config,
+	.getter =3D sun6i_a31_get_pll6_factors,
+};
+
 static const struct factors_data sun6i_a31_pll6_data __initconst =3D {
 	.enable =3D 31,
 	.table =3D &sun6i_a31_pll6_config,
@@ -1110,6 +1116,7 @@
 	{.compatible =3D "allwinner,sun5i-a13-ahb-clk", .data =3D &sun5i_a13_ahb_=
data,},
 	{.compatible =3D "allwinner,sun4i-a10-apb1-clk", .data =3D &sun4i_apb1_da=
ta,},
 	{.compatible =3D "allwinner,sun7i-a20-out-clk", .data =3D &sun7i_a20_out_=
data,},
+	{.compatible =3D "allwinner,pll-periphx2-clk", .data =3D &pll_periphx2_da=
ta,},
 	{}
 };
=20

--=20
Ken ar c'henta=F1	|	      ** Breizh ha Linux atav! **
Jef		|		http://moinejf.free.fr/
