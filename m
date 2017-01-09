Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
Date: Mon, 9 Jan 2017 12:01:12 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.xyz>
Subject: Re: [linux-sunxi] Re: [PATCH 3/6] clk: sunxi-ng: Add H5 clocks
Message-ID: <20170109110112.yzmz5dcnw5lthhbm@lukather>
References: <20170106014959.nqPebrUB@smtp1p.mail.yandex.net>
MIME-Version: 1.0
In-Reply-To: <20170106014959.nqPebrUB@smtp1p.mail.yandex.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-sunxi@googlegroups.com,
 Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============6340483864155819055=="
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>


--===============6340483864155819055==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="55e3muqlmyqo54af"
Content-Disposition: inline


--55e3muqlmyqo54af
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 06, 2017 at 06:48:31AM +0800, Icenowy Zheng wrote:
>=20
> 2017=E5=B9=B41=E6=9C=886=E6=97=A5 06:04=E4=BA=8E Maxime Ripard <maxime.ri=
pard@free-electrons.com>=E5=86=99=E9=81=93=EF=BC=9A
> >
> > On Tue, Dec 27, 2016 at 12:25:15AM +0800, Icenowy Zheng wrote:=20
> > > Add the H5 CCU clocks set based on the H3 one.=20
> > >=20
> > > Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>=20
> >
> > Is there any difference with H3's?=20
>=20
> One more Transport Stream controller, so one more bus gate and bus
> reset for it.

There's no need to duplicate more than 1000 lines of code just for
that then. Just add a new compatible and reuse the clocks already
defined.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--55e3muqlmyqo54af
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYc210AAoJEBx+YmzsjxAgP3YP/1gWhVo0FL5xv2HdmdwRUCkb
aqFMOK/QLVMvKeBbK7B6dq8+8LHnLGf/j9daA329c6dDZsmM0jDXaXhI7E9e0H4D
sMikhbdxPUIpVBYQ+eHGDxAOVj0mZ/o9pkxq1nu55zavBSqSEcj98zAGQD84GojQ
jkXBS95TvE5eAKxnqU5biU/wF0H3GK1dqREMVlN9rt+j4r0i7GUijwFwNnqFMknl
ZC+noVaB1ng/VTxXVF/S9XyaaUi1j6CHsOMY3Y1iO3RwhLxPPhjCVCGqWX74Btth
D7DjmpyOUage2sM/DwOoqoWksKuh6SuEA4dcL4hbxe21DeKjWgCJQul5ydPuGh9Z
G7hSlaV1PLLa/viktJbb7H+y2h0C+7GMGB+UAqkQIb7d/haUTOt2ysLwmitTBz5P
GJIo2sxgLQ8xaUW52L2d4GqlzWIWPNfRgKpKqz8BeEGr7hi4gRyRfjURNVyunoGx
J+mxM9vwgA0RO1MvVof++iADpqzVfNc1kRTMZBdu/oG24E6zXUFjlMuITQK0iGoa
yJfP/sVYaRL8kQKZSZ+RfsAgu93DgpUeOvxiyPPAvp8nUdGOxs3fP5iNJq/fbHSR
pUtvwBdlMzgFKel7BmvfxQkUBnrMUCJhxiLOraK60jqC4rwXoVNrghnBID9/l6Xl
l+xhgWA2UBSyEv4ETQgK
=L4Qd
-----END PGP SIGNATURE-----

--55e3muqlmyqo54af--


--===============6340483864155819055==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============6340483864155819055==--
