Return-Path: <heiko@sntech.de>
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Emilio =?ISO-8859-1?Q?L=F3pez?= <emilio.lopez@collabora.co.uk>, mturquette@baylibre.com, sboyd@codeaurora.org, wens@csie.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] clk: sunxi: delay protected clocks until arch initcall
Date: Wed, 27 Jan 2016 22:07:15 +0100
Message-ID: <1991025.ABeYDSZEGp@diego>
In-Reply-To: <20160127203816.GU4317@lukather>
References: <1453385439-10154-1-git-send-email-emilio.lopez@collabora.co.uk> <7334994.mKnQpNNMP2@diego> <20160127203816.GU4317@lukather>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart15017865.eCjWoE86d1"; micalg="pgp-sha256"; protocol="application/pgp-signature"
List-ID: <linux-clk.vger.kernel.org>

--nextPart15017865.eCjWoE86d1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Am Mittwoch, 27. Januar 2016, 21:38:16 schrieb Maxime Ripard:
> Hi,
>=20
> On Wed, Jan 27, 2016 at 05:14:17PM +0100, Heiko St=FCbner wrote:
> > Hi,
> >=20
> > Am Mittwoch, 27. Januar 2016, 16:37:22 schrieb Maxime Ripard:
> > > I thought the patches were simply dropped and the
> > > rockchip people just took another approach.
> >=20
> > nope still on track ... especially as it was Stephen's believe that=

> > orphans
> > shouldn't even be usable to general clock users :-).
> >=20
> > I just remember that the proposed general solution was based on Mik=
e's
> > upcoming generic critical clock handling (the handoff thingy), whic=
h would
> > move critical clock handling out of architecture-specific code, so =
I've
> > been prodding Mike mainly.
> >=20
> > Another option might be to allow clock-controllers to handle orphan=
s and
> > only deny orphan usage to outside clock users, maybe expanding on w=
hat I
> > did with the clock-conf part in patch2.
>=20
> I'm not sure that would solve anything in our case. All our clocks
> drivers are different ones, so I'm not sure how we could handle that.=


the core issue is, that a clk_get on an orphan is going to return EPROB=
E_DEFER=20
after the second patch, which is also true for sunxi critical clocks.

The clock-conf has the same issue in the case where you know on the boa=
rd-
level that a clock will stay orphaned indefinitly and want to reparent =
it away=20
to some sane parent.

That's why I added of_clk_get_from_provider_with_orphans() (limited to =
use in=20
the ccf) in the second patch to allow orphans to be reparented via assi=
gned-
clocks foo. In theory one could argue that clock controller generally k=
now=20
what they're doing and add something like clk_get_with_orphans() or wha=
tever=20
that might be called then.
--nextPart15017865.eCjWoE86d1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAABCAAGBQJWqTGDAAoJEPOmecmc0R2BeF8H/2LasuZIhSYeaIDxDyaCGyhy
/CXsgqYLtx0llZaXuz9+HNTlE1Ip6Z18IRyyikcKs+7Jvi5mK17olZWgYLVRBYWC
YxmCQ4/FUP1jSOGGTk1Un1Hi+ZD13H7x88v9gz0HFC6tJzLqQpg4uGQIhAv7QI6u
RVIp6MjGbgMCpSxxjmgvPXh7flShLxN55keYsU8vUDhUkJeu6C1grdDtYoVJ9W6y
s+ETkcUplB9qO3TpVFZ3UwA7ycWf4BAnXZ/hH2giLiCQJIZ97C9A4hZHwGgX+vB4
+gBzYlY6jVqGxX82XV7ue45ourabu42IkTQOpQg3nPl4SCuS+rWHjfw8qaQGV9o=
=lPpm
-----END PGP SIGNATURE-----

--nextPart15017865.eCjWoE86d1--
