Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Joel Stanley <joel@jms.id.au>, Michael Turquette <mturquette@baylibre.com>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20180607070959.31995-1-joel@jms.id.au>
Cc: Andrew Jeffery <andrew@aj.id.au>, linux-clk@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20180607070959.31995-1-joel@jms.id.au>
Message-ID: <153091009365.143105.4953968802856253539@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH] clk: aspeed: Mark bclk (PCIe) and dclk (VGA) as critical
Date: Fri, 06 Jul 2018 13:48:13 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Joel Stanley (2018-06-07 00:09:59)
> This is used by the host to talk to the BMC's PCIe slave device. The BMC
> is not involved, but the clock needs to be enabled so the host can use
> the device.
> =

> Fixes: 15ed8ce5f84e ("clk: aspeed: Register gated clocks")
> Cc: stable@vger.kernel.org # 4.15
> Acked-by: Andrew Jeffery <andrew@aj.id.au>
> Tested-by: Lei YU <mine260309@gmail.com>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---

Applied to clk-fixes
