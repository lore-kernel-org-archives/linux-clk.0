Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
Date: Thu, 4 May 2017 16:40:10 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.io>
Subject: Re: [PATCH v2 02/10] pinctrl: sunxi: add definitions for add A20 and
 R40 support to A10 driver
Message-ID: <20170504144010.lco2r6jviff63bcd@lukather>
References: <20170504135006.16483-1-icenowy@aosc.io>
 <20170504135006.16483-3-icenowy@aosc.io>
 <20170504140431.zhpcxvphxnxj7ipq@lukather>
 <318E9984-9F5A-41C3-A3E0-52D5ECA05212@aosc.io>
MIME-Version: 1.0
In-Reply-To: <318E9984-9F5A-41C3-A3E0-52D5ECA05212@aosc.io>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-sunxi@googlegroups.com,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============3240148263260486882=="
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>


--===============3240148263260486882==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hkzpfawk6wz66o4k"
Content-Disposition: inline


--hkzpfawk6wz66o4k
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 04, 2017 at 10:07:47PM +0800, Icenowy Zheng wrote:
>=20
>=20
> =E4=BA=8E 2017=E5=B9=B45=E6=9C=884=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=881=
0:04:31, Maxime Ripard <maxime.ripard@free-electrons.com> =E5=86=99=E5=88=
=B0:
> >On Thu, May 04, 2017 at 09:49:58PM +0800, Icenowy Zheng wrote:
> >> Allwinner A10, A20 and R40 SoCs have similar GPIO layout.
> >>=20
> >> Add SoC definitions in pinctrl-sunxi.h, in order to merge A20 support
> >> into A10 driver, and add R40 support into it.
> >
> >While your commit log is good, the commit title is misleading since
> >you're not adding it to the A10 driver. You just adding SoC IDs
> >definitions
>=20
> Is "pinctrl: sunxi: Add SoC ID definitions for A10, A20 and R40 SoCs" OK?

Yep, it is, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--hkzpfawk6wz66o4k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJZCz1KAAoJEBx+YmzsjxAgITcQAKV4W05UeZv/lKUjBIRdeSIF
UmrRsQV4L/AmqiRYXx+FfzuPp1SPbsW312K7rb8foX5sZLlsB84hwSwtB9kqg52v
0b4bXKmYzrpKtKodWBKqMHcuXkLLQdhOpVq0XB3xhWSTDnjTRLC4fbw0zIbJl74E
MwcvfD3kQTFzEFuwfNY6GEnxVOisYxDOot6jqaHY5Jk+az4AA5hucHsHsdFq1FPm
Tx/ylXXgdabWmUuYhJMqleWIc28z+iZw2nylWnrOSd7evxL95/GHXTnt7lnztztW
JG1esEiEhtBrc+8+nN4fu14NsyJEthkgS+/IbBMdTL7adTmX67oa7sRwmtwCF640
BCGJrncAnf5TZDXb4xzYEay2rsHvqaFuGeUwOpCrTux7cPC5e+S86o2JSrGB+HNC
cfB6P0z0yNVkxAMqa9bkS3OoljySWU2EwQqEmeMoLExz0sjPLLLqzbOIVqi33/3r
zOrB6/KUlwJkYAttkGUjQz27xEtJ/+vgBy+3sY9517XNDjOXFA89J4LeG1VA4DWn
DVwkSqK96DrXAy6nHuJ0DRfwEfCweU6SURnQuZTInedgAOtSfYMUi9G6dYXM8qkH
itVOtGEOu6kCzLUaNZrSX34hrZgK3HdaJl/LvaEVR1KmfdHWBXt7Keb9Pgr+1qtb
IBFuMUXQ4ciIANXrWKhm
=Nusp
-----END PGP SIGNATURE-----

--hkzpfawk6wz66o4k--


--===============3240148263260486882==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============3240148263260486882==--
