Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Joel Stanley <joel@jms.id.au>, Michael Turquette <mturquette@baylibre.com>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20180427025547.14115-1-joel@jms.id.au>
Cc: Andrew Jeffery <andrew@aj.id.au>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Ryan Chen <ryan_chen@aspeedtech.com>,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
References: <20180427025547.14115-1-joel@jms.id.au>
Message-ID: <152642160316.237094.580656516961912710@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH v2] clk: aspeed: Support second reset register
Date: Tue, 15 May 2018 15:00:03 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Joel Stanley (2018-04-26 19:55:47)
> The ast2500 has an additional reset register that contains resets not
> present in the ast2400. This enables support for this register, and adds
> the one reset line that is controlled by it.
> =

> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---

Applied to clk-next
