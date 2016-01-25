Return-Path: <thierry.reding@gmail.com>
Return-Path: <thierry.reding@gmail.com>
Date: Mon, 25 Jan 2016 13:30:57 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Rhyland Klein <rklein@nvidia.com>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>,
	Mike Turquette <mturquette@baylibre.com>,
	Stephen Warren <swarren@wwwdotorg.org>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Alexandre Courbot <gnurou@gmail.com>, linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [Patch V2 1/9] clk: tegra: Fix divider on VI_I2C
Message-ID: <20160125123057.GD20452@ulmo.nvidia.com>
References: <1452799478-14791-1-git-send-email-rklein@nvidia.com>
 <1452799478-14791-2-git-send-email-rklein@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wULyF7TL5taEdwHz"
In-Reply-To: <1452799478-14791-2-git-send-email-rklein@nvidia.com>
List-ID: <linux-clk.vger.kernel.org>


--wULyF7TL5taEdwHz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 14, 2016 at 02:24:30PM -0500, Rhyland Klein wrote:
> VI-I2C has 16 bits available for its divider. Switch the divider
> width to 16 instead of 8 so correct rates can be set.
>=20
> Signed-off-by: Rhyland Klein <rklein@nvidia.com>
> ---
>  drivers/clk/tegra/clk-tegra-periph.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thierry

--wULyF7TL5taEdwHz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWphWAAAoJEN0jrNd/PrOhDXsP/2d0Bcr6tfkePb9iFKYVyaQQ
oFVAHHRjxNGz0WmZvfASN5XeV66Kqp4yHvQivb9K33O59uJy4HYTx9BKsY/ah6dz
KjEWwl/0yTJYQ2sLHukbwERecZyDwamEkZ1KlNu6tdomsweVzK9MuK/60gvYY4kY
p2jnCZ/C5n0sSPIPWqpaGPSpOoKvqKMzo26hng9d9Q8qk++3fXaMAjWM7gBDnZod
FFpByrNWtWuMmK0wSEbR0iGCvgWOm+mS17qRIm/oMEL4IjisW/8ZlLoCq8qShASb
5B+R+OYBOUuiNw/6bKup2ajofMmKJsaIAx3s+Xs3h+fZHyBNC03tFZ3giXy6MAj4
xlIUEzoD9r3TWAoq7AOxDHZBnU/KlPW6cMWKrskdbdGfgYgEh7YSBOlPS7sjTufb
/vkuq8yVUdDt92R2oyBYfd+NY6FGW6m76U7WxiV533Nzmyye2DMbxQekuqchGje0
FEpONhz/h3v4wIJ9+T4NyUbFGPOQubuwTv+paKVqVTV8ZHDNObqKFx0RThYGOJIe
LRcoIhlM6pcLJPid1RJ2hyu2mTjnvXvOHw0asOxppfUmr3SItcTAT0+PK8FsVLgS
a16+Rh3sieFKk1bSzMRuqFdoL+Ouht9XVqJrffj15tanchxiShfVYQZcnB+IBY6p
pziDwUEII8+JXnjPKtmF
=iIvJ
-----END PGP SIGNATURE-----

--wULyF7TL5taEdwHz--
