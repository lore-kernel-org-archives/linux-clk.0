Return-Path: <shawnguo@kernel.org>
Date: Thu, 1 Mar 2018 08:14:08 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Anson Huang <Anson.Huang@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, sboyd@codeaurora.org,
	mturquette@baylibre.com, fabio.estevam@nxp.com,
	kernel@pengutronix.de
Subject: Re: [PATCH] clk: imx: imx7d: correct video pll clock tree
Message-ID: <20180301001407.GM3217@dragon>
References: <1514999361-2723-1-git-send-email-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1514999361-2723-1-git-send-email-Anson.Huang@nxp.com>
List-ID: <linux-clk.vger.kernel.org>

On Thu, Jan 04, 2018 at 01:09:21AM +0800, Anson Huang wrote:
> There is a test divider and post divider in video PLL,
> test divider is placed before post divider, all clocks
> that can select parent from video PLL should be from
> post divider, NOT from pll_video_main, below are
> clock tree dump before and after this patch:
> 
> Before:
> pll_video_main
>    pll_video_main_bypass
>       pll_video_main_clk
>          lcdif_pixel_src
>             lcdif_pixel_cg
>                lcdif_pixel_pre_div
>                   lcdif_pixel_post_div
>                      lcdif_pixel_root_clk
> After:
> pll_video_main
>    pll_video_main_bypass
>       pll_video_main_clk
>          pll_video_test_div
>             pll_video_post_div
>                lcdif_pixel_src
>                   lcdif_pixel_cg
>                      lcdif_pixel_pre_div
>                         lcdif_pixel_post_div
>                            lcdif_pixel_root_clk
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

Applied, thanks.
