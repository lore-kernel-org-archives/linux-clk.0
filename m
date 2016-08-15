Return-Path: <sboyd@codeaurora.org>
Date: Mon, 15 Aug 2016 15:48:36 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Kevin Hilman <khilman@baylibre.com>
Cc: Mike Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] clk: gxbb: add MMC gate clocks, and expose for DT
Message-ID: <20160815224836.GS361@codeaurora.org>
References: <20160802214011.19077-1-khilman@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20160802214011.19077-1-khilman@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

On 08/02, Kevin Hilman wrote:
> Add the SD/eMMC gate clocks and expose them for use by DT.
> 
> While at it, also explose FCLK_DIV2 since this is one of the input
> clocks to the mux internal to each of the SD/eMMC blocks.
> 
> Signed-off-by: Kevin Hilman <khilman@baylibre.com>
> ---

Applied to clk-meson-gxbb and merged into clk-next.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
