Return-Path: <sboyd@codeaurora.org>
Date: Fri, 1 Jul 2016 17:45:09 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Dong Aisheng <aisheng.dong@nxp.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	mturquette@baylibre.com, shawnguo@kernel.org,
	linux-arm-kernel@lists.infradead.org, anson.huang@nxp.com
Subject: Re: [PATCH V3 6/8] clk: imx: add clk api for supporting
 CLK_OPS_PARENT_ENABLE clocks
Message-ID: <20160702004509.GO27880@codeaurora.org>
References: <1467279078-2330-1-git-send-email-aisheng.dong@nxp.com>
 <1467279078-2330-7-git-send-email-aisheng.dong@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1467279078-2330-7-git-send-email-aisheng.dong@nxp.com>
List-ID: <linux-clk.vger.kernel.org>

On 06/30, Dong Aisheng wrote:
> IMX SoCs like i.MX7D requires using CLK_OPS_PARENT_ENABLE flags,
> adding the corresponding clock APIs variants for easily to use.
> 
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@codeaurora.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
