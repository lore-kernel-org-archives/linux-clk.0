Return-Path: <sboyd@codeaurora.org>
Date: Fri, 20 Jan 2017 16:21:50 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Lucas Stach <l.stach@pengutronix.de>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <fabio.estevam@nxp.com>,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	kernel@pengutronix.de, patchwork-lst@pengutronix.de
Subject: Re: [PATCH] clk: imx6: don't restrict LDB mux changes on QuadPlus
Message-ID: <20170121002150.GL20800@codeaurora.org>
References: <20170113173943.23677-1-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170113173943.23677-1-l.stach@pengutronix.de>
List-ID: <linux-clk.vger.kernel.org>

On 01/13, Lucas Stach wrote:
> The LDB mux/gate layout has been fixed on QuadPlus, so there is no need
> to restrict the LDB mux changes on this hardware, as the erratum
> preventing this from working properly is gone.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
