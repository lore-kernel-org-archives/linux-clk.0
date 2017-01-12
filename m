Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
Date: Thu, 12 Jan 2017 18:13:45 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.xyz>
Subject: Re: [linux-sunxi] Re: [PATCH 2/5] clk: sunxi-ng: add support for V3s
 CCU
Message-ID: <20170112171345.nzkgg6jjyz6ywb54@lukather>
References: <20170111065524.tILSH8cS@smtp1p.mail.yandex.net>
MIME-Version: 1.0
In-Reply-To: <20170111065524.tILSH8cS@smtp1p.mail.yandex.net>
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
Content-Type: multipart/mixed; boundary="===============4529201150131795672=="
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>


--===============4529201150131795672==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xtl6ajsohtdxdgqk"
Content-Disposition: inline


--xtl6ajsohtdxdgqk
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Jan 11, 2017 at 11:55:16AM +0800, Icenowy Zheng wrote:
>=20
> 2017=E5=B9=B41=E6=9C=8811=E6=97=A5 02:10=E4=BA=8E Maxime Ripard <maxime.r=
ipard@free-electrons.com>=E5=86=99=E9=81=93=EF=BC=9A
> >
> > On Tue, Jan 03, 2017 at 11:16:26PM +0800, Icenowy Zheng wrote:=20
> > > V3s has a similar but cut-down CCU to H3.=20
> > >=20
> > > Add support for it.=20
> > >=20
> > > Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>=20
> >
> > It looks like there's nothing different but the clocks that you=20
> > register with the H3, please just use the H3 driver.=20
>=20
> USB gate part is different, and many things have gone.

As far as I can see, you're only adding a few clocks, and removing a
bunch. This is definitely something that can be dealt with by simply
registering a slightly different set of clocks, like we're doing on
sun5i.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--xtl6ajsohtdxdgqk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYd7lEAAoJEBx+YmzsjxAgcUMP/03z4B5xu2ltdotMrezeOC0K
PHB7Wq8Rrfqzu2ZwcUieC5PsDZmRdhW13M7C56iFyvnG6sIWuD1qbCCcLVh0ZhAd
5woJrj5g9nZsc2aNEKGmMjbtrCu6qFJFM7ZxGavjUJvepuxwyg3Ftxup75erakAd
5fdRJ5eE/+nxzN4ywDp2IhxLFAx8G5y/1KnPnK4bZw10yPOiytAzKBxddOK6MkJW
qI3qOK3HCU++5VU262uHUy2/3EpDDP1KWvH6+SRLbcvmWAI8h34HB9S7f1NXrQFf
r/DYPG6e7T2Q/DAj9j0W72vCHIU9QecobSrWUolUUgfEgdpjkYbiREEAhl4qutB4
G5IqTcBuNDxfUQ7J9Jb3JwtMgJN8+Jc309nELDDF/2aoHegMrKwpVc8fcRO2kGBy
mTBbBufvPlFU30pT26ut2pbTKSqpE9vxcb84vAR7tRCwPsFFyP435tKZSGQiMQFm
8Q4/nK/130l0Wc0re8Kk3fgNg49KQ1QEgrgc9IipzvAm2412qkFuDUVmmLbqmfZs
DWwsBvH41DJvk0EF76FttHmOe5pD/korDuEKcawxi50iw3tim63yE9Hpl6mRcEI9
7YB7sEVQMhzM0QSrjz26ngj4+95C839LR35FjC2vRZByIE/B6GZSB7uHh9rLAbMy
OqHnBbDZACZb5Gj1voTr
=R7Qx
-----END PGP SIGNATURE-----

--xtl6ajsohtdxdgqk--


--===============4529201150131795672==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============4529201150131795672==--
