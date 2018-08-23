Return-Path: <ulf.hansson@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20180803211132.71539.18482@harbor.lan>
References: <9439bd29e3ccd5424a8e9b464c8c7bd9@codeaurora.org>
 <20180704065522.p4qpfnpayeobaok3@vireshk-i7> <CAPDyKFo-Z=H2mJXm7mN0Mt=iRzOaEuJSXc2gdE4i5NEfZ_OM6A@mail.gmail.com>
 <153210674909.48062.14786835684020975508@swboyd.mtv.corp.google.com>
 <CAPDyKFr7xxUV0pmQCoM1T_fZdBifWqJF6QJgHQe2JGUU0a6MJg@mail.gmail.com> <20180803211132.71539.18482@harbor.lan>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 23 Aug 2018 13:10:55 +0200
Message-ID: <CAPDyKFppT5L5LN_G4UFMLbdB5DosXuw+dyvFzN3jZ2PAopVKNw@mail.gmail.com>
Subject: Re: [RFD] Voltage dependencies for clocks (DVFS)
To: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, grahamr@codeaurora.org,
	linux-clk <linux-clk@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>,
	Doug Anderson <dianders@chromium.org>, Taniya Das <tdas@codeaurora.org>,
	Rajendra Nayak <rnayak@codeaurora.org>, Amit Nischal <anischal@codeaurora.org>,
	Vincent Guittot <vincent.guittot@linaro.org>, Amit Kucheria <amit.kucheria@linaro.org>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

On 3 August 2018 at 23:11, Michael Turquette <mturquette@baylibre.com> wrote:
> Quoting Ulf Hansson (2018-07-31 03:35:50)
>> [...]
>>
>> >>
>> >> Another option is to use the ->runtime_suspend|resume() callbacks at
>> >> the genpd level. In principle when the device enters runtime suspend,
>> >> genpd can decide to drop the votes for the device (if some exist). At
>> >> runtime resume, genpd then should re-store the votes for the device it
>> >> had before it became runtime suspended (or if the vote became updated
>> >> in-between).
>> >
>> > I'd prefer to see the genpd layer do it instead of OPP layer controlling
>> > the on/off state. Calling dev_pm_opp_set_rate(dev, 0) just looks very
>> > weird and conflates clk frequency with power domain state which isn't
>> > exactly what we want. We want it to be related to the frequency _and_
>> > the enabled state. Plus it's like saying clk_set_rate(clk, 0) should
>> > turn the clk off, which we've never done before.
>>
>> Perhaps you misunderstood my suggestion!?
>>
>> Instead of having the driver to call dev_pm_opp_set_rate(dev, 0) from
>> their ->runtime_suspend() callbacks, my suggestion is to let genpd,
>> from its ->runtime_suspend() callback, temporarily drop the requested
>> performance level for the device. Hence genpd also needs to re-compute
>> and set a new aggregated performance value for the PM domain.
>>
>> The purpose was to make it transparent for drivers, as all they need
>> do is whatever they did before.
>>
>> >
>> > It would also be good to handle the on/off state in genpd because the
>> > genpd could have a governor attached to it that blocks on/off requests
>> > from drivers if the governor decides that the device is clk gating on
>> > and off quickly but it's not beneficial to change the voltage during the
>> > quick gating scenario because we spend more time changing voltage than
>> > clk gating. Connecting this all to genpd allows us to use the device
>> > power state as a signal to adjust the voltage, but leaves us flexibility
>> > to override it if it makes sense policy wise.
>>
>> Well, genpd already manages the on/off state!?
>>
>> Of course, I fully agree to the above, which seems also to be a good
>> reason to why my suggestion makes sense. Or am I missing something
>> here?
>>
>> >
>> > And please remember the other point here that many devices may all be
>> > sharing the same power domain and therefore the voltage that the domain
>> > runs at depends on many different clk frequencies for different devices
>> > and if those clks are enabled or not, aggregated into a single voltage
>> > requirement for the power domain.
>>
>> Right, the aggregation in genpd is done per device - not per clock. I
>> don't understand your concern, but again I may be missing something!?
>
> I believe that this is an argument against using OPP as the performance
> selection mechanism for all SoCs. It's data structures, along with the
> fact that is seems to have no awareness of device idleness, means that
> it's not really sufficient for more complex SoCs.

Sorry, but this does not make sense to me. :-)

For sure genpd has knowledge about "device's idleness", at least those
that have been attached to it. This is controlled via genpd's
->runtime_suspend() callback. See genpd_runtime_suspend() and
__genpd_runtime_suspend(), which is being invoked per device. What am
I missing here?

>
>>
>> > The runtime suspend state might be
>> > part of that aggregation equation, so that if a device's clk is off and
>> > it's been suspended for some time the voltage requirement for that clk
>> > frequency could be dropped, but if the device is resumed and the clk is
>> > still off then the voltage requirement can be ignored. We only need to
>> > make sure the power domain is at a high enough voltage when the clk is
>> > actually enabled though, so tying the voltage requirement drop to
>> > runtime PM of the device is not exactly correct.
>>
>> I see.
>>
>> For my understanding; you are saying that there may be use-cases when
>> one want to keep the device runtime resumed, but without having its
>> clock ungated, right?
>>
>> My guess is that this is a rather unusual case, no?
>
> This is a common case if I understand Stephen's example: Imagine a power
> island that scales voltage and may power clamp to zero. Now imagine that
> within that power island are a dozen separate functional devices, each
> consuming a dedicated functional clock input signal.

Right.

>
> It's possible to have the power island turned on so that one device can
> function, but the other 11 devices will remain clock gated.

Right.

>
> I assume the right way to handle this is to nest a dozen device-level
> genpd's within the power island-level genpd?

No.

Devices that belongs to the same "power island" shall be attached to
the same PM domain (genpd).

Each device within the same PM domain shall be separately managed
through runtime PM, via its corresponding runtime PM callbacks.

The job of genpd is to manage the PM domain, which means keeping it
powered on, in case any of its attached devices are in use (runtime
resumed). Not until all devices in the same PM domain becomes unused
(runtime suspended), then genpd can try to power off the PM domain.

> That mirrors the topology I
> described above, and allows the lowest level genpds (functional
> device-level) to gate and ungate clocks, and the parent genpd (power
> island-level) will only be concerned with voltage control.

Well, if there is "power island" topology, then that of course
can/shall be modeled by using genpd, but unless I am missing
something, that was not what you described above.

Anyway, let's try to use the right terminology of genpd, which are
master and subdomains, rather than parent/child.

>
>>
>> The point is, I think we can simply have the driver to call
>> dev_pm_opp_set_rate() to cover optimizations for these scenarios.
>>
>> >
>> > It may be that a device is composed of multiple power domains and those
>> > power domains each have their own clks with voltage requirements too.
>> > In this scenario, connecting the voltage requirement of the genpd to the
>> > runtime PM state of the device doesn't make sense at all. We'll get into
>> > a situation where half the device is "off" because a power domain and
>> > the clk for that power domain are off but we can't drop the voltage
>> > requirement because the overall device isn't runtime suspended. It's
>> > like the single genpd per device problem all over again. Let's not do
>> > that.
>>
>> I am *not* suggesting to remove the APIs in genpd for setting a
>> performance level. We can still do that and that should be sufficient
>> to cover any corner cases, don't you think?
>>
>> My suggestion was only to allow genpd to drop the votes (temporarily)
>> for a device that becomes runtime suspended.
>>
>> >
>> > So I'd rather see drivers calling some genpd API directly to indicate
>> > that the clk should turn off and the voltage domain constraint has gone
>> > away. We might want to transform OPP into a genpd of its own and then
>> > connect that OPP genpd to a clk domain genpd for some clk
>> > on/off/frequency part and a power domain for the voltage/corner scaling
>> > part. If we did that, then everything is a genpd that gets all
>> > aggregated in the genpd layer and drivers that only use OPP would be OK
>> > with their runtime PM state of their device affecting the OPP genpd's
>> > on/off state of clks and voltage requirements. Drivers that want finer
>> > control would be able to use some new genpd API to turn on and off the
>> > genpd when they want to.
>>
>> Sound like we need a white-board. :-)
>
> We really do. Maybe I'll make the trip to Vancouver in September :-)

Yes, it would be great to meet at Linaro connect! Please come! :-)

Also, I have already asked Rafael to bring up the DVFS as a topic
during our power management track at LPC in Vancouver in November.
Let's see what gets scheduled.

>
> I don't like the idea to "transform OPP into a genpd of its own", as
> suggested by Stephen above. But I think all he needs to solve this issue
> is nesting some functional clock-level genpds inside of a parent power
> island-level genpd. This is a repeat of the three paragraphs I've
> written above.
>
> This approach achieves the same effect as turning opp into a genpd, but
> I'm not inclined to try and change the OPP library to solve this
> problem.
>
> I think OPP is fine as-is: it makes it easy to handle the very simplest
> DVFS cases.  Stephen's requirements (and that of most mobile SoCs) goes
> beyond what the OPP library can and should offer.
>

The above seems reasonable.

On the other hand, Graham recently clarifies for QCOM SoCs, that clock
controllers themselves have OPP constraints and not only clock
consumers. To me this changes the situation, quite fundamentally as
well.

Kind regards
Uffe
