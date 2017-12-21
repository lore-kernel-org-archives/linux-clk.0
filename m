Return-Path: <sboyd@codeaurora.org>
Date: Thu, 21 Dec 2017 15:39:27 -0800
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
Subject: Re: [PATCH v6 4/5] clk: aspeed: Register gated clocks
Message-ID: <20171221233927.GE7997@codeaurora.org>
References: <20171128071908.12279-1-joel@jms.id.au>
 <20171128071908.12279-5-joel@jms.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20171128071908.12279-5-joel@jms.id.au>
List-ID: <linux-clk.vger.kernel.org>

On 11/28, Joel Stanley wrote:
> diff --git a/drivers/clk/clk-aspeed.c b/drivers/clk/clk-aspeed.c
> index 839243691b26..b5dc3e298693 100644
> --- a/drivers/clk/clk-aspeed.c
> +++ b/drivers/clk/clk-aspeed.c
> @@ -202,6 +202,107 @@ static const struct aspeed_clk_soc_data ast2400_data = {
>  	.calc_pll = aspeed_ast2400_calc_pll,
>  };
>  
> +static int aspeed_clk_enable(struct clk_hw *hw)
> +{
> +	struct aspeed_clk_gate *gate = to_aspeed_clk_gate(hw);
> +	unsigned long flags;
> +	u32 clk = BIT(gate->clock_idx);
> +	u32 rst = BIT(gate->reset_idx);
> +
> +	spin_lock_irqsave(gate->lock, flags);
> +
> +	if (gate->reset_idx >= 0) {
> +		/* Put IP in reset */
> +		regmap_update_bits(gate->map, ASPEED_RESET_CTRL, rst, rst);
> +
> +		/* Delay 100us */
> +		udelay(100);
> +	}
> +
> +	/* Enable clock */
> +	regmap_update_bits(gate->map, ASPEED_CLK_STOP_CTRL, clk, 0);
> +
> +	if (gate->reset_idx >= 0) {
> +		/* Delay 10ms */
> +		/* TODO: can we sleep here? */
> +		msleep(10);

No you can't sleep here. It needs to delay because this is inside
spinlock_irqsave.

> +
> +		/* Take IP out of reset */
> +		regmap_update_bits(gate->map, ASPEED_RESET_CTRL, rst, 0);
> +	}
> +
> +	spin_unlock_irqrestore(gate->lock, flags);
> +
> +	return 0;
> +}

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
