Return-Path: <rklein@nvidia.com>
Message-ID: <555CC183.2040302@nvidia.com>
Date: Wed, 20 May 2015 13:16:51 -0400
From: Rhyland Klein <rklein@nvidia.com>
MIME-Version: 1.0
To: Jim Lin <jilin@nvidia.com>
CC: Peter De Schrijver <pdeschrijver@nvidia.com>, Mike Turquette
	<mturquette@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Stephen Boyd
	<sboyd@codeaurora.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre
 Courbot <gnurou@gmail.com>, Bill Huang <bilhuang@nvidia.com>, Paul Walmsley
	<pwalmsley@nvidia.com>, Benson Leung <bleung@chromium.org>,
	<linux-clk@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 20/21] clk: tegra210: add support for Tegra210 clocks
References: <1431451444-23155-1-git-send-email-rklein@nvidia.com> <1431451444-23155-22-git-send-email-rklein@nvidia.com> <555C582A.7050508@nvidia.com>
In-Reply-To: <555C582A.7050508@nvidia.com>
Content-Type: text/plain; charset="windows-1252"
Return-Path: rklein@nvidia.com
List-ID: <linux-clk.vger.kernel.org>

On 5/20/2015 5:47 AM, Jim Lin wrote:
> On 05/13/2015 01:24 AM, Rhyland Klein wrote:
>> diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
>> new file mode 100644
>> index 000000000000..7f25e60e4d48
>> --- /dev/null
>> +++ b/drivers/clk/tegra/clk-tegra210.c
>>
>> +
>> +static struct tegra_clk_init_table common_init_table[] __initdata = {
>> +	{TEGRA210_CLK_UARTA, TEGRA210_CLK_PLL_P, 408000000, 0},
>> +	{TEGRA210_CLK_UARTB, TEGRA210_CLK_PLL_P, 408000000, 0},
>> +	{TEGRA210_CLK_UARTC, TEGRA210_CLK_PLL_P, 408000000, 0},
>> +	{TEGRA210_CLK_UARTD, TEGRA210_CLK_PLL_P, 408000000, 0},
>> +	{TEGRA210_CLK_PLL_A, TEGRA210_CLK_CLK_MAX, 564480000, 1},
>> +	{TEGRA210_CLK_PLL_A_OUT0, TEGRA210_CLK_CLK_MAX, 11289600, 1},
>> +	{TEGRA210_CLK_EXTERN1, TEGRA210_CLK_PLL_A_OUT0, 0, 1},
>> +	{TEGRA210_CLK_CLK_OUT_1_MUX, TEGRA210_CLK_EXTERN1, 0, 1},
>> +	{TEGRA210_CLK_CLK_OUT_1, TEGRA210_CLK_CLK_MAX, 0, 1},
>> +	{TEGRA210_CLK_I2S0, TEGRA210_CLK_PLL_A_OUT0, 11289600, 0},
>> +	{TEGRA210_CLK_I2S1, TEGRA210_CLK_PLL_A_OUT0, 11289600, 0},
>> +	{TEGRA210_CLK_I2S2, TEGRA210_CLK_PLL_A_OUT0, 11289600, 0},
>> +	{TEGRA210_CLK_I2S3, TEGRA210_CLK_PLL_A_OUT0, 11289600, 0},
>> +	{TEGRA210_CLK_I2S4, TEGRA210_CLK_PLL_A_OUT0, 11289600, 0},
>> +	{TEGRA210_CLK_HOST1X, TEGRA210_CLK_PLL_P, 136000000, 1},
>> +	{TEGRA210_CLK_SCLK_MUX, TEGRA210_CLK_PLL_P, 0, 1},
>> +	{TEGRA210_CLK_SCLK, TEGRA210_CLK_CLK_MAX, 102000000, 1},
>> +	{TEGRA210_CLK_DFLL_SOC, TEGRA210_CLK_PLL_P, 51000000, 1},
>> +	{TEGRA210_CLK_DFLL_REF, TEGRA210_CLK_PLL_P, 51000000, 1},
>> +	{TEGRA210_CLK_SBC4, TEGRA210_CLK_PLL_P, 12000000, 1},
>> +	{TEGRA210_CLK_PLL_RE_VCO, TEGRA210_CLK_CLK_MAX, 624000000, 0},
>> +	{TEGRA210_CLK_PLL_U_OUT1, TEGRA210_CLK_CLK_MAX, 48000000, 0},
>> +	{TEGRA210_CLK_PLL_U_OUT2, TEGRA210_CLK_CLK_MAX, 60000000, 0},
> Could you help to modify this as the following?
> Clocks have to be enabled only once.
> 
> +	{TEGRA210_CLK_PLL_RE_VCO, TEGRA210_CLK_CLK_MAX, 624000000, 1},
> +	{TEGRA210_CLK_PLL_U_OUT1, TEGRA210_CLK_CLK_MAX, 48000000, 1},
> +	{TEGRA210_CLK_PLL_U_OUT2, TEGRA210_CLK_CLK_MAX, 60000000, 1},
> 
Yes I can merge this into v6.

-rhyland

-- 
nvpublic
