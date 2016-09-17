Return-Path: <maxime.ripard@free-electrons.com>
Date: Sat, 17 Sep 2016 16:23:58 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Mike Turquette <mturquette@baylibre.com>, Chen-Yu Tsai <wens@csie.org>,
	linux-arm-kernel@lists.infradead.org,
	Andre Przywara <andre.przywara@arm.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH v2 1/4] clk: sunxi-ng: Add A64 clocks
Message-ID: <20160917142358.GD17518@lukather>
References: <20160909201029.24530-1-maxime.ripard@free-electrons.com>
 <20160909201029.24530-2-maxime.ripard@free-electrons.com>
 <20160914214554.GH7243@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Q0rSlbzrZN6k9QnT"
In-Reply-To: <20160914214554.GH7243@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>


--Q0rSlbzrZN6k9QnT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

On Wed, Sep 14, 2016 at 02:45:54PM -0700, Stephen Boyd wrote:
> On 09/09, Maxime Ripard wrote:
> > index 106cba27c331..964f22091a10 100644
> > --- a/drivers/clk/sunxi-ng/Makefile
> > +++ b/drivers/clk/sunxi-ng/Makefile
> > @@ -22,3 +22,4 @@ obj-$(CONFIG_SUN6I_A31_CCU)	+=3D ccu-sun6i-a31.o
> >  obj-$(CONFIG_SUN8I_A23_CCU)	+=3D ccu-sun8i-a23.o
> >  obj-$(CONFIG_SUN8I_A33_CCU)	+=3D ccu-sun8i-a33.o
> >  obj-$(CONFIG_SUN8I_H3_CCU)	+=3D ccu-sun8i-h3.o
> > +obj-$(CONFIG_SUN50I_A64_CCU)	+=3D ccu-sun50i-a64.o
>=20
> Maybe do alphanumeric ordering?

Yes, of course.

> > diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-a64.c b/drivers/clk/sunxi-=
ng/ccu-sun50i-a64.c
> > new file mode 100644
> > index 000000000000..d51ee416f515
> > --- /dev/null
> > +++ b/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
> > @@ -0,0 +1,870 @@
> > +
> > +static void __init sun50i_a64_ccu_setup(struct device_node *node)
> > +{
> > +	void __iomem *reg;
> > +	u32 val;
> > +
> > +	reg =3D of_io_request_and_map(node, 0, of_node_full_name(node));
> > +	if (IS_ERR(reg)) {
> > +		pr_err("%s: Could not map the clock registers\n",
> > +		       of_node_full_name(node));
> > +		return;
> > +	}
> > +
> > +	/* Force the PLL-Audio-1x divider to 4 */
> > +	val =3D readl(reg + SUN50I_A64_PLL_AUDIO_REG);
> > +	val &=3D ~GENMASK(19, 16);
> > +	writel(val | (3 << 16), reg + SUN50I_A64_PLL_AUDIO_REG);
> > +
> > +	writel(0x515, reg + SUN50I_A64_PLL_MIPI_REG);
> > +
> > +	sunxi_ccu_probe(node, reg, &sun50i_a64_ccu_desc);
> > +}
> > +CLK_OF_DECLARE(sun50i_a64_ccu, "allwinner,sun50i-a64-ccu",
> > +	       sun50i_a64_ccu_setup);
>=20
> Is there a reason it can't be a platform driver?

We have timers connected to those clocks. I'm not sure we'll ever use
them, since we also have the arch timers, and we can always change
that later, I'll change that.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--Q0rSlbzrZN6k9QnT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJX3VH+AAoJEBx+YmzsjxAgWZsQAKFvmbT5isr/UCwDv/j19lno
RO6/9VlBkqCaYAyU9gZxok1Ls8TrTqdNsvwGD0v/owqtrmbfaOiDRYeyIWl3Vzpo
Cyod8gFJhaKhntZc84dq3vs0U2EIfIQ15gRDj0uzF24LtAZkPPOezDgp3RTkgZhb
0pTkT4G165ti9pAebD+dmV/w6Y7K6aepLI20p4sfeAirucAgzT/qrBllQ9kD3+mI
a8VxZvmB+W6RZBNv6DphPfEO5yFZslH+9fEEQ/VJq6PYCL1lR/RP1xgRgfP2G4XA
+Ak8Vt45DNs4xJ8ApBWNsU7Y/fDCFOS5TSF6XO/Fk+Upot3Bl/beR9/LlqIcsyGt
zf/kucCwMhzKMoay/X/Vwqih5QJolIRN7tcD4h8ivMPGeYARTTDXrnAl0/RL1MGS
2j2yXf9goA6pG2p6NFrUiHercMszf+PyZV1pRFIxu4YtH7z6CJDp+8Nbi8ZevMyx
3pa9d6b1S+Uv54Ev52faFiGlsxAZMfMP9w4ftLPNnEebV5YLncJNtE9You7j6Bog
4WJYSwEwbU4jZ2W2hbad/1szz0wK6oAH2Eot5YlYCggqnF2o2xl6sVesm7TY/f2Y
SzuVrQDvEGIzjhK0p93y0kVJkcUWKdGzJ0t7i+DqYstI24zGq0Pcz3szqP0zQNsM
Bl25DN8+yD99bvSkwCR4
=N08J
-----END PGP SIGNATURE-----

--Q0rSlbzrZN6k9QnT--
