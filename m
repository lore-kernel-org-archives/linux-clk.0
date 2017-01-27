Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
Date: Fri, 27 Jan 2017 16:53:55 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.xyz>
Subject: Re: [PATCH v2 3/9] clk: sunxi-ng: add support for Allwinner H5 SoC
Message-ID: <20170127155355.zu6k7ucbpewmlsjb@lukather>
References: <20170126154859.55855-1-icenowy@aosc.xyz>
 <20170126154859.55855-4-icenowy@aosc.xyz>
MIME-Version: 1.0
In-Reply-To: <20170126154859.55855-4-icenowy@aosc.xyz>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Vinod Koul <vinod.koul@intel.com>, Andre Przywara <andre.przywara@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-sunxi@googlegroups.com,
 linux-kernel@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>,
 linux-gpio@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 Mark Brown <broonie@kernel.org>, dmaengine@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============5374108709979588328=="
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>


--===============5374108709979588328==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7eu64d63dd3wrlrk"
Content-Disposition: inline


--7eu64d63dd3wrlrk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 26, 2017 at 11:48:53PM +0800, Icenowy Zheng wrote:
> Allwinner H5 is a SoC that features a CCU like H3, but with MMC phase
> clocks removed (for new MMC controller) and a new bus gate/reset
> imported.
>=20
> Add support for it.
>=20
> Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>
> ---
> A giant rewrite since v1.
> It now do not use a dedicated driver for H5, but altered the CCU driver
> of H3 to support H5.
>=20
>  .../devicetree/bindings/clock/sunxi-ccu.txt        |   1 +
>  drivers/clk/sunxi-ng/Kconfig                       |   6 +-
>  drivers/clk/sunxi-ng/Makefile                      |   2 +-
>  .../sunxi-ng/{ccu-sun8i-h3.c =3D> ccu-sunxi-h3-h5.c} | 179 +++++++++++++=
+++++---
>  .../sunxi-ng/{ccu-sun8i-h3.h =3D> ccu-sunxi-h3-h5.h} |  15 +-
>  include/dt-bindings/clock/sun8i-h3-ccu.h           | 146 +--------------=
--
>  include/dt-bindings/clock/sunxi-h3-h5-ccu.h        | 148 +++++++++++++++=
++
>  include/dt-bindings/reset/sun8i-h3-ccu.h           | 104 +-----------
>  include/dt-bindings/reset/sunxi-h3-h5-ccu.h        | 106 ++++++++++++
>  9 files changed, 431 insertions(+), 276 deletions(-)
>  rename drivers/clk/sunxi-ng/{ccu-sun8i-h3.c =3D> ccu-sunxi-h3-h5.c} (80%)
>  rename drivers/clk/sunxi-ng/{ccu-sun8i-h3.h =3D> ccu-sunxi-h3-h5.h} (82%)
>  mode change 100644 =3D> 120000 include/dt-bindings/clock/sun8i-h3-ccu.h
>  create mode 100644 include/dt-bindings/clock/sunxi-h3-h5-ccu.h
>  mode change 100644 =3D> 120000 include/dt-bindings/reset/sun8i-h3-ccu.h
>  create mode 100644 include/dt-bindings/reset/sunxi-h3-h5-ccu.h

Please do that in two patches. One to rename the existing driver, one
to support the H5.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--7eu64d63dd3wrlrk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYi20TAAoJEBx+YmzsjxAga/kQALlO/Au0Uv5hArMtkjo5159+
FmrS3LrFr+mAj3beQTpByxuq6yaOSs6uGNRqlsb4DZVTHnO31Up6iIgpTXQS1WO0
7zfGTFhWDorek1rmxcDipg8MI5FdiLxq38NynijsnGqHTpBiWJiNNcYuj02cDNXX
ThL0zWae8tOMYIphpPB0FWn2XVz6B+SwdWNnTmnP2ERsO6A97SwNAY8chI06r5u+
EcGv80HTF9RUUmQcDWASgNxugHlAzQdHKK34fqYVRWmstxo201ZOKvi1cXgjT1vW
Nm8m2+GzlXKM7ZKN0JAhfXLWmckZ5MEhDOI5UyWmTgpwWWguZZ3GzWA6QKFaQxV3
q4hC56huox7x1ZUPT7+BypW7wj+ZZr1iC5aO2qPFZq5SO/eapOmI7mzwP3b5I34y
sgu4X9pVJcvfOm7e5jhUNA8dGUbWzvkxsj4WgrYG0CfLERw7c4XKbN7lpAZK7ywp
JpIujJcgY4jXEsSYAGpzUNNy6sRepiU6zQggCAFjHwGvVdrUL/nMhv3z2PYbzJhX
9zUKo+LHKb20ApnFZBrDhoMTnfGYRxModqG5cB1C2s8WCwGg7111LGGSLv7+pXJX
axsfQF6BYmX46qV4hInfOGXwLtxBxnS8IBZ6BAPVejV0aQvjiqh7cQS/jOU3X3Lm
W0mHc9wpGf++fTgZTtHv
=X26G
-----END PGP SIGNATURE-----

--7eu64d63dd3wrlrk--


--===============5374108709979588328==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============5374108709979588328==--
