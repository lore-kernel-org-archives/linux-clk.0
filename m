Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
Date: Tue, 10 Jan 2017 19:10:06 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.xyz>
Subject: Re: [PATCH 2/5] clk: sunxi-ng: add support for V3s CCU
Message-ID: <20170110181006.yrd6moy2mctzoc4c@lukather>
References: <20170103151629.19447-1-icenowy@aosc.xyz>
 <20170103151629.19447-3-icenowy@aosc.xyz>
MIME-Version: 1.0
In-Reply-To: <20170103151629.19447-3-icenowy@aosc.xyz>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-sunxi@googlegroups.com,
 Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============0215250191688981419=="
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>


--===============0215250191688981419==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="lqelbqhf667falss"
Content-Disposition: inline


--lqelbqhf667falss
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 03, 2017 at 11:16:26PM +0800, Icenowy Zheng wrote:
> V3s has a similar but cut-down CCU to H3.
>=20
> Add support for it.
>=20
> Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>

It looks like there's nothing different but the clocks that you
register with the H3, please just use the H3 driver.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--lqelbqhf667falss
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYdSN+AAoJEBx+YmzsjxAg/ncP/2xw4p/1hWzBEYiGKqu4pzOw
Z8yEXhDdMCjGh2Ymx4PGblOVpKV+PsBxseOFpywPA/8DAC1jPQ7mYZiGxPNl15MJ
EszfX9XFFy2cUy8qZg1Q756KKFHdTgrqKcJ3MXYP4/1sFw3J7cpv0lRPuKixecGJ
fwyIgmzIHa26BUM7SIBshzCHZAb3Wkj/bvzQ7BrL+oVPjGGyYaqu/nAzxiZVcct7
8X66aIIYr1lY7NQhPm5EARLry33PyEHcPXRTGnprUGArkZXgkrkgiac2YYf9ggKr
bbUDChXgQKdEIe+jRTJTSLa020OrWbHFiHSCtr2ZvLTE4PAj929/Fm1yfC/8hJqF
DXdfylvGlu7O9B6cJ3qCOTFkDZmlmFskJt54ivZTn+itpRkEfIl8y3MwlfWTXX5U
dAxKzW5Tsx69RFBaE+saDuIrfamQPoMN3C8UP27X/N9Lrjg3Iiq0g97PEcqN4tLm
2R2TrJf45RqEbqbkmc4K1/sbelN9kjjKev+cb5E9NoG7dQvIWifDaAPuo+LAOUnj
AJs2cFeS/ziLARm4gjjoRrUA1Z2vJEHr1Yg0EtFEjwWWWEPRUbgxa/b0MK0GVNvy
aORFVJApum4gn+I+0Ihq98w0/p5yErxq4MeKJFQxWeERItg7bicoA/dlHhT2wj5G
C2r9WYgBn8+wZOlZxM+x
=OjAd
-----END PGP SIGNATURE-----

--lqelbqhf667falss--


--===============0215250191688981419==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============0215250191688981419==--
