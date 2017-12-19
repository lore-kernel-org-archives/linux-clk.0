Return-Path: <maxime.ripard@free-electrons.com>
Date: Tue, 19 Dec 2017 09:32:28 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Chen-Yu Tsai <wens@csie.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH] clk: sunxi: sun9i-mmc: Implement reset callback for
 reset controls
Message-ID: <20171219083228.mima36idnmhmogdy@flea.lan>
References: <20171218035751.20661-1-wens@csie.org>
 <20171218210709.GY7997@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xlp63tevqs6hn3aa"
In-Reply-To: <20171218210709.GY7997@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>


--xlp63tevqs6hn3aa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 18, 2017 at 01:07:09PM -0800, Stephen Boyd wrote:
> On 12/18, Chen-Yu Tsai wrote:
> > Our MMC host driver now issues a reset, instead of just deasserting
> > the reset control, since commit c34eda69ad4c ("mmc: sunxi: Reset the
> > device at probe time"). The sun9i-mmc clock driver does not support
> > this, and will fail, which results in MMC not probing.
> >=20
> > This patch implements the reset callback by asserting the reset control,
> > then deasserting it after a small delay.
> >=20
> > Fixes: 7a6fca879f59 ("clk: sunxi: Add driver for A80 MMC config clocks/=
resets")
> > Cc: <stable@vger.kernel.org> # 4.14.x
> > Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> > ---
>=20
> Did you want us to pick this up into clk-fixes? It seems to be
> causing MMC to not work for some time? That sounds annoying
> enough.

That would be great, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--xlp63tevqs6hn3aa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlo4zpsACgkQ0rTAlCFN
r3SE2A/7BIF/Li1M76KA7m6J4BWNuJy54cuS2g7FlOY6yJ6QO4My323MuD6kR+lE
hjDIiorVeByjNHbzUayTskyiCBnxCjA6jPj6h6/AALA+61oyWm5iV7MITnaAewOH
L/IyN4lWJi2oHt1DQXoCyUYTxxx9WgVIBJp7cs280qyJzlrAAq1c/pIpWxWdIOrl
ULAkp1A9SGVDlstJp917sr4w3GEA7fvfx2Bb/irRmKC0qEW6saZVJuIREKypP2jf
Q2WEPQ71CZywNs42xmlC1sSyRDYNGCMeMMEwpjXEcZew4yTIHnU8XpxSt023or39
ZO9IU8MTy1vssR0yOrjDlWGzay0Chl9faXfRtsHkImGrZirAWk/YHISkXLxEsbIa
Y8EiKI906dbXw1bdusDBUbGkKS1e1GrJ9Gt262cxTWn4a6bRRhANaY2xu/HRCOJ6
hN8WBM3H8eJFTcMUh5t7R3/glT17ybCrYSt1of77zFSdQigDHUzdfXeffkAlyxs7
L4WhdJ7eeXqdj187pPQ+buBrMKq3nhVoxvBXYVN+5uw7b5gqSmCWUA1QJeXFh/+z
9oCI8MO3CAPtqac0Sf080+YPgRZ+sD6sOMcXfN6Pq8vykjp1wRfUk3YFX+Mo1Gwv
NGttmx41h7FtH/z770+QRcBdl5GKoUaDKVnyv2NVlmHpwIiJJEQ=
=29mZ
-----END PGP SIGNATURE-----

--xlp63tevqs6hn3aa--
