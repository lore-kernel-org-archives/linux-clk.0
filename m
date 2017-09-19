Return-Path: <pdeschrijver@nvidia.com>
Date: Tue, 19 Sep 2017 11:54:59 +0300
From: Peter De Schrijver <pdeschrijver@nvidia.com>
To: =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
CC: Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, "Thierry
 Reding" <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
	<linux-clk@vger.kernel.org>, <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH] clk: tegra30: fix cclk_lp divisor register
Message-ID: <20170919085459.GL6290@tbergstrom-lnx.Nvidia.com>
References: <f54b8ff896d3dcbae51741b817d65a7e9a21987a.1505789180.git.mirq-linux@rere.qmqm.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
In-Reply-To: <f54b8ff896d3dcbae51741b817d65a7e9a21987a.1505789180.git.mirq-linux@rere.qmqm.pl>
Return-Path: pdeschrijver@nvidia.com
List-ID: <linux-clk.vger.kernel.org>

On Tue, Sep 19, 2017 at 04:48:10AM +0200, Micha=C5=82 Miros=C5=82aw wrote:
> According to comments in code and common sense, cclk_lp uses its
> own divisor, not cclk_g's.
>=20

Acked-By: Peter De Schrijver <pdeschrijver@nvidia.com>

Note that we model multiple clocks which touch the same hw register which
will likely not work if you would use more than one of them. So probably
this needs to be refactored somehow. The clock topology is rather odd
though as the divider only applies to certain inputs for cclk_lp.

> Fixes: b08e8c0ecc42 ("clk: tegra: add clock support for Tegra30")
> Signed-off-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> ---
>  drivers/clk/tegra/clk-tegra30.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/clk/tegra/clk-tegra30.c b/drivers/clk/tegra/clk-tegr=
a30.c
> index 8f5a3e7c3bf9..95b7df4a8abd 100644
> --- a/drivers/clk/tegra/clk-tegra30.c
> +++ b/drivers/clk/tegra/clk-tegra30.c
> @@ -964,7 +964,7 @@ static void __init tegra30_super_clk_init(void)
>  	 * U71 divider of cclk_lp.
>  	 */
>  	clk =3D tegra_clk_register_divider("pll_p_out3_cclklp", "pll_p_out3",
> -				clk_base + SUPER_CCLKG_DIVIDER, 0,
> +				clk_base + SUPER_CCLKLP_DIVIDER, 0,
>  				TEGRA_DIVIDER_INT, 16, 8, 1, NULL);
>  	clk_register_clkdev(clk, "pll_p_out3_cclklp", NULL);
> =20
> --=20
> 2.11.0
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe linux-clk" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
