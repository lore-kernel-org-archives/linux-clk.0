Return-Path: <thierry.reding@gmail.com>
Return-Path: <thierry.reding@gmail.com>
Date: Thu, 2 Nov 2017 09:46:05 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Peter De Schrijver <pdeschrijver@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: clock: tegra: Add sor1_out clock
Message-ID: <20171102084605.GA29341@ulmo>
References: <20170901145343.19890-1-thierry.reding@gmail.com>
 <20171102081648.GJ11011@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+QahgC5+KEYLbs62"
In-Reply-To: <20171102081648.GJ11011@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>


--+QahgC5+KEYLbs62
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 02, 2017 at 01:16:48AM -0700, Stephen Boyd wrote:
> On 09/01, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > The sor1_src clock implemented on Tegra210 is modelled the wrong way
> > around, which causes some issues with HDMI and DP support. This clock
> > implementation is provided by BPMP on Tegra186, which models this in
> > a more correct way. Since this introduces incompatibilities between
> > the two SoC generations which we want to avoid, the Tegra210 will be
> > fixed in subsequent patches.
> >=20
> > This change adds sor1_out as an alias for sor1_src.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
>=20
> Applied to clk-next

Hi Stephen,

sorry for not having been clear about this. This patch and the  2-4 are
part of the pull request I sent out earlier (and for which I have an
updated one to fix the regression I mentioned last week). I'd prefer to
send this to you via pull request because there is a dependency on this
=66rom the ARM SoC tree (for a DT change).

Any chance you could back this out?

Thierry

--+QahgC5+KEYLbs62
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAln620kACgkQ3SOs138+
s6FwRQ//TLZepeCnDNtoy1666Wp+GUOZf3mIaQmhvbqaLOFlSNiyKwPJJ2EPdYQb
PReRLBd0wQ6GQO3HLdMXY4dWyg0LELiQojbGDIBrT1cOniFufVgru08zo1t5zgoB
H4y5OFFGW2pBilLn6gQm1sKnT4Fv17QFHXlQV2iphVyCjrzCmyDPdFPxOC3KzGce
m0xVTkdNy4vMeRQyGeMnY1Hq/DdgzL5h+q6Gmcmn3N8WJLjuDV6wlxlZwgSOqTpi
JXwSrf+RqqRbKOxLWvTru3TbIyThss+UutSYyQKyz90RCs7081mVqdNka32Pi96D
CNDIuIksb3fPptnQqN5RwMv0CTHGIDQIWv05o38ICgNRGoH2NhjcrqNQOrXolCX5
72bbeL1DrryL1+sOEFdSIIu0+BnJgreoACF74ueiNvNTtKSFUskVazawqKxy5Uz5
U4NDWp7k0y2/58m5BZTfUYr2LrY+qpwOpJ46x1yzH2qECicCfQad5NSEY1HSp/Ib
As8TtpkNAZpRSV2/hizAT8wmlJCVKhj+xXELSLK6UuGdXDX7pysNvBnP8qkrug5o
h8CWa6zD3cpcRQlKQ+2EVJ2bbFTHmhFfw34HNPy0/74Jh7b9gl6W1xTOLL3niLrU
342NfOjSOokhSY+GSYLhotnniwb9Onpe3hAFIS4FwVYRboS1glM=
=i9Z9
-----END PGP SIGNATURE-----

--+QahgC5+KEYLbs62--
