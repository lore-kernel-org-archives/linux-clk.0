Return-Path: <sboyd@codeaurora.org>
Date: Fri, 20 Nov 2015 10:54:56 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Nicolas Ferre <nicolas.ferre@atmel.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: at91: Revert "keep slow clk enabled to prevent
 system hang"
Message-ID: <20151120185456.GV32672@codeaurora.org>
References: <1447759593-20816-1-git-send-email-alexandre.belloni@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1447759593-20816-1-git-send-email-alexandre.belloni@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

On 11/17, Alexandre Belloni wrote:
> Commit dca1a4b5ff6e ("clk: at91: keep slow clk enabled to prevent system
> hang") added a workaround for the slow clock as it is not properly handled
> by its users.
> 
> Now that the slow clock is taken properly by the drivers, this workaround
> is not necessary anymore, revert it.
> 
> Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
> Acked-by: Michael Turquette <mturquette@baylibre.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
