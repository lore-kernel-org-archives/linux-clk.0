Return-Path: <rklein@nvidia.com>
Message-ID: <554916F8.2060908@nvidia.com>
Date: Tue, 5 May 2015 15:16:08 -0400
From: Rhyland Klein <rklein@nvidia.com>
MIME-Version: 1.0
To: Benson Leung <bleung@chromium.org>
CC: Peter De Schrijver <pdeschrijver@nvidia.com>, Mike Turquette
	<mturquette@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Stephen Boyd
	<sboyd@codeaurora.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre
 Courbot <gnurou@gmail.com>, <linux-clk@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 08/20] clk: tegra: pll: Add logic for handling SDM
 data
References: <1430757460-9478-1-git-send-email-rklein@nvidia.com>	<1430757460-9478-9-git-send-email-rklein@nvidia.com> <CANLzEksFVpYOtcG5QHHfQa6bGXJ6nMYrsP4yG=5wszxCHrWqug@mail.gmail.com>
In-Reply-To: <CANLzEksFVpYOtcG5QHHfQa6bGXJ6nMYrsP4yG=5wszxCHrWqug@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Return-Path: rklein@nvidia.com
List-ID: <linux-clk.vger.kernel.org>

On 5/4/2015 7:01 PM, Benson Leung wrote:
> On Mon, May 4, 2015 at 9:37 AM, Rhyland Klein <rklein@nvidia.com> wrote:
>> @@ -495,6 +505,28 @@ static int _calc_rate(struct clk_hw *hw, struct tegra_clk_pll_freq_table *cfg,
>>         return 0;
>>  }
>>
>> +static void clk_pll_set_sdm_data(struct clk_hw *hw,
>> +                                struct tegra_clk_pll_freq_table *cfg)
>> +{
>> +       struct tegra_clk_pll *pll = to_clk_pll(hw);
>> +       u32 val;
>> +
>> +       if (!pll->params->sdm_din_reg)
>> +               return;
>> +
>> +       if (cfg->sdm_data) {
>> +               val = pll_readl_sdm_din(pll) & (~sdm_din_mask(pll));
>> +               val |= sdin_data_to_din(cfg->sdm_data) & sdm_din_mask(pll);
>> +               pll_writel_sdm_din(val, pll);
>> +       }
>> +
>> +       val = pll_readl_sdm_ctrl(pll);
>> +       if (!cfg->sdm_data != !(val & pll->params->sdm_ctrl_en_mask)) {
> 
> You can use sdm_en_mask(pll) here.
> 
> I'm not super clear about what you're trying to accomplish here with
> !cfg->sdm_data != !(val & mask).
> Are you just checking if the masked value is different from sdm_data,
> but accounting for the integer widths being different (u16 vs u32)?

So I got clarification from the downstream author to be sure, and this
is the answer to what this is checking:

(<Configuration has non zero  SDM_DATA>  AND <sdm control is disabled>)
OR
(<Configuration has zero  SDM_DATA>  AND <sdm control is enabled>)

So the check is correct, just a complicated way of expressing it.

-rhyland


-- 
nvpublic
