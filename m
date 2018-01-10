Return-Path: <sboyd@codeaurora.org>
Date: Wed, 10 Jan 2018 13:40:44 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: David Lechner <david@lechnology.com>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] clk: fix reentrancy of clk_enable() on UP systems
Message-ID: <20180110214044.GD28313@codeaurora.org>
References: <1515116768-17089-1-git-send-email-david@lechnology.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1515116768-17089-1-git-send-email-david@lechnology.com>
List-ID: <linux-clk.vger.kernel.org>

On 01/04, David Lechner wrote:
> Reentrant calls to clk_enable() are not working on UP systems. This is
> caused by the fact spin_trylock_irqsave() always returns true when
> CONFIG_SMP=n (and CONFIG_DEBUG_SPINLOCK=n) which causes the reference
> counting to not work correctly when clk_enable_lock() is called twice
> before clk_enable_unlock() is called (this happens when clk_enable()
> is called from within another clk_enable()).
> 
> This fixes the problem by skipping the call to spin_trylock_irqsave() on UP
> systems and relying solely on reference counting. We also make sure to set
> flags in this case so that we are not returning an uninitialized value.
> 
> Suggested-by: Stephen Boyd <sboyd@codeaurora.org>
> Signed-off-by: David Lechner <david@lechnology.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
