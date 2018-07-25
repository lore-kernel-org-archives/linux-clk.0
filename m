Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Stephen Boyd <sboyd@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Viresh Kumar <viresh.kumar@linaro.org>
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <153247398093.48062.2891509901572895687@swboyd.mtv.corp.google.com>
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
 <20180720175612.76528.53638@harbor.lan>
 <153247398093.48062.2891509901572895687@swboyd.mtv.corp.google.com>
Message-ID: <20180725055135.96956.13008@harbor.lan>
Subject: Re: [RFD] Voltage dependencies for clocks (DVFS)
Date: Tue, 24 Jul 2018 22:51:38 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Stephen Boyd (2018-07-24 16:13:00)
> Quoting Michael Turquette (2018-07-20 10:56:12)
> > Quoting Stephen Boyd (2018-07-20 10:12:29)
> > > =

> > > For one thing, a driver should be able to figure out what the
> > > performance state requirement is for a particular frequency. I'd like=
 to
> > > see an API that a driver can pass something like a (device, genpd, cl=
k,
> > > frequency) tuple and get back the performance state required for that
> > > device's clk frequency within that genpd by querying OPP tables. If we
> > > had this API, then SoC vendors could design OPP tables for their on-S=
oC
> > > devices that describe the set of max frequencies a device can operate=
 at
> > > for a specific performance state and driver authors would be able to
> > > query that information and manually set genpd performance states when
> > > they change clk frequencies. In Qualcomm designs this would be their
> > =

> > I want to make sure I understand your proposal here. You want consumer
> > drivers to call the clk api's the manage clks, and you also want them to
> > use runtime/genpd apis to manage the power rails (with synchronicity
> > provided by a new api to set the right genpd/power rail state based on
> > clk freq). Do I have that right?
> =

> Yes. That is one option that I'd like to explore. We definitely have a
> case where drivers don't set any rate at all, they just set a power rail
> state with the performance state APIs. But it also seems complicated to
> do it all through the OPP APIs, so maybe duplicating a bunch of stuff in
> each driver will show that is good or bad.
> =

> > =

> > Sounds OK to me, but why not fold the clk_set_rate part into the genpd
> > as well? It's possible to have a genpd call clk_enable/clk_disable (see
> > include/linux/pm_clock.h, drivers/base/power/clock_ops.c and it's
> > various users under arch/arm/mach-* and drivers/*). Gating clocks within
> > a genpd callback feels analogous to setting clock rate.
> > =

> =

> I suppose it should be possible to make a genpd for the clk rate and clk
> enable/disable state and put that behind the genpd performance state API
> so that it mirrors the OPP set_rate API. Then it is analogous to setting
> a rate and having a state of 0 mean the voltage requirement is gone. Of
> course, then we've replaced the word 'rate' with 'state' and I'm all
> happy now, which seems hypocritical! I semi-alluded to this idea in the
> second half of my email where I said we can turn OPP into a genpd that
> accepts performance state requests via the genpd performance state API,
> so I'm happy to look at how this would work too. It would be nice for
> drivers to just request a performance state and have that fall into a
> genpd for the clk rate and enable/disable state and also go affect the
> performance state of a voltage domain genpd. Everything could be done on
> the backend in genpd then and drivers wouldn't do much with clks
> directly.
> =


Right, and for SoCs with complex power management hardware, I feel that
having a genpd backend that Knows All The Stuff will be really helpful
to the soc platform driver authors.

Lots of out-of-tree Whole Chip Power Management frameworks have shipped
in devices. I wonder if finally uniting performance and idle power
management in genpd will provide a path forward towards an
upstream-acceptable solution?

I think it would be ideal if we could nest all of the power primitives
within this layer (clocks, regulators, pmic/firmware messaging, avs,
etc) instead of having peer layers/subsystems.

Regards,
Mike
