Return-Path: <sboyd@codeaurora.org>
Date: Thu, 29 Jun 2017 17:25:34 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Armstrong <narmstrong@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH] clk: scpi: error when clock fails to register
Message-ID: <20170630002534.GF22780@codeaurora.org>
References: <20170628135345.9337-1-jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170628135345.9337-1-jbrunet@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

On 06/28, Jerome Brunet wrote:
> Current implementation of scpi_clk_add just print a warning when clock
> fails to register but then keep going as if nothing happened. The
> provider is then registered with bogus data.
> 
> This may latter lead to an Oops in __clk_create_clk when
> hlist_add_head(&clk->clks_node, &hw->core->clks) is called.
> 
> This patch fixes the issue and errors if a clock fails to register.
> 
> Fixes: cd52c2a4b5c4 ("clk: add support for clocks provided by SCP(System Control Processor)")
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
