Return-Path: <maxime.ripard@free-electrons.com>
Date: Thu, 19 Jan 2017 16:45:38 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>
Cc: dev@linux-sunxi.org, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, Chen-Yu Tsai <wens@csie.org>,
	Jorik Jonker <jorik@kippendief.biz>,
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
	"moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [linux-sunxi] [PATCH] clk: sunxi-ng: fix PLL_CPUX adjusting on H3
Message-ID: <20170119154538.4ge5vez36kvmase6@lukather>
References: <20161125002852.18097-1-megous@megous.com>
 <0985b1ec-ba95-1505-cc59-adec4b88238f@megous.com>
 <20170109095946.6esbfx6pafega5cd@lukather>
 <557330d0-2dcd-2211-8538-51c4d6b68834@megous.com>
 <20170116164300.j2zvjkxr7c5h5hyo@lukather>
 <f1ccd8ce-df6c-8204-71ab-2f774ac269d5@megous.com>
 <20170118165612.zkjaj36kedg64rjw@lukather>
 <c4152a9b-9b31-5ed7-39cd-da1a3489bc89@megous.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hjiqiomaziqsqnk5"
In-Reply-To: <c4152a9b-9b31-5ed7-39cd-da1a3489bc89@megous.com>
List-ID: <linux-clk.vger.kernel.org>


--hjiqiomaziqsqnk5
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 18, 2017 at 06:48:35PM +0100, Ond=C5=99ej Jirman wrote:
> Dne 18.1.2017 v 17:56 Maxime Ripard napsal(a):
> >>> What's your current plan to fix that? I guess the easiest (and most
> >>> likely to be reusable) would be to allow for clock tables, instead of
> >>> using the generic approach. We might have some other clocks (like
> >>> audio or video) that would need such a precise tuning in the future
> >>> too.
> >>
> >> My proposed solution is this for M factor (H3 specific solution):
> >>
> >> https://github.com/megous/linux/commit/88be3d421e958579026135d8acec4b3=
983958738
> >=20
> > This one is fine.
> >=20
> >> and this for P factor:
> >>
> >> https://github.com/megous/linux/commit/d7f274ed0c13fa9b4099445cb6bf9b2=
f8f2cfa8a
> >>
> >> Perhaps it should be configurable if the P limitation is not universal
> >> for all NKMP clocks. But I haven't read all the datasheets.
> >=20
> > And this is exactly what I wanted to avoid, for the reason you're
> > giving :)
> >=20
> > This is some generic code, and yet you're putting a clock and SoC
> > specific limit in there. You have two ways to deal with that. Either
> > come up with some generic throttling mecanism to force a particular
> > value above or below a given threshold, but that might be tedious to
> > do, and require some significant rework.
> >=20
> > Or you can use a table, which is generic and should be relatively
> > easy. I really think this is the most straightforward solution, and
> > even more so since we just want to support a limited number of
> > frequencies in this case.
>=20
> So I would add a pointer to a table to struct ccu_nkmp and define the
> table itself in ccu-sun8i-h3.c?
>=20
> If struct ccu_nkmp would have non-NULL pointer to a table, it would be
> used instead of the math in ccu_nkmp.c.
>=20
> Sounds ok?

Yep, sounds perfect!

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--hjiqiomaziqsqnk5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYgN8iAAoJEBx+YmzsjxAgGsoP/1SoVMZ8jEN0BH1LLjOLgxIj
JdRVlOt0yVVpAV2ZnyP3hCDutcKAgbalix4WwAEuywfgStJTP63QkEjZgfopDowj
YiJpmB2L2KnuikApSSX5P0wydWyQqFE2gotywu7QOuuKdxIagmh/78jz9ogXgQXG
30FKaBtkNUvndmyAa+aCs+jockIql+7zqh4mMarR1Ow84FZTBhtb6NsRx37ZkNrR
o5oVgFlIi2n2t7+sP9M38V3EYexOk6VqFkV3913qVxK07kAMiVadnZE8Bd6Fqyet
SgzSJnNDVAuIxW0E+fvFVZL+eyqRf/CImUe6AcObttdIJmb6lfm5ci3OHNI5gyv6
ky/m7gSomMsYrYVRCOunLVPvcDaTIgbiDnxCc3cBteVEN/uGlowpbxaeQ6odgI+A
r1MaJ5Gg3gmbAaCs3wjMRSsl5UC4KdS2oS4i8AGI9266kr6ESYP484FJIgM/Bxf3
4wnNkV5+ANmbSet+nL8rsUe4X8nj5RNC8b2PxKJiaRGNiM7FD81/7OdYWMPi7Qpo
cpH9UZ8CBxIw3KJECC8rb8esgRgPuaUnI+7eSFAkZUq0pP3a8O3yCRb8FuPyUAY9
QuWRx96Mdn9iIa8f0vtcIQ9ihVnbvFLfxgq/EV/VUhWnp7U7Gn+Q8vz4eKapuHhL
piSrZPDdvCC1KPb7RYpx
=hicu
-----END PGP SIGNATURE-----

--hjiqiomaziqsqnk5--
