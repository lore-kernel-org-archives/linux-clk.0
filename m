Return-Path: <sboyd@codeaurora.org>
Date: Thu, 14 Jan 2016 18:04:53 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: Nicolas Ferre <nicolas.ferre@atmel.com>,
	Boris Brezillon <boris.brezillon@free-electrons.com>,
	Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 06/13] clk: at91: pmc: merge at91_pmc_init in
 atmel_pmc_probe
Message-ID: <20160115020452.GM22188@codeaurora.org>
References: <1449248628-3486-1-git-send-email-alexandre.belloni@free-electrons.com>
 <1449248628-3486-7-git-send-email-alexandre.belloni@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1449248628-3486-7-git-send-email-alexandre.belloni@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

On 12/04, Alexandre Belloni wrote:
> at91_pmc_init() doesn't do much anymore, merge it in atmel_pmc_probe().
> 
> Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
> ---

Acked-by: Stephen Boyd <sboyd@codeaurora.org>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
