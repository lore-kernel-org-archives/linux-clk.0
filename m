Return-Path: <rklein@nvidia.com>
Message-ID: <554A4D82.80307@nvidia.com>
Date: Wed, 6 May 2015 13:21:06 -0400
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
Actually, sdm_shift/width aren't used. I originally added them to handle
SDM data, but eventually I switched to using a reg/mask combo. So this
isn't needed.

-rhyland


-- 
nvpublic
