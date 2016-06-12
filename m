Return-Path: <shawnguo@kernel.org>
Date: Sun, 12 Jun 2016 19:30:16 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Dong Aisheng <aisheng.dong@nxp.com>
Cc: linux-clk@vger.kernel.org, anson.huang@nxp.com, mturquette@baylibre.com,
	sboyd@codeaurora.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 02/11] clk: imx: correct AV PLL rate formula
Message-ID: <20160612113016.GZ20243@tiger>
References: <1465396420-27064-1-git-send-email-aisheng.dong@nxp.com>
 <1465396420-27064-2-git-send-email-aisheng.dong@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1465396420-27064-2-git-send-email-aisheng.dong@nxp.com>
List-ID: <linux-clk.vger.kernel.org>

On Wed, Jun 08, 2016 at 10:33:31PM +0800, Dong Aisheng wrote:
> From: Anson Huang <b20788@freescale.com>
> 
> The audio/video PLL's rate calculation is as below in RM:
> 
> Fref * (DIV_SELECT + NUM / DENOM), in origin clk-pllv3's
> code, below code is used:
> 
> (parent_rate * div) + ((parent_rate / mfd) * mfn
> 
> as it does NOT consider the float data using div, so below
> formula should be used as a decent method:
> 
> (parent_rate * div) + ((parent_rate * mfn) / mfd)
> 
> and we also need to consider parent_rate * mfd may overflow
> a 32 bit value, 64 bit value should be used.
> 
> After updating this formula, the dram PLL's rate is
> 1066MHz, which is correct, while the old formula gets
> 1056MHz.
> 
> [Aisheng: fix clk_pllv3_av_round_rate too]
> 
> Signed-off-by: Anson Huang <b20788@freescale.com>
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>

Applied, thanks.
