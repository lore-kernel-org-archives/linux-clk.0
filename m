Return-Path: <jilin@nvidia.com>
Message-ID: <555C582A.7050508@nvidia.com>
Date: Wed, 20 May 2015 17:47:22 +0800
From: Jim Lin <jilin@nvidia.com>
MIME-Version: 1.0
To: Rhyland Klein <rklein@nvidia.com>
CC: Peter De Schrijver <pdeschrijver@nvidia.com>, Mike Turquette
	<mturquette@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Stephen Boyd
	<sboyd@codeaurora.org>, Thierry Reding <thierry.reding@gmail.com>, "Alexandre
 Courbot" <gnurou@gmail.com>, Bill Huang <bilhuang@nvidia.com>, Paul Walmsley
	<pwalmsley@nvidia.com>, Benson Leung <bleung@chromium.org>,
	<linux-clk@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 20/21] clk: tegra210: add support for Tegra210 clocks
References: <1431451444-23155-1-git-send-email-rklein@nvidia.com> <1431451444-23155-22-git-send-email-rklein@nvidia.com>
In-Reply-To: <1431451444-23155-22-git-send-email-rklein@nvidia.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Return-Path: jilin@nvidia.com
List-ID: <linux-clk.vger.kernel.org>

On 05/13/2015 01:24 AM, Rhyland Klein wrote:
> diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
> new file mode 100644
> index 000000000000..7f25e60e4d48
> --- /dev/null
> +++ b/drivers/clk/tegra/clk-tegra210.c
>
> +
> +static struct tegra_clk_init_table common_init_table[] __initdata = {
> +	{TEGRA210_CLK_UARTA, TEGRA210_CLK_PLL_P, 408000000, 0},
> +	{TEGRA210_CLK_UARTB, TEGRA210_CLK_PLL_P, 408000000, 0},
> +	{TEGRA210_CLK_UARTC, TEGRA210_CLK_PLL_P, 408000000, 0},
> +	{TEGRA210_CLK_UARTD, TEGRA210_CLK_PLL_P, 408000000, 0},
> +	{TEGRA210_CLK_PLL_A, TEGRA210_CLK_CLK_MAX, 564480000, 1},
> +	{TEGRA210_CLK_PLL_A_OUT0, TEGRA210_CLK_CLK_MAX, 11289600, 1},
> +	{TEGRA210_CLK_EXTERN1, TEGRA210_CLK_PLL_A_OUT0, 0, 1},
> +	{TEGRA210_CLK_CLK_OUT_1_MUX, TEGRA210_CLK_EXTERN1, 0, 1},
> +	{TEGRA210_CLK_CLK_OUT_1, TEGRA210_CLK_CLK_MAX, 0, 1},
> +	{TEGRA210_CLK_I2S0, TEGRA210_CLK_PLL_A_OUT0, 11289600, 0},
> +	{TEGRA210_CLK_I2S1, TEGRA210_CLK_PLL_A_OUT0, 11289600, 0},
> +	{TEGRA210_CLK_I2S2, TEGRA210_CLK_PLL_A_OUT0, 11289600, 0},
> +	{TEGRA210_CLK_I2S3, TEGRA210_CLK_PLL_A_OUT0, 11289600, 0},
> +	{TEGRA210_CLK_I2S4, TEGRA210_CLK_PLL_A_OUT0, 11289600, 0},
> +	{TEGRA210_CLK_HOST1X, TEGRA210_CLK_PLL_P, 136000000, 1},
> +	{TEGRA210_CLK_SCLK_MUX, TEGRA210_CLK_PLL_P, 0, 1},
> +	{TEGRA210_CLK_SCLK, TEGRA210_CLK_CLK_MAX, 102000000, 1},
> +	{TEGRA210_CLK_DFLL_SOC, TEGRA210_CLK_PLL_P, 51000000, 1},
> +	{TEGRA210_CLK_DFLL_REF, TEGRA210_CLK_PLL_P, 51000000, 1},
> +	{TEGRA210_CLK_SBC4, TEGRA210_CLK_PLL_P, 12000000, 1},
> +	{TEGRA210_CLK_PLL_RE_VCO, TEGRA210_CLK_CLK_MAX, 624000000, 0},
> +	{TEGRA210_CLK_PLL_U_OUT1, TEGRA210_CLK_CLK_MAX, 48000000, 0},
> +	{TEGRA210_CLK_PLL_U_OUT2, TEGRA210_CLK_CLK_MAX, 60000000, 0},
Could you help to modify this as the following?
Clocks have to be enabled only once.

+	{TEGRA210_CLK_PLL_RE_VCO, TEGRA210_CLK_CLK_MAX, 624000000, 1},
+	{TEGRA210_CLK_PLL_U_OUT1, TEGRA210_CLK_CLK_MAX, 48000000, 1},
+	{TEGRA210_CLK_PLL_U_OUT2, TEGRA210_CLK_CLK_MAX, 60000000, 1},


> +	{TEGRA210_CLK_XUSB_SS_SRC, TEGRA210_CLK_PLL_U_480M, 120000000, 0},
> +	{TEGRA210_CLK_XUSB_FS_SRC, TEGRA210_CLK_PLL_U_48M, 48000000, 0},
> +	{TEGRA210_CLK_XUSB_HS_SRC, TEGRA210_CLK_PLL_U_60M, 60000000, 0},
> +	{TEGRA210_CLK_XUSB_FALCON_SRC, TEGRA210_CLK_PLL_RE_OUT, 224000000, 0},
> +	{TEGRA210_CLK_XUSB_HOST_SRC, TEGRA210_CLK_PLL_RE_OUT, 112000000, 0},
> +	{TEGRA210_CLK_SATA, TEGRA210_CLK_PLL_P, 104000000, 0},
> +	{TEGRA210_CLK_SATA_OOB, TEGRA210_CLK_PLL_P, 204000000, 0},
> +	{TEGRA210_CLK_EMC, TEGRA210_CLK_CLK_MAX, 0, 1},
> +	{TEGRA210_CLK_MSELECT, TEGRA210_CLK_CLK_MAX, 0, 1},
> +	{TEGRA210_CLK_CSITE, TEGRA210_CLK_CLK_MAX, 0, 1},
> +	{TEGRA210_CLK_TSENSOR, TEGRA210_CLK_CLK_M, 400000, 0},
> +	{TEGRA210_CLK_I2C1, TEGRA210_CLK_PLL_P, 0, 0},
> +	{TEGRA210_CLK_I2C2, TEGRA210_CLK_PLL_P, 0, 0},
> +	{TEGRA210_CLK_I2C3, TEGRA210_CLK_PLL_P, 0, 0},
> +	{TEGRA210_CLK_I2C4, TEGRA210_CLK_PLL_P, 0, 0},
> +	{TEGRA210_CLK_I2C5, TEGRA210_CLK_PLL_P, 0, 0},
> +	{TEGRA210_CLK_I2C6, TEGRA210_CLK_PLL_P, 0, 0},
> +	{TEGRA210_CLK_PLL_DP, TEGRA210_CLK_CLK_MAX, 270000000, 0},
> +	/* This MUST be the last entry. */
> +	{TEGRA210_CLK_CLK_MAX, TEGRA210_CLK_CLK_MAX, 0, 0},
> +};
> +
--nvpublic
