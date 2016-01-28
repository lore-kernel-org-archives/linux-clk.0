Return-Path: <sboyd@codeaurora.org>
Date: Thu, 28 Jan 2016 00:31:12 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: Nicolas Ferre <nicolas.ferre@atmel.com>,
	Boris Brezillon <boris.brezillon@free-electrons.com>,
	Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v4 03/13] clk: at91: remove IRQ handling and use polling
Message-ID: <20160128083112.GJ12841@codeaurora.org>
References: <1453911072-23608-1-git-send-email-alexandre.belloni@free-electrons.com>
 <1453911072-23608-4-git-send-email-alexandre.belloni@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1453911072-23608-4-git-send-email-alexandre.belloni@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

On 01/27, Alexandre Belloni wrote:
> The AT91 clock drivers make use of IRQs to avoid polling when waiting for
> some clocks to be enabled. Unfortunately, this leads to a crash when those
> IRQs are threaded (which happens when using preempt-rt) because they are
> registered before thread creation is possible.
> 
> Use polling on those clocks instead to avoid the problem.
> 
> Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
> ---

Acked-by: Stephen Boyd <sboyd@codeaurora.org>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
