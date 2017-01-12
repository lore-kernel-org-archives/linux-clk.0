Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
Date: Thu, 12 Jan 2017 18:17:13 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.xyz>
Subject: Re: [PATCH 1/5] arm: sunxi: add support for V3s SoC
Message-ID: <20170112171713.vzlhoak3ykr3aomp@lukather>
References: <20170103151629.19447-1-icenowy@aosc.xyz>
 <20170103151629.19447-2-icenowy@aosc.xyz>
 <20170110180926.ilqtygttpfgbetvu@lukather>
 <2706391484163632@web1g.yandex.ru>
MIME-Version: 1.0
In-Reply-To: <2706391484163632@web1g.yandex.ru>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 "linux-sunxi@googlegroups.com" <linux-sunxi@googlegroups.com>,
 Stephen Boyd <sboyd@codeaurora.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 Chen-Yu Tsai <wens@csie.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: multipart/mixed; boundary="===============3539582376582845446=="
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>


--===============3539582376582845446==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="z6tfcngwivu7rwau"
Content-Disposition: inline


--z6tfcngwivu7rwau
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

1;4601;0c
On Thu, Jan 12, 2017 at 03:40:32AM +0800, Icenowy Zheng wrote:
>=20
>=20
> 11.01.2017, 02:09, "Maxime Ripard" <maxime.ripard@free-electrons.com>:
> > On Tue, Jan 03, 2017 at 11:16:25PM +0800, Icenowy Zheng wrote:
> >> =A0Allwinner V3s is a low-end single-core Cortex-A7 SoC, with 64MB
> >> =A0integrated DRAM, and several peripherals.
> >>
> >> =A0Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>
> >> =A0---
> >> =A0=A0Documentation/arm/sunxi/README | 4 ++++
> >> =A0=A0arch/arm/mach-sunxi/sunxi.c | 1 +
> >> =A0=A02 files changed, 5 insertions(+)
> >>
> >> =A0diff --git a/Documentation/arm/sunxi/README b/Documentation/arm/sun=
xi/README
> >> =A0index cd0243302bc1..91ec8f2055be 100644
> >> =A0--- a/Documentation/arm/sunxi/README
> >> =A0+++ b/Documentation/arm/sunxi/README
> >> =A0@@ -67,6 +67,10 @@ SunXi family
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0+ Datasheet
> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0http://dl.linux-sunxi.org/H3/Allwi=
nner_H3_Datasheet_V1.0.pdf
> >>
> >> =A0+ - Allwinner V3s (sun8i)
> >> =A0+ + Datasheet
> >> =A0+ https://www.goprawn.com/forum/allwinner-cams/783-allwinner-v3s-so=
c-datasheet
> >> =A0+
> >
> > Please don't put random links in there, but at least something that we
> > know will be there in a couple of weeks/monthes/years
>=20
> Is http://linux-sunxi.org/File:Allwinner_V3s_Datasheet_V1.0.pdf acceptabl=
e?

It's much better, yes.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--z6tfcngwivu7rwau
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYd7oZAAoJEBx+YmzsjxAgycYQAIZYVz58JQH8O9t/dfHyfn8T
Ai0hVu6FTsjSUt9qZCbs1SqiydNxDpmfTlgrdlOgJfFmorD+Y5HjfGqmos35X/UC
YPyd2qyA7IBYbUYJROsgqL3mLG5edJgh9ct0t0rb2SlQg2/6Fj7pLmhiDfpmyqlo
f4PvSvNl0nyEnDUbTJ301d07AOs+u80oDGfH8eCHWQuDMUo2QS+2dU0XF9UphkTH
mQ6uzGtBl/Pjo0rtm9igzvSuf/UfTROOMy/2QRoJ5XFZT5PRVC+b20AAPZjKX/6Z
vzNoWjP5YjKERJ+RZ/DE+mYQl0DpC9GAtzXU5feJhXJNiijv/5x+gAHsW7iXnQ3X
o/8n/hGSEF0e07qjitkmQMFpgY9gfnm0AngmFzVRPl2rzYRQBX1ZcMo1esC7KsWb
ikPJFRVzwbVmRRjT3nl4f3Kb6Ix2diIN2XamS7nl0zXDKo89ONex5hU3avJZp+zd
JZ7DX9bsL5EMyAwPIQ84+X3F170DG/qpiyx5rWHK9R2HiLF9w4QJ8BLsvRsQthET
AIvBM2F7P164pNFS3ztKyJeRaJuSNOxyVJgCu7nvI9dM0/NDpaldC58QpZ95e09P
1cAnQeMgWLfi0tRtcI82ClBOx8cvRNprxXO3lMzVXpE9FokctGmmJ9wMdkOXsDvM
95Wu/kF7lFL2mdZGWHjJ
=0yRi
-----END PGP SIGNATURE-----

--z6tfcngwivu7rwau--


--===============3539582376582845446==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============3539582376582845446==--
