Return-Path: <sboyd@codeaurora.org>
Date: Fri, 20 Nov 2015 11:16:33 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>,
	kbuild test robot <fengguang.wu@intel.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: Use static inline functions instead of macros for
 dummies
Message-ID: <20151120191633.GY32672@codeaurora.org>
References: <1446153176-29865-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
In-Reply-To: <1446153176-29865-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

On 10/29, Geert Uytterhoeven wrote:
> if CONFIG_OF=n:
> 
>     drivers/clk/clk-cs2000-cp.c: In function ‘cs2000_remove’:
>     drivers/clk/clk-cs2000-cp.c:453:22: warning: unused variable ‘np’ [-Wunused-variable]
>       struct device_node *np = dev->of_node;
> 			  ^
> 
> Convert dummies of_clk_del_provider() and of_clk_init() from macros to
> static inline functions to kill such compiler warnings.
> 
> Reported-by: kbuild test robot <fengguang.wu@intel.com>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
