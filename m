Return-Path: <sboyd@codeaurora.org>
Date: Tue, 2 Jan 2018 17:47:03 -0800
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
Subject: Re: [PATCH v7 4/5] clk: aspeed: Register gated clocks
Message-ID: <20180103014703.GS7997@codeaurora.org>
References: <20171222024522.10362-1-joel@jms.id.au>
 <20171222024522.10362-5-joel@jms.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20171222024522.10362-5-joel@jms.id.au>
List-ID: <linux-clk.vger.kernel.org>

On 12/22, Joel Stanley wrote:
> The majority of the clocks in the system are gates paired with a reset
> controller that holds the IP in reset.
> 
> This borrows from clk_hw_register_gate, but registers two 'gates', one
> to control the clock enable register and the other to control the reset
> IP. This allows us to enforce the ordering:
> 
>  1. Place IP in reset
>  2. Enable clock
>  3. Delay
>  4. Release reset
> 
> There are some gates that do not have an associated reset; these are
> handled by using -1 as the index for the reset.
> 
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
