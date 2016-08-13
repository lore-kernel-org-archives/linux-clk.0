Return-Path: <sboyd@codeaurora.org>
Date: Fri, 12 Aug 2016 18:16:43 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, s.hauer@pengutronix.de,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 4/8] clk: sunxi: Use new macro CLK_OF_DECLARE_DRIVER
Message-ID: <20160813011643.GL361@codeaurora.org>
References: <1467735814-23518-1-git-send-email-ricardo.ribalda@gmail.com>
 <1467735814-23518-6-git-send-email-ricardo.ribalda@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1467735814-23518-6-git-send-email-ricardo.ribalda@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On 07/05, Ricardo Ribalda Delgado wrote:
> This driver initializes a clock provider via sun4i_a10_mod0_setup
> and then continues the initialization on sun4i_a10_mod0_clk_probe.
> 
> Use the new macro to notify the clk subsystem about this behaviour.
> 
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
