Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
Date: Thu, 2 Mar 2017 15:09:31 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.xyz>
Subject: Re: [PATCH 2/3] clk: sunxi-ng: add support for PRCM CCUs
Message-ID: <20170302140931.tq3vpncln6giyjpr@lukather>
References: <20170301152236.MUXmRgOe@smtp1m.mail.yandex.net>
MIME-Version: 1.0
In-Reply-To: <20170301152236.MUXmRgOe@smtp1m.mail.yandex.net>
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
Content-Type: multipart/mixed; boundary="===============4596179119785174692=="
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>


--===============4596179119785174692==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6hgimcr3dfhiog6h"
Content-Disposition: inline


--6hgimcr3dfhiog6h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 01, 2017 at 08:22:13PM +0800, Icenowy Zheng wrote:
> > I'm a bit worried by that to be honest. You claim to support the A31,=
=20
> > yet jugdging by the current state of that code you never actually=20
> > tested it on that SoC.=20
> >
> > What makes you say that the PRCM clocks are the same for the H3 and=20
> > A64? We have to be sure, otherwise we might not be able to get the DT=
=20
> > binding right from the very beginning, and we might not be able to fix=
=20
> > it later.=20
>=20
> In fact, if we worry about this, we shouldn't make r-ccu, as
> dedicated clocks are more easy to fix.
>=20
> For newer SoCs' PRCM, we never have enough documents, and Allwinner
> have said that they cannot provide it. (I asked them for this.)
>=20
> The best solution is to implement mature enough dedicated clocks
> before we convert to ccu.

What do you mean by dedicated clocks?

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--6hgimcr3dfhiog6h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYuCebAAoJEBx+YmzsjxAgJ8IQALcUPId77EDaY0PM0jY+AKrN
5emdLV0C7McSVki2zrpJD1fJAKFAtIjd2DqQoQkA4+wX/p4+oNCSpbyA2d9uZHes
kQ6EUPLfmK/j/H6ySNzAfniFMIAuqZ0v6GiT6b5E2SKlESuPuBY8EsM0yuOnqhdR
h8QZGTGNkEeXhmpgCVG4woYqRf2NLgQmcYvvw7LA6HFndo9p2oXC8tLxxoQG4qE9
kmvo0DfP6tDd+u6Sf4RecrxJDKlDNHbjnBPtXZ6e8OW3ulgvOQdFwsxUlXYUROrb
H3qpCzZU0KCsBOFn7OYZ7eJxrxhZrDWnDRdxL5ueGLmnbjBhnewBlz4ZsyBjmlqK
1hdjpmrnetJAM3DUHhf0MkpuIfPZU+a1EYTAyb6e5Igf+W8oAjxfHQcNbrxKhkk9
Rt/ihzavzJHhDeg4CltJQ798rR+6eG0tykjefgHG+n67OHSqpdOKRU7SVDdQP0oB
jF7LUsQjBCC6YwfgeXb0CBjD/GK/gr4mZv46CLVBgVQUZ+S/LhJBuedl325uVmgi
Z28PIgpHkKekxhI/UEvK0MU7osc9U9PhBc9Dt7Eep+pN2tf43twQ9GOGyriimjUF
gnw3OAMZUmrQlAA1tzj5Hh420oAdn08LzD7GkztsuVjw51RmlF/bfd4JwhkRWYE+
vRhlLmnNFIoktJIqzCAH
=rwbi
-----END PGP SIGNATURE-----

--6hgimcr3dfhiog6h--


--===============4596179119785174692==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============4596179119785174692==--
