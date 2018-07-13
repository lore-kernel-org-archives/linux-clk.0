Return-Path: <hofrat@osadl.at>
Date: Fri, 13 Jul 2018 16:41:10 +0000
From: Nicholas Mc Guire <der.herr@hofr.at>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Nicholas Mc Guire <hofrat@osadl.org>, Shawn Guo <shawnguo@kernel.org>,
	Frank Li <Frank.Li@freescale.com>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	NXP Linux Team <linux-imx@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <fabio.estevam@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] clk: imx6ul: fix missing of_node_put()
Message-ID: <20180713164110.GA27943@osadl.at>
References: <1531480400-7664-1-git-send-email-hofrat@osadl.org>
 <153149925072.48062.9395649003513930129@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <153149925072.48062.9395649003513930129@swboyd.mtv.corp.google.com>
List-ID: <linux-clk.vger.kernel.org>

On Fri, Jul 13, 2018 at 09:27:30AM -0700, Stephen Boyd wrote:
> Quoting Nicholas Mc Guire (2018-07-13 04:13:20)
> > of_find_compatible_node() is returning a device node with refcount
> > incremented and must be explicitly decremented after the last use
> > which is right after the us in of_iomap() here.
> > 
> > Signed-off-by: Nicholas Mc Guire <hofrat@osadl.org>
> > Fixes: commit 787b4271a6a0 ("clk: imx: add imx6ul clk tree support")
> 
> This is not how a Fixes line works. It doesn't have 'commit'. I'll
> remove it when applying so no need to resend.
>
sorry - guess I got that wrong on a whole set of patches - fill fix that
for future patches and thanks for fixing it here 

thx!
hofrat 
