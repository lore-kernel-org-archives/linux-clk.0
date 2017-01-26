Return-Path: <maxime.ripard@free-electrons.com>
Date: Thu, 26 Jan 2017 11:38:13 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH 08/11] ARM: dts: sun8i-a23-q8-tablet: Drop pinmux setting
 for codec PA gpio
Message-ID: <20170126103813.6k6zqnjvguiphs5s@lukather>
References: <20170124023230.3990-1-wens@csie.org>
 <20170124023230.3990-9-wens@csie.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hsn76sg75gdelhb2"
In-Reply-To: <20170124023230.3990-9-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>


--hsn76sg75gdelhb2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 24, 2017 at 10:32:27AM +0800, Chen-Yu Tsai wrote:
> We are moving towards handling GPIO pinmux settings that don't require
> extra bias or drive strength settings to use the GPIO bindings only.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---
>  arch/arm/boot/dts/sun8i-a23-q8-tablet.dts | 10 ----------
>  drivers/clk/sunxi-ng/ccu-sun9i-a80.c      | 24 ++++++++++++------------

That diff looks suspicious :)

(and the patch for which you wrote a commit log for
doesn't have anything to do in this serie)

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--hsn76sg75gdelhb2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYidGRAAoJEBx+YmzsjxAgW7AP/0PFazcUL+yvdX+HZPhtz3Vf
XjFoEwkxhRLL5JYGw9WwEzQvmdnh0JHT1b9vIQt20pEefIKHApQVV+XnDn6mW28N
BSw10HqHLHr8GK6WYu+EcphZ14xi+rrEPfi4KVjUKwE3NhCe4I+jxcVR7r1rrIe0
paTFUyIAGNDFo3DJtHn69DXeeW73XQOrznXUKdIFwzLGTSgFXNmqVxv3XlqlOgiE
BXN55MExnakTzSvYenIIGzOiL/1C3KV1sutlSonwWjgNJQg7+grdiJfcFsc6ZoMW
6Fpbz6HMegUj03/rwdBHfd2XqPB0/l/70ZrEk9gCwPsSOmdtpLpOaPLCWAfYGmPI
jW9ppO+iGYfT3Ssf9FRim4MhcBFuF+l4ge9MvfPmqIb1bCul1GKmF9HpAFofkGgz
qySDmhZRccPlp+w7+noYJ6b4Q/FHVXZTfQ1OiZF59RoKOkI8NSpqxxqA61faPOYY
OE27GJQWz2nR56bG3gsBBMNduWepKdbqNMdXBDrZCy20/cdRprNW/UX1Hk1YovNF
PvbzjyoLjWYR9Ptc8W5zRWUPipWmhznNJVFwwHfRVI5ejSYI0dSjHxhoUtCJQSPn
JtlW1MVlvSPqFAoccvSxitcpVIn5I1ytxZL8g8HAeJI8OFxDMGzJJeGGgDLLooSI
h9r2yaoM7TmLU3WjfWo8
=kVNJ
-----END PGP SIGNATURE-----

--hsn76sg75gdelhb2--
