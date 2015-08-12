Return-Path: <linus.walleij@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1438262365-29164-1-git-send-email-linus.walleij@linaro.org>
References: <1438262365-29164-1-git-send-email-linus.walleij@linaro.org>
Date: Wed, 12 Aug 2015 14:02:50 +0200
Message-ID: <CACRpkdZJKNph9cbJvBMQKdOCe0L8kKP=AEDaYqtBuc9vxxKPeg@mail.gmail.com>
Subject: Re: [PATCH 2/3] clk/ARM: move Ux500 PRCC bases to the device tree
From: Linus Walleij <linus.walleij@linaro.org>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	Ulf Hansson <ulf.hansson@linaro.org>, "arm@kernel.org" <arm@kernel.org>
Cc: linux-clk@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Thu, Jul 30, 2015 at 3:19 PM, Linus Walleij <linus.walleij@linaro.org> wrote:

> The base addresses for the Ux500 PRCC controllers are hardcoded,
> let's move them to the clock node in the device tree and delete
> the constants.
>
> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Ulf/Mike: please ACK this so I can take it through ARM SoC.

It appears this needs to go through the clk tree with the rest
(1/3, 3/3).

Can I have an ACK from the ARM SoC people so they know
this is happening?

Yours,
Linus Walleij
