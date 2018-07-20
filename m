Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Stephen Boyd <sboyd@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Viresh Kumar <viresh.kumar@linaro.org>
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <153210674909.48062.14786835684020975508@swboyd.mtv.corp.google.com>
Cc: grahamr@codeaurora.org, linux-clk <linux-clk@vger.kernel.org>,
 Linux PM <linux-pm@vger.kernel.org>, Doug Anderson <dianders@chromium.org>,
 Taniya Das <tdas@codeaurora.org>, Rajendra Nayak <rnayak@codeaurora.org>,
 Amit Nischal <anischal@codeaurora.org>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Amit Kucheria <amit.kucheria@linaro.org>
References: <9439bd29e3ccd5424a8e9b464c8c7bd9@codeaurora.org>
 <20180704065522.p4qpfnpayeobaok3@vireshk-i7>
 <CAPDyKFo-Z=H2mJXm7mN0Mt=iRzOaEuJSXc2gdE4i5NEfZ_OM6A@mail.gmail.com>
 <153210674909.48062.14786835684020975508@swboyd.mtv.corp.google.com>
Message-ID: <20180720175612.76528.53638@harbor.lan>
Subject: Re: [RFD] Voltage dependencies for clocks (DVFS)
Date: Fri, 20 Jul 2018 10:56:12 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Stephen Boyd (2018-07-20 10:12:29)
> Quoting Ulf Hansson (2018-07-04 05:50:40)
> > [...]
> > =

> > >> The third problem is that semantically using OPP for requesting
> > >> specific functional frequencies (i.e. for a  serial bus) is an abuse=
 of that
> > >> framework.  It requires the clients to find the "performance level" =
that
> > >> matches the specific frequency they require, then request that perfo=
rmance
> > >> level - when what they really want is to "set rate" on the clock to a
> > >> specific, known, frequency.
> > >
> > > This is the prototype of that routine:
> > >
> > > int dev_pm_opp_set_rate(struct device *dev, unsigned long target_freq=
);
> > >
> > > All we need is the target frequency and not an OPP.
> > >
> > > Maybe we can solve the problems you raised with the OPP core like
> > > this:
> > >
> > > - On a call to dev_pm_opp_set_rate(), we check the currently cached
> > >   frequency value. If it is unknown or 0, we call clk_enable() as
> > >   well..
> > >
> > > - When the drivers want things to shut down, they call
> > >   dev_pm_opp_set_rate(dev, 0) and on this we drop regulator vote, etc,
> > >   and call clk_disable().
> > >
> > > Will that be acceptable to everyone ?
> > =

> > For a cross SoC driver, the device may not be hooked up to an OPP
> > table. Then it needs to manage the clock anyways. I guess we can do
> > that for those cases that needs it.
> =

> Right. Something like the USB dwc3 driver will need to be changed and
> we'll see how it looks there.
> =

> Forcing OPP as the entry point to DVFS on every driver doesn't seem like
> a great idea. Some drivers just want to do clk API operations like they
> always have but now we need to throw in voltage scaling along with those
> clk operations. OPP is a convenient way to make sure drivers can't mess
> up the order of operations, agreed, but is that really that hard to get
> right? Converting all those drivers to the OPP APIs makes for
> contortions and I believe Graham doesn't think we should contort drivers
> that way unless they're using devfreq for their clk frequency and
> voltage scaling.
> =

> Plus, we're adding new and exciting clk APIs around the clk_set_rate()
> path. We have min/max variants of clk_set_rate() and we have a way to
> set a rate on a clk and make sure nobody else can change it with
> clk_set_rate_exclusive(). We would need to proxy all of those clk APIs
> through the OPP layer to cater to all the clk clients out there. All of
> that to avoid drivers ordering things incorrectly, when we already have
> drivers handling the order of operations correctly for powering on
> regulators and asserting resets at the right times. I just don't see
> what's wrong with drivers doing everything here themselves.
> =

> For one thing, a driver should be able to figure out what the
> performance state requirement is for a particular frequency. I'd like to
> see an API that a driver can pass something like a (device, genpd, clk,
> frequency) tuple and get back the performance state required for that
> device's clk frequency within that genpd by querying OPP tables. If we
> had this API, then SoC vendors could design OPP tables for their on-SoC
> devices that describe the set of max frequencies a device can operate at
> for a specific performance state and driver authors would be able to
> query that information and manually set genpd performance states when
> they change clk frequencies. In Qualcomm designs this would be their

I want to make sure I understand your proposal here. You want consumer
drivers to call the clk api's the manage clks, and you also want them to
use runtime/genpd apis to manage the power rails (with synchronicity
provided by a new api to set the right genpd/power rail state based on
clk freq). Do I have that right?

Sounds OK to me, but why not fold the clk_set_rate part into the genpd
as well? It's possible to have a genpd call clk_enable/clk_disable (see
include/linux/pm_clock.h, drivers/base/power/clock_ops.c and it's
various users under arch/arm/mach-* and drivers/*). Gating clocks within
a genpd callback feels analogous to setting clock rate.

Regards,
Mike

> "fmax" tables that map a max frequency to a voltage corner. If someone
> wanted to fine tune that table and make it into a full frequency plan
> OPP table for use by devfreq, then they could add more entries for all
> the validated frequencies and voltage corners that are acceptable and
> tested and this API would still work. We'll need this sort of table
> regardless because we can't expect devices to search for an exact
> frequency in an OPP table when they can support hundreds of different
> frequencies, like in display or audio situations.
> =

> Put succinctly, OPP needs to support a range of frequencies in addition
> to the set of frequencies it can support today and it needs to allow
> drivers to query that information.
> =

> > =

> > Another option is to use the ->runtime_suspend|resume() callbacks at
> > the genpd level. In principle when the device enters runtime suspend,
> > genpd can decide to drop the votes for the device (if some exist). At
> > runtime resume, genpd then should re-store the votes for the device it
> > had before it became runtime suspended (or if the vote became updated
> > in-between).
> =

> I'd prefer to see the genpd layer do it instead of OPP layer controlling
> the on/off state. Calling dev_pm_opp_set_rate(dev, 0) just looks very
> weird and conflates clk frequency with power domain state which isn't
> exactly what we want. We want it to be related to the frequency _and_
> the enabled state. Plus it's like saying clk_set_rate(clk, 0) should
> turn the clk off, which we've never done before.
> =

> It would also be good to handle the on/off state in genpd because the
> genpd could have a governor attached to it that blocks on/off requests
> from drivers if the governor decides that the device is clk gating on
> and off quickly but it's not beneficial to change the voltage during the
> quick gating scenario because we spend more time changing voltage than
> clk gating. Connecting this all to genpd allows us to use the device
> power state as a signal to adjust the voltage, but leaves us flexibility
> to override it if it makes sense policy wise.
> =

> And please remember the other point here that many devices may all be
> sharing the same power domain and therefore the voltage that the domain
> runs at depends on many different clk frequencies for different devices
> and if those clks are enabled or not, aggregated into a single voltage
> requirement for the power domain. The runtime suspend state might be
> part of that aggregation equation, so that if a device's clk is off and
> it's been suspended for some time the voltage requirement for that clk
> frequency could be dropped, but if the device is resumed and the clk is
> still off then the voltage requirement can be ignored. We only need to
> make sure the power domain is at a high enough voltage when the clk is
> actually enabled though, so tying the voltage requirement drop to
> runtime PM of the device is not exactly correct.
> =

> It may be that a device is composed of multiple power domains and those
> power domains each have their own clks with voltage requirements too.
> In this scenario, connecting the voltage requirement of the genpd to the
> runtime PM state of the device doesn't make sense at all. We'll get into
> a situation where half the device is "off" because a power domain and
> the clk for that power domain are off but we can't drop the voltage
> requirement because the overall device isn't runtime suspended. It's
> like the single genpd per device problem all over again. Let's not do
> that.
> =

> So I'd rather see drivers calling some genpd API directly to indicate
> that the clk should turn off and the voltage domain constraint has gone
> away. We might want to transform OPP into a genpd of its own and then
> connect that OPP genpd to a clk domain genpd for some clk
> on/off/frequency part and a power domain for the voltage/corner scaling
> part. If we did that, then everything is a genpd that gets all
> aggregated in the genpd layer and drivers that only use OPP would be OK
> with their runtime PM state of their device affecting the OPP genpd's
> on/off state of clks and voltage requirements. Drivers that want finer
> control would be able to use some new genpd API to turn on and off the
> genpd when they want to.
>=20
