Return-Path: <linus.walleij@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20170629060107.12548-1-joel@jms.id.au>
References: <20170629060107.12548-1-joel@jms.id.au>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 29 Jun 2017 11:00:54 +0200
Message-ID: <CACRpkda_kW2sy25+GN65R8OB_puNT1QVW2p8wC8W9qvXMgDFaw@mail.gmail.com>
Subject: Re: [PATCH] clk: gemini: Read status before using the value
To: Joel Stanley <joel@jms.id.au>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

On Thu, Jun 29, 2017 at 8:01 AM, Joel Stanley <joel@jms.id.au> wrote:

> The probe does a shift and mask of val without having read it from the hardware.
>
> Fixes: 846423f96721 ("clk: Add Gemini SoC clock controller")
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Some oversight when splitting the driver in a OF init and probe
path, thanks a lot for noticing! Magically the platform still worked
fine.

Yours,
Linus Walleij
