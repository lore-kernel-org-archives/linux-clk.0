Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
Date: Thu, 12 Jan 2017 17:52:44 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.xyz>
Subject: Re: [linux-sunxi] Re: [PATCH 4/5] ARM: dts: sunxi: add dtsi file for
 V3s SoC
Message-ID: <20170112165244.js3qrgo2nbazycmn@lukather>
References: <20170111065638.uW1SQ7Kq@smtp3m.mail.yandex.net>
MIME-Version: 1.0
In-Reply-To: <20170111065638.uW1SQ7Kq@smtp3m.mail.yandex.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org,
 linux-sunxi@googlegroups.com, Chen-Yu Tsai <wens@csie.org>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============5428659923959988012=="
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>


--===============5428659923959988012==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qxnx2rqhqsueymlf"
Content-Disposition: inline


--qxnx2rqhqsueymlf
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 11, 2017 at 11:56:32AM +0800, Icenowy Zheng wrote:
>=20
> 2017=E5=B9=B41=E6=9C=8811=E6=97=A5 02:21=E4=BA=8E Maxime Ripard <maxime.r=
ipard@free-electrons.com>=E5=86=99=E9=81=93=EF=BC=9A
> >
> > On Tue, Jan 03, 2017 at 11:16:28PM +0800, Icenowy Zheng wrote:=20
> > > + uart0_pins_a: uart0@0 {=20
> > > + pins =3D "PB8", "PB9";=20
> > > + function =3D "uart0";=20
> > > + bias-pull-up;=20
> >
> > Why do you need a pullup here?=20
>=20
> I think TX needs one, but RX do not need.

That's (at best) board specific. So it belongs in the DTS if it's
truely needed.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--qxnx2rqhqsueymlf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYd7RcAAoJEBx+YmzsjxAglHsP/1iGJ4qSTY3ycawKuawt3Ia3
0Gk8MiC1+Vd9sy6p02hb3lVaF1zMMH3rXEmAAZSNt5tl+BTu+S9h75uV2t3iZmS3
JjjYLgPnU95IoG1mOGFqoDQieG/EeiADzLl9g1DyNlqJkAQWZw1yNHK+kF9k/sgc
fV5QAQtROl9UFB5vpN9zPeIWHwDheo/gfU+uvKRlWd8YbALSKZq8Lg7T63t5mcCC
pQfnYBJK22EGp0igcDxEn1sFqRpF/Y/mH5+lhexXo+9Leek7oauppDsBBgUJ3d3i
rbxD75j5+cwBzC69QUr0bebizO0YYKoTY4Hwd2KWyV4KN8Qq+uab7jbeNQ5PnRBY
iv6CoTj2xxFgFpBqvG8pCnhASVe7XTcMxCNmfwMiBhP11GXV4WXq8B1P5nh5YEpV
rUVDCNsTNuYDUozRc4oyT8KzOnXvmOYU2ETttweptWjUO3N4H7f/HgkN595cJPXO
68+uaqmhjZ/gMa2oyIhgmwWaksO8SApXoK291Z5/Jj8qFPaZxoScatxK4O0t36yM
aJ+8GBDEWjBp1UWQDHZYftqiDHzqXbIflHsABEMc0SIY17lsto3LxvmT5tZ+urZI
Hxhbj/lPwG/vtkaj4LGX5QXiqxQmW3ASON7WMEDvegyKwSL0yfng2DyWf9JjtA1+
ee73ZDJUxniBuiJq6onZ
=KBl8
-----END PGP SIGNATURE-----

--qxnx2rqhqsueymlf--


--===============5428659923959988012==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============5428659923959988012==--
