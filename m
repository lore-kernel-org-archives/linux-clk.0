Return-Path: <sboyd@codeaurora.org>
Date: Tue, 8 Aug 2017 18:43:12 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
	Janos Laube <janos.dev@gmail.com>,
	Paulius Zaleckas <paulius.zaleckas@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	Hans Ulli Kroll <ulli.kroll@googlemail.com>,
	Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH] clk: gemini: hands off PCI OE bit
Message-ID: <20170809014312.GZ2146@codeaurora.org>
References: <20170808190818.11740-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170808190818.11740-1-linus.walleij@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

On 08/08, Linus Walleij wrote:
> This bit is pin control, and needs to be carefully managed by the
> new pin control driver.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Fixes tag?

Does this need to be merged now as a critical fix? Or we can wait
on it for next release?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
