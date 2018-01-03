Return-Path: <sboyd@codeaurora.org>
Date: Tue, 2 Jan 2018 17:47:01 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Joel Stanley <joel@jms.id.au>
Cc: Lee Jones <lee.jones@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Andrew Jeffery <andrew@aj.id.au>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Jeremy Kerr <jk@ozlabs.org>, Rick Altherr <raltherr@google.com>,
	Ryan Chen <ryan_chen@aspeedtech.com>, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v7 3/5] clk: aspeed: Add platform driver and register PLLs
Message-ID: <20180103014701.GR7997@codeaurora.org>
References: <20171222024522.10362-1-joel@jms.id.au>
 <20171222024522.10362-4-joel@jms.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20171222024522.10362-4-joel@jms.id.au>
List-ID: <linux-clk.vger.kernel.org>

On 12/22, Joel Stanley wrote:
> This registers a platform driver to set up all of the non-core clocks.
> 
> The clocks that have configurable rates are now registered.
> 
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> --
> v6:
>  - Add Andrew's reviewed-by
> v5:
>  - Remove eclk configuration. We do not have enough information to
>  correctly implement the mux and divisor, so it will have to be
>  implemented in the future
> v4:
>  - Add eclk div table to fix ast2500 calculation
>  - Add defines to document the BIT() macros
>  - Pass dev where we can when registering clocks
>  - Check for errors when registering clk_hws
> v3:
>  - Fix bclk and eclk calculation
>  - Separate out ast2400 and ast25000 for pll calculation
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
