Return-Path: <linus.walleij@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20171013115917.9318-2-linus.walleij@linaro.org>
References: <20171013115917.9318-1-linus.walleij@linaro.org> <20171013115917.9318-2-linus.walleij@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 30 Oct 2017 15:21:04 +0100
Message-ID: <CACRpkdbPjLb6aXa180az27gRyhei8m6ze=aeAvXtpS3mgy0D9Q@mail.gmail.com>
Subject: Re: [PATCH 2/2 v3] clk: qcom: Implement RPM clocks for MSM8660/APQ8060
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk <linux-clk@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

On Fri, Oct 13, 2017 at 1:59 PM, Linus Walleij <linus.walleij@linaro.org> wrote:

> The RPM clocks were missing for MSM8660/APQ8060. For this to be
> completed we need to add a special fixed rate RPM clock that is used
> for the PLL4 on these SoCs. The rest of the clocks are pretty
> similar to the other supported platforms.
>
> The "active" clock pattern is mirrored in all the clocks. I guess
> that the PLL4 that clocks the LPASS is actually never used as
> "active only" since the low-power audio subsystem should be left
> on when the CPU goes to idle, so that it can be used as a stand-alone
> MP3 player type of device.
>
> The PLL4 seems to be enabled only on behalf of the booting LPASS
> Hexagon - which will cast its own vote once its booted - and as
> such we only configure the active state (meaning both states will
> have same configuration). The result is that PLL4 will be on
> from prepare() to unprepare() regardless of what the application
> CPU does.
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v2->v3:
> - Skip the "active" state on the special, fixed PLL4 clock, just
>   like the vendor tree does.
> - Move defines around a bit in the sort order that Bjorn wants
>   them.
> - Make the plain "pxo" parent of the fixed PLL4 clock, not
>   "pxo_board"
> ChangeLog v1->v2:
> - Add the small hunk to the clk_rpm_handoff() function that just
>   skip over this for the fixed PLL4 clock. This accidentally
>   ended up in another patch.

Gentle ping on this patch.

Yours,
Linus Walleij
