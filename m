Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
Date: Thu, 12 Jan 2017 18:19:54 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.xyz>
Subject: Re: [PATCH 2/5] clk: sunxi-ng: add support for V3s CCU
Message-ID: <20170112171954.mj45su57fixzo6og@lukather>
References: <20170103151629.19447-1-icenowy@aosc.xyz>
 <20170103151629.19447-3-icenowy@aosc.xyz>
 <20170110181006.yrd6moy2mctzoc4c@lukather>
 <2705031484163593@web1g.yandex.ru>
 <2714901484163893@web1g.yandex.ru>
MIME-Version: 1.0
In-Reply-To: <2714901484163893@web1g.yandex.ru>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "linux-sunxi@googlegroups.com" <linux-sunxi@googlegroups.com>,
 Chen-Yu Tsai <wens@csie.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: multipart/mixed; boundary="===============1170309148742643837=="
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>


--===============1170309148742643837==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uxcid5gza52osl6z"
Content-Disposition: inline


--uxcid5gza52osl6z
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 12, 2017 at 03:44:53AM +0800, Icenowy Zheng wrote:
>=20
>=20
> 12.01.2017, 03:40, "Icenowy Zheng" <icenowy@aosc.xyz>:
> > 11.01.2017, 02:10, "Maxime Ripard" <maxime.ripard@free-electrons.com>:
> >> =A0On Tue, Jan 03, 2017 at 11:16:26PM +0800, Icenowy Zheng wrote:
> >>> =A0=A0V3s has a similar but cut-down CCU to H3.
> >>>
> >>> =A0=A0Add support for it.
> >>>
> >>> =A0=A0Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>
> >>
> >> =A0It looks like there's nothing different but the clocks that you
> >> =A0register with the H3, please just use the H3 driver.
> >
> > Nope.
> >
> > It has a different PLL (PLL_ISP) at different address, and some
> > different muxes.
>=20
> Forgot to mention the missing of PLL_DE and related misses.

Those are not conflicting, it's just a slightly different set of
clocks.

So there's really nothing undoable.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--uxcid5gza52osl6z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYd7q5AAoJEBx+YmzsjxAgJg8P/R+Kr62ig8qc8xTnzxVUaHSU
/A4fMOCsBt1v36t9YvyMGAxSnrqDdDRyIBtPOybEDuqMEfUc8m9cUDdH0DiFNY7U
3qCwmhK51ZRM/aoyOyLE2emYu4w3f31bRCpV/6mEKC8AlsOSeOpyCclh3bTB/Mfm
GPm9dDvfk04t+Q9DUTp5610zAR9A7kyndeK1hAABmZzFchxKW5b12FvQRMQJNNRb
t5WiRI7rS9X7zwr0yAT1wAd4bDXrkv13OeNhOfF9TpgbY9k59iqj3xPuDoLUXYoA
Sn8vpW7CgNQ5+Dj+Tqa7riRcxPyDlxFLPWHr150iT+kuADfQIPfxssv3sfvnHbBh
/XzgHZkfWTp856cPGZlGY4ZSqm0hfSOnS1JS2H+QRK+DPrAKl+O8pdgCHt/7FHFE
vsJFuaS4FJPvxaJKivX2vwUerSWvQih6wI+OInu7qkehjZTmmKgVStbDPkJF4cO8
Zs4oCzDkAMzpWd7FulAqOClnk9l+1//TeySY4ohObn8PWeGn8UZSUiFK2Siv1W5B
szJdiM4rKzBb6zzJSAIUbvZj4S86XJ+hCpg8McFix23dsI/p5T/bWJzx4dhTv7Rq
OFmh7M+8jO9FAo7Gm+rnhyIYTXLXnc0MMNpIx8v3aTcbrqUm6cNIVrNYfHz7JCWI
O96q+/slF3xe7BwL9K4M
=UJOe
-----END PGP SIGNATURE-----

--uxcid5gza52osl6z--


--===============1170309148742643837==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============1170309148742643837==--
