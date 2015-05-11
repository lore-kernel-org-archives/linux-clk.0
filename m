Return-Path: <maxime.ripard@free-electrons.com>
Date: Mon, 11 May 2015 21:43:36 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: linux-kernel@vger.kernel.org
Cc: Mike Turquette <mturquette@linaro.org>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/6] clk: asm9260: Fix of_io_request_and_map error check
Message-ID: <20150511194336.GH10961@lukather>
References: <1430579006-32702-1-git-send-email-maxime.ripard@free-electrons.com>
 <1430579006-32702-2-git-send-email-maxime.ripard@free-electrons.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9jHkwA2TBA/ec6v+"
In-Reply-To: <1430579006-32702-2-git-send-email-maxime.ripard@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>


--9jHkwA2TBA/ec6v+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Mike, Stephen,

On Sat, May 02, 2015 at 05:03:21PM +0200, Maxime Ripard wrote:
> of_io_request_and map returns an error pointer, but the current code assu=
mes
> that on error the returned pointer will be NULL.
>=20
> Obviously, that makes the check completely useless. Change the test to ac=
tually
> check for the proper error code.
>=20
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> Cc: Mike Turquette <mturquette@linaro.org>
> Cc: Stephen Boyd <sboyd@codeaurora.org>
> Cc: linux-clk@vger.kernel.org

There doesn't seem to be a sub-maintainer for that driver, I guess it
should go through your tree?

Thanks,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--9jHkwA2TBA/ec6v+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVUQZoAAoJEBx+YmzsjxAg2R4QAJwZsGWiVkg6hYt38PAQ+kk7
YEfm+uFxNiFF4QS462QIRvPNZ+yQ7kfQOLir/riW5FfGQ4q1cAy9cA0ChGGOXO5Z
ZDyi7pnO+96DuQx4P51epMeFJf724CVq8+h3ygnTbNxfIpuQFL99NM4ROMR6Xs0Z
pyG7sTmkS8KQ4GWLyPeQJ4JRVPDipItpIddejm+20ANtIuPHrAJVzqBP0OoWeYgS
emHGSBLfS7PNGLComF9lN/2C9t7pTJOTNtIk17yo/Q2raPzQloUroCuIAGmZW9Z4
Lu/jvie9EeraRR9G/dx9MPKiMIa3c17fJAIBBFf/gaygohriAaK7Jx7QvnZd5OEB
6vqgnmtr5foAO6HajUJsCsTZa5TFkFOPQjccgjISmVj+TiDDwwsrhLvlgtGogfsv
UztLG//m4D9QE1cUvmRDanoFyqoAjqTQV6LxKNVT4roisl08Oy5uM8ZDUTIjBatv
wmtmDiF+AuNFx2PkNQXo/xxnAfpWyJh1Zs3mffhLW74X21HHv6OPGb9xsrKYVaz6
oLouZSNU7QW7rXXZef4Pyefj0VYqslqgfytP1U2Zq8oMY+7OXq1I+EdpNdxHOmkA
Sj3oHkhQztlhkg/UE6AeeHS8ANS3tb0wc9N7UEC/qpFmg5un2qyGNLg21qa74G9M
z40ddxY0sLUqjOGA1GPk
=oREL
-----END PGP SIGNATURE-----

--9jHkwA2TBA/ec6v+--
