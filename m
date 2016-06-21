Return-Path: <sboyd@codeaurora.org>
Date: Mon, 20 Jun 2016 17:59:10 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Jongsung Kim <neidhard.kim@lge.com>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, Chanho Min <chanho.min@lge.com>,
	Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [RESEND][PATCH] clk: fixed-factor: set CLK_SET_RATE_PARENT
Message-ID: <20160621005910.GN1521@codeaurora.org>
References: <1465808880-12332-1-git-send-email-neidhard.kim@lge.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1465808880-12332-1-git-send-email-neidhard.kim@lge.com>
List-ID: <linux-clk.vger.kernel.org>

On 06/13, Jongsung Kim wrote:
> Without CLK_SET_RATE_PARENT-flag set, clk_factor_round_rate() just
> returns the current frequency. A fixed-factor-clock initialzed via
> of_fixed_factor_clk_set() (ie, by device-tree) can't have the flag
> set. It can be problematic when the parent of a fixed-factor-clock
> is rate-controllable clk, because the rounding can't be propagated
> to parent, the rounded target frequency is always the current, and
> finally the frequency can't be changed.
> 
> This patch sets the flags CLK_SET_RATE_PARENT for all fixed-factor-
> clocks, from clk_register_fixed_factor(), and removes checking the
> flag from clk_factor_round_rate().
> 
> Signed-off-by: Jongsung Kim <neidhard.kim@lge.com>
> ---

Hmm there's another patch for the same problem from Maxime[1]

Mike replied there and said that it's worrisome to do this for
all users of fixed factors clks, so perhaps you can set this flag
when you register the clk instead? Or prove that all the users of
this code in mainline are ok to change behavior.

[1] http://lists.infradead.org/pipermail/linux-arm-kernel/2016-May/429726.html

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
