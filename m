Return-Path: <sboyd@codeaurora.org>
Date: Fri, 20 Nov 2015 15:48:34 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: linux-clk@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
	devicetree@vger.kernel.org, jonmason@broadcom.com,
	mturquette@baylibre.com, linux@arm.linux.org.uk,
	sbranden@broadcom.com, rjui@broadcom.com
Subject: Re: [PATCH v4 2/3] clk: bcm: Add BCM63138 clock support
Message-ID: <20151120234834.GD9555@codeaurora.org>
References: <1446168199-5959-1-git-send-email-f.fainelli@gmail.com>
 <1446168199-5959-3-git-send-email-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1446168199-5959-3-git-send-email-f.fainelli@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On 10/29, Florian Fainelli wrote:
> BCM63138 has a simple clocking domain which is primarily the ARMPLL
> clocking complex, from which the ARM (CPU), APB and AXI clocks would be
> derived from.
> 
> Since the ARMPLL controller is entirely compatible with the iProc ARM
> PLL, we just initialize it without additional parameters.
> 
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> ---

Applied to clk-bcm63xx

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
