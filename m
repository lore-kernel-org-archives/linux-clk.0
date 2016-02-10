Return-Path: <sboyd@codeaurora.org>
Date: Wed, 10 Feb 2016 12:46:37 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: slemieux.tyco@gmail.com
Cc: robh+dt@kernel.org, mturquette@baylibre.com, stigge@antcom.de,
	vz@mleia.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2] clk: lpc32xx: add HCLK PLL output configuration
Message-ID: <20160210204637.GJ30978@codeaurora.org>
References: <1455130352-25860-1-git-send-email-slemieux.tyco@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1455130352-25860-1-git-send-email-slemieux.tyco@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On 02/10, slemieux.tyco@gmail.com wrote:
> From: Sylvain Lemieux <slemieux@tycoint.com>
> 
> This patch add the support to setup the HCLK PLL output
> using the "assigned-clock-rates" parameter in the device tree.
> 
> If the option is not use, the clock setup by the kickstart
> and/or bootloader remain unchanged.
> 
> The previous kernel version did not change the clock frequency
> output setup by the kickstart and/or bootloader;
> this version always setup the clock frequency output to 208MHz.
> 
> Signed-off-by: Sylvain Lemieux <slemieux@tycoint.com>
> ---

I couldn't find any usage of this driver in the tree so I just
applied this to clk-next. If it needs to go into some immutable
branch please let me know.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
