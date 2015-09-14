Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Mon, 14 Sep 2015 14:57:28 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
	Nicolas Ferre <nicolas.ferre@atmel.com>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: at91: system: don't try to free_irq when there
 is no IRQ
Message-ID: <20150914215728.GB23081@codeaurora.org>
References: <1441982047-11303-1-git-send-email-alexandre.belloni@free-electrons.com>
 <1441982047-11303-2-git-send-email-alexandre.belloni@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1441982047-11303-2-git-send-email-alexandre.belloni@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 09/11, Alexandre Belloni wrote:
> In the error path of at91_clk_register_system(), sys->irq is freed
> unconditionally but it may not exist or be request at all.
> 
> Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
