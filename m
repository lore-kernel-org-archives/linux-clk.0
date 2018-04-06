Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Abel Vesa <abel.vesa@nxp.com>, Fabio Estevam <fabio.estevam@nxp.com>,
 Irina Tirdea <irina.tirdea@nxp.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Peter Chen <peter.chen@freescale.com>, Sascha Hauer <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1522219599-10831-5-git-send-email-abel.vesa@nxp.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-imx@nxp.com,
 Anson Huang <anson.huang@nxp.com>,
 Ranjani Vaidyanathan <Ranjani.Vaidyanathan@nxp.com>,
 Abel Vesa <abelvesa@linux.com>, Daniel Baluta <daniel.baluta@nxp.com>,
 Anson Huang <b20788@freescale.com>, Abel Vesa <abel.vesa@nxp.com>
References: <1522219599-10831-1-git-send-email-abel.vesa@nxp.com>
 <1522219599-10831-5-git-send-email-abel.vesa@nxp.com>
Message-ID: <152303883696.143116.13663538916966228102@swboyd.mtv.corp.google.com>
Subject: Re: [RESEND 3/4] clk: imx7d: Correct ahb clk parent select
Date: Fri, 06 Apr 2018 11:20:36 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Abel Vesa (2018-03-27 23:46:38)
> From: Anson Huang <b20788@freescale.com>
> =

> Design team change the ahb's clk parent options but
> did NOT update the DOC accordingly in time, so the
> AHB/IPG's clk rate in clk tree is incorrect, AHB is
> 67.5MHz and IPG is 33.75MHz, but using scope to
> monitor them, they are actually 135MHz and 67.5MHz,
> update the clk parent option to make clk tree info
> correct.
> =

> Signed-off-by: Anson Huang <b20788@freescale.com>
> Signed-off-by: Irina Tirdea <irina.tirdea@nxp.com>
> Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
> ---

Applied to clk-next
