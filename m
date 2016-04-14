Return-Path: <maxime.ripard@free-electrons.com>
Date: Thu, 14 Apr 2016 17:56:34 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Vaishali Thakkar <vaishali.thakkar@oracle.com>
Cc: emilio@elopez.com.ar, mturquette@baylibre.com, sboyd@codeaurora.org,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: sunxi: Use resource_size
Message-ID: <20160414155634.GP4005@lukather>
References: <1460350383-7661-1-git-send-email-vaishali.thakkar@oracle.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jcwRHPSxFqmwpRFb"
In-Reply-To: <1460350383-7661-1-git-send-email-vaishali.thakkar@oracle.com>
List-ID: <linux-clk.vger.kernel.org>


--jcwRHPSxFqmwpRFb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 11, 2016 at 10:23:03AM +0530, Vaishali Thakkar wrote:
> Use the function resource_size instaed of explicit computation.
>=20
> Problem found using Coccinelle.
>=20
> Signed-off-by: Vaishali Thakkar <vaishali.thakkar@oracle.com>

Applied, thanks !
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--jcwRHPSxFqmwpRFb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXD72yAAoJEBx+YmzsjxAgw0IP/1HvDD9x32ExKr17Eqtow2q6
JmpmwNwZG6iGm94Pr7/Ev0d1FftUuzALoFnV5r91SK4UkzuGFCXv6+FJwgJr24fO
HlgfCTY7Vi0xRFRUepvZ4Yg+axzQAF1T5Y6VzLAqQejWClSUui28CSRBgnt5rlTm
K/XhWQ9jB75fXjiPg6/a/FjSgbVpqepyl3y5vlv+9PEyXpmB+6dQ4x3ayhXmp78J
ko8Hx4doRZiU9Br4DKPSMdJDm2mIDop2vxTwI6c8+Pj2K6CDKKrMo0/c3skBUHCL
ra4/i00zGkAWx4d9ZmQP9c9LWU/fNVnUbx8adMdCCbkx+QXfdWyH0lxpZrVsuA1A
KeuWmkeDgSj6QU9cUDFEstD/jjFXc2MZjhVk1fUCKaX4i6UYqM0zAqImpzd7fz5y
mAI3AsjvfXkU+9mI0yVDOqK1dbYD6rqSrr0rcmlkG4U/au6NsAO26R/ELLstxL3h
ZI7lRjTV9wqXXGSY64Fn42pQRrlbxcJZCguEBJLNLMKVuuILQ9DgS0m+17zIpP/H
xxxtF1K/nlkW0aquujvMX/CCzLl+ds9iSN2/uf8GMx/oR8QwJVbzKEcXR/WozKdq
nwtc834EdNsjPNT6ANtKyBKCrv9ptw+NgYUS4iFFS2+vPyqx0UWXfbfI6mOEQH9n
cbdL75MmvbdGdT1fzQIP
=SXh/
-----END PGP SIGNATURE-----

--jcwRHPSxFqmwpRFb--
