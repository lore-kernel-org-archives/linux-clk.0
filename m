Return-Path: <maxime.ripard@free-electrons.com>
Date: Sat, 21 Jan 2017 18:34:47 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 5/7] clk: sunxi-ng: Add sun5i CCU driver
Message-ID: <20170121173447.hjtddypjxr6achyt@lukather>
References: <cover.5df5469d9c7a6233e225a875dca513a03b05e871.1484897383.git-series.maxime.ripard@free-electrons.com>
 <a51d856e896b7fe59a1a544a7de3081688e377ff.1484897383.git-series.maxime.ripard@free-electrons.com>
 <CAGb2v65uzxu7P3AcnhJJ_rEvT5OL8=d9-jVjU5sWNNqJpkpSRw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hzeknru6p7sy5pdl"
In-Reply-To: <CAGb2v65uzxu7P3AcnhJJ_rEvT5OL8=d9-jVjU5sWNNqJpkpSRw@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>


--hzeknru6p7sy5pdl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Jan 21, 2017 at 09:34:15AM +0800, Chen-Yu Tsai wrote:
> On Fri, Jan 20, 2017 at 3:29 PM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
> > The Allwinner A10s, A13, R8 and NextThing GR8 are all based on the same
> > silicon, and all share the same clocks.
> >
> > However, they're not packaged in the same way, and therefore not all the
> > controllers are actually available on all these SoCs.
> >
> > Introduce a clock controller driver for all these SoCs with different
> > compatibles to take that into account.
> >
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
>=20
> Acked-by: Chen-Yu Tsai <wens@csie.org>

Thanks!

> > ---
> >  drivers/clk/sunxi-ng/Kconfig          |   10 +-
> >  drivers/clk/sunxi-ng/Makefile         |    1 +-
> >  drivers/clk/sunxi-ng/ccu-sun5i.c      | 1008 +++++++++++++++++++++++++=
+-
> >  drivers/clk/sunxi-ng/ccu-sun5i.h      |   67 ++-
> >  include/dt-bindings/clock/sun5i-ccu.h |  103 +++-
> >  include/dt-bindings/reset/sun5i-ccu.h |   32 +-
>=20
> I thought having these 2 in a separate patch would be better for
> cross tree merges?

Not really. This was needed when we had several drivers using it, but
since we merged all of them, it's not really needed anymore. Having it
split wouldn't make it easier, because both the DT bits and the
drivers bits would depend on it.

We don't have much for the sun5i stuff queued for 4.11, so we can just
have the DT bits merged through the clk tree.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--hzeknru6p7sy5pdl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYg5uzAAoJEBx+YmzsjxAgZ7QP/0ZuADe9kzSejUmU2tESlyAP
ayNN9e3c3YrDfZNRhQCMw//BkbN6a7gxd6vQcfI6H+r3BoNsngJQN5EFzIfflCZv
qp5WX3Oq2tz5TwWl6wEEeooiDLx22hz8EPHto+KcELzwS0N6qQ4O9MJtRuOWfw3K
WuDZgoDgBEh6/KNoqjPW8dZ6ytfK/wnpXjVnD000q/75x/fDGq8gG4ujUJWtDT4W
xd6PBxRTzX+t6D3ueZEzybBRUTHxcIyVjYTohbqCf2cRE7p62yH2UrmjnOzocEg+
dPHJVQ8KB19oKc4zB4/hzaM4QUs+VkIRHpt64Jiuao53rBLFD78P4xZ8SqxM4nN1
eAsUwcn1H11BBipxlbgYU0UxRrpyqybzKjblWNFQagn7IkJ8Y18pf7PASk2IyDcm
mkPKYlbTTHntiWBkHwJT94yobdG10+YOSZ+k88FgwZF9+oIssEE6m+8sTjRofU3T
sTN4sVcEcTxcrZUnSa+lTgxyIXUsbtIpPKHFMypr+A9R3GChZ620ol+PVyZ+ODid
ZYyX6hxzJwROVf+GqLbXP4CDZeGmUeumRfnjonql2VkHpX7mJWLBaw+Id+MEl/XC
gG7hvU4sQYBboOrvjVjyB9dvvWcrz9ZVvY3kqnLT259PMbN+/nsChZjIefFoLDTz
caj0m7jHhkdENyfUu9BW
=P50t
-----END PGP SIGNATURE-----

--hzeknru6p7sy5pdl--
