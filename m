Return-Path: <sboyd@codeaurora.org>
Date: Thu, 22 Jun 2017 17:39:34 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Santosh Shilimkar <ssantosh@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Tero Kristo <t-kristo@ti.com>, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: keystone: TI_SCI_PROTOCOL is needed for clk driver
Message-ID: <20170623003934.GN4493@codeaurora.org>
References: <20170620201249.145468-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170620201249.145468-1-arnd@arndb.de>
List-ID: <linux-clk.vger.kernel.org>

On 06/20, Arnd Bergmann wrote:
> CONFIG_COMPILE_TEST allows building a configuration without
> TI_SCI_PROTOCOL, which then fails to link:
> 
> drivers/clk/keystone/sci-clk.o: In function `ti_sci_clk_probe':
> sci-clk.c:(.text.ti_sci_clk_probe+0x4c): undefined reference to `devm_ti_sci_get_handle'
> 
> This makes it a hard dependency. Right now, that means we can't
> actually compile-test the driver unless ARCH_KEYSTONE is set as
> well, but we can fix that by allowing TI_MESSAGE_MANAGER to
> be selected for COMPILE_TEST as well.
> 
> Fixes: b745c0794e2f ("clk: keystone: Add sci-clk driver support")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
