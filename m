Return-Path: <sboyd@codeaurora.org>
Date: Mon, 30 Nov 2015 16:36:26 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Bai Ping <b51503@freescale.com>
Cc: shawnguo@kernel.org, kernel@pengutronix.de, mturquette@baylibre.com,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: imx: Replace clk error check with imx_check_clocks()
Message-ID: <20151201003626.GB17532@codeaurora.org>
References: <1448504323-17737-1-git-send-email-b51503@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1448504323-17737-1-git-send-email-b51503@freescale.com>
List-ID: <linux-clk.vger.kernel.org>

On 11/26, Bai Ping wrote:
> As we already have a 'imx_check_clocks' to do the clock error
> check, so cleanup the error check code.
> 
> Signed-off-by: Bai Ping <b51503@freescale.com>
> ---

Acked-by: Stephen Boyd <sboyd@codeaurora.org>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
