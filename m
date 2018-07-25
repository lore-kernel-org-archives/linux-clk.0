Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Masahiro Yamada <yamada.masahiro@socionext.com>,
 Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1532075856-1723-1-git-send-email-yamada.masahiro@socionext.com>
Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 Jassi Brar <jaswinder.singh@linaro.org>,
 Masami Hiramatsu <mhiramat@kernel.org>, linux-arm-kernel@lists.infradead.org
References: <1532075856-1723-1-git-send-email-yamada.masahiro@socionext.com>
Message-ID: <153256098433.48062.7081577175619627994@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH 1/2] clk: uniphier: add NAND 200MHz clock
Date: Wed, 25 Jul 2018 16:23:04 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Masahiro Yamada (2018-07-20 01:37:35)
> The Denali NAND controller IP needs three clocks:
> =

>  - clk: controller core clock
> =

>  - clk_x: bus interface clock
> =

>  - ecc_clk: clock at which ECC circuitry is run
> =

> Currently, only the first one (50MHz) is provided.  The rest of the
> two clock ports must be connected to the 200MHz clock line.  Add this.
> =

> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---

Applied to clk-next
