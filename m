Return-Path: <rklein@nvidia.com>
Message-ID: <554792FB.6080804@nvidia.com>
Date: Mon, 4 May 2015 11:40:43 -0400
From: Rhyland Klein <rklein@nvidia.com>
MIME-Version: 1.0
To: Jim Lin <jilin@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>
CC: Mike Turquette <mturquette@linaro.org>, Stephen Warren
	<swarren@wwwdotorg.org>, Stephen Boyd <sboyd@codeaurora.org>, Thierry Reding
	<thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 12/20] clk: tegra: pll: Add specialized logic for T210
References: <1430506447-29074-1-git-send-email-rklein@nvidia.com> <1430506447-29074-13-git-send-email-rklein@nvidia.com> <3e078ce64eff4ac992900523b1b67f19@HKMAIL103.nvidia.com>
In-Reply-To: <3e078ce64eff4ac992900523b1b67f19@HKMAIL103.nvidia.com>
Content-Type: text/plain; charset="windows-1252"
Return-Path: rklein@nvidia.com
List-ID: <linux-clk.vger.kernel.org>

On 5/1/2015 11:12 PM, Jim Lin wrote:
> 
>> +static void clk_plle_tegra210_is_enabled(struct struct clk_hw *hw) {
> Returned type is "int" instead of "void".
> Also one "struct" only for "clk_hw *hw"?
> 
>> +	struct tegra_clk_pll *pll = to_clk_pll(hw);
>> +	u32 val;
>> +
>> +	val = pll_readl_base(pll);
>> +
>> +	return val & PLLE_BASE_ENABLE ? 1 : 0; }
>> +
> --nvpublic
> 
thanks! will fix.

-rhyland

-- 
nvpublic
