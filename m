Return-Path: <sboyd@codeaurora.org>
Date: Wed, 7 Dec 2016 16:23:43 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Pan Bian <bianpan2016@163.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	patches@opensource.wolfsonmicro.com, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] clk: clk-wm831x: fix a logic error
Message-ID: <20161208002343.GG5423@codeaurora.org>
References: <1480573545-18588-1-git-send-email-bianpan2016@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1480573545-18588-1-git-send-email-bianpan2016@163.com>
List-ID: <linux-clk.vger.kernel.org>

On 12/01, Pan Bian wrote:
> Fix bug https://bugzilla.kernel.org/show_bug.cgi?id=188561. Function
> wm831x_clkout_is_prepared() returns "true" when it fails to read
> CLOCK_CONTROL_1. "true" means the device is already prepared. So
> return "true" on the read failure seems improper.
> 
> Signed-off-by: Pan Bian <bianpan2016@163.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
