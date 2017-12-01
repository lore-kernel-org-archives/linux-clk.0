MIME-Version: 1.0
In-Reply-To: <CACRpkdYAUfcM3Z_YZBNBFnPmCCrgx_LYynBB=oTyHLzhDWuA_g@mail.gmail.com>
References: <1511807134.6812.10.camel@baylibre.com>
	<CACRpkdYAUfcM3Z_YZBNBFnPmCCrgx_LYynBB=oTyHLzhDWuA_g@mail.gmail.com>
Date: Fri, 1 Dec 2017 08:14:31 -0800
Message-ID: <CAEG3pNA9m4b+2aA=9a9W=sNB3e2eCkfw+KgKUUWvdMQos0yZqQ@mail.gmail.com>
Subject: Re: [GIT PULL] : clk: implement clock rate protection mechanism
From: Michael Turquette <mturquette@baylibre.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	Maxime Ripard <maxime.ripard@free-electrons.com>,
	Quentin Schulz <quentin.schulz@free-electrons.com>, Opera <montvid@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

Hi Linus,

On Wed, Nov 29, 2017 at 4:07 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Mon, Nov 27, 2017 at 7:25 PM, Jerome Brunet <jbrunet@baylibre.com> wrote:
>
>> This patchset introduce clock protection to the CCF core. This can then
>> be used for:
>>
>> * Provide a way for a consumer to claim exclusivity over the rate control
>>   of a provider. Some clock consumers require that a clock rate must not
>>   deviate from its selected frequency. There can be several reasons for
>>   this, not least of which is that some hardware may not be able to
>>   handle or recover from a glitch caused by changing the clock rate while
>>   the hardware is in operation. For such HW, The ability to get exclusive
>>   control of a clock's rate, and release that exclusivity, could be seen
>>   as a fundamental clock rate control primitive. The exclusivity is not
>>   preemptible, so when claimed more than once, is rate is effectively
>>   locked.
>>
>> * Provide a similar functionality to providers themselves, fixing
>>   CLK_SET_RATE_GATE flag (enforce clock gating along the tree). While
>>   there might still be a few platforms relying the broken implementation,
>>   tests done has shown this change to be pretty safe.
>
> I recently brought up with Sboyd that we couldn't get some graphics
> going on the qualcomms without a patch like this:
> https://marc.info/?l=linux-clk&m=150708421709125&w=2
>
> In his reply:
> https://marc.info/?l=linux-clk&m=150960601110643&w=2
> he said that it was blocked because it's part of clock rate protection
> problems with Krait CPUfreq.
>
> So I was wondering whether this patch set hits the nail on its head
> wrt the requirements for Krait CPUfreq upstreaming too, or if it
> is looking for another solution altogether?

Coordinated clock rates (ccr) is the vaporware that could help with
both the high-intermediate-clock-frequency problem as well as the
Krait cpufreq problem. Problem is that it's still vaporware (or I turn
out a new spin of those patches roughly once per year).

This series from Jerome may or may not help you. If you have sibling
clocks that are changing the rate of a shared parent, then this series
should help you. Or if you have clocks whose rates are being changed
briefly during a set_rate event from another sibling clock, then this
series should help you. Or if you have multiple clock inputs/parents
to select from and you want to choose one which that is not claimed
and rate-locked by a sibling clock, then this series should help you.

I'm planning to merge this in today. Let me know if something
spectacular breaks ;-)

Best regards,
Mike

>
> Yours,
> Linus Walleij
