Return-Path: <jonathanh@nvidia.com>
Subject: Re: [PATCH] clk: tegra: Fix bypassing of PLLs
To: Stephen Boyd <sboyd@codeaurora.org>
References: <1448032264-29622-1-git-send-email-jonathanh@nvidia.com>
 <20151120171527.GL32672@codeaurora.org>
CC: Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad
	<pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, "Stephen
 Warren" <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>,
	Alexandre Courbot <gnurou@gmail.com>, <linux-clk@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Rhyland Klein
	<rklein@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <56530851.8020206@nvidia.com>
Date: Mon, 23 Nov 2015 12:36:33 +0000
MIME-Version: 1.0
In-Reply-To: <20151120171527.GL32672@codeaurora.org>
Return-Path: jonathanh@nvidia.com
Content-Type: text/plain; charset="windows-1252"
List-ID: <linux-clk.vger.kernel.org>


On 20/11/15 17:15, Stephen Boyd wrote:
> On 11/20, Jon Hunter wrote:
>> The _clk_disable_pll() function will attempt to place a PLL into bypass
>> if the TEGRA_PLL_BYPASS is specified for the PLL and then disable the PLL
>> by clearing the enable bit. To place the PLL into bypass, the bypass bit
>> needs to be set and not cleared. Fix this by setting the bypass bit and
>> not clearing it.
>>
>> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
>> ---
> 
> Fixes tag? It looks like this has been wrong from the beginning
> of time.

Yes good point.

Thierry, I see you have put this in the -next branch for tegra. Do you
want to add the following?

Fixes: 8f8f484bf355 ("clk: tegra: add Tegra specific clocks")

Jon
