Return-Path: <maxime.ripard@free-electrons.com>
Date: Thu, 30 Mar 2017 14:44:17 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Elaine Zhang <zhangqing@rock-chips.com>
Cc: heiko@sntech.de, xf@rock-chips.com, huangtao@rock-chips.com,
	mturquette@baylibre.com, sboyd@codeaurora.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-rockchip@lists.infradead.org, xxx@rock-chips.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/4] clk: rockchip: rk3228: make noc and some special
 clk as critical_clocks
Message-ID: <20170330124417.73ucpdkoonuiyhxz@lukather>
References: <1490695614-3220-1-git-send-email-zhangqing@rock-chips.com>
 <1490695614-3220-3-git-send-email-zhangqing@rock-chips.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qr26icxxwhan4wmg"
In-Reply-To: <1490695614-3220-3-git-send-email-zhangqing@rock-chips.com>
List-ID: <linux-clk.vger.kernel.org>


--qr26icxxwhan4wmg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 28, 2017 at 06:06:52PM +0800, Elaine Zhang wrote:
> Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
> ---
>  drivers/clk/rockchip/clk-rk3228.c | 30 +++++++++++++++++++++++++++++-
>  1 file changed, 29 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/clk/rockchip/clk-rk3228.c b/drivers/clk/rockchip/clk=
-rk3228.c
> index db6e5a9e6de6..4d3203f887e2 100644
> --- a/drivers/clk/rockchip/clk-rk3228.c
> +++ b/drivers/clk/rockchip/clk-rk3228.c
> @@ -445,7 +445,7 @@ enum rk3228_plls {
>  			RK2928_CLKGATE_CON(2), 12, GFLAGS,
>  			&rk3228_spdif_fracmux),
> =20
> -	GATE(0, "jtag", "ext_jtag", 0,
> +	GATE(0, "jtag", "ext_jtag", CLK_IGNORE_UNUSED,

CLK_IGNORE_UNUSED only prevents a given clock from being gated at
late_initcall time, but will not prevent it from being gated later in
the life of the system, for example if a reparenting occurs, or if all
the clocks sharing the same clock tree become disabled.

If your clock really should never ever be gated in order for Linux to
operate properly, you should use CLK_IS_CRITICAL.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--qr26icxxwhan4wmg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJY3P2dAAoJEBx+YmzsjxAgB54QALt6JZwo49kNlmAA+F1+ttCA
tAidISBolM6ZhBrIwUXH3+jTzHfdC9hbdV5s2U307zWXwf7C5GNxR7wx8p7SspmC
RGIe8pb+RKruqr7Uivgj1jdut20RH70NVDjR958xLAbIV3ciOUhVhaXzZXQvjtiy
GHMjnS5mVJY5c62n4wV3nshO8jSdhS/97mxIHlauZa9aSSJenrCeySy2aJh/aZ0C
QT1iMm4ewvMkSbPUW+tIPQL4HTWDHVY6gvnZ87FbYDZng4455Gplbr9PormAF9Gc
GPzI7jaDNdLLaNliMc9kiJHvIbLhmjZ1vHnFh0/S31faw4XQ7J4+uFYMaEozcfhC
XoqdzK8eDbK0GTHepv2BfxdmMwszT2CcXBfu2W7Ip4BPRJhIGWsUzaz6wwEXR8Ub
c7YLqs0uBG8i8/oXW4JgWHxMEJfFIsUEYQKt8S9CcaWhezG1+OwCR1InpneoN7f/
h5lKKZM/g8b81fw40ycfvHdOFDPErwosfDLpvC8zkDfFL+zjohg9lyyX+dc6AcMb
0vBSvMK9Ayby8c0WadSnSLYLXlpyRkVrgK7le56JYsb7UCTKZsRbk4OgkEjh05XQ
t6uDfLWBnV5OvyJDqfNhcBEJ3BmQDnDX7vBh651dxTpKT7J2e66taOUpWQVqDOFR
frduTCTOL2gG4iKK1ITL
=UFrl
-----END PGP SIGNATURE-----

--qr26icxxwhan4wmg--
