Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Wed, 27 Jun 2018 20:37:21 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 0/7] Allwinner A64 DE2 CCU support with dedicated DE2
 bus driver
Message-ID: <20180627183721.jmmsmp3u3mq4drvb@flea>
References: <20180622122615.55836-1-icenowy@aosc.io>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ps2gknofc7sl43sz"
In-Reply-To: <20180622122615.55836-1-icenowy@aosc.io>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


--ps2gknofc7sl43sz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

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

Applied all the patches with the minor modifications Chen-Yu and I
suggested.

The threading was broken on your serie though, so you probably want to
check your git configuration.

Thanks!
Maxime

--=20
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

--ps2gknofc7sl43sz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlsz2WAACgkQ0rTAlCFN
r3Rqtg/9FNqj+55uBUWVVg6p+GWADbscDtLsWrg3KBoHk8CIzJIwkYLz9Qq6Szzn
igI3+8w33dexvIWpcax8sRhtz/RnGRZeKOsgZI2uUQ8thANtUYiHo09A65yQUmPG
sBWCAIUHAY+8fsfDNCyeUysY8LhnF1UVLT929SvmBee0qk6aHeE41d17ugOduZib
0OZaITGf5SkV1LV1T60BM/ATQeRyGJ5gX4ysbxMgPacMh1F0yzu9vcwa7XKlc2iS
Nl64ar/OG72LaYRjD45l4OJuRvfb7S30iZULFJnI9tSSyLDBGoGuFwmssQF72tvs
KeMyXAczknLt6VmAT7ujqeP5J9h1qyNG/v97A4UbQWYqJ5orYKD/y8Q9VBrh/UfI
LZEeGZzjgL3MwFaSYVyorNtzCBc3vUz0gN9f9heV9JAYSN20L+YkNs51vciXpJNg
rzzOjLjQi1DJIOzkwtysg6H4XXzQwIZdIizZnTY8pL70UKzzmczAPFEVy8NnHefc
QMV7Xt8hu1zDSlgpVQ3t3zMnF7hpHHEpsSyWRm7ttWrmTiPYXIKz7wlFCFNTd/57
B+5LLz1ezlZ0iUabpy1cRTHxEWDPltnQPi86f2WD44p9372pJglyqyWBlm/CSAIB
2PJA0dukM660YYDdrwlEfCxTFh3woaqCqRgPJNwrx28tq2wpM9Q=
=G2y+
-----END PGP SIGNATURE-----

--ps2gknofc7sl43sz--
