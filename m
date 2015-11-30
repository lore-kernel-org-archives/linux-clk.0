Return-Path: <sboyd@codeaurora.org>
Date: Mon, 30 Nov 2015 12:59:10 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH] imx/clk-pllv1: fix wrong do_div() usage
Message-ID: <20151130205910.GR11298@codeaurora.org>
References: <alpine.LFD.2.20.1511031941300.630@knanqh.ubzr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <alpine.LFD.2.20.1511031941300.630@knanqh.ubzr>
List-ID: <linux-clk.vger.kernel.org>

On 11/03, Nicolas Pitre wrote:
> do_div() is meant to be used with an unsigned dividend.
> 
> Signed-off-by: Nicolas Pitre <nico@linaro.org>
> 

Applied to clk-fixes

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
