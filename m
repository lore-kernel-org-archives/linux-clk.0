Return-Path: <maxime.ripard@free-electrons.com>
Date: Sun, 13 Dec 2015 22:08:09 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Emilio =?iso-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>,
	Jens Kuske <jenskuske@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, Chen-Yu Tsai <wens@csie.org>,
	linux-clk@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [patch] clk: sunxi: signedness bug in sun8i_h3_bus_gates_init()
Message-ID: <20151213210809.GD19456@lukather>
References: <20151212124346.GC21408@mwanda>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="n/aVsWSeQ4JHkrmm"
In-Reply-To: <20151212124346.GC21408@mwanda>
List-ID: <linux-clk.vger.kernel.org>


--n/aVsWSeQ4JHkrmm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 12, 2015 at 03:43:46PM +0300, Dan Carpenter wrote:
> "index" needs to be signed for the error handling to work.
>=20
> Fixes: ab6e23a4e388 ('clk: sunxi: Add H3 clocks support')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--n/aVsWSeQ4JHkrmm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWbd45AAoJEBx+YmzsjxAgaA4QAII0Y5/Rd8ZQUqcoF2TutjlX
YGSEI8U2ZvaRN4Yi9SMA657aHFiHPEBJDY1FYcta63ITJKjanpAynVgnL/CzlRiy
lHxLOxcm2sAhUmtlVBWxTUfz/9ReV0FsVgYGHOdtaY+uqkqhnobYzHO/8lhCB45T
NrVEpLblbiAzqG67gBVvdIFd/eB8RnFpF7F8AKjW/ZKliANrEyayoa/netpNkjE3
Im7hQBZ8r5hr2bXmjpzCU8lYF5BWrwdh9yH52d97Q0KUTo5g4ItoW3IjTsgmrrqv
EDq0kOyD/8xbutTVbShuhrA9WDUB0lopu9Lcrqrgk9395LSn1O4haJi2a1dBKS47
l4UTYuNAiKKEO1akgFd/BToZV5G9rQJVA3oC7fXC34b6fxn2BRsTr5rrE+KyX0Yn
o5o6HG9vZtOQaB0uX3/b44ondedJG80ErQ+pDNQg1pBYfBPUEFhlVeVdS46mrGuv
qw2XhY0C3CkxTqWNo7kTOchslk8CtbLwJjCFQPeh+mDNHHC1OnuHQ+PZ6hhvJmw8
6UhiErNUmUXKiKAOjfISj7I6cHjXQ9U55yPA+ZVkHNbaXSl9BOfuriav9/jGe3uW
SGp86gWyvFGG2eR417JKscblKpzNYWtJlb4Bpv7w2kx1aMIc2dAbt4VU9pDFFUZY
IS8xWSjjSpX/8dnD3uFx
=AMZQ
-----END PGP SIGNATURE-----

--n/aVsWSeQ4JHkrmm--
