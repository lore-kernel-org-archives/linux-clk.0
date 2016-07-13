Return-Path: <s.nawrocki@samsung.com>
Subject: Re: [PATCH 07/10] clk: samsung: make clk-s5pv210-audss explicitly
 non-modular
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>
References: <20160704211220.5685-1-paul.gortmaker@windriver.com>
 <20160704211220.5685-8-paul.gortmaker@windriver.com>
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>,
 linux-kernel@vger.kernel.org, Tomasz Figa <tomasz.figa@gmail.com>,
 linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-id: <578618CA.8090808@samsung.com>
Date: Wed, 13 Jul 2016 12:32:42 +0200
MIME-version: 1.0
In-reply-to: <20160704211220.5685-8-paul.gortmaker@windriver.com>
Content-type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>

On 07/04/2016 11:12 PM, Paul Gortmaker wrote:
> The Kconfig currently controlling compilation of this code is:
> 
> arch/arm/mach-s5pv210/Kconfig:config ARCH_S5PV210
> arch/arm/mach-s5pv210/Kconfig:  bool "Samsung S5PV210/S5PC110" if ARCH_MULTI_V7
> 
> ...meaning that it currently is not being built as a module by anyone.
> 
> Lets remove the modular code that is essentially orphaned, so that
> when reading the driver there is no doubt it is builtin-only.
> 
> We explicitly disallow a driver unbind, since that doesn't have a
> sensible use case anyway, and it allows us to drop the ".remove"
> code for non-modular drivers.
> 
> Since this code is already not using module_init, case, the init
> ordering remains unchanged with this commit.
> 
> We also delete the MODULE_LICENSE tags etc. since all that information
> is already contained at the top of the file in the comments.
> 
> Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Cc: Tomasz Figa <tomasz.figa@gmail.com>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@codeaurora.org>
> Cc: linux-samsung-soc@vger.kernel.org
> Cc: linux-clk@vger.kernel.org
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

In case this is going to be applied directly to current clk-next:

Acked-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
