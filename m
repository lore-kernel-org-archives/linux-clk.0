Return-Path: <sboyd@codeaurora.org>
Date: Mon, 27 Jul 2015 14:29:36 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Rob Herring <robh@kernel.org>
Cc: Mike Turquette <mturquette@baylibre.com>,
	Thomas Gleixner <tglx@linutronix.de>, linux-clk@vger.kernel.org
Subject: Re: [PATCH v3] clk: kill off set_irq_flags usage
Message-ID: <20150727212935.GC14521@codeaurora.org>
References: <1438030523-15853-1-git-send-email-robh@kernel.org>
 <1438030523-15853-2-git-send-email-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1438030523-15853-2-git-send-email-robh@kernel.org>
List-ID: <linux-clk.vger.kernel.org>

On 07/27, Rob Herring wrote:
> set_irq_flags is ARM specific with custom flags which have genirq
> equivalents. Convert drivers to use the genirq interfaces directly, so we
> can kill off set_irq_flags. The translation of flags is as follows:
> 
> IRQF_VALID -> !IRQ_NOREQUEST
> IRQF_PROBE -> !IRQ_NOPROBE
> IRQF_NOAUTOEN -> IRQ_NOAUTOEN
> 
> For IRQs managed by an irqdomain, the irqdomain core code handles clearing
> and setting IRQ_NOREQUEST already, so there is no need to do this in
> .map() functions and we can simply remove the set_irq_flags calls. Some
> users also modify IRQ_NOPROBE and this has been maintained although it
> is not clear that is really needed. There appears to be a great deal of
> blind copy and paste of this code.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> Cc: Mike Turquette <mturquette@baylibre.com>
> Acked-by: Stephen Boyd <sboyd@codeaurora.org>
> Cc: linux-clk@vger.kernel.org
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
