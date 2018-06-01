Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Anson Huang <Anson.Huang@nxp.com>, fabio.estevam@nxp.com,
 kernel@pengutronix.de, mturquette@baylibre.com, shawnguo@kernel.org
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1526533248-21990-2-git-send-email-Anson.Huang@nxp.com>
Cc: Linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1526533248-21990-1-git-send-email-Anson.Huang@nxp.com>
 <1526533248-21990-2-git-send-email-Anson.Huang@nxp.com>
Message-ID: <152788024703.225090.10824571841764355947@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH] clk: imx6sl: correct ocram_podf clock type
Date: Fri, 01 Jun 2018 12:10:47 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Anson Huang (2018-05-16 22:00:48)
> IMX6SL_CLK_OCRAM_PODF is a busy divider, its name in
> CCM_CDHIPR register of Reference Manual CCM chapter
> is axi_podf_busy, correct its clock type.
> =

> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---

Applied to clk-next
