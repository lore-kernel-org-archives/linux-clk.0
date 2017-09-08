Return-Path: <maxime.ripard@free-electrons.com>
Date: Fri, 8 Sep 2017 09:37:33 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: sunxi-ng: Implement reset control status readback
Message-ID: <20170908073733.k26y54ddunjf7pnp@flea.lan>
References: <20170908043954.13019-1-wens@csie.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5xlsvuxw3j4ganvd"
In-Reply-To: <20170908043954.13019-1-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>


--5xlsvuxw3j4ganvd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 08, 2017 at 12:39:54PM +0800, Chen-Yu Tsai wrote:
> Until now we were not providing a way to read back the status of our
> reset controls. Consumers had no real way to be certain whether a
> peripheral was held in reset or not.
>=20
> Implement the status callback to complete the API support.
>=20
> Fixes: 1d80c14248d6 ("clk: sunxi-ng: Add common infrastructure")
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Acked-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--5xlsvuxw3j4ganvd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZski9AAoJEBx+YmzsjxAgO0kP/iAuBZ5uPB9XqDfhzaiHkaPK
67aNslG26QCM/TiWfAu9ogiJIyATwA32OMXomL5uf4X+Y2rLVzISdvARUrh7SgyX
PYzg0DZ3LEiRK8cyIXwGagUEKnnEhkpgKbKD7vdCxPK+wGmrgT3HrZDlKzxM7DbY
ejRmeukrXo6EhsoLODcCMatguTKDSowFO+3tleUeHd3vHCPupVFMeABmO6obKdUg
AdW62cHjQAJzMQK8qAoWvzL3quvrqcZGMUulLXAJpqLFkUDAXAawGPscW0zzEyTX
DL57M2f/bMBs/6U4oNJC+LfDao9Sv8A0h7ZDB82DFNCqpu6vERS4DdE2OTJZtWYT
Qj8XqBc/lkUcaJ0/kA/+d7Pz68PflznON6CLcMFLLHewNvWtxSmSoTiK9YMqeUP5
0jzCnKQXZwXb4joMZiOvRwM6wGD26uPEeOT9sTRe/JuZiFa5cPLTslcAYIOZbk7W
JoYKQ34REOLkL+opjXX8uvqNGLij1B0TKG6DTQMgy3f4q9Bn+gNhTT1JfAVfLujp
tjMTbVhOdgcRhG/ZDlpfK5SpkpjlxR/rMhgwIxLia/tKNl8fihIm1sAOihqviHgR
VtGa9bg2l2HSJBYIdxDOz3mfkxMilvoAFMlOMt4+QAV3VfbjMJuEKCOgOMYN16gV
Q7zJwnh1dbAXL+a8KIVc
=0b/Z
-----END PGP SIGNATURE-----

--5xlsvuxw3j4ganvd--
