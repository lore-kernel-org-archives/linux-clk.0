Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
Date: Thu, 19 Jan 2017 16:41:28 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.xyz>
Subject: Re: [linux-sunxi] Re: [PATCH v2 2/4] clk: sunxi-ng: add support for
 V3s CCU
Message-ID: <20170119154128.hzhggymgg7uczpfo@lukather>
References: <20170117200213.27eGY8hi@smtp3h.mail.yandex.net>
MIME-Version: 1.0
In-Reply-To: <20170117200213.27eGY8hi@smtp3h.mail.yandex.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Zepan <715805855@qq.com>,
 linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com,
 Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============5450601095262999357=="
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>


--===============5450601095262999357==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="psx5bck5e4wnn5kr"
Content-Disposition: inline


--psx5bck5e4wnn5kr
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 18, 2017 at 01:02:03AM +0800, Icenowy Zheng wrote:
>=20
> 2017=E5=B9=B41=E6=9C=8817=E6=97=A5 17:04=E4=BA=8E Maxime Ripard <maxime.r=
ipard@free-electrons.com>=E5=86=99=E9=81=93=EF=BC=9A
> >
> > Hi,=20
> >
> > On Tue, Jan 17, 2017 at 02:01:14AM +0800, Icenowy Zheng wrote:=20
> > > V3s has a similar but cut-down CCU to H3.=20
> > >=20
> > > Add support for it.=20
> > >=20
> > > Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>=20
> > > ---=20
> >
> > Output from checkpatch:=20
> > total: 5 errors, 2 warnings, 3 checks, 857 lines checked=20
> >
> > > I think I should make a comparsion between V3s and H3 CCU here:=20
> > > (I won't mention the missing/added clocks here, only list conflicting=
 clocks)=20
> >
> > That should be in your commit log.=20
>=20
> I think it can be easily get by a diff command :-)
>=20
> And we do not have the tradition to describe clock difference in
> commit log, is it right?

In very low details, no, but still having the big picture is a good
idea.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--psx5bck5e4wnn5kr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYgN4oAAoJEBx+YmzsjxAg3LsP/2Gfax1B4rYAprxZ2k92kUeq
wwE7NdXjEzCoW8RV59RKKAJELxJq+It0+a7byjKqnuxes+kTE7+KvRDCpoWYYf2U
RLy3IHgHnFgoKEgHt54HX3/9OqryQek3CeE5LwuzPSrrrTLC8ENMCDzEdlDWqaqa
o32vr9qu8gy/E725xR7/jfsRgQva10UEUa83kQmGum9nuK2C3Cq2MNPRxxUDaJoN
5POapjpxOF1UZqMAA3Z//6MRbgz8uiyr6TJZzAupW9oCMSQ07PmiG80oUztVhisv
FjPCUq5qTlDsCWj8pWKbOIM27dTqFEoJ4ICM2RLj650Ukb4nkBABnYsDWWFwsDjA
Pm/j0cdehwvWUemiT7hZ/qhacU38Z3azU1ZYF9UK86Pdrr++Zv4AzE79LfHORwd3
eBPGMGA/ZZ8oslgD4vY02WSoyYewBtjQqh7A6HUyTPThWYKvynyfmVhiwLTLQMN/
woG3AnbK2JQ490zDb0wVsOYS2Zp3rEDnbL3uUiuIONStfqySggk1+GZvUiXTfRbs
7+JVwhCAV7YYe0uKP2YpPoEVV/BujReNOTNmQBnGQGZ9yg8CxwBsaGLN+BMuNBZZ
h8dy0JmH9fva8lDYdLy0dR6S9tMiJAGJdCgfTp33d5wsb/ZPFWSviOSdIYN1EzlO
NZbrelb1FhrrU4X76QYC
=zGlR
-----END PGP SIGNATURE-----

--psx5bck5e4wnn5kr--


--===============5450601095262999357==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============5450601095262999357==--
