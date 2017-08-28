Return-Path: <shawnguo@kernel.org>
Date: Mon, 28 Aug 2017 17:42:38 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Arvind Yadav <arvind.yadav.cs@gmail.com>
Cc: kernel@pengutronix.de, fabio.estevam@nxp.com, mturquette@baylibre.com,
	sboyd@codeaurora.org, jun.nie@linaro.org, baoyou.xie@linaro.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] clk: imx: constify clk_div_table
Message-ID: <20170828094236.GA3525@dragon>
References: <1503898133-10862-1-git-send-email-arvind.yadav.cs@gmail.com>
 <1503898133-10862-2-git-send-email-arvind.yadav.cs@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1503898133-10862-2-git-send-email-arvind.yadav.cs@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On Mon, Aug 28, 2017 at 10:58:52AM +0530, Arvind Yadav wrote:
> clk_div_table are not supposed to change at runtime. All functions
> working with clk_div_table provided by <linux/clk-provider.h> work
> with const clk_div_table. So mark the non-const structs as const.
> 
> Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>

Acked-by: Shawn Guo <shawnguo@kernel.org>
