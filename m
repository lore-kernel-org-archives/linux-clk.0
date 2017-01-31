Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <20170130225138.GA14987@roeck-us.net>
References: <20170128184047.GA24957@dtor-ws> <20170128190309.GN27312@n2100.armlinux.org.uk>
 <20170128192207.GA38136@dtor-ws> <64ed0890-14f6-42ff-66b1-60f7b3d7d02f@roeck-us.net>
 <20170128233911.GO27312@n2100.armlinux.org.uk> <20170129180743.GA10917@dtor-ws>
 <20170130185551.GM8801@codeaurora.org> <20170130192214.GC11199@roeck-us.net>
 <20170130214227.GI27312@n2100.armlinux.org.uk> <20170130225138.GA14987@roeck-us.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 31 Jan 2017 09:43:16 +0100
Message-ID: <CAMuHMdW9Sx7nw6yYpvqNZ9WPHD1rsDe5HVRrmJj=xswGT=7D0g@mail.gmail.com>
Subject: Re: [PATCH v2] clk: add more managed APIs
To: Guenter Roeck <linux@roeck-us.net>
Cc: Russell King - ARM Linux <linux@armlinux.org.uk>, Stephen Boyd <sboyd@codeaurora.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Michael Turquette <mturquette@baylibre.com>,
	Viresh Kumar <viresh.kumar@linaro.org>, Andy Shevchenko <andy.shevchenko@gmail.com>,
	linux-clk <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi G=C3=BCnter,

On Mon, Jan 30, 2017 at 11:51 PM, Guenter Roeck <linux@roeck-us.net> wrote:
> On Mon, Jan 30, 2017 at 09:42:28PM +0000, Russell King - ARM Linux wrote:
>> On Mon, Jan 30, 2017 at 11:22:14AM -0800, Guenter Roeck wrote:
>> > Maybe the additional calls make sense; I can imagine they would.
>> > However, I personally would be a bit wary of changing the initializati=
on
>> > order of multi-clock initializations, and I am not sure how a single c=
all
>> > could address setting the rate ([devm_]clk_get_setrate_prepare_enable(=
)
>> > seems like a bit too much).
>> >
>> > [ On a side note, why is there no clk_get_prepare_enable() and
>> >   clk_get_prepare() ? Maybe it would be better to introduce those
>> >   together with the matching devm_ functions in a separate patch
>> >   if they are useful. ]
>>
>> If you take the view that trying to keep clocks disabled is a good way
>> to save power, then you'd have the clk_prepare() or maybe
>> clk_prepare_enable() in your runtime PM resume handler, or maybe even
>> deeper in the driver... the original design goal of the clk API was to
>> allow power saving and clock control.
>>
>> With that in mind, getting and enabling the clock together in the
>> probe function didn't make sense.
>>
>> I feel that aspect has been somewhat lost, and people now regard much
>> of the clk API as a bit of a probe-time nusience.
>
> While I understand what you are saying, I think just focusing on power
> savings paints a bit of a simplistic view of the clock API and its use.
> Power saving is not its only use case. In a system where power saving isn=
't
> the highest priority (say, in a high end switch), it is still extremely
> valuable, providing a unified API to the clocks in the system (and there
> are lots of clocks in a high end switch). Having seen what happens if the=
re
> is _no_ unified API (ie a complete mess of per-clock-driver calls all ove=
r
> the place), I consider this as at least as or even more important than it=
s
> power savings potential. In this use case, one would normally both get an=
d
> enable the clock (or, much more likely, clocks) in the probe function.
> One would also need remove functions, since interfaces in a high end swit=
ch
> are typically OIR capable.
>
> For my part, I stumbled over the lack of devm functions for clock APIs re=
cently
> when trying to convert watchdog drivers to use devm functions where possi=
ble.
> Many watchdog drivers do use the clock API to only enable the clock when =
the
> watchdog is actually running. However, there are several which prepare an=
d
> enable the clock at probe time, and disable/unprepare on remove. Would it=
 be
> possible to convert those to only prepare/enable the clocks if the watchd=
og
> is actually enabled ? Possibly, but I am sure that there are cases where =
that
> is not possible, or feasible. Either way, watchdog drivers are usually on=
ly
> loaded when actually used, so trying to optimize clock usage would often =
be
> more pain than it is worth.
>
> When I did that conversion, I started out using devm_add_action_or_reset(=
).
> While that does work, it was pointed out that using devm functions for th=
e
> clock APIs would be a much better solution. As it turns out, devm_add_act=
ion()
> and devm_add_action_or_reset() is already being used by various drivers t=
o
> work around the lack of devm functions for the clock API. With that in mi=
nd,
> have a choice to make - we can continue forcing people to do that, or we =
can
> introduce devm functions. My vote is for the latter.

W.r.t. clocks, there may be multiple reasons why you care about them:
  1. You need to control a clock output to a slave device (e.g. SPI, i2c,
     audio, ...).
     Here your driver cares about both enabling/disabling the clock, and
     programming its clock rate.
  2. You need to control a clock because synchronous hardware needs a runni=
ng
     clock to operate.
     Here you only care about enabling/disabling the clock, and this falls
     under the "power saving" umbrella.
     These days it's typically handled by a clock domain driver implementin=
g
     a PM Domain using the genpd framework.  Hence your driver doesn't need
     to manage the clock explicitly (no clk_get()/clk_prepare_enable() etc.=
),
     but just calls the pm_runtime_*() functions.
     Using pm_runtime_*() is always a good idea, even if currently there is
     no clock to control, as your device may end up in a future SoC that do=
es
     have a clock (or power domains).
  3. Combinations of the above.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
