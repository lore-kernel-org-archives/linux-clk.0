Return-Path: <sboyd@codeaurora.org>
Date: Mon, 2 Oct 2017 14:39:58 -0700
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
Subject: Re: [PATCH v2 2/5] clk: aspeed: Register core clocks
Message-ID: <20171002213958.GR457@codeaurora.org>
References: <20170921042641.7326-1-joel@jms.id.au>
 <20170921042641.7326-3-joel@jms.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170921042641.7326-3-joel@jms.id.au>
List-ID: <linux-clk.vger.kernel.org>

On 09/21, Joel Stanley wrote:
> @@ -112,9 +115,137 @@ static const struct aspeed_gate_data aspeed_gates[] __initconst = {
>  	/* 31: reserved */
>  };
>  
> +static const struct clk_div_table ast2400_div_table[] = {
> +	{ 0x0, 2 },
> +	{ 0x1, 4 },
> +	{ 0x2, 6 },
> +	{ 0x3, 8 },
> +	{ 0x4, 10 },
> +	{ 0x5, 12 },
> +	{ 0x6, 14 },
> +	{ 0x7, 16 },
> +	{ 0 }
> +};
> +
> +static const struct clk_div_table ast2500_div_table[] = {
> +	{ 0x0, 4 },
> +	{ 0x1, 8 },
> +	{ 0x2, 12 },
> +	{ 0x3, 16 },
> +	{ 0x4, 20 },
> +	{ 0x5, 24 },
> +	{ 0x6, 28 },
> +	{ 0x7, 32 },
> +	{ 0 }
> +};
> +
> +static struct clk_hw *aspeed_calc_pll(const char *name, u32 val)
> +{
> +	unsigned int mult, div;
> +
> +	if (val & BIT(20)) {

#define for these BIT() things please. Or a comment, but #define
is probably better. Just improves readability.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
