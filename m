Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Wed, 5 Sep 2018 09:21:36 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Chen-Yu Tsai <wens@csie.org>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH v4 06/11] dt-bindings: display: Add compatible for A64
 HDMI
Message-ID: <20180905072136.kzky22gkpkvjh35z@flea>
References: <20180904044053.15425-1-icenowy@aosc.io>
 <20180904044053.15425-7-icenowy@aosc.io>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="4xrw2dfl335tthev"
In-Reply-To: <20180904044053.15425-7-icenowy@aosc.io>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


--4xrw2dfl335tthev
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 04, 2018 at 12:40:48PM +0800, Icenowy Zheng wrote:
> From: Jagan Teki <jagan@amarulasolutions.com>
>=20
> The HDMI controller on Allwinner A64 is similar on the one on
> H3/H5/A83T (although the PHY is different with A83T).
>=20
> Add A64 compatible and append A83T compatible as fallback.
>=20
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> [Icenowy: refactor commit log]
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--4xrw2dfl335tthev
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAluPg/8ACgkQ0rTAlCFN
r3TfqBAAh+KfQix0sYDpcqb0FchTDdVxqzewRs6mDTgJRLlXVoL2mjdxHwPHHXta
SVp0lr1nDrHWE9s2Qmkf2ckp/s3A4nBL20AVTon3xHsCusZh3mGmu0su30VSw7iw
aZD473t6VYRdhVYZyrzqS1/cjp4s1mKzjoVd5TSfGgUm+ltvw5tBHNuSIyIQqCoq
TeJ3L0tRS7ybbUAEeJTGvw6lS2qmZzGFQsqRHx24Dt/mi6nqk9oS3bRqrjmQ8yHs
0fLQ7kEzLzmzolS1F97pf8V1svWfTEU412GaNsoV/W2K37kZyrTfRzaG8RC6RNFG
TVnmqlZP/0kJ2v4O4UoDb2qixVyQ3vb8oqKo85hMkQsQANfsKTewfYsP+hoTlX5T
+wGumT2l+d4Yci6r6xUROvsqbNwVdcOHf1/knDYO+bDiJJrUzaJoBLe0mEzCHE18
QThZbDCLuizK+zCtojjOLyYDslOWEufwCmODdAsx1WvM031Iyix4Uk1t8fTYtbQd
Pae1KLhoDQZJKvpGxmXiYPYJO4Et1TBXtWem4z2AgI7AK657lIpUbQ/r9YZnd2D5
IF2Mm7xVGAYQCC6lsQXYQrA98xxCOVn8jyc6mcruSh9MqV/FOUHEZeEAdrZJKQFz
siVzxPRJQNfwoXFDlu16YUFqXX/muBLiABdvzstlNAGQsx3aAwI=
=Turg
-----END PGP SIGNATURE-----

--4xrw2dfl335tthev--
