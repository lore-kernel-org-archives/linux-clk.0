Return-Path: <sboyd@codeaurora.org>
Date: Tue, 2 Jan 2018 17:46:58 -0800
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
Subject: Re: [PATCH v7 2/5] clk: aspeed: Register core clocks
Message-ID: <20180103014658.GQ7997@codeaurora.org>
References: <20171222024522.10362-1-joel@jms.id.au>
 <20171222024522.10362-3-joel@jms.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20171222024522.10362-3-joel@jms.id.au>
List-ID: <linux-clk.vger.kernel.org>

On 12/22, Joel Stanley wrote:
> This registers the core clocks; those which are required to calculate
> the rate of the timer peripheral so the system can load a clocksource
> driver.
> 
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
