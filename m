Return-Path: <thierry.reding@gmail.com>
Return-Path: <thierry.reding@gmail.com>
Date: Wed, 13 Jan 2016 18:15:50 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Stephen Warren <swarren@wwwdotorg.org>,
	Alexandre Courbot <gnurou@gmail.com>,
	Rhyland Klein <rklein@nvidia.com>, linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] clk: tegra: Fix sparse warning for pll_m
Message-ID: <20160113171550.GR2588@ulmo>
References: <1449248665-22343-1-git-send-email-jonathanh@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Idd68gPqKLz5+Ci0"
In-Reply-To: <1449248665-22343-1-git-send-email-jonathanh@nvidia.com>
List-ID: <linux-clk.vger.kernel.org>


--Idd68gPqKLz5+Ci0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 04, 2015 at 05:04:23PM +0000, Jon Hunter wrote:
> Sparse generates the following warning for the pll_m params structure:
>=20
> drivers/clk/tegra/clk-tegra210.c:1569:10: warning: Initializer entry
>  defined twice
> drivers/clk/tegra/clk-tegra210.c:1570:10:   also defined here
>=20
> Fix this by correcting the index for the MISC1 register.
>=20
> Fixes: b31eba5ff3f7 ("clk: tegra: Add support for Tegra210 clocks")
>=20
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  drivers/clk/tegra/clk-tegra210.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

All three patches applied.

Thanks,
Thierry

--Idd68gPqKLz5+Ci0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWloZGAAoJEN0jrNd/PrOhNt8P/RRbBHbI9h8uRYj5qNjBSeSQ
WlebJsZCRBoF1OA/7lSnm488TqKa5/qGUdQ4hwzeoQCJerGILBE69KamZlvHJp68
WR5ZAIjMZFwLqhConekK6qWDRe6eKfgHGs3/n54PWEDLoCvtbQKPQbHUGEUu2KM5
xSh6HlpDLYGuUrifvYMUdER5TpA2FPCAXA+qzERtEj2TlADmXcbwATUvO0xmQ6ra
ViABFuvsm7icfdL6upAINNDcwulrVjdDuiCFnyhv2dBpYTHURN0xAq0VMdzZ/Snk
xKh3loPEBjHuExrsilpxvGKnCy0Y8iVwi8OMb92aidrXu4jYjkaXx9wdZRcGIqzf
eaVwDgOoI2Xrxl9R/0OJ4hHVmA5FxPFDBgS1NVCiodH4eU+ejW+V4VXldCXJkZA1
C2kjeQTCWngX/aDiXG5/fgypgC+9SeuvqRj1Ch8cqgizyIjtPHtDuRBzD3K2JCpt
KHqTJGFAbCU1A58OmWwfnzhfsw59AFRfgmx/2735jfdis2m4zIhlVcdzX2ndvpZB
5YBBQcdprokNjT1yJGrxdVQRjYAOV97GoXjuQelyFuqt2EQdLB0BUJ1+wNCJa/Vt
dq8MDCNpp01C2UTthsUVNZqnHh+P2gVHxOW+0qRFrD/rU3qKizxWFl3x3Od9dw2Z
D/KwOuEUOBvGHToyZJvX
=WuPQ
-----END PGP SIGNATURE-----

--Idd68gPqKLz5+Ci0--
