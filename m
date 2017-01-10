Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
Date: Tue, 10 Jan 2017 19:09:26 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.xyz>
Subject: Re: [PATCH 1/5] arm: sunxi: add support for V3s SoC
Message-ID: <20170110180926.ilqtygttpfgbetvu@lukather>
References: <20170103151629.19447-1-icenowy@aosc.xyz>
 <20170103151629.19447-2-icenowy@aosc.xyz>
MIME-Version: 1.0
In-Reply-To: <20170103151629.19447-2-icenowy@aosc.xyz>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-sunxi@googlegroups.com,
 Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============4030732784558084608=="
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>


--===============4030732784558084608==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5dvepi43xsfpbyv5"
Content-Disposition: inline


--5dvepi43xsfpbyv5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 03, 2017 at 11:16:25PM +0800, Icenowy Zheng wrote:
> Allwinner V3s is a low-end single-core Cortex-A7 SoC, with 64MB
> integrated DRAM, and several peripherals.
>=20
> Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>
> ---
>  Documentation/arm/sunxi/README | 4 ++++
>  arch/arm/mach-sunxi/sunxi.c    | 1 +
>  2 files changed, 5 insertions(+)
>=20
> diff --git a/Documentation/arm/sunxi/README b/Documentation/arm/sunxi/REA=
DME
> index cd0243302bc1..91ec8f2055be 100644
> --- a/Documentation/arm/sunxi/README
> +++ b/Documentation/arm/sunxi/README
> @@ -67,6 +67,10 @@ SunXi family
>          + Datasheet
>            http://dl.linux-sunxi.org/H3/Allwinner_H3_Datasheet_V1.0.pdf
> =20
> +      - Allwinner V3s (sun8i)
> +        + Datasheet
> +          https://www.goprawn.com/forum/allwinner-cams/783-allwinner-v3s=
-soc-datasheet
> +

Please don't put random links in there, but at least something that we
know will be there in a couple of weeks/monthes/years

Thanks,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--5dvepi43xsfpbyv5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYdSNSAAoJEBx+YmzsjxAg2BwP/11NZLtbmXLfReAXu4E3j+Jk
0brGJ2NYa2N1XvFWKixGzd+aXkq6/Fqi5vaelCF/6meFQa2UX0qgy+tP5fEc3fKE
ucJCr8pgLO1kaK7pFJbWHtWlRQzZLgSq9/DYjUYgqfBxVOu0gFNQFVtHIpmDyDdn
aqNorY0mkx3aSgbJiEhPsjf8YlX83+sWt9+00dlg4hyxHepKBP7cbKwOkLivMkOK
bo2mO1GxcUoPYh7aNDdLYAtjSSCTFQ4xZvDaA3ghFfS44Kll7b+4TEGSU5Qt9uad
alK4myTxLWcYpdIXTKc6J3AVUc9sh/wiNJksaoagKYKaZwiwA6O90HZxMJ0w9NZX
EXAhkZxng0IwigZA35Hf9HlidrLqjBrF7Sz+2DcCMjB4JSSxW4SycufRzoGOdvV2
CazjYE7jAKwBUK6tiZV5yfY6DL5qYEidSdx4+8As/o3gdubmVq3TvWTmIDOheowS
9af/BbsTZpHhftXQHNKztL1o5BaJpLFgRKjzAsl5D2/+n6HaH9J2P1Q49L8//+0p
+OzNcecGK8AopJslvUw53/PtvxiYr/vQoU9ChCdAHmcAXdRU4sL8ggSaIDHjZJW+
HDs8ReaQAwJxQ8QVj+bGoaIoOgwVM+jjseDdI6sE9Kf+itJ84TtCJi9LsUAFF8kU
VTabp+IiXgU5HHJylNF0
=bhod
-----END PGP SIGNATURE-----

--5dvepi43xsfpbyv5--


--===============4030732784558084608==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============4030732784558084608==--
