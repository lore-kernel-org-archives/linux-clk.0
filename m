Return-Path: <sboyd@codeaurora.org>
Date: Thu, 25 Feb 2016 15:03:18 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	Pawel Moll <pawel.moll@arm.com>
Subject: Re: [PATCH] clk: versatile: sp810: support reentrance
Message-ID: <20160225230318.GB28849@codeaurora.org>
References: <1456303151-29413-1-git-send-email-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1456303151-29413-1-git-send-email-linus.walleij@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

On 02/24, Linus Walleij wrote:
> Despite care take to allocate clocks state containers the
> SP810 driver actually just supports creating one instance:
> all clocks registered for every instance will end up with the
> exact same name and __clk_init() will fail.
> 
> Rename the timclken<0> .. timclken<n> to sp810_<instance>_<n>
> so every clock on every instance gets a unique name.

The subject made me think clk framework reentrancy. Anyway,
applied to clk-next.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
