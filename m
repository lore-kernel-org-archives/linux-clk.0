Return-Path: <sboyd@codeaurora.org>
Date: Mon, 14 Sep 2015 14:57:24 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
	Nicolas Ferre <nicolas.ferre@atmel.com>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] clk: at91: utmi: use pmc_read when the at91_pmc is
 available
Message-ID: <20150914215724.GA23081@codeaurora.org>
References: <1441982047-11303-1-git-send-email-alexandre.belloni@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1441982047-11303-1-git-send-email-alexandre.belloni@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

On 09/11, Alexandre Belloni wrote:
> at91_pmc_read is a workaround to allow external drivers to acces some
> registers of the PMC. There is no need for it in clk-utmi.c as we aready
> have a pointer to the struct at91_pmc.
> 
> Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
