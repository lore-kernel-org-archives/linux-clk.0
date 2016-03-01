Return-Path: <tony@atomide.com>
Date: Tue, 1 Mar 2016 15:55:33 -0800
From: Tony Lindgren <tony@atomide.com>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Tero Kristo <t-kristo@ti.com>
Subject: Re: [PATCH] clk: ti: Fix some errors found by static checkers
Message-ID: <20160301235532.GD4469@atomide.com>
References: <1456858499-28035-1-git-send-email-sboyd@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1456858499-28035-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

* Stephen Boyd <sboyd@codeaurora.org> [160301 10:55]:
> drivers/clk/ti/clk-814x.c:34:12: warning: symbol 'dm814x_adpll_early_init' was not declared. Should it be static?
> drivers/clk/ti/clk-814x.c:58:12: warning: symbol 'dm814x_adpll_enable_init_clocks' was not declared. Should it be static?
> drivers/clk/ti/adpll.c:465 ti_adpll_recalc_rate() warn: should '__readw(d->regs + 20) << 18' be a 64 bit type?
> drivers/clk/ti/adpll.c:945 ti_adpll_probe() error: we previously assumed 'd->clocks' could be null (see line 921)
> 
> The last one looks like a real bug because we don't return an
> error on allocation failure.

Yeah nice, that's a real bug:

Tested-by: Tony Lindgren <tony@atomide.com>
