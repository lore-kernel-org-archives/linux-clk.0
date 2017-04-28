Return-Path: <sboyd@codeaurora.org>
Date: Fri, 28 Apr 2017 10:48:56 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Chen-Yu Tsai <wens@csie.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Icenowy Zheng <icenowy@aosc.xyz>,
	Tobias Regnery <tobias.regnery@gmail.com>,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: sunxi-ng: always select CCU_GATE
Message-ID: <20170428174856.GA7065@codeaurora.org>
References: <20170427110239.2389266-1-arnd@arndb.de>
 <20170428073542.jamyyjgafirqtth4@lukather>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170428073542.jamyyjgafirqtth4@lukather>
List-ID: <linux-clk.vger.kernel.org>

On 04/28, Maxime Ripard wrote:
> 1;4601;0c
> On Thu, Apr 27, 2017 at 01:02:31PM +0200, Arnd Bergmann wrote:
> > When the base driver is enabled but all SoC specific drivers are turned
> > off, we now get a build error after code was added to always refer to the
> > clk gates:
> > 
> > drivers/clk/built-in.o: In function `ccu_pll_notifier_cb':
> > :(.text+0x154f8): undefined reference to `ccu_gate_helper_disable'
> > :(.text+0x15504): undefined reference to `ccu_gate_helper_enable'
> > 
> > This changes the Kconfig to always require the gate code to be built-in
> > when CONFIG_SUNXI_CCU is set.
> > 
> > Fixes: 02ae2bc6febd ("clk: sunxi-ng: Add clk notifier to gate then ungate PLL clocks")
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> 
> Acked-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> 
> Stephen, Mike, can you apply this patch directly? This affects the
> current (4.11) release, so we probably don't want to have the overhead
> of a PR here :/
> 

Yep. Applied to fixes to be sent off today.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
