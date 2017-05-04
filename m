Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
Date: Thu, 4 May 2017 16:04:31 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.io>
Subject: Re: [PATCH v2 02/10] pinctrl: sunxi: add definitions for add A20 and
 R40 support to A10 driver
Message-ID: <20170504140431.zhpcxvphxnxj7ipq@lukather>
References: <20170504135006.16483-1-icenowy@aosc.io>
 <20170504135006.16483-3-icenowy@aosc.io>
MIME-Version: 1.0
In-Reply-To: <20170504135006.16483-3-icenowy@aosc.io>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-sunxi@googlegroups.com,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============3602956582948042302=="
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>


--===============3602956582948042302==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kgqcsg4xoxy3tnku"
Content-Disposition: inline


--kgqcsg4xoxy3tnku
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 04, 2017 at 09:49:58PM +0800, Icenowy Zheng wrote:
> Allwinner A10, A20 and R40 SoCs have similar GPIO layout.
>=20
> Add SoC definitions in pinctrl-sunxi.h, in order to merge A20 support
> into A10 driver, and add R40 support into it.

While your commit log is good, the commit title is misleading since
you're not adding it to the A10 driver. You just adding SoC IDs
definitions

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--kgqcsg4xoxy3tnku
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJZCzTvAAoJEBx+YmzsjxAgd/cP/3OOUGdwACceEtrAhpsacN3x
zWHrvAdFSTCNwp8DeLePhib92C4lwwTWwGUmjc/GgEU6DqShm9LGd1Fv2yvssAFN
9OnbLbrWPPvlTJqcSZ6ni9Y5hh4m2FOvF3mSvJWfDpTjnu90wT8HIg7xKz5Ks/MZ
s0PGx+2BbGlwp0dTG5xPa5C8W8TkueblOU9b8uXS2g8I5LuI0hYbjCDq8hhXD7u7
C7SRMOkPXmtXfhWdNqbh/yfWW5NYtlqHaqMj5BlNKVlZaWwB4MJJts9alTpmAb90
diQuNLBuLtSwiC0s2/MeS3EKK/QlTt4KJkYsvegel+ddaLg0HMD7oICZ4OJvJuQx
9VXvS8j/MPKGM8bM3qVfqLOu7pMVIFacp+p7r9+RJuwfhUQ78uVPkGEERlj2bjKm
aLqGybWKE5dysQK8gpJ8VDbUCmaV2lntYEq5i+gS/U0WWnj9nx1Q+AO6U45i16sE
aJddZAcabqjZ0aKr+ANRJ9ac2h1mHFinVe1Cg8YgHHkl6sYohtq53I8GNdL2n3lb
itgSSkej412TkKLAE0WRSKUH2FesF2AFKDCQSlPAl1mYSxgkUZKVbgUHqglbOYDa
YnQaoUP1AMCff505JTdEKuBFiYQqXGPECmufP7iLEKP36Dbu6UNBXhLkcm12txgW
sZ9rerSJHsme9E/ykJi9
=hJRg
-----END PGP SIGNATURE-----

--kgqcsg4xoxy3tnku--


--===============3602956582948042302==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============3602956582948042302==--
