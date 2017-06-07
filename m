Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:40454 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751066AbdFGJmx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 7 Jun 2017 05:42:53 -0400
Date: Wed, 7 Jun 2017 11:42:41 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@siol.net>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH v2 10/11] ARM: sun8i: h3: add display engine pipeline for
 TVE
Message-ID: <20170607094241.65dcm42aacrn4eev@flea.lan>
References: <20170604160149.30230-1-icenowy@aosc.io>
 <20170604160149.30230-11-icenowy@aosc.io>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="cfwhan3eeejuewto"
In-Reply-To: <20170604160149.30230-11-icenowy@aosc.io>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


--cfwhan3eeejuewto
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 05, 2017 at 12:01:48AM +0800, Icenowy Zheng wrote:
> +	soc {
> +		display_clocks: clock@1000000 {
> +			compatible =3D "allwinner,sun8i-a83t-de2-clk";
> +			reg =3D <0x01000000 0x100000>;
> +			clocks =3D <&ccu CLK_BUS_DE>,
> +				 <&ccu CLK_DE>;
> +			clock-names =3D "bus",
> +				      "mod";
> +			resets =3D <&ccu RST_BUS_DE>;
> +			#clock-cells =3D <1>;
> +			#reset-cells =3D <1>;
> +			assigned-clocks =3D <&ccu CLK_DE>;
> +			assigned-clock-parents =3D <&ccu CLK_PLL_DE>;
> +			assigned-clock-rates =3D <432000000>;
> +		};

We discussed that already a few times, but there's no reason to do
so. If you need a downstream clock at a particular rate, call
clk_set_rate on it, period.

Whether its parent will be coming from PLL_DE or some other more
appriopriate clock is not relevant and doesn't make any difference.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--cfwhan3eeejuewto
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZN8qRAAoJEBx+YmzsjxAgg3oP/iz7gGLz4Z9PuRhkgBa7LF5z
FHhiizGV401GHhAADkvxwU3jZfu5BkIZdZxDKx3o7xUKzPuY8N/VaacKZmef8mtP
zwl4NoC1hAQMceKmsaywaI5D24gywNvzo4kJ4XG+eJSLGkx+mfIHl34LyEJryZds
lyQ595ro6r5aRGd9sdgzSyygW70J3K47xuF/eu8T9mzgdvAMOEKgF+qvuoF8MCYO
TMlGM1l1dQY6dkVnEOd983q2NzO8d/2Zq718TMcGWwDQe/UAWIMWISbEnPk8y8tg
9Z0uVDDfAoHFFTyQQ7UQ3cuIslgbifNss1HuEL+ck32P0LB2BqUTT0FCoqviRWsu
ag1iR1G8/2K9oPCbnRrFJZKUOdGtswsDeo+ud+ko231p7tFdNfyRUNwh17gfgdnd
MGCOkUy8qmjHgwZcfLMlCjBJE9OLQf1EsTL/r/aITDFwh0gWQAZVMj5nOTg22zKU
lPkM/CpGAKtT3MXZGgjtgO5zvTbYdwpJgP5S/3XPxkSA1kjBs55dlHyVdBAwPBIu
CrhNdSZBJSkl6sgkniqUglWcXzI0FpTjh0WGUtdbmhnc6sjVdv60iV7APtt2cAqy
+iJCFzPi/Dag/+UA5dIell338A2ClX4uZXF85ti8LfgMRuIWr4Cy0dwunEXYyrqO
D5snKxrP/XHs8DDf40j5
=4Xqc
-----END PGP SIGNATURE-----

--cfwhan3eeejuewto--
