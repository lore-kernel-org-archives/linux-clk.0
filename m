Return-Path: <sboyd@codeaurora.org>
Date: Fri, 7 Apr 2017 12:16:32 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Robin van der Gracht <robin@protonic.nl>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>,
	Fabio Estevam <fabio.estevam@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] clk: imx: clk-imx6ul: The i.mx6ul has no aips_tz3
 clock
Message-ID: <20170407191632.GX7065@codeaurora.org>
References: <20170303141405.17581-1-robin@protonic.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170303141405.17581-1-robin@protonic.nl>
List-ID: <linux-clk.vger.kernel.org>

On 03/03, Robin van der Gracht wrote:
> The clock was mapped on CG15 (gpio2_clocks) in the CCRG0 register.
> 
> Reviewed-by: Fabio Estevam <fabio.estevam@nxp.com>
> Signed-off-by: Robin van der Gracht <robin@protonic.nl>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
