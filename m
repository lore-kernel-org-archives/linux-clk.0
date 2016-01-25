Return-Path: <thierry.reding@gmail.com>
Return-Path: <thierry.reding@gmail.com>
Date: Mon, 25 Jan 2016 13:47:08 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Rhyland Klein <rklein@nvidia.com>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>,
	Mike Turquette <mturquette@baylibre.com>,
	Stephen Warren <swarren@wwwdotorg.org>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Alexandre Courbot <gnurou@gmail.com>, linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [Patch V2 6/9] clk: tegra210: fix pllx dyn step calculation
Message-ID: <20160125124708.GL20452@ulmo.nvidia.com>
References: <1452799478-14791-1-git-send-email-rklein@nvidia.com>
 <1452799478-14791-7-git-send-email-rklein@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="lHuqAdgBYNjQz/wy"
In-Reply-To: <1452799478-14791-7-git-send-email-rklein@nvidia.com>
List-ID: <linux-clk.vger.kernel.org>


--lHuqAdgBYNjQz/wy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 14, 2016 at 02:24:35PM -0500, Rhyland Klein wrote:
> The logic for calculating the input rate used when figuring out
> the proper dynamic steps for pllx was incorrect. It is supposed to
> be calculated using parent_rate / m but it was just using the parent
> rate directly, therefore using the wrong step values.
>=20
> Signed-off-by: Rhyland Klein <rklein@nvidia.com>
> ---
>  drivers/clk/tegra/clk-tegra210.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

Applied, thanks.

Thierry

--lHuqAdgBYNjQz/wy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWphlLAAoJEN0jrNd/PrOhyZYP/0yddyYV+buh6VbBumkAQFGd
I2bKW+Txr5eVwokcYGmHTJtTpCHoH6qxbJw3kNR+xneAVi99t4h/NmqvMkCCjI0t
vbib4ktX7ZlwFtViTjQPWeD2oM/1u6r+kbDzL9bVT7Jb9Np8S+/8rnW6weWFAv6U
gyuU9ILVkqNg6NeUWe6eZZmhxmxGPtX3nlnPWOffalK7hrqlC1ciq6bwgzvugM02
Ewh+1I7h/vYHjfdTMFjUB2rUEekCujx4j67dQFb1czQ3kF7BqAlLjKinhsibycKW
A9m55bHv5Q5CUEDf76QRkq7hPCked7HF7lY8tx3d/VxfxL+Qcr5WHaahIlFO3swe
3Mz/18BHxl2GpLaPc+EnD3SDxns1oWYHMBus2UKZU+RZb8PQMP7Br5TAUKKKXiwJ
zwUqhftyFr2+06JBPI+1P/Q/1LLsjb2QnlTKeaU3kmOaRpSgSNNw0zHhevBtd3Vw
iSd7DPnHYqocd1JbtVvaq6TiNDG3DFwcbwb8ml3zRyakWwM7w55s3uaDare4Pl0o
q/k5wHMw1IYK1cWf+GavArAWANxPVpypuGUMHDua4Ri6bfvZOMXNnJ0T2/xVYvjX
u8sr/N4F5Ffg+14riqtOx7Yjiop9pOM9DnC4cwvpwfrQfY7PWgDszYpeyY04SBFc
9RO2EtRvOkj6xmTCzILg
=uCGd
-----END PGP SIGNATURE-----

--lHuqAdgBYNjQz/wy--
