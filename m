Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
Date: Fri, 3 Mar 2017 15:48:39 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.xyz>
Subject: Re: [linux-sunxi] Re: [PATCH 2/3] clk: sunxi-ng: add support for
 PRCM CCUs
Message-ID: <20170303144839.snrm5wgjyj5fvko7@lukather>
References: <20170301152220.MEgmqtKw@smtp2p.mail.yandex.net>
 <20170302140859.aqvwtgzxkdi2lqbc@lukather>
 <3232491488467598@web22o.yandex.ru>
MIME-Version: 1.0
In-Reply-To: <3232491488467598@web22o.yandex.ru>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 "linux-sunxi@googlegroups.com" <linux-sunxi@googlegroups.com>,
 Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: multipart/mixed; boundary="===============7885695037945009158=="
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>


--===============7885695037945009158==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pgkebievbicil76d"
Content-Disposition: inline


--pgkebievbicil76d
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 02, 2017 at 11:13:18PM +0800, Icenowy Zheng wrote:
>=20
>=20
> 02.03.2017, 22:09, "Maxime Ripard" <maxime.ripard@free-electrons.com>:
> > On Wed, Mar 01, 2017 at 08:17:39PM +0800, Icenowy Zheng wrote:
> >> =A0> I'm a bit worried by that to be honest. You claim to support the =
A31,
> >> =A0> yet jugdging by the current state of that code you never actually
> >> =A0> tested it on that SoC.
> >>
> >> =A0I only claim to reserve possibility to extend the driver to support
> >> =A0A31, but I didn't claim it currently support A31.
> >
> > Well, you did call it sun6i.
> >
> > Please rename it, and we will consolidate in due time.
>=20
> Then rename it back when it really gains support for A31?

Yes.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--pgkebievbicil76d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYuYJHAAoJEBx+YmzsjxAg54sP/0OEdB/HBABcvxabUHLqI8e+
kFkByqFTFfyvGIIYlmSr9IOsFerGaqMpqC+mmK30FUa/QsO1qZtfLpQj5uj8lcz0
Qn7ZW8GAWglzTtqeLiK6EFVh52SGOyw7M8uXRAnx1lQkk1F9xFbYa58GffwDt9MA
TCPBka7M5vOHu9RfkBOPnz3eh/40bjOIJhLN2G8xAb2R/p4jDK4oDH20fUQUB2RJ
sWDSYPoSSMXo2nnCRJBRsdF8D4CFSc7uSlrXHd7u0Ruf+0QKkyjU42P9zKzBkNbb
0Hwx3a9lRC2r/ozQY5DJhor1s5GHFFgD/21aqgkRXX/KL0wrznD48NbwCZyFCZ1o
OWf908XOOgNtzRPEQQdzEBut5qss9IO4COz+fA5FVKjNoYY/6riIfBr+Kb9kfPv9
rWBnGMjned0VCXE4kw2nnt/T9lw+yeyr81AQpiMNIdtySNWqlms8sftI1280uBsm
8X2QWnWmtxf77O8a8hq7BLwITb326xRU5X7tr+CwG46YOF1sqAjZZGhkUOVudmmJ
YuPbLwqSXVZXKM3qEcLm2mKB95iKuSBhlcUTZRmlk19guwKzDgRDiDaDddZfF2Kz
qEd6Ie45pRUUaBlmmKfhrOIwOzJLoc6kFvPUVgXw0DKgM9OGKc62EeKc9l/vTkml
L1Zy7kv7mfqiG2eJM5yJ
=OCc9
-----END PGP SIGNATURE-----

--pgkebievbicil76d--


--===============7885695037945009158==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============7885695037945009158==--
