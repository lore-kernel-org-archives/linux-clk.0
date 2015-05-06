Return-Path: <rklein@nvidia.com>
Message-ID: <554A3EE6.9010805@nvidia.com>
Date: Wed, 6 May 2015 12:18:46 -0400
From: Rhyland Klein <rklein@nvidia.com>
MIME-Version: 1.0
To: Thierry Reding <thierry.reding@gmail.com>, Peter De Schrijver
	<pdeschrijver@nvidia.com>
CC: Mike Turquette <mturquette@linaro.org>, Stephen Warren
	<swarren@wwwdotorg.org>, Stephen Boyd <sboyd@codeaurora.org>, Alexandre
 Courbot <gnurou@gmail.com>, <linux-clk@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 19/20] clk: tegra210: add support for Tegra210 clocks
References: <1430757460-9478-1-git-send-email-rklein@nvidia.com> <1430757460-9478-20-git-send-email-rklein@nvidia.com> <20150506145113.GH22098@ulmo.nvidia.com>
In-Reply-To: <20150506145113.GH22098@ulmo.nvidia.com>
Content-Type: text/plain; charset="windows-1252"
Return-Path: rklein@nvidia.com
List-ID: <linux-clk.vger.kernel.org>

On 5/6/2015 10:51 AM, Thierry Reding wrote:
> * PGP Signed by an unknown key
> 
> On Mon, May 04, 2015 at 12:37:39PM -0400, Rhyland Klein wrote:
> [...]
>> diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
> [...]
>> +static struct div_nmp plld_nmp = {
>> +	.divm_shift = 0,
>> +	.divm_width = 8,
>> +	.divn_shift = 11,
>> +	.divn_width = 8,
>> +	.divp_shift = 20,
>> +	.divp_width = 3,
>> +};
> 
> I think we need to add the SDM shift and width fields here:
> 
> 	.sdm_shift = 0,
> 	.sdm_width = 16,
> 
> Otherwise pll_d can't take advantage of the fractional divider.
> 
> [...]
>> +static struct tegra_clk tegra210_clks[tegra_clk_max] __initdata = {
> [...]
>> +	[tegra_clk_clk72Mhz] = { .dt_id = TEGRA210_CLK_CLK72MHZ, .present = true },
> 
> I think you want to use the _8 variant here that you specifically
> introduced for Tegra210 in an earlier patch.
> 
>> +static __init void tegra210_periph_clk_init(void __iomem *clk_base,
>> +					    void __iomem *pmc_base)
>> +{
>> +	struct clk *clk;
>> +
>> +	/* xusb_ss_div2 */
>> +	clk = clk_register_fixed_factor(NULL, "xusb_ss_div2", "xusb_ss_src", 0,
>> +					1, 2);
>> +	clks[TEGRA210_CLK_XUSB_SS_DIV2] = clk;
>> +
>> +	/* plld_dsi */
>> +	clk = clk_register_gate(NULL, "pll_d_dsi", "pll_d_out0", 0,
>> +				clk_base + PLLD_MISC0, 21, 0, &pll_d_lock);
>> +	clks[TEGRA210_CLK_PLLD_DSI] = clk;
>> +
>> +	/* dsia */
>> +	clk = tegra_clk_register_periph_gate("dsia", "pll_d_dsi", 0, clk_base,
>> +					     0, 48, periph_clk_enb_refcnt);
>> +	clks[TEGRA210_CLK_DSIA] = clk;
>> +
>> +	/* dsib */
>> +	clk = tegra_clk_register_periph_gate("dsib", "pll_d_dsi", 0, clk_base,
>> +					     0, 82, periph_clk_enb_refcnt);
>> +	clks[TEGRA210_CLK_DSIB] = clk;
> 
> Can we rename pll_d_dsi to pll_d_dsi_out for consistency with earlier
> SoC generations, please? Also, don't forget the /* plld_dsi */ comment.

sure

> 
> In retrospect I'm not sure we've got this clock right. The (public)
> documentation is a little sparse, but I think this bit actually enables
> the fast and slow clocks to the MIPI pad macros. If you look at the
> register documentation for Tegra30 and Tegra114 they use a similarly
> named register with a more verbose description. I've also seen a couple
> of clock diagrams that indicate where these actually are.
> 
> Now what I wonder is if it makes any sense to represent this as a parent
> clock for DSI, because it really isn't. But if it isn't then we need to
> find another way of enabling this. Presumably turning this off saves
> power if pll_d is used for non-DSI/CSI purposes, so we'd want to disable
> it when we can. We could export this as a separate clock and add it to
> the DSI driver.
> 
> Rhyland, can you file an internal bug to track this, so that we get the
> documentation updated. Peter, can you help find out what the real story
> is with this clock?
> 

I'll file the bug and look into it some more.

-rhyland

>> diff --git a/include/dt-bindings/clock/tegra210-car.h b/include/dt-bindings/clock/tegra210-car.h
> [...]
>> +#define TEGRA210_CLK_PLLD_DSI 307
> 
> This would be TEGRA210_CLK_PLL_D_DSI_OUT after the rename suggested
> above.
> 
> I have a couple of other clocks that need to be added, but I think we
> can do that in separate patches, especially since some require changes
> to the drivers for previous SoCs.
> 
> Thierry
> 
> * Unknown Key
> * 0x7F3EB3A1
> 


-- 
nvpublic
