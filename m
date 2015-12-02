Return-Path: <shawnguo@kernel.org>
Date: Wed, 2 Dec 2015 14:11:33 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Bai Ping <b51503@freescale.com>
Cc: kernel@pengutronix.de, mturquette@baylibre.com, sboyd@codeaurora.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: imx: Replace clk error check with imx_check_clocks()
Message-ID: <20151202061133.GH692@tiger>
References: <1448504323-17737-1-git-send-email-b51503@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1448504323-17737-1-git-send-email-b51503@freescale.com>
List-ID: <linux-clk.vger.kernel.org>

On Thu, Nov 26, 2015 at 10:18:43AM +0800, Bai Ping wrote:
> As we already have a 'imx_check_clocks' to do the clock error
> check, so cleanup the error check code.
> 
> Signed-off-by: Bai Ping <b51503@freescale.com>

Applied, thanks.
