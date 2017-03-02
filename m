Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
Date: Thu, 2 Mar 2017 15:08:59 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.xyz>
Subject: Re: [linux-sunxi] Re: [PATCH 2/3] clk: sunxi-ng: add support for
 PRCM CCUs
Message-ID: <20170302140859.aqvwtgzxkdi2lqbc@lukather>
References: <20170301152220.MEgmqtKw@smtp2p.mail.yandex.net>
MIME-Version: 1.0
In-Reply-To: <20170301152220.MEgmqtKw@smtp2p.mail.yandex.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>,
 linux-sunxi@googlegroups.com, Rob Herring <robh+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============8600491971143479273=="
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>


--===============8600491971143479273==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mmb7xnqrwdznwsjh"
Content-Disposition: inline


--mmb7xnqrwdznwsjh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 01, 2017 at 08:17:39PM +0800, Icenowy Zheng wrote:
> > I'm a bit worried by that to be honest. You claim to support the A31,=
=20
> > yet jugdging by the current state of that code you never actually=20
> > tested it on that SoC.=20
>=20
> I only claim to reserve possibility to extend the driver to support
> A31, but I didn't claim it currently support A31.

Well, you did call it sun6i.

Please rename it, and we will consolidate in due time.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--mmb7xnqrwdznwsjh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYuCd2AAoJEBx+YmzsjxAgm9kQALLPQT2oh9KZCud9aigKNGRI
1TOX1lsZfrme5FEPFxjeX30NBh+IlVpyvypniXRrYd31Nwd7M/O96OOzJI7xyNhB
qpRT1/DyhJR9RxVYfcHvYPy97yuntTHfI1kp1/nh4DFBgCqzvpNTMs1AIivP+iAn
I9fDls5EP2FVa6a4E27g3ViM119Rda34ViwTkReEcFlYs4bUc6rNxzNmmjXK8Pfv
fAqxmtU1SsTf/cPvXYoOLpXHZjJiZIKbkFbc0lnTpesSd2XtdlVTNkQF2zMUCZKW
Xq/ILCAhTYa4fanBMtu3gm5Tl3FLyxt3wPEENdw3CmE7FDmkCR7IhbrgVa6b9Va1
E3UgwUKcv/XZvwJeMZ5MqGCUaI8+ETvIolC9lFTtzFEJlb4pCVHluwgwvpzqgUDV
9Uqa/v9VX3ac6thTU3W8RyPFqQ+45f5V3fD17hh8r4utId0Ip8Ir5geniYCpNu2G
ZuFLx8kdp+ZQoWEv15TMZ29hMC5L6gttJuPgJ8KNfzP3Zh/OpAT1DJRat1pZa7Ke
1XiA4YXlZiF87vsCZftgCnqJH5+RNGu5tYaKrF7jjsvJOp96WRomiuYHl7EPEQOT
M0WmXha+5ZFToAJgFdALTthdvKWUrVdwswMOR1A/V9fElPT2Ta1myW/vkKhdnvDq
Ynd/WHidjYSsqDC6EONM
=tiJD
-----END PGP SIGNATURE-----

--mmb7xnqrwdznwsjh--


--===============8600491971143479273==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============8600491971143479273==--
