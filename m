Return-Path: <linus.walleij@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20170601070208.GO20170@codeaurora.org>
References: <20170524082044.8473-1-linus.walleij@linaro.org> <20170601070208.GO20170@codeaurora.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 5 Jun 2017 15:34:14 +0200
Message-ID: <CACRpkdZv8MzXVecEXVdJ+P0MxVscYSy=MxC-yQAR0S4yQ6-rwQ@mail.gmail.com>
Subject: Re: [PATCH 2/2 v4] clk: Add Gemini SoC clock controller
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk <linux-clk@vger.kernel.org>,
	Janos Laube <janos.dev@gmail.com>, Paulius Zaleckas <paulius.zaleckas@gmail.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Hans Ulli Kroll <ulli.kroll@googlemail.com>, Florian Fainelli <f.fainelli@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

On Thu, Jun 1, 2017 at 9:02 AM, Stephen Boyd <sboyd@codeaurora.org> wrote:

>> +CLK_OF_DECLARE_DRIVER(gemini_cc, "cortina,gemini-syscon", gemini_cc_init);
>
> Is there a reason why this isn't a platform driver?

I can't get the platform to boot if I try, I guess because the console
UART needs the clock like super-early.

I fixed all the other issues, resending soon.

Yours,
Linus Walleij
