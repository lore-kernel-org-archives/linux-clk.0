Return-Path: <maxime.ripard@free-electrons.com>
Date: Thu, 28 Jul 2016 15:28:42 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Jean-Francois Moine <moinejf@free.fr>
Cc: Chen-Yu Tsai <wens@csie.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
	dev@linux-sunxi.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 4/9] clk: sunxi-ng: mux: Add support for mux tables
Message-ID: <20160728132842.GA6682@lukather>
References: <1469516671-19377-1-git-send-email-wens@csie.org>
 <1469516671-19377-5-git-send-email-wens@csie.org>
 <20160726194306.9b6aadd3d1669bd6f5a54d99@free.fr>
 <20160727065934.GD6560@lukather>
 <20160727091827.e26f72701ce5758fa29aff7a@free.fr>
 <20160727074020.GH6560@lukather>
 <20160727103649.9e6ef332847b5a5c8fac66af@free.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vkogqOf2sHV7VnPd"
In-Reply-To: <20160727103649.9e6ef332847b5a5c8fac66af@free.fr>
List-ID: <linux-clk.vger.kernel.org>


--vkogqOf2sHV7VnPd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 27, 2016 at 10:36:49AM +0200, Jean-Francois Moine wrote:
> On Wed, 27 Jul 2016 09:40:20 +0200
> Maxime Ripard <maxime.ripard@free-electrons.com> wrote:
>=20
> > > > Parenting functions would also not work as expected,
> > > > clk_hw_get_parent_by_index being the obvious example, in that case
> > > > returning the empty string for an invalid parent, while it should
> > > > really return NULL.
> > >=20
> > > I don't see why the clock should be orphan.
> > > Then, when a parent is "", clk_hw_get_parent_by_index() returns NULL.
> >=20
> > Why? It should return NULL when there's no parent, while you
> > explicitly registered a parent.
>=20
> "" is not an existing parent. It could be "none" / "dum" / "toto" / ...
> with the same result: 'this index cannot be used in mux'.

And the clock is marked as orphan, while it really isn't.

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--vkogqOf2sHV7VnPd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXmgiKAAoJEBx+YmzsjxAgcL4P/1mZaGjaSKf94azBc2yHzWM/
aUWVYUuuPmiIeKsvcNdJs90PdmN39360m58PLBsijiFc2PZJXEH0W7knZmLw1M8T
cfrwBj6AiYPlXM12X35ZpAu8ki3sLezgVmCAHk0lIKkIrtcqpQNSBX3r78JcKjUY
ndaOg7kjgtHrFWZHvXVmz79wcPsHyp3uYxPfpTUATsPtP4iXG8AVGoEr3xpm44Pw
dvAFEpDvDdh1UzGkSCFlF2ggDgGGI/OR8ATs2DgGohyLW3AthXaXEoQxcgG0lZZs
PZBvT15yy+nf/Lp11WH7dd+sVZ6jFeiGr4DYuytcKpCOoQERf7e20LsThF8j4BVs
Yy0sJODDqAj/n7QVYMVACrYudTADyyWnteRwM29GsoznZk4MhHUHiJY5jrXaVUQX
KXNFmvordNDMO7W+48L0K2aTS3oRDElQEhbVNgoJjo/j8kRxRastjCfQpPf5sCTG
spUuyizxcn/4Qur0NMvZuFf85bT4bJFdFb5a0Pj6HAXtpybn0od1gTuPMixYRTOP
1upFTtf74n7N/11rF4gNizwxTokQKR0ADczi0BgSmxhUtjerRwysuB+p4BPIy12m
tkcVfoiyKYxsfrSrOhCDbXmMNnC8rPjrwbiLwqKhXGfyU5o5Zy4Y3N1EsjjwZAib
9veIdfg88UpZJwtCdDUI
=fg8K
-----END PGP SIGNATURE-----

--vkogqOf2sHV7VnPd--
