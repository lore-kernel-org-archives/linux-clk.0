Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
Date: Thu, 23 Feb 2017 16:20:28 -0800
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.xyz>
Subject: Re: [linux-sunxi] Re: [RFC PATCH 4/9] clk: sunxi-ng: support R40 SoC
Message-ID: <20170224002028.miupa6dzefgxbfse@lukather>
References: <20170222231738.HXRSmi86@smtp1o.mail.yandex.net>
MIME-Version: 1.0
In-Reply-To: <20170222231738.HXRSmi86@smtp1o.mail.yandex.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Linus Walleij <linus.walleij@linaro.org>, Chen-Yu Tsai <wens@csie.org>,
 Kishon Vijay Abraham I <kishon@ti.com>, linux-gpio@vger.kernel.org,
 linux-sunxi@googlegroups.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============0533806570926305171=="
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>


--===============0533806570926305171==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="g5of3ncydxxzu2w7"
Content-Disposition: inline


--g5of3ncydxxzu2w7
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 22, 2017 at 01:54:58PM +0800, Icenowy Zheng wrote:
>=20
> 2017=E5=B9=B42=E6=9C=8822=E6=97=A5 07:03=E4=BA=8E Maxime Ripard <maxime.r=
ipard@free-electrons.com>=E5=86=99=E9=81=93=EF=BC=9A
> >
> > Hi,=20
> >
> > On Sat, Feb 18, 2017 at 01:37:17AM +0800, Icenowy Zheng wrote:=20
> > > Allwinner R40 SoC have a clock controller module in the style of the=
=20
> > > SoCs beyond sun6i, however, it's more rich and complex.=20
> > >=20
> > > Add support for it.=20
> > >=20
> > > As the user manual is still not available, this driver is made with=
=20
> > > knowledge from clk-sun8iw11.c in the BSP kernel source.=20
> >
> > Missing SoB.=20
> >
> > Why are some patches tagged as RFC and some don't?=20
>=20
> There's still no open User Manual for R40, so I tagged CCU-related
> drivers RFC.
>=20
> Pinctrl driver can be written with the datasheet draft, which is
> available now.
>=20
> For USB we have never user manual so everything is educated guess --
> so it's not RFC.

It's still kind of weird to mix and match patches with and without RFC
tags.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--g5of3ncydxxzu2w7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYr3xMAAoJEBx+YmzsjxAgfs0QAL24uvKyCPflkHLK1pP4SNL0
stcJWaa9W6pmnpQkhqyD5oZlrS8MkxdWmCGlKxyrrT+zT3TsmFBKM3sbLk0+Ciw2
luZUfpsIFZO3zlCCnyrd6sq1VXGLZ3xSftgA24DLE7heMmMDhx0aQghfS6Y6xwFs
YMQJnVyC9YcpwRkKdsJkSktbbZmRCsSqzRgaa72++lhk05ZuycI8DAnbpsZmC5ov
PIRXjcGgO2yhHNljyqv87cxf6zKDXmqlAdt9wuZ1GPPhz6JAArDTRxFaEhehLPVY
zYFQVvEyjdz6mZgZL7lrogjt3V92DOHv7ZR3AYKD78L8g8iZVWcJt00AQ6W92U64
IHdB4ymTTFe4pNim5AvzF3iG9EekSpfwCVUHQFLQvgykzRndg7iJUS+Qyp1Xi3VM
bWkONMQl3WBMzN9KNyGx9v657h0ze+qiSFbx8YyiE41ldhQdk0XdrQX9mMsrTgmU
zEH4MH4j7JbWAEK8Kq62NfgBkSy99MpfJGyR2tEPJsH8rHoZb6JrfHSQtSJKBB1n
FYUlxR/3HUrl/ydzxDSh1K2E1QQ9Y4HhCSAfMuKnVYSOorCuUDiMBPnky1aZLJGz
hZPrInmrMJ7aF3SPpUiPKNcvE/TzJ4Lpiq+stceSpnGzzYItSwfy6HubQe6OKMzj
MAhNp2d5yPs/Oq8QL06X
=OKPg
-----END PGP SIGNATURE-----

--g5of3ncydxxzu2w7--


--===============0533806570926305171==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============0533806570926305171==--
