Return-Path: <maxime.ripard@free-electrons.com>
Date: Mon, 30 Jan 2017 08:42:10 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH v2 00/10] clk: sunxi-ng: Add support for A80 CCUs
Message-ID: <20170130074210.6pxvenwdtynyyzyt@lukather>
References: <20170128122239.4480-1-wens@csie.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zf4y3f3u3v63kcnj"
In-Reply-To: <20170128122239.4480-1-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>


--zf4y3f3u3v63kcnj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Jan 28, 2017 at 08:22:29PM +0800, Chen-Yu Tsai wrote:
> Hi everyone,
>=20
> This is v2 of my A80 CCU clk patches. Changes since v1:
>=20
>   - Use pre-divider adjusted parent rate for rounding.
>=20
>   - Use else statement for the case where the PLL lock status bit is
>     in same register.
>=20
>   - Add a more detailed description of the main CCU and DE CCU to the
>     commit messages.
>=20
>   - Fix DE CCU compatible string in DT binding example.
>=20
>   - Fix incorrectly squashed patch hunk.
>=20
>   - Drop leading zeros from device tree node name in DT examples.
>=20
>   - Expanded commit message for "ARM: dts: sun8i-a23-q8-tablet: Drop
>     pinmux setting for codec PA gpio".
>=20
> This series adds new "sunxi-ng" style drivers for the CCUs found in the
> Allwinner A80 SoC. The A80 contains 1 main clock control unit, and some
> subsystem specific clock control units at separate addresses. These
> include the USB, display engine, and MMC.
>=20
>   - The MMC clocks can be supported by the old clock drivers,
>     hence here we do not add a new driver for it.
>=20
>   - The old USB clock driver is intertwined with other SoCs,
>     requires old style bindings with clock-output-names and
>     CLK_OF_DECLARE for its parents. It is easier to switch
>     to a new binding and driver.
>=20
>   - The display engine (DE) CCU was not supported in the past.
>=20
> The A80 CCU also has some quirks about its design. It has
>=20
>   - Separate registers for PLL lock status
>=20
>   - P1, P2 dividers, which are power-of-2 and only 1 bit wide
>=20
> The first 3 patches fix and extend the behavior of sunxi-ng's
> mux clock type, based on the behavior of the clk subsystem's
> basic mux clock.
>=20
> The fourth patch adds support for checking PLL lock status
> bits in separate registers, as opposed to within the PLL's
> config register.
>=20
> Patches 5 through 7 add drivers for the CCU blocks.
>
> Patch 8 and 9 do some cleanup of the sunxi/allwinner dts files
> prior to switching sun9i dts to the new sunxi-ng clock bindings.
> These are independent of the clk stuff, but touch the same lines
> for sun9i. Including them should make it easier to apply and test
> patches.
>=20
> Patch 10 has sun9i switch over to the new clock bindings.
>=20
> Please take a look and let me know what you think.


This is a bit late, but I took it in anyway.

Note that I only applied the patches about the CCU. The pinctrl header
stuff is quite conflict heavy, and not really a big deal anyway.

(and I really would have liked to have it as a separate series. This
has nothing to do with the A80 CCU).

Thanks,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--zf4y3f3u3v63kcnj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYju5OAAoJEBx+YmzsjxAgQdQP/A1k0lcD0egBocxczkVmlsVG
qW8UPwqAJgKkFToB//HmJeWBNH30IzGfqsiarxg8yJ4Vq3n8PsAHT+e99Lt0EHBD
pkBelxncGbvvWawPoWaijjzs85mHGtG3TotMM+lSeBH9dFmg35XxxdTV3O3aQxxN
opRb/JNa+5veWD5qtkJJU5Qo3tTlYkTMr1Aao0HJCiYTqH1XTFs/gBx6fEng2i9t
D4/FUSeZDnPd5vyO+fcywY19ff2oGJQFMb9GcOkguVZ92zUndDsMFVpoQYono6qO
kzvr1/T70F7Z9k7IkLeayxCXfFztSlN33jj77fhD4gO0AnMpDPBxSa4/WBLa9naM
faQDEpbdHNpd/artgsGmh+HC0bB276/WfRCNfnMDfpYcMGgcI6SL6I1Nw9LCnL0+
d+SMvf9heExb/FjUv24njiKDhZxbWXRquOAAeB42f+jDWN489G8WBEvrQnqHX9iu
IASKPQ2em0n3jwHzjPvokEr7J5Ilel8zdn4x927x3HOm0nuDKib6lzyMp/qrBk4T
GDAbgTvGsXCtIHkZcKXHT8yfWpv5PHqNd6XIKTibk4tP4LK+35iFSoOn5g2/x5bD
KAhSiqzy3D5UZSlROfSoI5GBVdM5ut2F5auM1+ijkTIdba1oVBipar+i4PzxizuZ
xNvFscw6Av8MzsBc/nCC
=ogSG
-----END PGP SIGNATURE-----

--zf4y3f3u3v63kcnj--
