Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Peter De Schrijver <pdeschrijver@nvidia.com>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20180723082641.GJ1636@tbergstrom-lnx.Nvidia.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 grahamr@codeaurora.org, linux-clk <linux-clk@vger.kernel.org>,
 Linux PM <linux-pm@vger.kernel.org>,
 Mike Turquette <mturquette@baylibre.com>,
 Doug Anderson <dianders@chromium.org>, Taniya Das <tdas@codeaurora.org>,
 Rajendra Nayak <rnayak@codeaurora.org>,
 Amit Nischal <anischal@codeaurora.org>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Amit Kucheria <amit.kucheria@linaro.org>
References: <9439bd29e3ccd5424a8e9b464c8c7bd9@codeaurora.org>
 <20180704065522.p4qpfnpayeobaok3@vireshk-i7>
 <CAPDyKFo-Z=H2mJXm7mN0Mt=iRzOaEuJSXc2gdE4i5NEfZ_OM6A@mail.gmail.com>
 <153210674909.48062.14786835684020975508@swboyd.mtv.corp.google.com>
 <20180723082641.GJ1636@tbergstrom-lnx.Nvidia.com>
Message-ID: <153247347784.48062.15923823598346148594@swboyd.mtv.corp.google.com>
Subject: Re: [RFD] Voltage dependencies for clocks (DVFS)
Date: Tue, 24 Jul 2018 16:04:37 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Peter De Schrijver (2018-07-23 01:26:41)
> On Fri, Jul 20, 2018 at 10:12:29AM -0700, Stephen Boyd wrote:
> > =

> > For one thing, a driver should be able to figure out what the
> > performance state requirement is for a particular frequency. I'd like to
> > see an API that a driver can pass something like a (device, genpd, clk,
> > frequency) tuple and get back the performance state required for that
> > device's clk frequency within that genpd by querying OPP tables. If we
> > had this API, then SoC vendors could design OPP tables for their on-SoC
> > devices that describe the set of max frequencies a device can operate at
> > for a specific performance state and driver authors would be able to
> > query that information and manually set genpd performance states when
> > they change clk frequencies. In Qualcomm designs this would be their
> > "fmax" tables that map a max frequency to a voltage corner. If someone
> > wanted to fine tune that table and make it into a full frequency plan
> > OPP table for use by devfreq, then they could add more entries for all
> > the validated frequencies and voltage corners that are acceptable and
> > tested and this API would still work. We'll need this sort of table
> > regardless because we can't expect devices to search for an exact
> > frequency in an OPP table when they can support hundreds of different
> > frequencies, like in display or audio situations.
> > =

> =

> Various reasons why I think the driver is not the right place to handle
> the V/f relationship:
> =

> 1) The V/f relationship is temperature dependent. So the voltage may have
>    to be adjusted when the temperature changes. I don't think we should
>    make every driver handle this on its own.

This is AVS? Should be fine to plumb that into some sort of voltage
domain that gets temperature feedback and then adjusts the voltage based
on that? This is basically the same as Qualcomm's "voltage corners" by
the way, just that the voltage is adjusted outside of the Linux kernel
by another processor when the temperature changes.

> =

> 2) Not every device with V/f requirements has its own powerdomain. On Teg=
ra
>    for example we have 2 voltage rails: core and CPU. (and a 3rd one for =
GPU
>    since Tegra124). So all peripherals (except GPU) share the same voltage
>    rail and they are grouped in several domains, one of which cannot be
>    powergated. So genpd domains do not align with the V/f curves of the
>    peripherals themselves.
> =


I'm fairly certain this is true on most SoCs today. There is a main
powerdomain for non-CPU things, and then some sort of CPU powerdomain or
domains for CPU things. Each device in those domains needs to request a
certain performance state on the voltage domain they're in (the "core"
powerdomain in your example) and then that genpd will aggregate those
requests with a max operation to pick the highest state required from
all devices attached to the genpd for the voltage domain.

How does power gating or not power gating the domain matter for this?
