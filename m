Return-Path: <maxime.ripard@free-electrons.com>
Date: Tue, 20 Dec 2016 20:06:54 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: codekipper@gmail.com
Cc: linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	mturquette@baylibre.com, linux-sunxi@googlegroups.com
Subject: Re: [linux-sunxi][PATCH] clk: sunxi-ng: A31: Fix spdif clock register
Message-ID: <20161220190654.jkfzwh6suongevfz@lukather>
References: <20161220104446.22638-1-codekipper@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yqmuarbs6sb4h2zm"
In-Reply-To: <20161220104446.22638-1-codekipper@gmail.com>
List-ID: <linux-clk.vger.kernel.org>


--yqmuarbs6sb4h2zm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 20, 2016 at 11:44:46AM +0100, codekipper@gmail.com wrote:
> From: Marcus Cooper <codekipper@gmail.com>
>=20
> As the SPDIF was rarely documented on the earlier Allwinner SoCs
> it was assumed that it had a similar clock register to the one
> described in the H3 User Manual.
>=20
> However this is not the case and it looks to shares the same setup
> as the I2S clock registers.
>=20
> Signed-off-by: Marcus Cooper <codekipper@gmail.com>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--yqmuarbs6sb4h2zm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYWYFOAAoJEBx+YmzsjxAgWF8P/i4RRktswx54Uh8viCyrnZeu
J4tfB3Uzm89TLyXf9dWVooSBoFxEdk+fLvz2j6N888ifnBPmGTF9tLdcxwGnRXJ9
ruUttawqxBCct2MI/k2Pe5q/WA9MPb8X2kev2rCbH825HpoZrM2ypgaslszNDXB9
XEWMcuGFsAN5vKfrpaBDVqvymFcqdYqLIEggC3eXz8rIpd2Jw4JTcqm3zipks8lp
f8CvjaEfIzuAVyOFbBkq2evat9vG653FGVE2radf1dHlUPnMovW24d8YDeZx5qHc
NpRiOrPX094eyRlN+0CO8HVYG8Y9wUQRpH8RR+9mjzclY8vCFawugXG5p15zZ4hY
SrjL2GEq6P54Sb+2bHZTgeE/ThilMFvo2wW0tqOkYbNMkGcA4ST1Ft5dzCtgXsbH
mx5Rz8m6Sgij+ZQTHepYgs/oF0YsIM2S9E0kkg9jWK6FASf1H/fBWoOux1DRZhOO
DPGDzah2XG5gWSyCBwmcrl8BUtVc6M6lvzuakR3pClvu1svu8YEz2L1+gvBXYs8H
rVdiIuVNI04O+dc7XmpLj1S74iuzryir5bD93AELM02+VUMw/XYnhF/r5sgqeL41
8uuS733cGVLfqlxWVxUCz2ceAS4EFLOB8Uueahhih+iXjzlDP32tgT06zFsejxMb
em49SIFd1vKrjipwHNzq
=rYp6
-----END PGP SIGNATURE-----

--yqmuarbs6sb4h2zm--
