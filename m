Return-Path: <maxime.ripard@free-electrons.com>
Date: Fri, 20 Oct 2017 09:29:04 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: mturquette@baylibre.com, sboyd@codeaurora.org
Cc: emilio@elopez.com.ar, wens@csie.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Corentin Labbe <clabbe.montjoie@gmail.com>
Subject: Re: [PATCH] clk: sunxi: fix build warning
Message-ID: <20171020072904.kfmx65lbqd3uw2qh@flea>
References: <20171019190948.5754-1-clabbe.montjoie@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2qvmdpm5era6zp5o"
In-Reply-To: <20171019190948.5754-1-clabbe.montjoie@gmail.com>
List-ID: <linux-clk.vger.kernel.org>


--2qvmdpm5era6zp5o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Stephen, Mike,

On Thu, Oct 19, 2017 at 09:09:48PM +0200, Corentin Labbe wrote:
> This patch fix the following build warning:
> drivers/clk/sunxi/clk-factors.c:279:14: warning: variable 'name' set but =
not used [-Wunused-but-set-variable]
>=20
> Signed-off-by: Corentin Labbe <clabbe.montjoie@gmail.com>

Acked-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Can you apply that patch directly? This is the only fix that we're
supposed to have for 4.14.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--2qvmdpm5era6zp5o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZ6aXAAAoJEBx+YmzsjxAgUVIP/2a6QiA3keTstSJwi1aQhVP4
LOBCXrqMd68XfNAmGnLX1BZScZVoaFUUugMetYovhcpCvbfiJ/5KcfUmGFDDOhiR
Ndy2Cnl+jeKIqW3HL77acIjRTeI9jM7tLo5eWzHEf38mJMw26TMkbF0PA0/2Onck
0otffb7T+nK9pydc33zh3dxnezI2ni9p4ViSbRqcaq75IoQOXP3xxuy7TKs/VT6V
UKSUux7ZLeKAjbWyrkbDpUHxL9xANwFGrseT7qYMtvqu6NcC2HrvGhhBECwE1DN+
XduHjRkapMRsAbYy/8Su8Po24lmUYqdjoX5lJPjrLPyqDZZsjx3A8WGcsUEITH1N
qkx4ZTNd68TjcK3qPsx7imLa1Diwj0E5941+NseV3pu3RrkRmgd6pHMoDZbk7O8G
qLKvg9pQRIQziHRmnTOOSFRBfyyHAyDLPSXQ7fYYSb0tS5ehuIbE7kwb0THlBMZ+
kxR1VRKEfudb4X7QwkwQWP8INpb88iovlxvr9hBFzF8572+07ghDSP7fdw6xsIl9
iGedfwNU4UEwLfZUDVnuoqyUf3i1pcNZQf3sDbwpojPTFo376E4VWr+XggILMNal
Hnk73tiMIJwNBPyATKAHMthVwVCbq3DFpESZ+jvsIyPfVz3osyf7KOu2x1gQ62oO
I6pSKZjUsZ1KkjLCBQ/u
=mOd8
-----END PGP SIGNATURE-----

--2qvmdpm5era6zp5o--
