Return-Path: <maxime.ripard@free-electrons.com>
Date: Tue, 26 Jul 2016 10:56:51 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, dev@linux-sunxi.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH resend 1/9] clk: sunxi-ng: Fix inverted test condition in
 ccu_helper_wait_for_lock
Message-ID: <20160726085651.GB7190@lukather>
References: <1469516671-19377-1-git-send-email-wens@csie.org>
 <1469516671-19377-2-git-send-email-wens@csie.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0eh6TmSyL6TZE2Uz"
In-Reply-To: <1469516671-19377-2-git-send-email-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>


--0eh6TmSyL6TZE2Uz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 26, 2016 at 03:04:23PM +0800, Chen-Yu Tsai wrote:
> The condition passed to read*_poll_timeout() is the break condition,
> i.e. wait for this condition to happen and return success.
>=20
> The original code assumed the opposite, resulting in a warning when
> the PLL clock rate was changed but never lost it's lock as far as
> the readout indicated. This was verified by checking the read out
> register value.
>=20
> Fixes: 1d80c14248d6 ("clk: sunxi-ng: Add common infrastructure")
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> Acked-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Applied, thanks

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--0eh6TmSyL6TZE2Uz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXlyXTAAoJEBx+YmzsjxAgqLgP/RVNz5buAaHr6E7WFc3DAYh8
Y35JsUUcZxwcCZgbCrBGEb73Y7WsrIfWXQo/5/093BeMXrdOJ2HCxRz5l7N5XM81
P+JXVonKv6VLDOrtt1OlOeFMJDnJPMMvncLHqXHm/0LFgvUm7QlftKhHIqku/B2A
o/JInYqlj82pM59AosM3qgxmTiHbueZFJR6/pGeZ4mGz1F/Ba+GnB7zye2vZ8xl1
7wOMAa0vFfpfyDS9krXIZmokPJQKnDCiOjOA69Z7QVFHgroeiAybFKPyNczYEzHB
6vKDrbP4rQx9rHxemJgBhXdy03+EkFGC9ioeqPSsdLf5yEyYWT+Oh+V7EBXRQD3y
CQX1VtJRfXWGJyoGzgXke/X/5zP4qHH2DTwoKCRes1tI775sNCu+vmJtBpEeTkR4
hRoF6MXTeQWLGB0bDgtjzaMC+RDmoXNbkQ1t5N1wdUNWqVCbpVwVayja5NtwLtgW
tNJ7hTl+U8h28ZoaYRX9VDyjjB8J7mwrVogBmj9up7JtP2bmmZ7wdSl0fRvs+lFr
jToCUklhh2WnOKHNqY1zHMgUg5h61wsbdCjwL99GKrunIoSpRapCyvksM8LAW8o+
KH/bPWR5J1ts4YTcVJUbbvFriJJ43nSGkRzJnqIHxh5dH7aHZGX/QE4yU++dDQl6
JPblvim2rJe97n4DCc99
=nCZJ
-----END PGP SIGNATURE-----

--0eh6TmSyL6TZE2Uz--
