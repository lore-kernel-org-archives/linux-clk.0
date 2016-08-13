Return-Path: <sboyd@codeaurora.org>
Date: Fri, 12 Aug 2016 17:57:05 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Fabio Estevam <fabio.estevam@nxp.com>
Cc: mturquette@baylibre.com, stefan@agner.ch,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	shawnguo@kernel.org, festevam@gmail.com
Subject: Re: [PATCH] clk: imx7d: do not set the parent of
 IMX7D_ENET_AXI_ROOT_SRC
Message-ID: <20160813005705.GE361@codeaurora.org>
References: <1468590782-8436-1-git-send-email-fabio.estevam@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1468590782-8436-1-git-send-email-fabio.estevam@nxp.com>
List-ID: <linux-clk.vger.kernel.org>

On 07/15, Fabio Estevam wrote:
> Booting the kernel on a imx7s-warp leads to several warnings like these:
> 
> [    0.000000] ------------[ cut here ]------------

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
