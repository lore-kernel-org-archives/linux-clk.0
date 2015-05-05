Return-Path: <rklein@nvidia.com>
Message-ID: <55492043.2010202@nvidia.com>
Date: Tue, 5 May 2015 15:55:47 -0400
From: Rhyland Klein <rklein@nvidia.com>
MIME-Version: 1.0
To: Benson Leung <bleung@chromium.org>
CC: Peter De Schrijver <pdeschrijver@nvidia.com>, Mike Turquette
	<mturquette@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Stephen Boyd
	<sboyd@codeaurora.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre
 Courbot <gnurou@gmail.com>, <linux-clk@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 10/20] clk: tegra: pll: Add logic for out-of-table
 rates for T210
References: <1430757460-9478-1-git-send-email-rklein@nvidia.com>	<1430757460-9478-11-git-send-email-rklein@nvidia.com> <CANLzEktX3tiBXvxKgToUr5S7xZ+YibpeG6tDvW1R=qkW6_T5WQ@mail.gmail.com>
In-Reply-To: <CANLzEktX3tiBXvxKgToUr5S7xZ+YibpeG6tDvW1R=qkW6_T5WQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Return-Path: rklein@nvidia.com
List-ID: <linux-clk.vger.kernel.org>

On 5/4/2015 7:34 PM, Benson Leung wrote:
> On Mon, May 4, 2015 at 9:37 AM, Rhyland Klein <rklein@nvidia.com> wrote:
>> For Tegra210, the logic to calculate out-of-table rates is different
>> from previous generations. Add callbacks that can be overridden to
>> allow for different ways of calculating rates. Default to
>> _cal_rate when not specified.
> 
> You should mention that you're adding a new flag and new members that
> may override mdiv as well.

Yes, will add that.

> 
>>
>> Based on original work by Aleksandr Frid <afrid@nvidia.com>
>>
>> Signed-off-by: Rhyland Klein <rklein@nvidia.com>
>> ---
>> diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
>> index 3f92f1ad3961..b63ef31a2d7a 100644
>> --- a/drivers/clk/tegra/clk.h
>> +++ b/drivers/clk/tegra/clk.h
>> @@ -199,6 +199,8 @@ struct div_nmp {
>>   *     base register.
>>   * TEGRA_PLL_BYPASS - PLL has bypass bit
>>   * TEGRA_PLL_HAS_LOCK_ENABLE - PLL has bit to enable lock monitoring
>> + * TEGRA_MDIV_NEW - Switch to new method for calculating fixed mdiv
>> + *     it may be more accurate (especially if SDM present)
>>   */
>>  struct tegra_clk_pll_params {
>>         unsigned long   input_min;
>> @@ -235,7 +237,13 @@ struct tegra_clk_pll_params {
>>         struct div_nmp  *div_nmp;
>>         struct tegra_clk_pll_freq_table *freq_table;
>>         unsigned long   fixed_rate;
>> +       bool            vco_out;
> 
> vco_out is unused and unrelated to this change?

vco_out is used to mark which PLL's have a vco_out, and is going to be
used in the new out-of-table rate calculation in tegra210, so I will
move adding this member until that patch.


> 
>> +       u16             mdiv_default;
>> +       u32     (*round_p_to_pdiv)(u32 p, u32 *pdiv);
>>         void    (*set_gain)(struct tegra_clk_pll_freq_table *cfg);
>> +       int     (*calc_rate)(struct clk_hw *hw,
>> +                       struct tegra_clk_pll_freq_table *cfg,
>> +                       unsigned long rate, unsigned long parent_rate);
> 
> Add kerneldoc for new members.

Will do, thanks!

-rhyland


-- 
nvpublic
