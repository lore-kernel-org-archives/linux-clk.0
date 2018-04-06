Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Abel Vesa <abel.vesa@nxp.com>, Fabio Estevam <fabio.estevam@nxp.com>,
 Irina Tirdea <irina.tirdea@nxp.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Peter Chen <peter.chen@freescale.com>, Sascha Hauer <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1522219599-10831-6-git-send-email-abel.vesa@nxp.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-imx@nxp.com,
 Anson Huang <anson.huang@nxp.com>,
 Ranjani Vaidyanathan <Ranjani.Vaidyanathan@nxp.com>,
 Abel Vesa <abelvesa@linux.com>, Daniel Baluta <daniel.baluta@nxp.com>,
 Dong Aisheng <b29396@freescale.com>, Abel Vesa <abel.vesa@nxp.com>
References: <1522219599-10831-1-git-send-email-abel.vesa@nxp.com>
 <1522219599-10831-6-git-send-email-abel.vesa@nxp.com>
Message-ID: <152303884033.143116.14807011107162910724@swboyd.mtv.corp.google.com>
Subject: Re: [RESEND 4/4] clk: imx7d: Move clks_init_on before any clock operations
Date: Fri, 06 Apr 2018 11:20:40 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Abel Vesa (2018-03-27 23:46:39)
> From: Dong Aisheng <b29396@freescale.com>
> =

> For init on clocks we should move it at the first place in imx7d_clocks_i=
nit()
> before any clock operations, else the clock operation may fail in case th=
e clock
> is still not on.
> =

> Acked-by: Ranjani Vaidyanathan <Ranjani.Vaidyanathan@freescale.com>
> Signed-off-by: Dong Aisheng <b29396@freescale.com>
> Signed-off-by: Irina Tirdea <irina.tirdea@nxp.com>
> Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
> ---

Applied to clk-next
