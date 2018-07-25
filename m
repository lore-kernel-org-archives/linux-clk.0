Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Nicholas Mc Guire <hofrat@osadl.org>, Shawn Guo <shawnguo@kernel.org>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1531480400-7664-1-git-send-email-hofrat@osadl.org>
Cc: Frank Li <Frank.Li@freescale.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Nicholas Mc Guire <hofrat@osadl.org>, Fabio Estevam <fabio.estevam@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-arm-kernel@lists.infradead.org
References: <1531480400-7664-1-git-send-email-hofrat@osadl.org>
Message-ID: <153255075856.48062.12106960428649534948@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH] clk: imx6ul: fix missing of_node_put()
Date: Wed, 25 Jul 2018 13:32:38 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Nicholas Mc Guire (2018-07-13 04:13:20)
> of_find_compatible_node() is returning a device node with refcount
> incremented and must be explicitly decremented after the last use
> which is right after the us in of_iomap() here.
> =

> Signed-off-by: Nicholas Mc Guire <hofrat@osadl.org>
> Fixes: commit 787b4271a6a0 ("clk: imx: add imx6ul clk tree support")
> ---

Applied to clk-next
