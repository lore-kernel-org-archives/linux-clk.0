Return-Path: <sboyd@codeaurora.org>
Date: Tue, 8 Nov 2016 14:42:59 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] clk: pxa mark dummy helper as 'inline'
Message-ID: <20161108224259.GL16026@codeaurora.org>
References: <20161108144950.3472058-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20161108144950.3472058-1-arnd@arndb.de>
List-ID: <linux-clk.vger.kernel.org>

On 11/08, Arnd Bergmann wrote:
> The dummy_clk_set_parent function is marked as 'static' but is
> no longer referenced from the pxa25x clk driver after the last use
> of the RATE_RO_OPS() macro is gone from this file, causing a
> harmless build warning:
> 
> In file included from drivers/clk/pxa/clk-pxa25x.c:24:0:
> drivers/clk/pxa/clk-pxa.h:146:12: error: 'dummy_clk_set_parent' defined but not used [-Werror=unused-function]
> 
> This marks the functon as 'inline', which lets the compiler simply
> drop it when it gets referenced.
> 
> Fixes: 9fe694295098 ("clk: pxa: transfer CPU clock setting from pxa2xx-cpufreq")

I hope I don't rewrite clk-next history... I need some sort of
magic git pre-commit hook that rewrites fixes tags if the hash
changes.

> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
