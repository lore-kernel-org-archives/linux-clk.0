Return-Path: <maxime.ripard@free-electrons.com>
Date: Fri, 15 Jul 2016 10:19:54 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>
Cc: dev@linux-sunxi.org, linux-arm-kernel@lists.infradead.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Chen-Yu Tsai <wens@csie.org>,
	Emilio =?iso-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>,
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 06/14] ARM: sun8i: clk: Add clk-factor rate
 application method
Message-ID: <20160715081954.GQ4761@lukather>
References: <20160625034511.7966-1-megous@megous.com>
 <20160625034511.7966-7-megous@megous.com>
 <20160630204001.GC5485@lukather>
 <64d0c1e2-d818-0806-7c92-c10603b4f6f5@megous.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dUqh8vgUBVXHzm9w"
In-Reply-To: <64d0c1e2-d818-0806-7c92-c10603b4f6f5@megous.com>
List-ID: <linux-clk.vger.kernel.org>


--dUqh8vgUBVXHzm9w
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 01, 2016 at 02:53:52AM +0200, Ond=C5=99ej Jirman wrote:
> On 30.6.2016 22:40, Maxime Ripard wrote:
> > Hi,
> >=20
> > On Sat, Jun 25, 2016 at 05:45:03AM +0200, megous@megous.com wrote:
> >> From: Ondrej Jirman <megous@megous.com>
> >>
> >> PLL1 on H3 requires special factors application algorithm,
> >> when the rate is changed. This algorithm was extracted
> >> from the arisc code that handles frequency scaling
> >> in the BSP kernel.
> >>
> >> This commit adds optional apply function to
> >> struct factors_data, that can implement non-trivial
> >> factors application method, when necessary.
> >>
> >> Also struct clk_factors_config is extended with position
> >> of the PLL lock flag.
> >=20
> > Have you tested the current implementation, and found that it was not
> > working, or did you duplicate the arisc code directly?
>=20
> Also of note is that similar code probably doesn't crash in u-boot,
> because there, before changing the PLL1 clock, the cpu is switched to
> 24MHz osc, so it is not overclocked, even if factors align in such a way
> that you'd get the behavior I described in the other email.

That's also something that we can do.

See Meson's clk-cpu clock notifiers for example.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--dUqh8vgUBVXHzm9w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXiJypAAoJEBx+YmzsjxAgSs0P/0G2WFzLS1PHJsg6b9XWjgTE
K9fr+5ri3JGAInOPUK5pHfSS9kUnuEFkimxQ3uY6Kj6vncgCRC3bbBijaj8hEb2A
l48gDzezU7cbSLhqIb5xUEJEXFHTRkLiq56vy39ctBNQN/Nx3CuQ0nny9FbIBN8i
VDEabw1YhDdKiYlrgo1perkd23U2V+IRqrufPXRmK8kIRIJxZ5O5eP0FMAoTAQEg
b3Ugd67K7561jaieYrQkIEe9sIjo7bFqyCJLIQeySgEUbNP+JvOjEzun5X0L6wxb
BUL7VN+x6Ew7GbZQzEzRA0QEr2mNqJnpqKNdjmDUZ/LGtRbtg0aymVmmHy+g5VTs
E2A8lFKtA7GnavxmxhjWmPltg352+xCQ7IHQjAhUyEuk1Iqcb5dBdJK0/YlcyyMG
2vgvpy0kIX2PeE44ncdKB6xJu4YFbrTUrxeCGXQgwvsrAnIVr4AOvh4PB0rxwVFe
+rCrmgB5DLhGvw4jRqSqvdd4bM2kfY9dxh7BT34tW5HfB3pHu+m3J1nV1UV4X1tx
PAd75nA/gvG4hRqpIcQkaTTuOJ0FgUqBXD3zT9VFP77NEFgCr/rJjUYlYCY9J+zY
Mr4UA3jPk/G1mOdZ6xa6LNh6TWQ3SdmNakTQBB8y0ssilg4DCHt9OIq3+asyEUuP
Qg53ZBgMnBD46c67ntAD
=k0t/
-----END PGP SIGNATURE-----

--dUqh8vgUBVXHzm9w--
