Return-Path: <shawnguo@kernel.org>
Date: Sun, 20 May 2018 21:02:04 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Anson Huang <Anson.Huang@nxp.com>
Cc: kernel@pengutronix.de, fabio.estevam@nxp.com, mturquette@baylibre.com,
	sboyd@kernel.org, Linux-imx@nxp.com,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: imx6sl: correct ocram_podf clock type
Message-ID: <20180520130203.GB26863@dragon>
References: <1526533248-21990-1-git-send-email-Anson.Huang@nxp.com>
 <1526533248-21990-2-git-send-email-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1526533248-21990-2-git-send-email-Anson.Huang@nxp.com>
List-ID: <linux-clk.vger.kernel.org>

On Thu, May 17, 2018 at 01:00:48PM +0800, Anson Huang wrote:
> IMX6SL_CLK_OCRAM_PODF is a busy divider, its name in
> CCM_CDHIPR register of Reference Manual CCM chapter
> is axi_podf_busy, correct its clock type.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

Acked-by: Shawn Guo <shawnguo@kernel.org>
