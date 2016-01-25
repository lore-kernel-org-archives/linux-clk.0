Return-Path: <thierry.reding@gmail.com>
Return-Path: <thierry.reding@gmail.com>
Date: Mon, 25 Jan 2016 13:46:48 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Rhyland Klein <rklein@nvidia.com>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>,
	Mike Turquette <mturquette@baylibre.com>,
	Stephen Warren <swarren@wwwdotorg.org>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Alexandre Courbot <gnurou@gmail.com>, linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
	Mark Kuo <mkuo@nvidia.com>
Subject: Re: [Patch V2 7/9] clk: tegra: pll: Do not disable PLLE when under
 HW control
Message-ID: <20160125124648.GK20452@ulmo.nvidia.com>
References: <1452799478-14791-1-git-send-email-rklein@nvidia.com>
 <1452799478-14791-8-git-send-email-rklein@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ZG5hGh9V5E9QzVHS"
In-Reply-To: <1452799478-14791-8-git-send-email-rklein@nvidia.com>
List-ID: <linux-clk.vger.kernel.org>


--ZG5hGh9V5E9QzVHS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 14, 2016 at 02:24:36PM -0500, Rhyland Klein wrote:
> From: Mark Kuo <mkuo@nvidia.com>
>=20
> SW should not disable PLLE if PLLE is already put under HW control.
>=20
> Signed-off-by: Mark Kuo <mkuo@nvidia.com>
> Signed-off-by: Rhyland Klein <rklein@nvidia.com>
> ---
>  drivers/clk/tegra/clk-pll.c | 22 +++++++++++++++-------
>  1 file changed, 15 insertions(+), 7 deletions(-)

Applied, thanks.

Thierry

--ZG5hGh9V5E9QzVHS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWphk4AAoJEN0jrNd/PrOhK6IQAKh8U5OFIuZF7JUE15gQc3qt
Q0dZjbJxH8PON/AvWn4hL9Af+ukkq/nex42AlYc19LKCiCO7VjBSgPOYlpqaCb7z
+qW3RUxBg+Ktq/rh8G8K2fFgk1hBb968GlIw/P5Pp9k5Y10YjFixhG5vU/wAjmh8
wqQubnGIPnFeqvlL4yA9A2RFheH2rrYxLCk7Hrf8zqkJuNkt2vwOEGLKzMdtJhBQ
X50fBxNxZZwIJrlc5Fzeieyjd8DdhU1+LecY9ye1oBxvIxBUAUsKBDxZT4AaeaLu
41PjEx5GsL5FjPrWJRLgwoM9kNk4/KPb5fK0o3xbBiE3zk6dRLbQ8QLAWlLfZ6jo
lTGE/1/NNRUISYboXvup+gnoVvD6I+lO4SleXqCWiDxpCyqZ20O8Fem+Q/gmR1m/
A1SbsGRvbb4q5TfMyz0C+BFSDHKBwyDdZwauQeXIbC4DMVpLQz4JYozAwW3D0A7I
3Ej7UAzte+WwLaPgaUZvOVmeDFzw1Zd3MA+bw8Gt6PuNfMsea/mb9VsMt79JBi6W
gbba+EvNN5hiW9mtsBrTOSyZLLi16qIV9LKS5NmsgQg0P7RdLSgUiD2t3ufmhR9s
S5N+R6J8CbkNSXvrluqd89wb9l+Cjuu/Gm7USR7BIQ3Itpxl87KJv6AIwP5Eijso
ywy1thhjiE+iS2FIOL/8
=gjC3
-----END PGP SIGNATURE-----

--ZG5hGh9V5E9QzVHS--
