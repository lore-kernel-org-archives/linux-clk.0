Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Stefan Agner <stefan@agner.ch>, kernel@pengutronix.de, shawnguo@kernel.org
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20180418125254.4397-1-stefan@agner.ch>
Cc: fabio.estevam@nxp.com, mturquette@baylibre.com,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Stefan Agner <stefan@agner.ch>
References: <20180418125254.4397-1-stefan@agner.ch>
Message-ID: <152548892600.138124.3143140012763491118@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH] clk: imx6ul: fix periph clk2 clock mux selection
Date: Fri, 04 May 2018 19:55:26 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Stefan Agner (2018-04-18 05:52:54)
> According to the data sheet the 3rd choice is the bypass clock
> of pll2. This should not have any effect in practice as this
> selection is not used currently.
> =

> Signed-off-by: Stefan Agner <stefan@agner.ch>
> ---

Applied to clk-next
