Return-Path: <sboyd@codeaurora.org>
Date: Mon, 1 Feb 2016 17:08:14 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH v2 12/16] clk: avoid circular clock topology
Message-ID: <20160202010814.GA4848@codeaurora.org>
References: <1451298191-30815-1-git-send-email-yamada.masahiro@socionext.com>
 <1451298191-30815-13-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1451298191-30815-13-git-send-email-yamada.masahiro@socionext.com>
List-ID: <linux-clk.vger.kernel.org>

On 12/28, Masahiro Yamada wrote:
> Currently, clk_register() never checks a circular parent looping,
> but clock providers could register such an insane clock topology.
> For example, "clk_a" could have "clk_b" as a parent, and vice versa.
> In this case, clk_core_reparent() creates a circular parent list
> and __clk_recalc_accuracies() calls itself recursively forever.
> 
> The core infrastructure should be kind enough to bail out, showing
> an appropriate error message in such a case.  This helps to easily
> find a bug in clock providers.  (uh, I made such a silly mistake
> when I was implementing my clock providers first.  I was upset
> because the kernel did not respond, without any error message.)
> 
> This commit adds a new helper function, __clk_is_ancestor().  It
> returns true if the second argument is a possible ancestor of the
> first one.  If a clock core is a possible ancestor of itself, it
> would make a loop when it were registered.  That should be detected
> as an error.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
