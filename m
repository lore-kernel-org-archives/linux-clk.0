Return-Path: <maxime.ripard@free-electrons.com>
Date: Fri, 28 Apr 2017 09:35:42 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Chen-Yu Tsai <wens@csie.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Icenowy Zheng <icenowy@aosc.xyz>,
	Tobias Regnery <tobias.regnery@gmail.com>,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: sunxi-ng: always select CCU_GATE
Message-ID: <20170428073542.jamyyjgafirqtth4@lukather>
References: <20170427110239.2389266-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xf27qlbkf54ua6vr"
In-Reply-To: <20170427110239.2389266-1-arnd@arndb.de>
List-ID: <linux-clk.vger.kernel.org>


--xf27qlbkf54ua6vr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

1;4601;0c
On Thu, Apr 27, 2017 at 01:02:31PM +0200, Arnd Bergmann wrote:
> When the base driver is enabled but all SoC specific drivers are turned
> off, we now get a build error after code was added to always refer to the
> clk gates:
>=20
> drivers/clk/built-in.o: In function `ccu_pll_notifier_cb':
> :(.text+0x154f8): undefined reference to `ccu_gate_helper_disable'
> :(.text+0x15504): undefined reference to `ccu_gate_helper_enable'
>=20
> This changes the Kconfig to always require the gate code to be built-in
> when CONFIG_SUNXI_CCU is set.
>=20
> Fixes: 02ae2bc6febd ("clk: sunxi-ng: Add clk notifier to gate then ungate=
 PLL clocks")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Stephen, Mike, can you apply this patch directly? This affects the
current (4.11) release, so we probably don't want to have the overhead
of a PR here :/

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--xf27qlbkf54ua6vr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJZAvDLAAoJEBx+YmzsjxAgyJIQAKELXCweqo4AWe9OI2tF/aQD
tq8qlo3F5sm/vzWQgEyBDJHvPeLz4jrdOg8TShMC9bPUA77Z1janm0PVwDJr6UYq
cUvoVl3nzuQCdFZDOkTa/wevPwujM1NJ6Ylni95XoSq4AuoA6cNGjW+3qeJqa9oq
P/hdKO9hz6hTFzDYQqRJgEce1y0jibqX1lZvgHhPDU/M3kh14x2wSx6Mamzmiz9Q
jQ36x4IATY+fSYgEzwNd30YE2sD5IlReORUHg+fsWNmzAPLV1IpPgoRqvHl3YaTK
Jp7WVQmBKe0vbIXUVlj7i2clEcmi0un8P5GKMkkPjQ7fQGP/XbPTJAfhjUCLyUIu
u/2QbIzY783Gv6+FBJi6v7zHt1KHYYvzx5e401byy+q5tu3h3AKem9qiCLFfmf+q
8EBEh/wZ/F78siDtjn2MRG9RjyOXtejYCJk8Dg6THCy5blJPKIPBccfBuok1oem+
E55a7vGqoy4YfMJOEJsgws3W32lp1nx+etHiH2OgBT2FlfEUSA1lewGZuut8mtyH
IwbvlX8kuEaV9oAXpb9t0RibFhCJkWo8eXceMycUqzxd9xil4c/GGO6Uv8+gKjxz
PoC8Dr9eYS+JzLcack2NGCOdOl8ZR6JZvkR/KRv8VTe3KVDSaHs7deZ82OaKgCWv
8Gl+EUGzUJdnlt/CiM9L
=Je4f
-----END PGP SIGNATURE-----

--xf27qlbkf54ua6vr--
