Return-Path: <sboyd@codeaurora.org>
Date: Mon, 22 May 2017 17:55:53 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Icenowy Zheng <icenowy@aosc.io>,
	Tobias Regnery <tobias.regnery@gmail.com>,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: sunxi-ng: select SUNXI_CCU_MULT for sun8i-a83t
Message-ID: <20170523005553.GH20170@codeaurora.org>
References: <20170522202951.2896280-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170522202951.2896280-1-arnd@arndb.de>
List-ID: <linux-clk.vger.kernel.org>

On 05/22, Arnd Bergmann wrote:
> We get a link error when CCU_MULT is not set with the
> newly added driver:
> 
> drivers/clk/sunxi-ng/ccu-sun8i-a83t.o:(.data.__compound_literal.1+0x4): undefined reference to `ccu_mult_ops'
> drivers/clk/sunxi-ng/ccu-sun8i-a83t.o:(.data.__compound_literal.3+0x4): undefined reference to `ccu_mult_ops'
> 
> Fixes: 46b492116666 ("clk: sunxi-ng: Add driver for A83T CCU")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Is there any way we can automate finding these build errors and
prevent them from creeping into the tree? It may be asking too
much, but it seems like we should be able to find these
particular problems with some script that greps for ccu_*_ops and
checks that any file's Kconfig symbol also has that selected.

Anyway, I'm just tired of seeing these sorts of things in my
inbox.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
