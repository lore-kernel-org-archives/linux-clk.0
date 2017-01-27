Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
Date: Fri, 27 Jan 2017 16:58:51 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.xyz>
Subject: Re: [PATCH v2 6/9] arm64: dts: allwinner: add Allwinner H5 .dtsi
Message-ID: <20170127155851.lv64kh7gm4ztsjpg@lukather>
References: <20170126154859.55855-1-icenowy@aosc.xyz>
 <20170126154859.55855-7-icenowy@aosc.xyz>
MIME-Version: 1.0
In-Reply-To: <20170126154859.55855-7-icenowy@aosc.xyz>
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
Content-Type: multipart/mixed; boundary="===============5762951283383165840=="
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>


--===============5762951283383165840==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="aczqchan7dzeup4t"
Content-Disposition: inline


--aczqchan7dzeup4t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 26, 2017 at 11:48:56PM +0800, Icenowy Zheng wrote:
> +		mmc@01c0f000 {

Please use a label based syntax here too.

> +			compatible =3D "allwinner,sun50i-a64-mmc",
> +				     "allwinner,sun5i-a13-mmc";

The compatibility with the A13 has never been true, and the compatible
should be "allwinner,sun50i-h5-mmc", "allwinner,sun50i-a64-mmc".

> +			clocks =3D <&ccu CLK_BUS_MMC0>, <&ccu CLK_MMC0>;
> +			clock-names =3D "ahb", "mmc";
> +		};
> +
> +		mmc@01c10000 {
> +			compatible =3D "allwinner,sun50i-a64-mmc",
> +				     "allwinner,sun5i-a13-mmc";
> +			clocks =3D <&ccu CLK_BUS_MMC1>, <&ccu CLK_MMC1>;
> +			clock-names =3D "ahb", "mmc";
> +		};
> +
> +		mmc@01c11000 {
> +			compatible =3D "allwinner,sun50i-a64-mmc",

And this is very likely to use the emmc compatible.

> +				     "allwinner,sun5i-a13-mmc";
> +			clocks =3D <&ccu CLK_BUS_MMC2>, <&ccu CLK_MMC2>;
> +			clock-names =3D "ahb", "mmc";
> +		};
> +
> +		clock@01c20000 {
> +			compatible =3D "allwinner,sun50i-h5-ccu",
> +				     "allwinner,sun8i-h3-ccu";
> +		};

If it doesn't have the same clocks, it's not compatible with the H3.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--aczqchan7dzeup4t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYi246AAoJEBx+YmzsjxAgb8kP/A5kXdRUDhSec7/vZjsz3hnN
W1nC/VCwo+KBNuOlJ3n9R8CsiYDOugOEKmp+Pi3nX2hffX/pBZCQ0zUeTsx8uw6b
CBrtCdHUHea6GrI7dfuWZO2Aq3YsHPZzy5V0nfdVEoTVl4j0Y7tGOW6zgsWLcQ6H
I6mZ2RMDMelL+EXOTY/Dyp3r8oFYNPbYJMR4S3wj5/5UbiH2VQ6zignYGB+1E1wQ
ezt6NkRPxra7B1CeGUItHF8bbNAwU6ZcWYoSJiS2VwBTkr2m5Jdf6E8qXb2P76TI
SHv7X91BoUhoM0p7ckQ0DaEo/AYqn7PfWCD3VlO3UdpWEoWET5f4o9adYr52xXUe
Z54h9II1rchMmgx6iZ56ASj2sCM5Ie1oN0HGDsF/WhDA/htoowd74L0/VW8fw4m0
4Mjj8DSQJ2WxcWkAKJua+IaQ7zkAa+CC9731McTWuDx9rBqlOoyjVpq4Ch22BcYe
YFo1HmTgR3OvxKe+uvrEmdKPEdgFOBRB0DCISrfqKCtDN3yB/0Mqq8xI0G9uz0UG
pk3crtYh+4nDrdoa92i2L7BBYLIPnrkzKFqnkTW+Y2ckcbN1HpkLsHpgeYi/7NsN
aoVSTvADuxkbQWgCkXxlZ9CS1p2g23ZK1LfQw373VNmFeK2050eV+laC2H9HzY0I
m76kPZV9KzwKCLkX0NDp
=OUkM
-----END PGP SIGNATURE-----

--aczqchan7dzeup4t--


--===============5762951283383165840==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============5762951283383165840==--
