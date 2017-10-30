Return-Path: <linus.walleij@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20171004023006.31763-1-linus.walleij@linaro.org>
References: <20171004023006.31763-1-linus.walleij@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 30 Oct 2017 15:23:43 +0100
Message-ID: <CACRpkdZL9GD0H1n1-Xu2vYH-WHxEpf4843tSs1=M_QvdHdbPpA@mail.gmail.com>
Subject: Re: [PATCH] RESEND: clk: Avoid sending high rates to downstream
 clocks during set_rate
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk <linux-clk@vger.kernel.org>, Opera <montvid@gmail.com>,
	John Stultz <john.stultz@linaro.org>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

On Wed, Oct 4, 2017 at 4:30 AM, Linus Walleij <linus.walleij@linaro.org> wrote:

> From: Stephen Boyd <sboyd@codeaurora.org>
>
> If a clock is on and we call clk_set_rate() on it we may get into
> a situation where the clock temporarily increases in rate
> dramatically while we walk the tree and call .set_rate() ops. For
> example, consider a case where a PLL feeds into a divider.
> Initially the divider is set to divide by 1 and the PLL is
> running fairly slow (100MHz). The downstream consumer of the
> divider output can only handle rates =< 400 MHz, but the divider
> can only choose between divisors of 1 and 4.
>
>  +-----+   +----------------+
>  | PLL |-->| div 1 or div 4 |---> consumer device
>  +-----+   +----------------+
>
> To achieve a rate of 400MHz on the output of the divider, we
> would have to set the rate of the PLL to 1.6 GHz and then divide
> it by 4. The current code would set the PLL to 1.6GHz first while
> the divider is still set to 1, thus causing the downstream
> consumer of the clock to receive a few clock cycles of 1.6GHz
> clock (far beyond it's maximum acceptable rate). We should be
> changing the divider first before increasing the PLL rate to
> avoid this problem.
>
> Therefore, set the rate of any child clocks that are increasing
> in rate from their current rate so that they can increase their
> dividers if necessary. We assume that there isn't such a thing as
> minimum rate requirements.
>
> Cc: Opera <montvid@gmail.com>
> Cc: John Stultz <john.stultz@linaro.org>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> ---
> Stephen: just wanted to check what's up with this patch.
> When I apply it on my kernel I get graphics on the Nexus7,
> when I don't, I don't.
>
> OpenWRT has started to carry the patch in their tree I noticed.
> I found it in John Stultz patch stack.
>
> Is there some similar patch floating in some other series, is
> it fundamentally wrong or something else?
>
> Just wanted to reboot the discussion so we know where this is
> standing.

Gentle ping on this patch too.

Sorry for pushing, it's just so nice to have graphics working
out-of-the-box on Nexus 7.

Yours,
Linus Walleij
