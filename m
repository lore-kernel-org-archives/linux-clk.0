Return-Path: <maxime.ripard@free-electrons.com>
Date: Fri, 15 Sep 2017 11:47:00 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Alexander Syring <alex@asyring.de>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] clk: sunxi-ng: Fix missing CLK_SET_RATE_PARENT in
 ccu-sun4i-a10.c
Message-ID: <20170915094700.j7hykv3iq5n2iksk@flea.lan>
References: <20170914120519.2006-1-alex@asyring.de>
 <CAGb2v677Ed4-iX6fkYEYZ1N9ZLKXfQQF2hhdbcbBCaB0-g174A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4kaq7swas62zbvmh"
In-Reply-To: <CAGb2v677Ed4-iX6fkYEYZ1N9ZLKXfQQF2hhdbcbBCaB0-g174A@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>


--4kaq7swas62zbvmh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 14, 2017 at 08:14:10PM +0800, Chen-Yu Tsai wrote:
> On Thu, Sep 14, 2017 at 8:05 PM, Alexander Syring <alex@asyring.de> wrote:
> > When using cpufreq-dt with default govenor other than "performance"
> > system freezes while booting.
> > Adding CLK_SET_RATE_PARENT | CLK_IS_CRITICAL to clk_cpu fixes the
> > problem.
> >
> > Tested on Cubietruck (A20).
> >
> > Fixes: c84f5683f6E ("clk: sunxi-ng: Add sun4i/sun7i CCU driver")
> >
> > Reported-by: Alexander Syring <alex@asyring.de>
>=20
> You typically don't need this if you yourself are the reporter.

Queued for 4.15.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--4kaq7swas62zbvmh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZu6GUAAoJEBx+YmzsjxAgOrIP/3Ja7cIUhbzLbZvqFQ7VYQAs
Uun0NSW/ho0Hwkm+PjJIOqBnvlBE2X1hHlk0DHTY+jtMyS1uVuBtqbsa9LSC8Zi3
B8QRU0Wrh3Wffq6ZcudcICyztTOAiZKbEosAX78j6SSlLUKZBvRW1LPGenucC0cL
6Nv99rBgdBSN9DgE+C1luC9dihe7rDiBE7ia2Zsd2UPY/phFAZVySTdIVSn2dpV4
fdL5YKniVadBitv8sQDYFnwIL5aebRoLa9Xdmt5CFneEaoPmDEz1fEo2opjAT90l
51DdM1XAy8+mImj+ZjWHjcHRM54Sd9fx0LnfTQwsh3wO4dnzNgL3OdwPbIv4YezV
eWZMGHI4ncYlZ0qVpq/17y5tU+tfBOQYd3HQ18isq8YrLc0bHFWWf/R0OJkyln42
yWp31QzQoHZfye1R98x0rEAs2slLe80irjSWq86a/JTw2icLIOfGFYoUyJgjO0gh
lGmLyddzQ4sp2GU8L3YyRL0xUmdwuekRhQKScUaCfV7mKEQuAHoYa6fVauxu+veH
dqr4nSFxPbKkiMD8jVknP30wqAU1T+3fAoTckZ821GrEOX4eWff6oGAM6UwaNmKy
RRs+HIBTs5cobN7NRqPJQ5fgaLzfyUdNZz3SWdEcRpcvc/p4WBNE41T6mmLlZ5E8
MZUSBwxcq9m9UrV4uuI+
=A4ip
-----END PGP SIGNATURE-----

--4kaq7swas62zbvmh--
