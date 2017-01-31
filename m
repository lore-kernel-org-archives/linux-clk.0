Return-Path: <dmitry.torokhov@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20170131172058.GA15184@roeck-us.net>
References: <20170128184047.GA24957@dtor-ws> <20170128190309.GN27312@n2100.armlinux.org.uk>
 <20170128192207.GA38136@dtor-ws> <64ed0890-14f6-42ff-66b1-60f7b3d7d02f@roeck-us.net>
 <20170128233911.GO27312@n2100.armlinux.org.uk> <20170129180743.GA10917@dtor-ws>
 <20170130185551.GM8801@codeaurora.org> <20170130192214.GC11199@roeck-us.net>
 <20170131005957.GB35974@dtor-ws> <20170131172058.GA15184@roeck-us.net>
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Tue, 31 Jan 2017 10:26:29 -0800
Message-ID: <CAKdAkRT7iPdw877GxZCxa5h+mnczgksmLnpuuF+MuLPwP6zBkw@mail.gmail.com>
Subject: Re: [PATCH v2] clk: add more managed APIs
To: Guenter Roeck <linux@roeck-us.net>
Cc: Stephen Boyd <sboyd@codeaurora.org>, Russell King - ARM Linux <linux@armlinux.org.uk>,
	Michael Turquette <mturquette@baylibre.com>, Viresh Kumar <viresh.kumar@linaro.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>, linux-clk@vger.kernel.org,
	lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Tue, Jan 31, 2017 at 9:20 AM, Guenter Roeck <linux@roeck-us.net> wrote:
> On Mon, Jan 30, 2017 at 04:59:57PM -0800, Dmitry Torokhov wrote:
>> On Mon, Jan 30, 2017 at 11:22:14AM -0800, Guenter Roeck wrote:
>> > On Mon, Jan 30, 2017 at 10:55:51AM -0800, Stephen Boyd wrote:
>> > > On 01/29, Dmitry Torokhov wrote:
>> > > > When converting a driver to managed resources it is desirable to be able to
>> > > > manage all resources in the same fashion. This change allows managing
>> > > > clocks in the same way we manage many other resources.
>> > >
>> > > Can you please add 'managing clock prepared and enabled state in
>> > > the same way'?
>> > >
>> > > The current wording makes it sound like we don't have
>> > > devm_clk_get() when we do.
>> > >
>> > > >
>> > > > This adds the following managed APIs:
>> > > >
>> > > > - devm_clk_prepare()/devm_clk_unprepare();
>> > > > - devm_clk_prepare_enable()/devm_clk_disable_unprepare().
>> > >
>> > > Wouldn't this be preceded by a devm_clk_get() call? Wouldn't it
>> > > be even shorter to have the APIs
>> > >
>> > >   devm_clk_get_and_prepare()/devm_clk_unprepare_and_put()
>> > >   devm_clk_get_and_prepare_enable()/devm_clk_disable_unprepare_and_put()
>> > >
>> > > instead?
>> > >
>> > In many cases I see
>> >
>> >     devm_clk_get(clk1);
>> >     devm_clk_get(clk2);
>> >     clk_prepare_enable(clk1);
>> >     clk_prepare_enable(clk2);
>> >
>> > Sometimes the calls are intertwined with setting the clock rates.
>> >
>> >     devm_clk_get(clk);
>> >     clk_set_rate(clk, rate);
>> >     clk_prepare_enable(clk);
>> >
>> > Maybe the additional calls make sense; I can imagine they would.
>> > However, I personally would be a bit wary of changing the initialization
>> > order of multi-clock initializations, and I am not sure how a single call
>> > could address setting the rate ([devm_]clk_get_setrate_prepare_enable()
>> > seems like a bit too much).
>> >
>> > [ On a side note, why is there no clk_get_prepare_enable() and
>> >   clk_get_prepare() ? Maybe it would be better to introduce those
>> >   together with the matching devm_ functions in a separate patch
>> >   if they are useful. ]
>> >
>> > > Is there any other subsystem that has similar functionality?
>> > > Regulators? GPIOs? Resets? I'm just curious if those subsystems
>> > > also need similar changes.
>> > >
>> > Ultimately yes, and most already do. If I recall correctly, I tried to
>> > introduce devm_ functions for regulators some time ago, but that was
>> > rejected with the comment that it would invite misuse.  At the time
>> > I accepted that; today my reaction would be to counter that pretty much
>> > everything can be misused, and that the potential for misuse should not
>> > penaltize all the valid use cases.
>>
>> I think we should ping Mark again. The only thing we are achieving is
>> that everyone is using devm_add_action_or_reset() with wrappers around
>> regulator_put().
>>
> regulator_get() has an equivalent devm_regulator_get(). Maybe it was since
> added, or I was thinking about a different function.

I think we also need devm_regulator_enable().

Thanks.

-- 
Dmitry
