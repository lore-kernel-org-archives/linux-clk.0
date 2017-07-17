Return-Path: <maxime.ripard@free-electrons.com>
Date: Mon, 17 Jul 2017 11:22:09 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-mmc@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH 08/11] ARM: dts: sun8i: a83t: Add MMC controller device
 nodes
Message-ID: <20170717092209.r55enf4ub7ttwpdy@flea>
References: <20170714064302.20383-1-wens@csie.org>
 <20170714064302.20383-9-wens@csie.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="p3pxdnobiellbeqz"
In-Reply-To: <20170714064302.20383-9-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>


--p3pxdnobiellbeqz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Jul 14, 2017 at 02:42:59PM +0800, Chen-Yu Tsai wrote:
> The A83T has 3 MMC controllers. The third one is a bit special, as it
> supports a wider 8-bit bus, and a "new timing mode".
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---
>  arch/arm/boot/dts/sun8i-a83t.dtsi | 57 +++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 57 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/sun8i-a83t.dtsi b/arch/arm/boot/dts/sun8i-=
a83t.dtsi
> index beed05e10a3b..085312d0c521 100644
> --- a/arch/arm/boot/dts/sun8i-a83t.dtsi
> +++ b/arch/arm/boot/dts/sun8i-a83t.dtsi
> @@ -182,6 +182,63 @@
>  			#dma-cells =3D <1>;
>  		};
> =20
> +		mmc0: mmc@1c0f000 {
> +			compatible =3D "allwinner,sun7i-a20-mmc";

Ideally, we should have an A83T compatible here too, just in case.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--p3pxdnobiellbeqz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZbIHBAAoJEBx+YmzsjxAg5U8QAJLdywCOeawtF1CUeodxSlsp
nB8oPMwwou/mJkfkYhNwlu17nmoBoErawww4331t9Rj6yO7W+mNU2g+iZ8ofhqKr
kjVQf53NmZdB6r76StZtXmp/xf0JRgu63B3PoyDTKaRm7ZdLopWiAU3XfC4HKW/T
4rJKWmPesugLawDG8GR0/+1obukuqbnIUfuziD8fxnx6rAQbD/m3htzKHnjRvinA
a1OksbQz30h55GZe9b+OchTcb02SHEpWtgDgKeljKjiB0x59bWJE+xGaTnfDp9xB
oecdObkNOS2C3NmsTW+eb1vui1yvgXuwuSk1cYn8Dv2Ehfg1B/xL44ZS31KvIJXR
2/A+UAhDlyD/7DXiVWBYGRJEHitAHlsWidCJjEO73dGXaU+Pbs9ttAA+wxMXE8Ow
xNp69K4nOea+8BkirOI44WxDlGjNNAyrtorQGDwZEhHjCK1eGfPp9h769xB5x5Fa
l2NzNdBbdHFyADWiOLOaU7DBvYhiUsIKbMGdiIUqDnT7sGhJcJFsa6ZPEp20vZ+9
tI17ElJYOouUiq7hF1DCSY8kM4zkXbqjxtEJKJuDmjDTTOzVF3QGhmLKdh7Xj3M1
ZtIQ1qH+NRMOjoiCkzixQZyAIiKjwsgtm3zduKdBZMuDTtzU+/lWs+WW1unV8+rW
Nu+EIONvGqVrS0F9TLxx
=t87w
-----END PGP SIGNATURE-----

--p3pxdnobiellbeqz--
