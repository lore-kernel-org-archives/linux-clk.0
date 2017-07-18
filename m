Return-Path: <joel.stan@gmail.com>
MIME-Version: 1.0
Sender: joel.stan@gmail.com
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 18 Jul 2017 19:53:09 +0930
Message-ID: <CACPK8XdXxfxngzhSxyPb=OKcEv+3Up8ve-2WtpETpXvXe_av5w@mail.gmail.com>
Subject: Coupled clk/reset
To: Philipp Zabel <p.zabel@pengutronix.de>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org, Ryan Chen <ryan_chen@aspeedtech.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>, Andrew Jeffery <andrew@aj.id.au>, Jeremy Kerr <jk@ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

Hello!

I'm taking a stab at a clk and reset driver for the Aspeed SoCs. I've
used the Gemini driver for inspiration so far, which looks to be a
good fit for the clock gating and important clocks (those we need in
order to get the uart and timer source going).

One tricky bit is the datasheet specifies the following for enabling
an IP block ('engine'), whenever the engine is started from the
clocked stopped state:

 1. Enable engine reset
 2. Delay 100us
 3. Enable clock
 4. Delay 10ms
 5. Disable engine reset

How does this dance fit into the reset/clock framework? I need to show
that there is this dependency when enabling a clock.

Cheers,

Joel
