Return-Path: <maxime.ripard@free-electrons.com>
Date: Mon, 24 Oct 2016 17:05:42 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Mike Turquette <mturquette@baylibre.com>, Chen-Yu Tsai <wens@csie.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-sunxi@googlegroups.com,
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v4 6/9] clk: sunxi-ng: Add A64 clocks
Message-ID: <20161024150542.cle7iw2l7c5ybbrr@lukather>
References: <cover.024e1b023e41efe548dc6a004f7a946408d5c9a2.1476196031.git-series.maxime.ripard@free-electrons.com>
 <cd4dd81821b8910d40626baab2dbfdabd94b1b98.1476196031.git-series.maxime.ripard@free-electrons.com>
 <20161020184601.GB26139@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6t3qhlpls5xcw2dg"
In-Reply-To: <20161020184601.GB26139@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>


--6t3qhlpls5xcw2dg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

On Thu, Oct 20, 2016 at 11:46:01AM -0700, Stephen Boyd wrote:
> On 10/11, Maxime Ripard wrote:
> > diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-a64.c b/drivers/clk/sunxi-=
ng/ccu-sun50i-a64.c
> > new file mode 100644
> > index 000000000000..c0e96bf6d104
> > --- /dev/null
> > +++ b/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
> > +
> > +static int sun50i_a64_ccu_probe(struct platform_device *pdev)
> > +{
> > +	struct resource *res;
> > +	void __iomem *reg;
> > +	u32 val;
> > +
> > +	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +	reg =3D devm_ioremap_resource(&pdev->dev, res);
> > +	if (IS_ERR(reg)) {
> > +		dev_err(&pdev->dev, "Could not map the clock registers\n");
>=20
> devm_ioremap_resource() should already spit out an error.
>=20
> > +		return PTR_ERR(reg);
> > +	}
> > +
> > +	/* Force the PLL-Audio-1x divider to 4 */
> > +	val =3D readl(reg + SUN50I_A64_PLL_AUDIO_REG);
> > +	val &=3D ~GENMASK(19, 16);
> > +	writel(val | (3 << 16), reg + SUN50I_A64_PLL_AUDIO_REG);
> > +
> > +	writel(0x515, reg + SUN50I_A64_PLL_MIPI_REG);
> > +
> > +	return sunxi_ccu_probe(pdev->dev.of_node, reg, &sun50i_a64_ccu_desc);
> > +}
> > +
> > +static const struct of_device_id sun50i_a64_ccu_ids[] =3D {
> > +	{ .compatible =3D "allwinner,sun50i-a64-ccu" },
> > +	{ },
>=20
> Nitpick: drop the comma

Thanks for your comments, it's fixed.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--6t3qhlpls5xcw2dg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYDiNCAAoJEBx+YmzsjxAgpOAP/A0zd+zs2hz8peugygH2t9rk
q1PVPfshHKD+HZEfnLSYS+HBCnEBAhNWc/dsq47QfHb//szYzar5IcuwvYZMU1Vq
mi2hvKd+26ZvyUzLgsICJcXosgmoDxgCaRX3sLqQBGTlbcvVuPFZ7+kCnxvFXi7Y
RM/E0xIqozqizCNJ7s/BzkOTIsztRtP36dtz8OBUJi7ZVxsmf4uiEnjvKizbLfPh
+kn2NPlXuOk80U2qwY2G/hUIIoG3E/lCJYLlT6dArrF7T3Du1brQ/PHTBYBPbsLX
e+8bJfsWiFC3GOwZDhjzEEjO4oYLaQCaStEIfbQyZbVVq495Qb7M9wzgXtFfROw2
H7jIorP7wDrHDwtgbXGiR+0xkzMB/q/PXPpvvkz1ye0qAV78T/4yAVhXvFCzDLbr
h146bImRrV1HoF0sSLOf/y5Hk+GLBRCUAcH3Ny1xK6gXCReVU1YT24IyGGg4r0u/
iTLCllFYFkZ5F2QLUqYVBz5z1nbo4hjECLaQmoj4ZUJ9GQ15nPDlO+85FVDPLWYw
zw7KpIAwEvXu8wpBSQLs5sDFri3LHf+zS72K+CnkeobzW6NRXi/gV1D/XM+zojvz
5qR977u2VfhvYNVJmrwegmEvpunxNLQ6GtCAooZexmlt0lKPaVNiFZuBe7ExFFF3
qWXn8rgLm2LD9mQUOecZ
=iYuW
-----END PGP SIGNATURE-----

--6t3qhlpls5xcw2dg--
