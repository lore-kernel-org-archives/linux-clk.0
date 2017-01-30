Return-Path: <dmitry.torokhov@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20170130214227.GI27312@n2100.armlinux.org.uk>
References: <20170128184047.GA24957@dtor-ws> <20170128190309.GN27312@n2100.armlinux.org.uk>
 <20170128192207.GA38136@dtor-ws> <64ed0890-14f6-42ff-66b1-60f7b3d7d02f@roeck-us.net>
 <20170128233911.GO27312@n2100.armlinux.org.uk> <20170129180743.GA10917@dtor-ws>
 <20170130185551.GM8801@codeaurora.org> <20170130192214.GC11199@roeck-us.net> <20170130214227.GI27312@n2100.armlinux.org.uk>
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Mon, 30 Jan 2017 13:58:05 -0800
Message-ID: <CAKdAkRREDjH4+qxs6AOHHmftPi4HFuDwi8=m4WQJdyhs5ApNPg@mail.gmail.com>
Subject: Re: [PATCH v2] clk: add more managed APIs
To: Russell King - ARM Linux <linux@armlinux.org.uk>
Cc: Guenter Roeck <linux@roeck-us.net>, Stephen Boyd <sboyd@codeaurora.org>,
	Michael Turquette <mturquette@baylibre.com>, Viresh Kumar <viresh.kumar@linaro.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>, linux-clk@vger.kernel.org,
	lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Mon, Jan 30, 2017 at 1:42 PM, Russell King - ARM Linux
<linux@armlinux.org.uk> wrote:
> On Mon, Jan 30, 2017 at 11:22:14AM -0800, Guenter Roeck wrote:
>> Maybe the additional calls make sense; I can imagine they would.
>> However, I personally would be a bit wary of changing the initialization
>> order of multi-clock initializations, and I am not sure how a single call
>> could address setting the rate ([devm_]clk_get_setrate_prepare_enable()
>> seems like a bit too much).
>>
>> [ On a side note, why is there no clk_get_prepare_enable() and
>>   clk_get_prepare() ? Maybe it would be better to introduce those
>>   together with the matching devm_ functions in a separate patch
>>   if they are useful. ]
>
> If you take the view that trying to keep clocks disabled is a good way
> to save power, then you'd have the clk_prepare() or maybe
> clk_prepare_enable() in your runtime PM resume handler, or maybe even
> deeper in the driver... the original design goal of the clk API was to
> allow power saving and clock control.
>
> With that in mind, getting and enabling the clock together in the
> probe function didn't make sense.
>
> I feel that aspect has been somewhat lost, and people now regard much
> of the clk API as a bit of a probe-time nusience.

It really depends on the driver. Devices that are expected to be used
"all the time", like keyboards, that get "opened" very early in the
boot process, maybe even by the kernel itself, usually enable hardware
in probe as doing it later just makes code more complex. Devices that
are "less used" and could provide more power savings (like GPU) may
have more elaborate power management with clocks being turned on and
off as needed. I would not paint clk API as "probe-time nuisance", but
for some class of devices devm CLK API is really helpful.

FWIW I do not think that kitchen sink calls, like
"devm_clk_get_prepare_set_rate_enable" are helpful. Resource
acquisition and use of said resource are logically separate.

Thanks.

-- 
Dmitry
