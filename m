Return-Path: <benh@kernel.crashing.org>
Message-ID: <1514584997.2743.107.camel@kernel.crashing.org>
Subject: Re: [PATCH v6 4/5] clk: aspeed: Register gated clocks
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Joel Stanley <joel@jms.id.au>, Lee Jones <lee.jones@linaro.org>,
        Michael
 Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andrew
 Jeffery <andrew@aj.id.au>, Jeremy Kerr <jk@ozlabs.org>,
        Rick Altherr
 <raltherr@google.com>,
        Ryan Chen <ryan_chen@aspeedtech.com>, Arnd Bergmann
 <arnd@arndb.de>
Date: Sat, 30 Dec 2017 09:03:17 +1100
In-Reply-To: <20171227013227.GV7997@codeaurora.org>
References: <20171128071908.12279-1-joel@jms.id.au>
	 <20171128071908.12279-5-joel@jms.id.au>
	 <20171221233927.GE7997@codeaurora.org>
	 <1513910191.2743.77.camel@kernel.crashing.org>
	 <1513910633.2743.79.camel@kernel.crashing.org>
	 <20171227013227.GV7997@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

On Tue, 2017-12-26 at 17:32 -0800, Stephen Boyd wrote:
> > I noticed we do have a few i2c based clock drivers... how are they ever
> > supposed to work ? i2c bus controllers are allowed to sleep and the i2c
> > core takes mutexes...
> 
> We have clk_prepare()/clk_unprepare() for sleeping suckage. You
> can use that, and i2c based clk drivers do that today.

"suckage" ? Hehe ... the suckage should rather be stuff that cannot
sleep. Arbitrary latencies and jitter caused by too much code wanting
to be "atomic" when unnecessary are a bad thing.

In the case of clocks like the aspeed where we have to wait for a
rather long stabilization delay, way too long to legitimately do a non-
sleepable delay with a lock held, do we need to do everything in
prepare() then ?

Ben.
