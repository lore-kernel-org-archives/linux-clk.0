Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Mon, 25 Jun 2018 18:00:52 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-sunxi@googlegroups.com
Subject: Re: [PATCH v2 0/7] Allwinner A64 DE2 CCU support with dedicated DE2
 bus driver
Message-ID: <20180625160052.kgje2hnzwhfcm2i5@flea>
References: <20180622122615.55836-1-icenowy@aosc.io>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="wmxasll2s52fhhq4"
In-Reply-To: <20180622122615.55836-1-icenowy@aosc.io>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


--wmxasll2s52fhhq4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Jun 22, 2018 at 08:26:08PM +0800, Icenowy Zheng wrote:
> This patchset tries to implement the Allwinner A64 DE2 as a bus driver,
> in order to model the fact that the SRAM claim controls the access to
> the whole DE2 memory space.
>=20
> PATCH 1 and PATCH 4 are for the CCU part.
>=20
> PATCH 2 is the device tree binding for the A64 DE2 bus, and PATCH 3
> implements the bus driver.
>=20
> PATCH 5 adds the DE2 CCU device tree node, with the DE2 bus node.
>=20
> PATCH 6 and 7 are HDMI simplefb patches for A64. They're present as a
> test to this patchset.

Apart from the (minor) comments I made that can be fixed up while
applying, I'm happy with those changes. I'd still like to get a review
=66rom Rob, so I'll wait for it to apply them.

Thanks a lot for working on this,
Maxime

--=20
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

--wmxasll2s52fhhq4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlsxEbMACgkQ0rTAlCFN
r3Tq8g/+NQ8s3Cp8SzJS6v7IGwwGTHxvAFSmlW96Ize2uROz7Ha1DF6hWp5w/yp6
ugjXrcgyHbgWvOKJ4sdiLbyMgz1Dk5y+7pW0KFcDyDEtJq8SxVZerGv76i8SdjRd
Ai64eIXqkZaiSq50VZBlfeJ6AcbKsTz1hqq94irICU/W5qE0mJivfgbySGDmFUuW
NlAFXxVkxWfWBCdQGqrh+fUdUSgdULZCaOt6AwSh/pR17/HTkhk5JICQUTayfYyQ
YygcTvPiStatCKabI+OnPcw+kaNb2Eqm1OkeM2g1Yx2QWTeLPuwOqvmPoE5UhRDs
6Om7OBsLf8WHQ2KlMSxg2Z7MqRaqgAFW446nRsHHA4CNHeDUlfN+zxrlDt9Mf/tk
lxr2DmN5JGywZeCiV0UhUo92xJ55fbEx4Gtqtn0Td+SR6mBRvvjcCqWqERKqbFVC
YaMXGGWJ5bro70hi3WN98miDjaBUdpPQthtZ6gN3QeSkUsESHfiJ/rkONVt2BB/6
5D1rd14JqpVeyE1ZPADBjnl4pR3S8o8HTKMAwziAZyu9qZ1fgUQQ2yY49rL/aCsI
nafobbPsfISvjTOXUYoqcydvUEpi8HS+mBi523EuakeYjmCQyVWPZbH4woFqzARX
GqHOR0Decy7z3F5nLL4hXHSBditzwj9rjLIpI793Hc9ot3JeXzY=
=VZnJ
-----END PGP SIGNATURE-----

--wmxasll2s52fhhq4--
