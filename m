Return-Path: <linus.walleij@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1511807134.6812.10.camel@baylibre.com>
References: <1511807134.6812.10.camel@baylibre.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 29 Nov 2017 13:07:28 +0100
Message-ID: <CACRpkdYAUfcM3Z_YZBNBFnPmCCrgx_LYynBB=oTyHLzhDWuA_g@mail.gmail.com>
Subject: Re: [GIT PULL] : clk: implement clock rate protection mechanism
To: Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk <linux-clk@vger.kernel.org>,
	Maxime Ripard <maxime.ripard@free-electrons.com>,
	Quentin Schulz <quentin.schulz@free-electrons.com>, Opera <montvid@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

On Mon, Nov 27, 2017 at 7:25 PM, Jerome Brunet <jbrunet@baylibre.com> wrote:

> This patchset introduce clock protection to the CCF core. This can then
> be used for:
>
> * Provide a way for a consumer to claim exclusivity over the rate control
>   of a provider. Some clock consumers require that a clock rate must not
>   deviate from its selected frequency. There can be several reasons for
>   this, not least of which is that some hardware may not be able to
>   handle or recover from a glitch caused by changing the clock rate while
>   the hardware is in operation. For such HW, The ability to get exclusive
>   control of a clock's rate, and release that exclusivity, could be seen
>   as a fundamental clock rate control primitive. The exclusivity is not
>   preemptible, so when claimed more than once, is rate is effectively
>   locked.
>
> * Provide a similar functionality to providers themselves, fixing
>   CLK_SET_RATE_GATE flag (enforce clock gating along the tree). While
>   there might still be a few platforms relying the broken implementation,
>   tests done has shown this change to be pretty safe.

I recently brought up with Sboyd that we couldn't get some graphics
going on the qualcomms without a patch like this:
https://marc.info/?l=linux-clk&m=150708421709125&w=2

In his reply:
https://marc.info/?l=linux-clk&m=150960601110643&w=2
he said that it was blocked because it's part of clock rate protection
problems with Krait CPUfreq.

So I was wondering whether this patch set hits the nail on its head
wrt the requirements for Krait CPUfreq upstreaming too, or if it
is looking for another solution altogether?

Yours,
Linus Walleij
