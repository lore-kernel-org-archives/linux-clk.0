Return-Path: <pdeschrijver@nvidia.com>
Date: Mon, 23 Jul 2018 11:26:41 +0300
From: Peter De Schrijver <pdeschrijver@nvidia.com>
To: Stephen Boyd <sboyd@kernel.org>
CC: Ulf Hansson <ulf.hansson@linaro.org>, Viresh Kumar
	<viresh.kumar@linaro.org>, <grahamr@codeaurora.org>, linux-clk
	<linux-clk@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>, Mike
 Turquette <mturquette@baylibre.com>, Doug Anderson <dianders@chromium.org>,
	Taniya Das <tdas@codeaurora.org>, Rajendra Nayak <rnayak@codeaurora.org>,
	Amit Nischal <anischal@codeaurora.org>, Vincent Guittot
	<vincent.guittot@linaro.org>, Amit Kucheria <amit.kucheria@linaro.org>
Subject: Re: [RFD] Voltage dependencies for clocks (DVFS)
Message-ID: <20180723082641.GJ1636@tbergstrom-lnx.Nvidia.com>
References: <9439bd29e3ccd5424a8e9b464c8c7bd9@codeaurora.org>
 <20180704065522.p4qpfnpayeobaok3@vireshk-i7>
 <CAPDyKFo-Z=H2mJXm7mN0Mt=iRzOaEuJSXc2gdE4i5NEfZ_OM6A@mail.gmail.com>
 <153210674909.48062.14786835684020975508@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
In-Reply-To: <153210674909.48062.14786835684020975508@swboyd.mtv.corp.google.com>
Return-Path: pdeschrijver@nvidia.com
List-ID: <linux-clk.vger.kernel.org>

On Fri, Jul 20, 2018 at 10:12:29AM -0700, Stephen Boyd wrote:
> Quoting Ulf Hansson (2018-07-04 05:50:40)
> > [...]
> > 
> > >> The third problem is that semantically using OPP for requesting
> > >> specific functional frequencies (i.e. for a  serial bus) is an abuse of that
> > >> framework.  It requires the clients to find the "performance level" that
> > >> matches the specific frequency they require, then request that performance
> > >> level - when what they really want is to "set rate" on the clock to a
> > >> specific, known, frequency.
> > >
> > > This is the prototype of that routine:
> > >
> > > int dev_pm_opp_set_rate(struct device *dev, unsigned long target_freq);
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
> > 
> > For a cross SoC driver, the device may not be hooked up to an OPP
> > table. Then it needs to manage the clock anyways. I guess we can do
> > that for those cases that needs it.
> 
> Right. Something like the USB dwc3 driver will need to be changed and
> we'll see how it looks there.
> 
> Forcing OPP as the entry point to DVFS on every driver doesn't seem like
> a great idea. Some drivers just want to do clk API operations like they
> always have but now we need to throw in voltage scaling along with those
> clk operations. OPP is a convenient way to make sure drivers can't mess
> up the order of operations, agreed, but is that really that hard to get
> right? Converting all those drivers to the OPP APIs makes for
> contortions and I believe Graham doesn't think we should contort drivers
> that way unless they're using devfreq for their clk frequency and
> voltage scaling.
> 
> Plus, we're adding new and exciting clk APIs around the clk_set_rate()
> path. We have min/max variants of clk_set_rate() and we have a way to
> set a rate on a clk and make sure nobody else can change it with
> clk_set_rate_exclusive(). We would need to proxy all of those clk APIs
> through the OPP layer to cater to all the clk clients out there. All of
> that to avoid drivers ordering things incorrectly, when we already have
> drivers handling the order of operations correctly for powering on
> regulators and asserting resets at the right times. I just don't see
> what's wrong with drivers doing everything here themselves.
> 
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
> "fmax" tables that map a max frequency to a voltage corner. If someone
> wanted to fine tune that table and make it into a full frequency plan
> OPP table for use by devfreq, then they could add more entries for all
> the validated frequencies and voltage corners that are acceptable and
> tested and this API would still work. We'll need this sort of table
> regardless because we can't expect devices to search for an exact
> frequency in an OPP table when they can support hundreds of different
> frequencies, like in display or audio situations.
> 

Various reasons why I think the driver is not the right place to handle
the V/f relationship:

1) The V/f relationship is temperature dependent. So the voltage may have
   to be adjusted when the temperature changes. I don't think we should
   make every driver handle this on its own.

2) Not every device with V/f requirements has its own powerdomain. On Tegra
   for example we have 2 voltage rails: core and CPU. (and a 3rd one for GPU
   since Tegra124). So all peripherals (except GPU) share the same voltage
   rail and they are grouped in several domains, one of which cannot be
   powergated. So genpd domains do not align with the V/f curves of the
   peripherals themselves.

Peter.
