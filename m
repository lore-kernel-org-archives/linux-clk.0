Return-Path: <sboyd@codeaurora.org>
Date: Thu, 14 Jan 2016 18:07:39 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: Nicolas Ferre <nicolas.ferre@atmel.com>,
	Boris Brezillon <boris.brezillon@free-electrons.com>,
	Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 13/13] clk: at91: pmc: drop at91_pmc_base
Message-ID: <20160115020739.GP22188@codeaurora.org>
References: <1449248628-3486-1-git-send-email-alexandre.belloni@free-electrons.com>
 <1449248628-3486-14-git-send-email-alexandre.belloni@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1449248628-3486-14-git-send-email-alexandre.belloni@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

On 12/04, Alexandre Belloni wrote:
> at91_pmc_base is not used anymore, remove it along with at91_pmc_read and
> at91_pmc_write.
> 
> Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
> ---

Acked-by: Stephen Boyd <sboyd@codeaurora.org>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
