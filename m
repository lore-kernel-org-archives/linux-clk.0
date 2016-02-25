Return-Path: <sboyd@codeaurora.org>
Date: Thu, 25 Feb 2016 15:06:54 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Kevin Smith <kevin.smith@elecsyscorp.com>
Cc: "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Gregory CLEMENT <gregory.clement@free-electrons.com>,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: [PATCH v3 2/2] clk: mvebu: Move corediv config to mvebu config
Message-ID: <20160225230654.GD28849@codeaurora.org>
References: <1455136849-7888-1-git-send-email-kevin.smith@elecsyscorp.com>
 <1455209620-6125-1-git-send-email-kevin.smith@elecsyscorp.com>
 <1455209620-6125-2-git-send-email-kevin.smith@elecsyscorp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1455209620-6125-2-git-send-email-kevin.smith@elecsyscorp.com>
List-ID: <linux-clk.vger.kernel.org>

On 02/11, Kevin Smith wrote:
> The core clock does not depend on corediv, so enabling corediv
> based on the clock is not really correct.  Move the corediv
> config option from the clock driver Kconfig to the mvebu Kconfig
> so that it can be enabled by the MACH option instead.
> 
> This also enables corediv on Armada 375 and 38X, which was
> previously missing.
> 
> Signed-off-by: Kevin Smith <kevin.smith@elecsyscorp.com>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@codeaurora.org>
> Cc: Gregory CLEMENT <gregory.clement@free-electrons.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
