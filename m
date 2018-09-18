Return-Path: <khilman@baylibre.com>
Return-Path: <khilman@baylibre.com>
From: Kevin Hilman <khilman@baylibre.com>
To: grahamr@codeaurora.org
Cc: Ulf Hansson <ulf.hansson@linaro.org>,  Peter De Schrijver <pdeschrijver@nvidia.com>,  Michael Turquette <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Viresh Kumar <viresh.kumar@linaro.org>,  linux-clk <linux-clk@vger.kernel.org>,  Linux PM <linux-pm@vger.kernel.org>,  Doug Anderson <dianders@chromium.org>,  Taniya Das <tdas@codeaurora.org>,  Rajendra Nayak <rnayak@codeaurora.org>,  Amit Nischal <anischal@codeaurora.org>,  Vincent Guittot <vincent.guittot@linaro.org>,  Amit Kucheria <amit.kucheria@linaro.org>,  linux-clk-owner@vger.kernel.org
Subject: Re: [RFD] Voltage dependencies for clocks (DVFS)
References: <9439bd29e3ccd5424a8e9b464c8c7bd9@codeaurora.org>
	<20180704065522.p4qpfnpayeobaok3@vireshk-i7>
	<CAPDyKFo-Z=H2mJXm7mN0Mt=iRzOaEuJSXc2gdE4i5NEfZ_OM6A@mail.gmail.com>
	<153210674909.48062.14786835684020975508@swboyd.mtv.corp.google.com>
	<20180723082641.GJ1636@tbergstrom-lnx.Nvidia.com>
	<153247347784.48062.15923823598346148594@swboyd.mtv.corp.google.com>
	<20180725054400.96956.13278@harbor.lan>
	<20180725112702.GN1636@tbergstrom-lnx.Nvidia.com>
	<CAPDyKFqHNOc-KHcA-LGpyScZ54rsa-FWgJihStgW6sPmXgw07A@mail.gmail.com>
	<83d6a10252e7238f326e378957f2ff70@codeaurora.org>
Date: Tue, 18 Sep 2018 10:25:03 -0700
In-Reply-To: <83d6a10252e7238f326e378957f2ff70@codeaurora.org>
	(grahamr@codeaurora.org's message of "Tue, 31 Jul 2018 13:02:45
	-0700")
Message-ID: <7htvmmsopc.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

[ sorry, a little late to the party ]

[...]

> Would there be some way to prevent consumers from directly calling
> clk_set_rate or clk_enable and force them to go via another framework
> for these calls?  It would at least prevent people from using the
> "wrong" interface and bypassing voltage requirements.  That of course
> means having to mirror any of the clk APIs that update clock state
> into genpd/opp, which Stephen finds distasteful (and I agree).

Chiming in late to this thread with a a bit of historical perspecitve
(and over simplification): doing exactly this was part of the goal of of
genpd in the first place.

Before genpd, it used to be the case where lots of drivers only used the
clk API for idle power management (clock gating).  Essentially a bunch
of clk_enable/disable calls based on activity.  This didn't scale well
for lots of reasons, but a primary one was that the same IP could be
integrated differnetly on differnent SoCs, thus have different clocks
for gating (or no clock gating.)

With genpd, we could remove all of the clock-specific stuff from
consumers and replace with a more generic pm_runtime calls, putting the
intelligence, such as SoC integration knowledge and some goverors around
whether or not to *actually* gate clocks, into the genpd
callbacks/governors, which, being pluggable, could be highly SoC
specific.

IMO, at a high level, in this thread, we're having exactly the same
conversation again, with the difference being we're talking about
active/performace states and not idle states.

While active states are definitely more complex, and have more
dependencies, I don't see why the general approach on of the solution
should not be the same as it was for idle management.

Basically, I'm agreeing with the general direction this thread seems to
be going that using the new active/performance features of genpd, and
having genpd callbacks/goverors that Know All The Things seems like the
obvious direction to go.

However, the hard part remains, and that is defining the right consumer
layer to give all the hints/requests so that the super-smart genpd
governors can do the right thing.

Kevin
