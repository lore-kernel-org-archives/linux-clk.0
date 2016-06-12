Return-Path: <shawnguo@kernel.org>
Date: Sun, 12 Jun 2016 19:31:05 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Dong Aisheng <aisheng.dong@nxp.com>
Cc: linux-clk@vger.kernel.org, anson.huang@nxp.com, mturquette@baylibre.com,
	sboyd@codeaurora.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 03/11] clk: imx7d: correct dram root clk parent select
Message-ID: <20160612113105.GA20243@tiger>
References: <1465396420-27064-1-git-send-email-aisheng.dong@nxp.com>
 <1465396420-27064-3-git-send-email-aisheng.dong@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1465396420-27064-3-git-send-email-aisheng.dong@nxp.com>
List-ID: <linux-clk.vger.kernel.org>

On Wed, Jun 08, 2016 at 10:33:32PM +0800, Dong Aisheng wrote:
> From: Anson Huang <b20788@freescale.com>
> 
> DRAM root clk should be either from pll dram main clk
> or dram alt root clk.
> 
> Signed-off-by: Anson Huang <b20788@freescale.com>
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>

Applied, thanks.
