Return-Path: <linus.walleij@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1454507228-14718-1-git-send-email-linus.walleij@linaro.org>
References: <1454507228-14718-1-git-send-email-linus.walleij@linaro.org>
Date: Wed, 10 Feb 2016 09:23:54 +0100
Message-ID: <CACRpkdafovzA6Ci31aX09nue77G3N2AomPoMbAT-gOTUYxtKHQ@mail.gmail.com>
Subject: Re: [PATCH] clk: versatile: mask VCO bits before writing
From: Linus Walleij <linus.walleij@linaro.org>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Wed, Feb 3, 2016 at 2:47 PM, Linus Walleij <linus.walleij@linaro.org> wrote:

> The Versatile syscon ICST driver OR:s the bits into place but
> forgets to mask the previous value, making the code only work
> if the register is zero or giving haphazard results. Mask the
> 19 bits used by the Versatile syscon interface register.
>
> Regression caused and now fixed by yours truly.
>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@codeaurora.org>
> Cc: linux-clk@vger.kernel.org
> Fixes: 179c8fb3c2a6 ("clk: versatile-icst: convert to use regmap")
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Mike/Stephen, are you picking this for fixes?

Yours,
Linus Walleij
