Return-Path: <shawnguo@kernel.org>
Date: Sun, 20 May 2018 21:01:32 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Anson Huang <Anson.Huang@nxp.com>
Cc: kernel@pengutronix.de, fabio.estevam@nxp.com, mturquette@baylibre.com,
	sboyd@kernel.org, Linux-imx@nxp.com,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: imx6sx: disable unnecessary clocks during clock
 initialization
Message-ID: <20180520130130.GA26863@dragon>
References: <1526533248-21990-1-git-send-email-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1526533248-21990-1-git-send-email-Anson.Huang@nxp.com>
List-ID: <linux-clk.vger.kernel.org>

On Thu, May 17, 2018 at 01:00:47PM +0800, Anson Huang wrote:
> Disable those unnecessary clocks during kernel boot up to save power,
> those modules clock should be managed by modules driver in runtime.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

Acked-by: Shawn Guo <shawnguo@kernel.org>
