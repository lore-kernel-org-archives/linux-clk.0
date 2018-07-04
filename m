Return-Path: <ulf.hansson@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20180704065522.p4qpfnpayeobaok3@vireshk-i7>
References: <9439bd29e3ccd5424a8e9b464c8c7bd9@codeaurora.org> <20180704065522.p4qpfnpayeobaok3@vireshk-i7>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 4 Jul 2018 14:50:40 +0200
Message-ID: <CAPDyKFo-Z=H2mJXm7mN0Mt=iRzOaEuJSXc2gdE4i5NEfZ_OM6A@mail.gmail.com>
Subject: Re: [RFD] Voltage dependencies for clocks (DVFS)
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: grahamr@codeaurora.org, linux-clk <linux-clk@vger.kernel.org>,
	Linux PM <linux-pm@vger.kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Mike Turquette <mturquette@baylibre.com>, Doug Anderson <dianders@chromium.org>,
	Taniya Das <tdas@codeaurora.org>, Rajendra Nayak <rnayak@codeaurora.org>,
	Amit Nischal <anischal@codeaurora.org>, Vincent Guittot <vincent.guittot@linaro.org>,
	Amit Kucheria <amit.kucheria@linaro.org>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

[...]

>> The third problem is that semantically using OPP for requesting
>> specific functional frequencies (i.e. for a  serial bus) is an abuse of that
>> framework.  It requires the clients to find the "performance level" that
>> matches the specific frequency they require, then request that performance
>> level - when what they really want is to "set rate" on the clock to a
>> specific, known, frequency.
>
> This is the prototype of that routine:
>
> int dev_pm_opp_set_rate(struct device *dev, unsigned long target_freq);
>
> All we need is the target frequency and not an OPP.
>
> Maybe we can solve the problems you raised with the OPP core like
> this:
>
> - On a call to dev_pm_opp_set_rate(), we check the currently cached
>   frequency value. If it is unknown or 0, we call clk_enable() as
>   well..
>
> - When the drivers want things to shut down, they call
>   dev_pm_opp_set_rate(dev, 0) and on this we drop regulator vote, etc,
>   and call clk_disable().
>
> Will that be acceptable to everyone ?

For a cross SoC driver, the device may not be hooked up to an OPP
table. Then it needs to manage the clock anyways. I guess we can do
that for those cases that needs it.

Another option is to use the ->runtime_suspend|resume() callbacks at
the genpd level. In principle when the device enters runtime suspend,
genpd can decide to drop the votes for the device (if some exist). At
runtime resume, genpd then should re-store the votes for the device it
had before it became runtime suspended (or if the vote became updated
in-between).

In that way, the driver only needs to call dev_pm_opp_set_rate() when
it calls clk_set_rate().

Kind regards
Uffe
