Return-Path: <john.stultz@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1475933892-16021-1-git-send-email-shawn.guo@linaro.org>
References: <1475933892-16021-1-git-send-email-shawn.guo@linaro.org>
From: John Stultz <john.stultz@linaro.org>
Date: Mon, 10 Oct 2016 10:39:12 -0700
Message-ID: <CALAqxLV5oOsP8ZcKrwzwK6OsZZwTjsvyk18+aWEFpZh17VttnA@mail.gmail.com>
Subject: Re: [PATCH] clk: hi6220: use CLK_OF_DECLARE_DRIVER for sysctrl and
 mediactrl clock init
To: Shawn Guo <shawn.guo@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	Guodong Xu <guodong.xu@linaro.org>, linux-clk@vger.kernel.org,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Sat, Oct 8, 2016 at 6:38 AM, Shawn Guo <shawn.guo@linaro.org> wrote:
> The hi6220-sysctrl and hi6220-mediactrl are not only clock provider but
> also reset controller.  It worked fine that single sysctrl/mediactrl
> device node in DT can be used to initialize clock driver and populate
> platform device for reset controller.  But it stops working after
> commit 989eafd0b609 ("clk: core: Avoid double initialization of clocks")
> gets merged.  The commit sets flag OF_POPULATED during clock
> initialization to skip the platform device populating for the same
> device node.  On hi6220, it effectively makes hi6220-sysctrl reset
> driver not probe any more.
>
> The patch changes hi6220 sysctrl and mediactrl clock init macro from
> CLK_OF_DECLARE to CLK_OF_DECLARE_DRIVER, so that the reset driver using
> the same hardware block can continue working.
>
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>

Tested-by: John Stultz <john.stultz@linaro.org>

I hit this as well last week when 989eafd0b609 ("clk: core: Avoid
double initialization of clocks") landed, which killed graphics on my
HiKey.

My workaround was a bit hackish, as I don't really know when one
should use OF_DECLARE vs OF_DECLARE_DRIVER, but I also converted the
hi6220_clk_ao and hi6220_clk_power to the _DRIVER side. Your patch
seems to work just as well for me, but I wanted to double check with
you that the ao/power clks didn't need the conversion as well.

thanks
-john
