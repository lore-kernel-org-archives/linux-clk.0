Return-Path: <linus.walleij@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20170527200008.GM12920@tuxbook>
References: <20170419091326.11226-1-linus.walleij@linaro.org>
 <20170419091326.11226-3-linus.walleij@linaro.org> <20170527200008.GM12920@tuxbook>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 13 Oct 2017 13:50:08 +0200
Message-ID: <CACRpkdZvWeN8qwW_S8V-owJ0HJt5npFz7GHAYzcA_ke6agXAVA@mail.gmail.com>
Subject: Re: [PATCH 3/5 v2] clk: qcom: Implement RPM clocks for MSM8660/APQ8060
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

On Sat, May 27, 2017 at 10:00 PM, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
> On Wed 19 Apr 02:13 PDT 2017, Linus Walleij wrote:

>> The "active" clock pattern is mirrored in all the clocks. I guess
>> that the PLL4 that clocks the LPASS is actually never used as
>> "active only" since the low-power audio subsystem should be left
>> on when the system suspends, so it can be used as a stand-alone
>> MP3 player type of device.
>>
>> As we do not have firmware for the LPASS we will probably only use
>> this clock when the system is up and running (not suspended) for now,
>> so that will be using the "active" clock.
>>
>
> Note that "active" vs "sleep" is not related to the Linux suspend state,
> but rather the CPU idle state; at the bottom of the CPU idle path the
> RPM will react and reconfigure resources to their sleep state (if one is
> configured) and then reconfigured based on the active state before
> returning from the idle.
>
> The PLL4 seems to be enabled only on behalf of the booting LPASS Hexagon
> - which will cast its own vote once its booted - and as such we only
> configure the active state (meaning both states will have same
> configuration).  The result is that PLL4 will be on from prepare() to
> unprepare() regardless of what the application CPU does.

OK I copy/pasted some of this into my commit message and cut
the "active" clock from PLL4.

>> +#define DEFINE_CLK_RPM_FIXED(_platform, _name, _active, r_id, r)           \
>
> Is there a reason why you don't use DEFINE_CLK_RPM_PXO_BRANCH() for
> PLL4?

So it is (I think as concluded from the other mail) a pretty hardwired
PLL that can only be turned on and off.

#define DEFINE_CLK_RPM_PXO_BRANCH(_platform, _name, _active, r_id, r)

This macro presupposes an _active variant, so it's not really
working :/

Nothing in the driver is using this macro however, it seems like
it was defined for some missing piece.

How do you feel about if I simply update that macro and
cut the _active version then?

Or should I create a new DEFINE_CLK_RPM_PXO_BRANCH_FIXED()?

Yours,
Linus Walleij
