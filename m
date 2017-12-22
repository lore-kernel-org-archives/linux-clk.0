Return-Path: <sboyd@codeaurora.org>
Date: Thu, 21 Dec 2017 18:11:11 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Sergej Sawazki <sergej@taudac.com>
Cc: mturquette@baylibre.com, sebastian.hesselbarth@gmail.com,
	linux@armlinux.org.uk, linux-clk@vger.kernel.org, ce3a@gmx.de,
	Rabeeh Khoury <rabeeh@solid-run.com>
Subject: Re: [PATCH v2 2/2] clk: si5351: Apply PLL soft reset before enabling
 the outputs
Message-ID: <20171222021111.GL7997@codeaurora.org>
References: <1505562282-9111-1-git-send-email-sergej@taudac.com>
 <1505562282-9111-3-git-send-email-sergej@taudac.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1505562282-9111-3-git-send-email-sergej@taudac.com>
List-ID: <linux-clk.vger.kernel.org>

On 09/16, Sergej Sawazki wrote:
> The "Si5351A/B/C Data Sheet" states to apply a PLL soft reset before
> enabling the output clocks [1]. This is required to get a deterministic
> phase relationship between the output clocks.
> 
> Without resetting the PLL, the phase relationship between the clocks is
> unpredictable. Fix this by resetting the PLL in si5351_clkout_prepare().
> 
> References:
> [1] https://www.silabs.com/Support%20Documents/TechnicalDocs/Si5351-B.pdf
>     Figure 12 ("I2C Programming Procedure")
> 
> Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
> Cc: Rabeeh Khoury <rabeeh@solid-run.com>
> Cc: Russell King <linux@armlinux.org.uk>
> Signed-off-by: Sergej Sawazki <sergej@taudac.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
