Return-Path: <sboyd@codeaurora.org>
Date: Wed, 19 Apr 2017 09:11:13 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Dong Aisheng <aisheng.dong@nxp.com>
Cc: linux-clk@vger.kernel.org, mturquette@baylibre.com, shawnguo@kernel.org,
	fabio.estevam@nxp.com, stefan@agner.ch,
	linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
Subject: Re: [PATCH 1/2] clk: clk-imx7d: fix ahb clk definition
Message-ID: <20170419161113.GY7065@codeaurora.org>
References: <1491878269-9559-1-git-send-email-aisheng.dong@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1491878269-9559-1-git-send-email-aisheng.dong@nxp.com>
List-ID: <linux-clk.vger.kernel.org>

On 04/11, Dong Aisheng wrote:
> MX7D ahb clk actually has no LPCG gate, current LPCG offset 0x4200
> used actually is for adc, not ahb. After fix, correct ocram_s_clk
> parent accordingly as well.
> 
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Stefan Agner <stefan@agner.ch>
> Cc: Fabio Estevam <fabio.estevam@nxp.com>
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
