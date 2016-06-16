Return-Path: <shawnguo@kernel.org>
Date: Thu, 16 Jun 2016 09:05:06 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Dong Aisheng <aisheng.dong@nxp.com>
Cc: linux-clk@vger.kernel.org, anson.huang@nxp.com, mturquette@baylibre.com,
	sboyd@codeaurora.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH V3 1/1] clk: imx: refine the powerdown bit of clk-pllv3
Message-ID: <20160616010506.GM20243@tiger>
References: <1465803434-31507-1-git-send-email-aisheng.dong@nxp.com>
 <1465820692-20055-1-git-send-email-aisheng.dong@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1465820692-20055-1-git-send-email-aisheng.dong@nxp.com>
List-ID: <linux-clk.vger.kernel.org>

On Mon, Jun 13, 2016 at 08:24:52PM +0800, Dong Aisheng wrote:
> The powerdown bit is a bit confused, let's change it to power_bit
> to relfect both powerdown and powerup case according to different
> plls.
> 
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>

Applied, thanks.
