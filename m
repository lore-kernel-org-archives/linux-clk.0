Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
Date: Mon, 30 Jan 2017 10:03:07 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.xyz>
Subject: Re: [PATCH v3 03/10] clk: sunxi-ng: rename sun8i-h3 driver to
 sunxi-h3-h5
Message-ID: <20170130090307.mmeab5ybfxaeicq2@lukather>
References: <20170129023331.62106-1-icenowy@aosc.xyz>
 <20170129023331.62106-4-icenowy@aosc.xyz>
MIME-Version: 1.0
In-Reply-To: <20170129023331.62106-4-icenowy@aosc.xyz>
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
Content-Type: multipart/mixed; boundary="===============4789165534562571741=="
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>


--===============4789165534562571741==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="oa6hxwnkli4wexjx"
Content-Disposition: inline


--oa6hxwnkli4wexjx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Jan 29, 2017 at 10:33:24AM +0800, Icenowy Zheng wrote:
> As the CCU in the Allwinner H5 SoC is very similar to the one in H3,
> rename the H3 driver to sunxi-h3-h5 so that it can be extended with H5
> support.
>=20
> Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>
> ---
> The original PATCH v2 3/9 is splited into two patches in v3, this one ren=
ames
> the H3 driver to h3-h5, and the next one finally add H5 support to it.
>=20
>  drivers/clk/sunxi-ng/Kconfig                       |   4 +-
>  drivers/clk/sunxi-ng/Makefile                      |   2 +-
>  .../sunxi-ng/{ccu-sun8i-h3.c =3D> ccu-sunxi-h3-h5.c} |  42 +++---
>  .../sunxi-ng/{ccu-sun8i-h3.h =3D> ccu-sunxi-h3-h5.h} |  10 +-
>  include/dt-bindings/clock/sun8i-h3-ccu.h           | 146 +--------------=
------
>  include/dt-bindings/clock/sunxi-h3-h5-ccu.h        | 145 +++++++++++++++=
+++++
>  include/dt-bindings/reset/sun8i-h3-ccu.h           | 104 +--------------
>  include/dt-bindings/reset/sunxi-h3-h5-ccu.h        | 103 +++++++++++++++
>  8 files changed, 282 insertions(+), 274 deletions(-)
>  rename drivers/clk/sunxi-ng/{ccu-sun8i-h3.c =3D> ccu-sunxi-h3-h5.c} (96%)
>  rename drivers/clk/sunxi-ng/{ccu-sun8i-h3.h =3D> ccu-sunxi-h3-h5.h} (88%)
>  mode change 100644 =3D> 120000 include/dt-bindings/clock/sun8i-h3-ccu.h
>  create mode 100644 include/dt-bindings/clock/sunxi-h3-h5-ccu.h
>  mode change 100644 =3D> 120000 include/dt-bindings/reset/sun8i-h3-ccu.h
>  create mode 100644 include/dt-bindings/reset/sunxi-h3-h5-ccu.h

Please generate your patches with -M

> -static void __init sun8i_h3_ccu_setup(struct device_node *node)
> +static void __init sunxi_h3_h5_ccu_init(struct device_node *node,
> +				  const struct sunxi_ccu_desc *desc)
>  {

The indentation should be on the opening parenthesis.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--oa6hxwnkli4wexjx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYjwFHAAoJEBx+YmzsjxAgPTcQAL/ZIIw/DeJ4jCKzz+XTeBnQ
ESz+LSRDEd23iLRIQBeGwYIQmBtdsobGoI7BkjKr57cwQoj+3kIz37g+fJSi2+xd
kIOd+4y+H0IbEDtH/R1oFRNYP72ydxhyreXfLwG/affCncuXHKPBrv28nRFQzJ6i
rEXB87cEeQ39SqziydU5N9uiWKjjBybEvyaBj4Pekh88XAoH2XGkyLc/A3kUROBZ
eLOO2k3Vd4q9tNjbN8CTO07eqBFBz68nlHyfoU2OZ7bHZMhd8oUcxTAyelbj2EVM
+mf4dRH4tDMfaXTTfQLfgmBkWMop1MRoy2w2TJOXTo86CnXdTa/AOC4KJvW+1XcV
imV+8kw0lPKg9L/e7yOOI3rCKQJ3f4EO74RmDicbssB+8U8Aq10hE0BTtEtw1q61
0lS4GVB1BK82KiNBxnLqnpg6eELgM6pHHG639pKYLRFtaU5PkxRryJ0NduGXqqY7
nFwGiN6gvgFv9IYZAQz4C9xmLYkqglN8RGUB8eGCrUOuna+K4/kwQ4GTk2IzYiae
WRKslZ7uixog/tShlUKbo2/EdiYJGXA38xctyl85dh6IeyuX+JxkrSZ4AEoCXyy2
RicjAytDoufQ0aLptPdDQAMkWCRXBJha4hBcIQEAFkcOApFMiy22O1OYhAjyK7kZ
kJGSc35Ymxk/hR2O76FQ
=77Ut
-----END PGP SIGNATURE-----

--oa6hxwnkli4wexjx--


--===============4789165534562571741==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============4789165534562571741==--
