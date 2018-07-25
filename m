Return-Path: <pdeschrijver@nvidia.com>
Date: Wed, 25 Jul 2018 14:27:02 +0300
From: Peter De Schrijver <pdeschrijver@nvidia.com>
To: Michael Turquette <mturquette@baylibre.com>
CC: Stephen Boyd <sboyd@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
	Viresh Kumar <viresh.kumar@linaro.org>, <grahamr@codeaurora.org>, linux-clk
	<linux-clk@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>, Doug
 Anderson <dianders@chromium.org>, Taniya Das <tdas@codeaurora.org>, Rajendra
 Nayak <rnayak@codeaurora.org>, Amit Nischal <anischal@codeaurora.org>,
	Vincent Guittot <vincent.guittot@linaro.org>, Amit Kucheria
	<amit.kucheria@linaro.org>
Subject: Re: [RFD] Voltage dependencies for clocks (DVFS)
Message-ID: <20180725112702.GN1636@tbergstrom-lnx.Nvidia.com>
References: <9439bd29e3ccd5424a8e9b464c8c7bd9@codeaurora.org>
 <20180704065522.p4qpfnpayeobaok3@vireshk-i7>
 <CAPDyKFo-Z=H2mJXm7mN0Mt=iRzOaEuJSXc2gdE4i5NEfZ_OM6A@mail.gmail.com>
 <153210674909.48062.14786835684020975508@swboyd.mtv.corp.google.com>
 <20180723082641.GJ1636@tbergstrom-lnx.Nvidia.com>
 <153247347784.48062.15923823598346148594@swboyd.mtv.corp.google.com>
 <20180725054400.96956.13278@harbor.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
In-Reply-To: <20180725054400.96956.13278@harbor.lan>
Return-Path: pdeschrijver@nvidia.com
List-ID: <linux-clk.vger.kernel.org>

On Tue, Jul 24, 2018 at 10:44:00PM -0700, Michael Turquette wrote:
> Quoting Stephen Boyd (2018-07-24 16:04:37)
> > Quoting Peter De Schrijver (2018-07-23 01:26:41)
> > > On Fri, Jul 20, 2018 at 10:12:29AM -0700, Stephen Boyd wrote:
> > > > 
> > > > For one thing, a driver should be able to figure out what the
> > > > performance state requirement is for a particular frequency. I'd like to
> > > > see an API that a driver can pass something like a (device, genpd, clk,
> > > > frequency) tuple and get back the performance state required for that
> > > > device's clk frequency within that genpd by querying OPP tables. If we
> > > > had this API, then SoC vendors could design OPP tables for their on-SoC
> > > > devices that describe the set of max frequencies a device can operate at
> > > > for a specific performance state and driver authors would be able to
> > > > query that information and manually set genpd performance states when
> > > > they change clk frequencies. In Qualcomm designs this would be their
> > > > "fmax" tables that map a max frequency to a voltage corner. If someone
> > > > wanted to fine tune that table and make it into a full frequency plan
> > > > OPP table for use by devfreq, then they could add more entries for all
> > > > the validated frequencies and voltage corners that are acceptable and
> > > > tested and this API would still work. We'll need this sort of table
> > > > regardless because we can't expect devices to search for an exact
> > > > frequency in an OPP table when they can support hundreds of different
> > > > frequencies, like in display or audio situations.
> > > > 
> > > 
> > > Various reasons why I think the driver is not the right place to handle
> > > the V/f relationship:
> > > 
> > > 1) The V/f relationship is temperature dependent. So the voltage may have
> > >    to be adjusted when the temperature changes. I don't think we should
> > >    make every driver handle this on its own.
> > 
> > This is AVS? Should be fine to plumb that into some sort of voltage
> > domain that gets temperature feedback and then adjusts the voltage based

For the core rail, it seems the voltage is indeed just adjusted based on
temperature. For the GPU rail, we have equations which calculate the required
voltage as a function of frequency and temperature. In some cases I think
we just cap the frequency if the temperature would be too high to find
a suitable voltage. Fortunately the GPU has its own rail, so it doesn't
necessarily need to be handled the same way.

> > on that? This is basically the same as Qualcomm's "voltage corners" by
> > the way, just that the voltage is adjusted outside of the Linux kernel
> > by another processor when the temperature changes.
> 
> Ack to what Stephen said above. Adaptive voltage scaling, corners, body
> bias, SMPS modes/efficiency, etc are all just implementation details.
> 
> I don't think anyone is suggesting for drivers to take all of the above
> into account when setting voltage. I would imagine either a "nominal"
> voltage, a voltage "index" or a performance state to be passed from the
> driver into the genpd layer.
> 
> Peter would that work for you?
> 

A voltage index should do I think. The reason for a voltage index is that
we have at least one case, where the voltage depends on the mode of the
device. This is the case for the HDMI/DP output serializers (SORx). The
required voltage doesn't only depend on the pixel rate, but also on the
mode (DP or HDMI). One danger is that we must make sure all
drivers of devices sharing a rail, use this API to set their voltage
requirement. If not, weird failures will show up.

> > 
> > > 
> > > 2) Not every device with V/f requirements has its own powerdomain. On Tegra
> > >    for example we have 2 voltage rails: core and CPU. (and a 3rd one for GPU
> > >    since Tegra124). So all peripherals (except GPU) share the same voltage
> > >    rail and they are grouped in several domains, one of which cannot be
> > >    powergated. So genpd domains do not align with the V/f curves of the
> > >    peripherals themselves.
> > > 
> > 
> > I'm fairly certain this is true on most SoCs today. There is a main
> > powerdomain for non-CPU things, and then some sort of CPU powerdomain or
> > domains for CPU things. Each device in those domains needs to request a
> > certain performance state on the voltage domain they're in (the "core"
> > powerdomain in your example) and then that genpd will aggregate those
> > requests with a max operation to pick the highest state required from
> > all devices attached to the genpd for the voltage domain.
> > 
> > How does power gating or not power gating the domain matter for this?
> > 
> 
> I'll go out on a limb and suggest that nested genpd's take care of
> Peter's concern? In Peter's case there are power islands that can clamp
> power during idle. Some devices have these, some do not. For
> active/performance power management there are the scalable voltage
> rails.
> 
> I think that in this (very common) pattern the right thing to do is is
> have the performance genpds at the top level of the genpd hierarchy.
> These map onto the scalable voltage rails for DVFS.
> 
> Nested within these performance genpds/rails are the power islands used
> for power clamping during device idle.
> 
> Peter would that work for you?
> 

So the voltage genpd would then not have any on/off controls?

Peter.

> Best regards,
> Mike
