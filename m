Return-Path: <maxime.ripard@free-electrons.com>
Date: Wed, 27 Jan 2016 18:32:46 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Vishnu Patekar <vishnupatekar0510@gmail.com>,
	linux-sunxi@googlegroups.com
Subject: Re: [PATCH RFC 07/11] clk: sunxi: factors: Support custom formulas
Message-ID: <20160127173246.GL4317@lukather>
References: <1453727747-23307-1-git-send-email-wens@csie.org>
 <1453727747-23307-8-git-send-email-wens@csie.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5mZBmBd1ZkdwT1ny"
In-Reply-To: <1453727747-23307-8-git-send-email-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>


--5mZBmBd1ZkdwT1ny
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 25, 2016 at 09:15:43PM +0800, Chen-Yu Tsai wrote:
> Some clocks cannot be modelled using the standard factors clk formula,
> such as clocks with special pre-dividers on one parent, or clocks
> with all power-of-two dividers.
>=20
> Add support for a custom .recalc callback for factors clk. Also pass
> the current parent index to the .get_factor and .recalc callbacks.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--5mZBmBd1ZkdwT1ny
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWqP8+AAoJEBx+YmzsjxAgH8IP/jnw7o5KLzaJ3dTuWpbKuReS
Hp5km9o/+tIo7xO9d61MUNq8+q5zQXWM1eZzWEbCqR6Uw6CqmTwCmn4FU7xQVQz9
MRUNHE/3M5QSUyTPKAzaQ7Lc33ZDXHXS15/VmH6o3EglAvO6eJFYpVQuoONIIaT5
EzNxiG9lmwb+ftS85gNJlYZ18m7B1zLyoVTKqr3ycmhqIhp94oJMED9enLQ55RHL
K2xfoFBnQ4cr1dVJ4p2F232iwwg7ysNuMFM6TqjOQ0xhBT+I23Zh5v5sodI+J7y3
u2FqxQiEOvXwAuiiXfE+2rC7noA/zzYBxudqAzJLV1xW+F5VLDvccq+Axkt9F5AW
0bVjSuOT7NlPMCAqY1AyRz0daz0VZTTX0HAu9rkz0ATaB28cdA7OAkUmJ0WBmkNc
de6jDLR7NFN+bdytWwH92stxwUBuGXkw/YO87zsGb2ZhQDVXJYKCUDuQWnDYlrHU
hgCn3Oj838ohPRma9uhl0F7qr5IMFDAnxrsUKiT6WGvKEQ8fwtHvxtNkBP5UGDzZ
kGH37YDD8UIDkdfLNUA/MPC+3IVHDKmUmpJCoh6ZpZkJ8bxc0LK6ZOvp2qC2RW9a
MKMqQt5OkT7FGOG3fKQ4nUI30MEi7bMvoNxD/EVqWH5iH7/UVcA7aOIlQJIRUcu7
njPSy8LHOWrNYwJxAWAH
=Bxv+
-----END PGP SIGNATURE-----

--5mZBmBd1ZkdwT1ny--
