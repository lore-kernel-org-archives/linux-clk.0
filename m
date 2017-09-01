Return-Path: <sboyd@codeaurora.org>
Date: Fri, 1 Sep 2017 15:59:54 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Sergej Sawazki <sergej@taudac.com>
Cc: mturquette@baylibre.com, sebastian.hesselbarth@gmail.com,
	rabeeh@solid-run.com, linux@armlinux.org.uk,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH 0/3] clk: si5351: PLL reset fixes
Message-ID: <20170901225954.GJ21656@codeaurora.org>
References: <1502547783-24685-1-git-send-email-sergej@taudac.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1502547783-24685-1-git-send-email-sergej@taudac.com>
List-ID: <linux-clk.vger.kernel.org>

On 08/12, Sergej Sawazki wrote:
> The Si5351 clock generator has up to 8 output clocks and 2 PLLs. In order
> to get a deterministic phase offset relationship between the output clocks,
> it is necessary to reset the PLLs is certain scenarios.
> 
> This patch-set:
>  * fixes a regression and adds resetting the PLL before enabling the outputs
>  * adds a dt-property for enabling/disabling the PLL reset
>  * adds a debug message for PLL reset (it is helpful during debugging,
>    probably no longer required?)
> 
> Based on clk-next.
> 
> 

Please include Russell King on the patches. I'd like Sebastian or
Russell to review these before merging. For now, I'm going to
apply the other change from Russell.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
