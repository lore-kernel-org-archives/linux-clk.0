Return-Path: <sboyd@codeaurora.org>
Date: Fri, 4 Nov 2016 13:32:49 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: linux-kernel@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH 03/10] clk: mvebu: make cp110-system-controller
 explicitly non-modular
Message-ID: <20161104203249.GG16026@codeaurora.org>
References: <20160704211220.5685-1-paul.gortmaker@windriver.com>
 <20160704211220.5685-4-paul.gortmaker@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20160704211220.5685-4-paul.gortmaker@windriver.com>
List-ID: <linux-clk.vger.kernel.org>

On 07/04, Paul Gortmaker wrote:
> The Kconfig currently controlling compilation of this code is:
> 
> drivers/clk/mvebu/Kconfig:config ARMADA_CP110_SYSCON
> drivers/clk/mvebu/Kconfig:      bool
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
> Since module_platform_driver() uses the same init level priority as
> builtin_platform_driver() the init ordering remains unchanged with
> this commit.
> 
> Also note that MODULE_DEVICE_TABLE is a no-op for non-modular code.
> 
> We also delete the MODULE_LICENSE tag etc. since all that information
> is already contained at the top of the file in the comments.
> 
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@codeaurora.org>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: linux-clk@vger.kernel.org
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
