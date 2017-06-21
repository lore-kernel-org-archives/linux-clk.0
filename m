Return-Path: <sboyd@codeaurora.org>
Date: Wed, 21 Jun 2017 15:08:58 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Jon Mason <jonmason@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: bcm: don't mark iproc_pll_clk_setup as __init
Message-ID: <20170621220858.GJ4493@codeaurora.org>
References: <20170621215851.4052618-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170621215851.4052618-1-arnd@arndb.de>
List-ID: <linux-clk.vger.kernel.org>

On 06/21, Arnd Bergmann wrote:
> This function is now called from the probe() function of a
> platform driver, which may be called later than __init,
> which triggers a lot of warnings like:
> 
> WARNING: drivers/clk/built-in.o(.text+0x1a41c): Section mismatch in reference from the function sr_lcpll1_clk_init() to the function .init.text:iproc_pll_clk_setup()
> 
> This removes the annotation on iproc_pll_clk_setup to address
> all those warnings.
> 
> Fixes: 654cdd3229cd ("clk: bcm: Add clocks for Stingray SOC")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thanks. I already have the fix in my queue though.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
