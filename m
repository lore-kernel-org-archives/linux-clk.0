Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Anson Huang <Anson.Huang@nxp.com>, fabio.estevam@nxp.com,
 kernel@pengutronix.de, mturquette@baylibre.com, shawnguo@kernel.org
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1526533248-21990-1-git-send-email-Anson.Huang@nxp.com>
Cc: Linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1526533248-21990-1-git-send-email-Anson.Huang@nxp.com>
Message-ID: <152788024421.225090.2764368176678914931@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH] clk: imx6sx: disable unnecessary clocks during clock
 initialization
Date: Fri, 01 Jun 2018 12:10:44 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Anson Huang (2018-05-16 22:00:47)
> Disable those unnecessary clocks during kernel boot up to save power,
> those modules clock should be managed by modules driver in runtime.
> =

> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---

Applied to clk-next
