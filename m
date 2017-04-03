Return-Path: <maxime.ripard@free-electrons.com>
Date: Mon, 3 Apr 2017 09:36:40 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.io>
Cc: devicetree@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
	linux-sunxi@googlegroups.com, linux-kernel@vger.kernel.org,
	Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 0/5] Add support for the R_CCU on Allwinner H3/A64 SoCs
Message-ID: <20170403073640.7l7mar6zjcgytf6z@lukather>
References: <20170329104246.34204-1-icenowy@aosc.io>
 <20170402160237.osgt32ugw7cz7ubg@lukather>
 <alpine.LNX.2.20.1704030029590.823@x220i>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tolepy6lgddw5d5l"
In-Reply-To: <alpine.LNX.2.20.1704030029590.823@x220i>
List-ID: <linux-clk.vger.kernel.org>


--tolepy6lgddw5d5l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 03, 2017 at 12:32:08AM +0800, Icenowy Zheng wrote:
>=20
>=20
> On Sun, 2 Apr 2017, Maxime Ripard wrote:
>=20
> > Hi,
> >=20
> > On Wed, Mar 29, 2017 at 06:42:41PM +0800, Icenowy Zheng wrote:
> > > Allwinner SoCs after sun6i-a31 nearly all have a R_CCU in PRCM part.
> > > (V3s and R40 do not have it, as they have even no PRCM)
> > >=20
> > > This patch adds support for the ones on H3/A64.
> > >=20
> > > Some clock/reset values are reserved for easier extending the support=
 to
> > > A31/A23, but for this I think some changes to the PRCM MFD should be =
made,
> > > see [1] (Although this is only a sketch).
> > >=20
> > > The r_pio device node is also added for A64, as the driver is already
> > > merged, and its depends (r_ccu) is now met.
> > >=20
> > > [1] https://github.com/wens/linux/commits/sunxi-ng-prcm
> >=20
> > It looks good now, thanks.
> >=20
> > Beside from the minor fix you've mentionned, please don't use the
> > defined IDs (yet) in your DT patches (3 to 5).
>=20
> Thanks! (I think it's the same question we meet when merging V3s patchset,
> right? :-) )

Exactly. When doing that kind of conversion, in order to not break the
compilation, we would take the DT patches through the clock
tree.

However, this doesn't work very well when we also have DT patches that
conflicts with those clock conversion ones that would need to get
through arm-soc.

And in this case, this is even more complex since you have the H3/H5
split patches that would need to go through yet another branch.

Not using the defines for now, and sending a fix later fixes all these
issues.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--tolepy6lgddw5d5l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJY4fuEAAoJEBx+YmzsjxAgS7sQAI+ZtOyolj/NoV+ewIHPTzt/
DWWEg2yDmJPxrBDKEbmn0p18+8g/38HBKmOarN55a68FRoyY+Qc26lqbrBzSzDuJ
fAhf2dCMvx/K8oMOFjcdb5szqEqNXC+Xn+EoaGTNRUkXxGtKMP7NIN8dwfTmHUkO
8ODvMkjvzq1RipWlS64uWko745QD75NkJ4owpODCRILz2R90aUveiz04aTbnapoz
SvLeAhcxzN+iNRL7g2sHqzUTxe+1FTsQYwgK/sJOJ5SZQNjQMBpaT4ZGOKn0K6dy
L2iXdRZ5jTtjHOU15lS7rpHqTI6pTpeRtIGz0HdKAcHshIW+ADra1TFcuIdGaaIt
RKTXZBE54YVyk5Vyga+ig6TXbFKN7Cdwu5qQ3whdv07vij7sLs0P5fyy7HC1CuI1
3uEFOZ3rybpm/QXT4eBbvK0OrIxfIMgXmZwd9BuwWF4ZAWQNlhxQi4hrQo+SraAw
AUZ9HtuwiSOIQCzAxXt2IJqAd2JK5nYAIZivrDUr2jqaaY3MVwClxxBwxStrE5au
3N8+hQ+SInSkOV9xAqnOySU0dmiVdbqTKGIBuYl9P8I8VkyZLq6BXhs3OUPsfMyX
kwDcY16ur8vrF9mxGNDGNG9a0izIvzoxr8o50f20Bq4W+/zOEDLwALxDgGidtQo6
pbJ40wpEs1qnLwqABIJU
=ZBeu
-----END PGP SIGNATURE-----

--tolepy6lgddw5d5l--
