Return-Path: <maxime.ripard@free-electrons.com>
Date: Sat, 27 Aug 2016 14:15:45 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: jorik@kippendief.biz
Cc: mturquette@baylibre.com, sboyd@codeaurora.org, wens@csie.org,
	megous@megous.com, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: sunxi-ng: Fix wrong reset register offsets
Message-ID: <20160827121545.GT3165@lukather>
References: <1472210653-32170-1-git-send-email-jorik@kippendief.biz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="eu12+zRL7gQwOC+E"
In-Reply-To: <1472210653-32170-1-git-send-email-jorik@kippendief.biz>
List-ID: <linux-clk.vger.kernel.org>


--eu12+zRL7gQwOC+E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Thanks a lot for your patch.

On Fri, Aug 26, 2016 at 01:24:13PM +0200, jorik@kippendief.biz wrote:
> From: Jorik Jonker <jorik@kippendief.biz>
>=20
> The reset register offsets for UART*, I2C* and SCR were off by a few byte=
s.

You're missing your signed-off-by though. Could you resend it with it?

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--eu12+zRL7gQwOC+E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXwYRxAAoJEBx+YmzsjxAgKL0P/3UidqANTqKn22NK0OEQYqMx
XW6vfI3bilLoNgswlQ083gLsIsD1OfR2ytDnz7DfuKLNHT9r3EQG+kMyB2hjKvRW
EGYN8oRojwlib9XulW6w1G/YdB+3TuQNOL4Qx0dznqpMF5hRxkfMRCvoZFF9kfqu
8nJfkcNvyprm/hzMedihQocTlvGt/FpmEblYSj+Oib1rdx2O9cWHJ3KrkkzJoy4y
W7skG1G6yFj+kKsATDg6m1gE9gVFk5PYMbGk7Y+xClGQ5VXunVYFMxwXErCMH7oS
SZSn0dTsmkrKl6nDAzLghoOHdy2A2nt0k5/dA/204uEaTUw2YdJqJE6FuuuhQ02q
zxkRY3Z9q4qXjatrAOsi3XVZXoTDgsPE6fF4YLHglHAWDhsBWaMaa82KXp2xYJ5u
XTCjELV8ps5srm7fhnPIZl5nqyN7p1u77uU3wTREBQt/nWd8k6oWavjmG4I7+VD2
KxeafXTavW6TNxfC4IuhcpkyQJ8yx09T1C2gU6JKMJUVHBdbkGb4jnAYiwGJeXuR
4q6Bcw/mPkl0T56CSgubXhoyXXIz5+S0x2gfMcwaQk29zkWNCiJ9sCfQXE4J2ERp
hbSv1KNPJXE5aMRqMDxUm/y1f2t6n+sgtPGtA1dpxiF+b3UhFgzPtOPIBIV8JpgC
F2CFED+qXrTsw4WNsiGX
=ZIxb
-----END PGP SIGNATURE-----

--eu12+zRL7gQwOC+E--
