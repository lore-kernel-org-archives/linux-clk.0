Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Nicholas Mc Guire <hofrat@osadl.org>, Shawn Guo <shawnguo@kernel.org>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1531500004-23175-1-git-send-email-hofrat@osadl.org>
Cc: Bai Ping <ping.bai@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <fabio.estevam@nxp.com>, NXP Linux Team <linux-imx@nxp.com>,
 Michael Turquette <mturquette@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Nicholas Mc Guire <hofrat@osadl.org>
References: <1531500004-23175-1-git-send-email-hofrat@osadl.org>
Message-ID: <153255079923.48062.1152946611739352576@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH] clk: imx6sll: fix missing of_node_put()
Date: Wed, 25 Jul 2018 13:33:19 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Nicholas Mc Guire (2018-07-13 09:40:04)
> of_find_compatible_node() is returning a device node with refcount
> incremented and must be explicitly decremented after the last use
> which is right after the us in of_iomap() here.
> =

> Signed-off-by: Nicholas Mc Guire <hofrat@osadl.org>
> Fixes: commit 4a5f720b6542 ("clk: imx: add clock driver for imx6sll")
> ---

Applied to clk-next
