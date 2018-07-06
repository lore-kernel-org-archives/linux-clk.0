Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Joel Stanley <joel@jms.id.au>, Michael Turquette <mturquette@baylibre.com>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20180628231540.26633-1-joel@jms.id.au>
Cc: linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20180628231540.26633-1-joel@jms.id.au>
Message-ID: <153089970720.143105.7005759760140367907@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH] clk: aspeed: Support HPLL strapping on ast2400
Date: Fri, 06 Jul 2018 10:55:07 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Joel Stanley (2018-06-28 16:15:40)
> The HPLL can be configured through a register (SCU24), however some
> platforms chose to configure it through the strapping settings and do
> not use the register. This was not noticed as the logic for bit 18 in
> SCU24 was confused: set means programmed, but the driver read it as set
> means strapped.
> =

> This gives us the correct HPLL value on Palmetto systems, from which
> most of the peripheral clocks are generated.
> =

> Fixes: 5eda5d79e4be ("clk: Add clock driver for ASPEED BMC SoCs")
> Cc: stable@vger.kernel.org # v4.15
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---

Do you want this merged for -rc5? It sounds like on some systems this is
a problem, but I don't know if these systems are supposed to work yet or
not, so priority of this fix is not easy for me to understand.
