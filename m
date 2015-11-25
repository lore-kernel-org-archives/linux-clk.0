Return-Path: <shawnguo@kernel.org>
Date: Wed, 25 Nov 2015 11:51:03 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Bai Ping <b51503@freescale.com>
Cc: kernel@pengutronix.de, mturquette@baylibre.com, sboyd@codeaurora.org,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH Resend] clk: imx: add 'is_prepared' clk_ops callback for
 pllv3 clk
Message-ID: <20151125035103.GF11999@tiger>
References: <1448381213-24349-1-git-send-email-b51503@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1448381213-24349-1-git-send-email-b51503@freescale.com>
List-ID: <linux-clk.vger.kernel.org>

On Wed, Nov 25, 2015 at 12:06:53AM +0800, Bai Ping wrote:
> Add 'is_prepared' callback function for pllv3 type clk to make sure when
> the system is bootup, the unused clk is in a known state to match the
> prepare count info.
> 
> Signed-off-by: Bai Ping <b51503@freescale.com>
> Reviewed-by: Lucas Stach <l.stach@pengutronix.de>

Applied, thanks.
