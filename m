Return-Path: <linus.walleij@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20170318085944.15899-3-linus.walleij@linaro.org>
References: <20170318085944.15899-1-linus.walleij@linaro.org> <20170318085944.15899-3-linus.walleij@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 28 Mar 2017 23:04:06 +0200
Message-ID: <CACRpkdY2wvae2n-vBmkXwh6rhVWP_pZddJ3e5BZzQO9q5OVzSA@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM/clk: move the ICST library to drivers/clk
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	Russell King <linux@armlinux.org.uk>
Cc: linux-clk <linux-clk@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Sat, Mar 18, 2017 at 9:59 AM, Linus Walleij <linus.walleij@linaro.org> wrote:

> This moves the ICST clock divider helper library from
> arch/arm/common to drivers/clk/versatile so it is maintained
> with the other clock drivers.
>
> We keep the structure as a helper library intact and do not
> fuse it with the clk-icst.c Versatile ICST clock driver: there
> may be other users out there that need to use this library for
> their clocking, and then it will be helpful to keep the
> library contained. (The icst.[c|h] files could just be moved
> to drivers/clk/lib or a similar location to share the library.)
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

CLK maintainers: could you ACK this so that I can ask the ARM
SoC tree to pull in these two patches?

Or do you prefer to take all patches in the CLK tree so I should
ask the ARM people to ACK it?

Yours,
Linus Walleij
