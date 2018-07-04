Return-Path: <viresh.kumar@linaro.org>
Return-Path: <viresh.kumar@linaro.org>
Date: Wed, 4 Jul 2018 12:25:22 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: grahamr@codeaurora.org
Cc: linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, sboyd@kernel.org,
	mturquette@baylibre.com, dianders@chromium.org,
	ulf.hansson@linaro.org, Taniya Das <tdas@codeaurora.org>,
	Rajendra Nayak <rnayak@codeaurora.org>,
	Amit Nischal <anischal@codeaurora.org>, vincent.guittot@linaro.org,
	amit.kucheria@linaro.org
Subject: Re: [RFD] Voltage dependencies for clocks (DVFS)
Message-ID: <20180704065522.p4qpfnpayeobaok3@vireshk-i7>
References: <9439bd29e3ccd5424a8e9b464c8c7bd9@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <9439bd29e3ccd5424a8e9b464c8c7bd9@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On 18-06-18, 13:44, grahamr@codeaurora.org wrote:
> The second concern above is the more challenging.  A proposal to use OPP to
> manage core DVFS has been made, but suffers from three major problems:

A bit of history first on how things evolved. The OPP core was
initially designed to be a data provider, which can be used by other
framework/drivers like cpufreq, etc.

Sometime back we realized that we can get rid of some code that is
duplicated across drivers but is essentially doing the same thing,
programming clock and regulators. We looked at the best place to put
that functionality and OPP core was the place we chose.

> first, it requires clients to use OPP for setting their rate, but the clock
> framework for other control (i.e. enable or disable). Not only is this
> confusing and (I would claim) ugly, it would also be very easy for clients
> to accidentally call clk_set_rate directly instead of going via OPP,
> resulting in invalid DVFS operating points.

I agree to this problem. It would be more correct and convenient to
have things controlled by a single entity.

> The second problem is that OPP
> does not allow for removing a voltage vote entirely when the clock is
> disabled - which is a fundamental requirement for the design to be power
> optimal.

This should be done by the entity which takes care of
enabling/disabling the resources and its the drivers for now. So yeah
it is the same problem as the first one I would say.

> The third problem is that semantically using OPP for requesting
> specific functional frequencies (i.e. for a  serial bus) is an abuse of that
> framework.  It requires the clients to find the "performance level" that
> matches the specific frequency they require, then request that performance
> level - when what they really want is to "set rate" on the clock to a
> specific, known, frequency.

This is the prototype of that routine:

int dev_pm_opp_set_rate(struct device *dev, unsigned long target_freq);

All we need is the target frequency and not an OPP.

Maybe we can solve the problems you raised with the OPP core like
this:

- On a call to dev_pm_opp_set_rate(), we check the currently cached
  frequency value. If it is unknown or 0, we call clk_enable() as
  well..

- When the drivers want things to shut down, they call
  dev_pm_opp_set_rate(dev, 0) and on this we drop regulator vote, etc,
  and call clk_disable().

Will that be acceptable to everyone ?

-- 
viresh
