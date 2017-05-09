Return-Path: <maxime.ripard@free-electrons.com>
Date: Tue, 9 May 2017 21:09:00 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: icenowy@aosc.io
Cc: Yong Deng <iemdey@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] clk: sunxi-ng: v3s: Fix usb otg device reset bit
Message-ID: <20170509190900.3m6fhq2mi6adc2s7@lukather>
References: <1493980317-39775-1-git-send-email-iemdey@gmail.com>
 <20170505200440.zje5s7x2seglxzi6@lukather>
 <a7ef1477b9dec8009e9c40bce5d42267@aosc.io>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qsqnrdgrho2uamw2"
In-Reply-To: <a7ef1477b9dec8009e9c40bce5d42267@aosc.io>
List-ID: <linux-clk.vger.kernel.org>


--qsqnrdgrho2uamw2
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 06, 2017 at 10:51:25PM +0800, icenowy@aosc.io wrote:
> =E5=9C=A8 2017-05-06 04:04=EF=BC=8CMaxime Ripard =E5=86=99=E9=81=93=EF=BC=
=9A
> > Hi,
> >=20
> > On Fri, May 05, 2017 at 06:31:57PM +0800, Yong Deng wrote:
> > > V3S's usb otg device reset bit should be 24, not 23.
> > >=20
> > > Signed-off-by: Yong Deng <iemdey@gmail.com>
> > > Reviewed-By: Icenowy Zheng <icenowy@aosc.io>
> >=20
> > Applied, thanks.
> > Maxime
>=20
> Maybe it should also apply to 4.11 stable?
>=20
> Cc: stable@vger.kernel.org

I just added it, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--qsqnrdgrho2uamw2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJZEhPGAAoJEBx+YmzsjxAg2icQAI6noxYZMlPJM7ag0SZCH5fp
idnk19lkk7pC1BE7PiAnIBkNf+Unzoh/IPdQkEbygjugAJ6dKj0a0QNaAJK18tJk
mzU+ZNeL+WeJUyIYG8ywOYOVYNIj2Or0eVNNUw1rILGdvvERmyDvCRH11uZOJOhY
SkEeAPRkmhuydV/idzevK3swqQtrWm6h8P7Z1qNuV382cJo64gLVE5j0yVzMo518
kyr4lcAZea2j/BzG39lTTuD2PmBgHewmxjMV40RADwERFA5zmFgw/rR6mbJb76uC
nUUYLOcnsyofyp9nCY2nNAyKMzUhsa/qTzKHG67l0N6cu7zV1/INKKa2047H4OnJ
YCKlQGkfscqwnnc072yfEBhMSwIV4h6Gl1DzzGRl3E5P7sUeMWBTXNRKotIJXkh4
apJ2TkGSf6FYA0+F3IDrZBV2L2F4P6cpswPa4xShMSh9NWw7jn1sNIn6MbCUowB3
VH2OsOnUq9lESHVVFR8S8TScJyONUFrReKTCLCm0CPK+1XWhyH8zzubJDFcK5aQ6
/CVtxoj5rrl5mfxA/BUpn08gSuNIj0NQ/Es/mkWcyg5GpXFlE3MhYd2wQ7sO+WXw
UsCzK5cDPxGJyWvFyG7p96NNSHolOaOjgx+zDzaKpVOwO707gv8ajUBItWjEWhnH
0tDI3fhFDUAmnTdYR8cf
=GSyB
-----END PGP SIGNATURE-----

--qsqnrdgrho2uamw2--
