Return-Path: <sboyd@codeaurora.org>
Date: Wed, 23 Nov 2016 14:25:08 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
	Michael Turquette <mturquette@baylibre.com>,
	Jon Mason <jonmason@broadcom.com>,
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>
Subject: Re: [PATCH] clk: bcm: Fix unmet Kconfig dependencies for CLK_BCM_63XX
Message-ID: <20161123222508.GA6095@codeaurora.org>
References: <20161122174329.11592-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20161122174329.11592-1-f.fainelli@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On 11/22, Florian Fainelli wrote:
> With commit f4e871509959 ("clk: iproc: Make clocks visible options"),
> COMMON_CLK_IPROC gained a dependency on ARCH_BCM_IPROC, yet CLK_BCM_63XX
> also selects that option, this causes the following Kconfig warning:
> 
> warning: (CLK_BCM_63XX) selects COMMON_CLK_IPROC which has unmet direct
> dependencies ((ARCH_BCM_IPROC || COMPILE_TEST) && COMMON_CLK)
> 
> Fix this by adding proper depends/default for COMMON_CLK_IPROC
> 
> Fixes: f4e871509959 ("clk: iproc: Make clocks visible options")
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> ---

Applied to fixes with the default part dropped

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
