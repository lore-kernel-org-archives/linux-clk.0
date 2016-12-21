Return-Path: <sboyd@codeaurora.org>
Date: Wed, 21 Dec 2016 15:08:12 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>,
	Fabio Estevam <fabio.estevam@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org, Chris Healy <cphealy@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] clk: imx: pllv3: support fractional multiplier on
 vf610 PLL1/PLL2
Message-ID: <20161221230812.GL5423@codeaurora.org>
References: <1482135129-28570-1-git-send-email-nikita.yoush@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1482135129-28570-1-git-send-email-nikita.yoush@cogentembedded.com>
List-ID: <linux-clk.vger.kernel.org>

On 12/19, Nikita Yushchenko wrote:
> On vf610, PLL1 and PLL2 have registers to configure fractional part of
> frequency multiplier.
> 
> This patch adds support for these registers.
> 
> This fixes "fast system clock" issue on boards where bootloader sets
> fractional multiplier for PLL1.
> 
> Suggested-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> CC: Chris Healy <cphealy@gmail.com>
> Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
> Tested-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
