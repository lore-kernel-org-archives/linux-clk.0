Return-Path: <wsa@the-dreams.de>
Date: Fri, 14 Jul 2017 16:25:59 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: Re: clk: renesas: rcar-gen3: Fix error return code in
 cpg_sd_clock_recalc_rate
Message-ID: <20170714142559.p6xp6dp4whlqcr5n@ninjato>
References: <1492624001-3758-13-git-send-email-ykaneko0929@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dxvska6c26goqwhg"
In-Reply-To: <1492624001-3758-13-git-send-email-ykaneko0929@gmail.com>
List-ID: <linux-clk.vger.kernel.org>


--dxvska6c26goqwhg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 20, 2017 at 02:46:33AM +0900, Yoshihiro Kaneko wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>=20
> In .recalc_rate of struct clk_ops, it is desirable to return 0 if an
> error occurs, but -EINVAL is returned. This patch fixes it.
>=20
> Fixes: 5b1defde7054 ("clk: renesas: cpg-mssr: Extract common R-Car Gen3 s=
upport code")
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--dxvska6c26goqwhg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAllo1HcACgkQFA3kzBSg
KbbCbQ/9GVsmsx99cpPZGaQhm1PHL9MXDjXxSI3VdyijhL4bjqAGbFVzXGjzS+LF
Bjdsqn9WfC18YbTeXKPdGdgtQFbuRiHnUTsBsB5g9zu1CJjQDJMEN0aGHJjkXKxx
gZl6VkYMlbA3Nal6I53Ls0rElrYjWocsnV/RuUmDBYswSfLPXPJAkh3S0EG3pNw7
3OWD0oDsozOQUvHupqRmtJZ+Mh6hTPplV1TpcYBKtHFTWn9yLIKEPq35GGD8pZX0
Hl1t/zh/D12FnoOo6eqwTtord7RbmTLik9qa9iN2dpIXD7lfubglNqYqc64NQaMn
PBgGZ4J/hODUDs7MNjeZ9VT/3q/kViy6JuCLu/c5R3nHjcYsZq+By3x98A0876+L
lgtQ9x5MACCMGFciB/KyMLohN8lrtRZfb1Z3WlyBaGW5FvahpPBp5BiA7/Sg+g2D
wkNPCcLDOAsl2+XUtzjMPSeZf1G+s9HRI3Wm16/jv48TGPMP8mBtCsJ3ZqzXZJ2i
NF/U1ChRVYgWl1e1FjCZDf0h0bmfFtVfuXlyOtYII3TymxEZYIENhhThBy7Vbguo
lm3xxaSK49+UACCNQSKda71DYKVTChb1XdLCxgxsnmNraVQi5YtKf9AOTJR0w6hd
l/chmC4h5WCwtvGgKCZpJ3XmLHrYB6bp7I3i3tu52WqamB7Gt0o=
=aXxB
-----END PGP SIGNATURE-----

--dxvska6c26goqwhg--
