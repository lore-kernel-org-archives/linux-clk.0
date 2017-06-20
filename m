Return-Path: <sboyd@codeaurora.org>
Date: Mon, 19 Jun 2017 19:01:33 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Dong Aisheng <aisheng.dong@nxp.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, mturquette@baylibre.com,
	shawnguo@kernel.org, Anson.Huang@nxp.com, ping.bai@nxp.com
Subject: Re: [PATCH 8/9] clk: imx: make mux parent strings const
Message-ID: <20170620020133.GR4493@codeaurora.org>
References: <1494856763-6543-1-git-send-email-aisheng.dong@nxp.com>
 <1494856763-6543-9-git-send-email-aisheng.dong@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1494856763-6543-9-git-send-email-aisheng.dong@nxp.com>
List-ID: <linux-clk.vger.kernel.org>

On 05/15, Dong Aisheng wrote:
> As the commit 2893c379461a ("clk: make strings in parent name arrays
> const"), let's make the parent strings const, otherwise we may meet
> the following warning when compiling:
> 
> drivers/clk/imx/clk-imx7ulp.c: In function 'imx7ulp_clocks_init':
> drivers/clk/imx/clk-imx7ulp.c:73:35: warning: passing argument 5 of
> 	'imx_clk_mux_flags' discards 'const' qualifier from pointer target type
> 
>   clks[IMX7ULP_CLK_APLL_PRE_SEL] = imx_clk_mux_flags("apll_pre_sel", base + 0x508, 0,
> 	1, pll_pre_sels, ARRAY_SIZE(pll_pre_sels), CLK_SET_PARENT_GATE);
>                                    ^
> In file included from drivers/clk/imx/clk-imx7ulp.c:23:0:
> drivers/clk/imx/clk.h:200:27: note: expected 'const char **' but argument is
>  of type 'const char * const*'
> ...
> 
> Cc: Stephen Boyd <sboyd@codeaurora.org>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> ---

Looks good.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
