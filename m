Return-Path: <maxime.ripard@free-electrons.com>
Date: Mon, 30 Nov 2015 21:14:12 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Mike Turquette <mturquette@baylibre.com>, Chen-Yu Tsai <wens@csie.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: sunxi: pll2: Fix clock running too fast
Message-ID: <20151130201412.GA29263@lukather>
References: <1448897699-20475-1-git-send-email-maxime.ripard@free-electrons.com>
 <20151130193216.GI11298@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZGiS0Q5IWpPtfppv"
In-Reply-To: <20151130193216.GI11298@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>


--ZGiS0Q5IWpPtfppv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 30, 2015 at 11:32:16AM -0800, Stephen Boyd wrote:
> On 11/30, Maxime Ripard wrote:
> > @@ -191,25 +186,17 @@ err_unmap:
> >  	iounmap(reg);
> >  }
> > =20
> > -static struct sun4i_pll2_data sun4i_a10_pll2_data =3D {
> > -	.pre_div_flags	=3D CLK_DIVIDER_ONE_BASED | CLK_DIVIDER_ALLOW_ZERO,
> > -};
> > -
> >  static void __init sun4i_a10_pll2_setup(struct device_node *node)
> >  {
> > -	sun4i_pll2_setup(node, &sun4i_a10_pll2_data);
> > +	sun4i_pll2_setup(node, &sun4i_a10_pll2_data, 0);
>=20
> And it doesn't compile, because we just deleted the data that
> this is taking an address of. Hmph.

Sorry for the screw up, I'll resend a new version tomorrow...

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--ZGiS0Q5IWpPtfppv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWXK4UAAoJEBx+YmzsjxAg9JEP+QF2ZtdQRkqjzse6zOYpzK8H
8RJqk30XKrE0H9ajfrSFqgay8s3rrbC44fO4kHykJybQ5UR501eydrc7fqmb6T5p
L+BjXPINsah5cBmaYPQadiuJP0/T1xxIVBbP1Jr2jRUh/LwgijnrQqGrRIJzoO/D
heYv9no1XnpjKba8qX5Cri6a5RCYougfQ9u0Lh6rjukE2tTPrtmVAEg9cKmfYIJT
hSnxqVNtM4TCH9IXCzr7riffWB6lIcJX1DNs0p19Pi3G3S5ru9Ms51POSBeoQ6xh
r8RJi2JtAJUVyL1NJkGUAxlZhXwrCIccSUehDFK9iymLRKWJCcwdNNmCoU+lmf6s
kywNbdTO8lnX85HPKRUokqQNL58lMBIDG8D+SJjIttfpkhZ9jEe9k3lCHj8SKAxm
cWp1P4ezL40H/xjaZj/ad/NjP3zI4S5geS9hlCuNZp3nsXyAx3cKwBZu+0LP5TDm
uw450ZYHPwXcbM2X2psfl646wiaiX2Xymcd+esNr7KPCC/hmLWKcspwg1T7FlY0k
8F4bjYu5TaQmHHWY3M0g9DMqs8z9iZwPgacyOawBu8qaDyjy2kPgh2QZCRdmCXNF
djfur0TvXDf5CQsAbP5AV1PRCGxhlx/tIqzP263XB780lVusiyLWdfcXcu3+JvZO
YZF5Og+eXlcCn08l1Yz0
=3Z0w
-----END PGP SIGNATURE-----

--ZGiS0Q5IWpPtfppv--
