Return-Path: <thierry.reding@gmail.com>
Return-Path: <thierry.reding@gmail.com>
Date: Mon, 11 Jun 2018 10:22:44 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Mikko Perttunen <mperttunen@nvidia.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Peter De Schrijver <pdeschrijver@nvidia.com>,
	linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] clk: tegra: Make vic03 a child of pll_c3
Message-ID: <20180611082244.GA31882@ulmo>
References: <20180611081853.31474-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="EeQfGwPcQSOJBaQU"
In-Reply-To: <20180611081853.31474-1-thierry.reding@gmail.com>
List-ID: <linux-clk.vger.kernel.org>


--EeQfGwPcQSOJBaQU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 11, 2018 at 10:18:53AM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>=20
> By default, the vic03 clock is a child of pll_m but that runs at 924 MHz
> which is too fast for VIC. Make vic03 a child of pll_c3 by default so it
> will run at a supported frequency.
>=20
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/clk/tegra/clk-tegra124.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/clk/tegra/clk-tegra124.c b/drivers/clk/tegra/clk-teg=
ra124.c
> index 0c69c7970950..f5048f82c0b9 100644
> --- a/drivers/clk/tegra/clk-tegra124.c
> +++ b/drivers/clk/tegra/clk-tegra124.c
> @@ -1290,6 +1290,7 @@ static struct tegra_clk_init_table common_init_tabl=
e[] __initdata =3D {
>  	{ TEGRA124_CLK_MSELECT, TEGRA124_CLK_CLK_MAX, 0, 1 },
>  	{ TEGRA124_CLK_CSITE, TEGRA124_CLK_CLK_MAX, 0, 1 },
>  	{ TEGRA124_CLK_TSENSOR, TEGRA124_CLK_CLK_M, 400000, 0 },
> +	{ TEGRA124_CLK_VIC03, TEGRA124_CLK_PLL_C3, 0, 0 },
>  	/* must be the last entry */
>  	{ TEGRA124_CLK_CLK_MAX, TEGRA124_CLK_CLK_MAX, 0, 0 },
>  };

Adding Peter for visibility.

Thierry

--EeQfGwPcQSOJBaQU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlseMVEACgkQ3SOs138+
s6HQzxAAwTJDtPWElBQrCQOnLNTdjHC+V8elbTX4Ce2eapL5FFNHAvb1K+cTqq7X
QtDyiN5c8iiaEDNte84hjUqan3lMmFpt3xJgYeNC99M5cih3y289GDztPhK4rYyL
E1Y7aenRX9U4P1HIJHWpaEekFK7QkIky/7RGZ9hO5vvBadCrflCqKe/K7MldewXH
+O65EvWs0BMenQSgHFZ5hvyJEttsN8tC40mZZ+77QcVbS7ie2a5j+jkZ6MM+yMQ2
eWj6elf9xd4k1w49T/jF7MCBhou2jxuSwepwUSahZb+e6ZMcd6V3mMPffvPr7TKJ
hLUYDDsijvWbdSjjqv4AuCE86HcSrA63KYRARJ3etqolUWqmpm2pWvsEL2IdB4dj
xRVW0tCNTpXZEBuYnkv0iKlqlrE6NEs49AUIVjp1JmhTy2gp9ci99UjW7pgO4ONk
JTtTYiGM6G+4kfwSjlDG8Z8oaER6wfHI4NYIj0ocmwnp7osuNVlm1o1WY9gFzcAM
6cqSPz4qI26Ac7UIUsEp9Jm+1/axbVe+2HUz323P/AiUxrCF+YXse0TVkYJHXfB4
p/v8hjkvCobVpDo6UnZtDoBdST2O9yI2i2OjI9gVRZh8G+B0ceAV8ESJA52qBGS0
/wmiPHMrwokjUGqUzyhSXsol1a1qYpPdMFBudO1bEA2syd6wzds=
=URtF
-----END PGP SIGNATURE-----

--EeQfGwPcQSOJBaQU--
