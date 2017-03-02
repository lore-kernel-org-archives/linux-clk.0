Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
Date: Thu, 2 Mar 2017 14:58:12 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.xyz>
Subject: Re: [PATCH] arm: dts: sun8i: split Allwinner H3 .dtsi
Message-ID: <20170302135812.kvvqw6trjipjhhu5@lukather>
References: <20170301201342.47583-1-icenowy@aosc.xyz>
 <20170301201342.47583-3-icenowy@aosc.xyz>
MIME-Version: 1.0
In-Reply-To: <20170301201342.47583-3-icenowy@aosc.xyz>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>,
 linux-sunxi@googlegroups.com, linux-kernel@vger.kernel.org,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============7406649139464821910=="
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>


--===============7406649139464821910==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2u5euainn4mpvuic"
Content-Disposition: inline


--2u5euainn4mpvuic
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 02, 2017 at 04:13:40AM +0800, Icenowy Zheng wrote:
> From: Andre Przywara <andre.przywara@arm.com>
>=20
> The new Allwinner H5 SoC is pin-compatible to the H3 SoC, but with the
> Cortex-A7 cores replaced by Cortex-A53 cores and the MMC controller
> updated. So we should really share almost the whole .dtsi.
> In preparation for that move the peripheral parts of the existing
> sun8i-h3.dtsi into a new sunxi-h3-h5.dtsi.
> The actual sun8i-h3.dtsi then includes that and defines the H3 specific
> parts on top of it.
> According to "Allwinner H3 Datasheet Version 1.2 Apr. 23, 2015" [1]
> Chapter 4.12. GIC and "Allwinner H5 Datasheet Revision 1.0 May. 20,
> 2016" [2] Chapter 4.12. GIC, the two SoCs both use ARM GIC-400 interrupt
> controller (see the "Note" after the interrupt source table), so the GIC
> node is extracted to sunxi-h3-h5.dtsi as well, and the compatible is
> changed to "arm,gic-400".

This should be in a separate patch.

> On the way get rid of skeleton.dtsi, as recommended in that very file.

That too.

> The inclusion of pinctrl-a10.h is also dropped, as it's now not needed
> at all after changing pinctrl binding to the generic pinconf binding.

And that as well...

> [1] http://linux-sunxi.org/File:Allwinner_H3_Datasheet_V1.2.pdf
> [2] https://github.com/OrangePiLibra/OrangePi_H5SDK/blob/master/Documenta=
tion/Hardware/H5_User_Manual.pdf

Please don't put URLs in commit logs.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--2u5euainn4mpvuic
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYuCT0AAoJEBx+YmzsjxAgFEYP/3zNRk09Jwznw4lvRzakB2CH
xx89I/uyUShT0fiQgVD7ODYQLwVPSJKUKKJE+NPs2qL9cTgX9vDqWAzhInxST372
+Rv43BQOvyMMhVZbzjbZ9C+Q3x8lmuHwiGMDTJElV0znFPGa1hkW1Sr8curqO3cz
PxisSqMA2mYoyo8J7iR+YnMjcIUVOzaMR8/I51zUCgs40S6cwtO5DjO2qbtWYmp+
GnOfpJWo6anB0zqoZKo5HY2alIqWVE26Ny+7NyMKY7yn9LstDOGK+k2+dKLsda2F
KELBadavyT5ujv2DbIkWctA5s5+AIaoyNI7eIaVR8WBRj264Mt5NAWdsYk8TIe3X
qcq72y9uBZUeyBgp004qwwrkg0Y6hueyHLUStNNmHi4Q3/hVRlrejN4Q4y+2ZAcD
Nn8XEj4k4KF1bQzW/rm3ZvYAe6KFVaLDHUC3YPWKRtyiMhh4DXYJAEAnfx9ZjciT
6dYYZ9pB1ZG2VupPlRAq8PIuLme3qwhcIl7hILWd0J/JnocxMiSaIIc7kNCP8pzq
pspfMW0WHonW9Zd2uWqGrIktwW0QyWHOaIZrfw97C2htlhqtwcUsbg0UCT2JLD/x
OQXv7+bFY1Fe/cQUD5qlI3P9Z7YG8k2MURqemWZ+UHqzp4J2j1KN0sBaHXaFb7hl
9AjRpAWKs0WkDdvm9QUj
=4odw
-----END PGP SIGNATURE-----

--2u5euainn4mpvuic--


--===============7406649139464821910==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============7406649139464821910==--
