Return-Path: <maxime.ripard@free-electrons.com>
Date: Thu, 4 Jun 2015 18:21:25 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: linux-kernel@vger.kernel.org,
	Emilio =?iso-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>,
	Mike Turquette <mturquette@linaro.org>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] drivers/clk: convert sunxi/clk-mod0.c to use
 builtin_platform_driver
Message-ID: <20150604162125.GN23777@lukather>
References: <1431287385-1526-1-git-send-email-paul.gortmaker@windriver.com>
 <1433358578-9579-1-git-send-email-paul.gortmaker@windriver.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7//HIyYuZny8+TsE"
In-Reply-To: <1433358578-9579-1-git-send-email-paul.gortmaker@windriver.com>
List-ID: <linux-clk.vger.kernel.org>


--7//HIyYuZny8+TsE
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 03, 2015 at 03:09:38PM -0400, Paul Gortmaker wrote:
> This driver builds based on obj-y and hence will not ever be
> modular.  Change it to use the non-modular registration so that it
> won't suffer a compile fail once a header move places the modular
> registration within the module.h file.
>=20
> Cc: "Emilio L=F3pez" <emilio@elopez.com.ar>
> Cc: Mike Turquette <mturquette@linaro.org>
> Cc: Stephen Boyd <sboyd@codeaurora.org>
> Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
> Cc: linux-clk@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

Acked-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--7//HIyYuZny8+TsE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVcHsFAAoJEBx+YmzsjxAg6lYP/i0yArCyRaQthW1e/BNKy8WM
x4f3WKjdunSAka5BCKP3lea1qiSzjPcH5v3tmwUDFCHmLniJdjnN2m9bm3uq0mfQ
321YoQ1UWfeGv76K0+nC//D0c2+w7GGFB74sewwKgOR8ie5mkiHDEVbLK2zaogDA
VavS4rJfB+p4hGBCttf/sJu1+6s5cdWqlYMtCNH43kreDH9RcTPNxRsjAF6ny4/Q
1vGnJUSEfVAglp4QZns4VdEB8L+UAODj9GIU21ILFjuKFoHHMIzjY5biicB8o+4X
yBxHn1anRB2tQ7Uz3Er7hLAx4rqy7BGMmSsW//Hc9M1ilBFafVL8HQHThDqwkwv2
TOx+dSN27mxG/gwtUT78v2ibuSl93Slx6vqcPKg5gGoXIKZo0nSLqJbwf8vWvLye
KBuijF/kj8w5ZpKFR93wubQ2YYGeUH0HLHBk9Amoe1QQ7PDKKXAqvxmvXE0td6gp
XftiUzODc1ErgmbgU4z4Usdp7roxWUFJv6JW0s/ZodCAQkxqd7hwkDxVPNvY6bSV
kvFtk+0Y15DTJWU4Uw8kr76sw0rhDHwwIH1cwS62Y5JeHyDjc6Y/7cWD9ZlQSopi
IhBSwC4ZEXjbTrs69dDPQNHZps1YjbQHalQvmY1dAccGWIBIMoXUWd8QzkyYF4aU
PuXHQeO+UReaEH4Ewi0N
=wYcW
-----END PGP SIGNATURE-----

--7//HIyYuZny8+TsE--
