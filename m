Return-Path: <maxime.ripard@free-electrons.com>
Date: Sat, 25 Jun 2016 09:13:38 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: megous@megous.com
Cc: dev@linux-sunxi.org, linux-arm-kernel@lists.infradead.org,
	Josef Gajdusek <atx@atx.name>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Chen-Yu Tsai <wens@csie.org>,
	Emilio =?iso-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>,
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 01/14] ARM: clk: sunxi: Add driver for the H3 THS clock
Message-ID: <20160625071338.GC4000@lukather>
References: <20160625034511.7966-1-megous@megous.com>
 <20160625034511.7966-2-megous@megous.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lMM8JwqTlfDpEaS6"
In-Reply-To: <20160625034511.7966-2-megous@megous.com>
List-ID: <linux-clk.vger.kernel.org>


--lMM8JwqTlfDpEaS6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Jun 25, 2016 at 05:44:58AM +0200, megous@megous.com wrote:
> From: Josef Gajdusek <atx@atx.name>
>=20
> This patch adds a driver for the THS clock which is present on the
> Allwinner H3.
>
> Signed-off-by: Josef Gajdusek <atx@atx.name>

You might not have noticed, but we are currently rewriting the whole
clock support for the Allwinner SoCs, targetting the H3 as the first
SoC to use it.

There's already some support for the H3 THS clock, so please use that
instead.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--lMM8JwqTlfDpEaS6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXbi8iAAoJEBx+YmzsjxAgv3oP/0Y+596DB6x2wSugN+1NPZAl
9ZnukzcQl/XXFWxO7xvOXwFlXUfzTAYiQ4rGjUiPxFAphnX7lsg/ISylm/cC0ed/
/wUKrYurv5i6uPkuWkG3pCxLgACey2rjqoBnfiZXwZJijn0ptFXunqApxqZPAKn3
9dHVaiWREiohI8jKWKUo1mmLgOSwL6jDXcO7VzWKfY8Q5xf/4/I6aCoTxVvya7r8
0WKhN1K4/FrEXf0Q+XCPEf/+L1O4CsSj41b5T4Qx7xAHuW06GdmzP7QEs8GMxZ++
OdoNTeuTDSiK2T9T6tryu0R6Ctcg+WY1gQaPWeo3x9j72iTe+ZhV6k7hzNjhAI91
H7rOT7BGJz1iVZ1JPT57g3oZykQR9P4wrNDNqsK58zVpA/vXdQJHnWNYF+4Oc0GZ
0rwmc8EGvGQvn3YZA5E/AhzSxhtgWzU19pWbkfgGSTt7q5mnsxjG2rRnL7yjjXie
UQAzbuhsOd3JUCmRZX6AlSdNb9AfyS3WnTzFrYlJhnQQL9CZp6THqJBVCnKLpEQE
KQg49xjJP5qS/tY3gQP59J/PG+q/sODOtbSyflxv+SWhhdqKgciFvaW65Mc+y0rB
DM0CLYnzzk1d/3KjkJ4a7wpNXQSd7Me1uH7TmH+SthbQCw4efb29lJ9WFDwSRZ76
OfRVcV9RTXVY6v9Jfus0
=rBzp
-----END PGP SIGNATURE-----

--lMM8JwqTlfDpEaS6--
