Return-Path: <maxime.ripard@free-electrons.com>
Date: Mon, 6 Feb 2017 11:51:20 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH] clk: sunxi-ng: Check kzalloc() for errors and cleanup
 error path
Message-ID: <20170206105120.5gxti6szfmxi4psc@lukather>
References: <20170203230050.26181-1-sboyd@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jarxidfms4qhd4vw"
In-Reply-To: <20170203230050.26181-1-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>


--jarxidfms4qhd4vw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 03, 2017 at 03:00:50PM -0800, Stephen Boyd wrote:
> This kzalloc() could fail. Let's bail out with -ENOMEM here
> instead of NULL dereferencing. That silences static checkers. We
> should also cleanup on the error path even though this function
> returning an error probably means the system won't boot.
>=20
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>

Acked-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Can you apply it directly?

Thanks,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--jarxidfms4qhd4vw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYmFUoAAoJEBx+YmzsjxAgsAcP/1LQKfyMTCeliLvxTWrM9gvF
Ruowbvu769rMj7d8ih6l5e5NNkfJnd0zHHOqZJpKJp+uLGijM5bmHr3H0JrrLcKn
ogQ7u5o7a0SDen6bzUnVgy4Om5g0xN+bLrms/kejhv0xlBFiorZiLeLIWgfhoOD4
JjxfI+xdATmz29I2fVO1zT4IiLntdRS4zHDIfDJjBMJng9naPS6habIZSyxLy10i
il4YJpN9nCBXzjoX/VoTP6ev2fyMgVoBUgiZVbGJa1QdMpoiiG+yaoExs6dp0fgm
3ikMw5d9Ro4bGOecHepEw0p+A9NyCcA4kNSPj6FIFeHepBvC4bro3oYaz1xCNg62
wFOp0xcqRi8GkP2KMOWofcAEwKr3CaNwJIUb2m0WIU7abOfZ6igdyUlYbFah5MzY
XF47yjbUGamPyu6SzZoN2B99BVButJUkEZWJ0aEJ6nVLLLzQ+Gp1aDlxv9R5/Bdc
9MEEuowrfEWvJr/NCtgWZZJDjr860iNl+Yip0GQ8SROTa4hMPBbw82MJ280FXiYw
DFSpJbelJKSSKlroaZcMhIo/0pY0QZ/G5HWb6YEBNQqOVc7bPaMV5jr/O6BLKvUI
cbl0JkIM1HrpOqVwaI2ThlDsb9h+LlBsk9LiZ59vVwUttgRBYxeZWKwElG0oy6Oi
b8YYQP5o923AJTUvsyOL
=eUew
-----END PGP SIGNATURE-----

--jarxidfms4qhd4vw--
