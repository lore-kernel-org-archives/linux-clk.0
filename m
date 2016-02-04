Return-Path: <maxime.ripard@free-electrons.com>
Date: Thu, 4 Feb 2016 13:08:17 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Emilio Lopez <emilio@elopez.com.ar>, heiko@sntech.de,
	Chen-Yu Tsai <wens@csie.org>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH 2/5] clk: sunxi: Make clocks setup functions take const
 pointer
Message-ID: <20160204120817.GE4270@lukather>
References: <1454402834-6385-1-git-send-email-maxime.ripard@free-electrons.com>
 <1454402834-6385-3-git-send-email-maxime.ripard@free-electrons.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+SfteS7bOf3dGlBC"
In-Reply-To: <1454402834-6385-3-git-send-email-maxime.ripard@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>


--+SfteS7bOf3dGlBC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 02, 2016 at 09:47:11AM +0100, Maxime Ripard wrote:
> All the data structure that we pass to the clocks setup functions are
> declared const, while our setup functions expects a regular pointer. This
> was hidden by the fact that we cast a void * pointer back to these
> structures, which made it go unnoticed.
>=20
> Fix the functions prototype.
>=20
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Applied with Andre and Chen-Yu Acked-by's

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--+SfteS7bOf3dGlBC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWsz8xAAoJEBx+YmzsjxAgB+gP/3lqgdRUDrJtxhxOolF3SBTL
zMUyToQ3/0rvU1wWQ5zlIdqMdqC9+Pbia52lPCRT1/Sjt04oXvLXVY/EdULbhTx/
EzzxNCeQODeSPFbCN3Pv7I4ULZrCFfxzai3Yxo+LI3D3cB5Vi6CB4LaTcvLASmKF
vS18le9Bpw6RDw4D0rOJC6GvRtgHf0TZ5rjEg6XqKTq3bbkw/jDvWyCIycdxXybe
14hJWoGhCyqMmJbh+0UwlB2V+IhA4C6kndThpK2XNvlLoKNNf68tsdNb6Led6Sg5
EEW3pGFOs0L7NDrS7qYvkT6YcqQY4CkMOCOAYO7tA6IJA0ng78eFri5Dbs9EOcjv
ylaROogXzD/1HJJ4uPpxtZPfYfNfKNMcBZS0e75K22MTFK1il2oY7CUpBHlk8ZWg
RpY/AGrmLX5tGZf5jYIU+qV61A7dfY+Cjf5iHiIdRqtCXOvTirSHx4fLNKklix58
TgNV2fbMAFJmU3qo/zk00b/HFipmS3rC27Ukf2VsuDo07aoprKL+fVqn+0qGuctP
u9HyILKTM1f581tzfnTyEZH4NFZIVU4seO4CZnGQXL7EV5WVQQqyuLZOVRT+BM9a
M6aYDtCo4fNLYmCobZ8idGMiVgs+z5WHsu81kSz6JUN/WF9BMWnyW8MvDBBn0pXA
gtDgL1OQVIAUGzPU4OSH
=4zGF
-----END PGP SIGNATURE-----

--+SfteS7bOf3dGlBC--
