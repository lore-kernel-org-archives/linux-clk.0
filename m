Return-Path: <sboyd@codeaurora.org>
Date: Mon, 30 Jan 2017 10:55:51 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Russell King - ARM Linux <linux@armlinux.org.uk>,
	Guenter Roeck <linux@roeck-us.net>,
	Michael Turquette <mturquette@baylibre.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] clk: add more managed APIs
Message-ID: <20170130185551.GM8801@codeaurora.org>
References: <20170128184047.GA24957@dtor-ws>
 <20170128190309.GN27312@n2100.armlinux.org.uk>
 <20170128192207.GA38136@dtor-ws>
 <64ed0890-14f6-42ff-66b1-60f7b3d7d02f@roeck-us.net>
 <20170128233911.GO27312@n2100.armlinux.org.uk>
 <20170129180743.GA10917@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170129180743.GA10917@dtor-ws>
List-ID: <linux-clk.vger.kernel.org>

On 01/29, Dmitry Torokhov wrote:
> When converting a driver to managed resources it is desirable to be able to
> manage all resources in the same fashion. This change allows managing
> clocks in the same way we manage many other resources.

Can you please add 'managing clock prepared and enabled state in
the same way'?

The current wording makes it sound like we don't have
devm_clk_get() when we do.

> 
> This adds the following managed APIs:
> 
> - devm_clk_prepare()/devm_clk_unprepare();
> - devm_clk_prepare_enable()/devm_clk_disable_unprepare().

Wouldn't this be preceded by a devm_clk_get() call? Wouldn't it
be even shorter to have the APIs

  devm_clk_get_and_prepare()/devm_clk_unprepare_and_put()
  devm_clk_get_and_prepare_enable()/devm_clk_disable_unprepare_and_put()

instead?

Is there any other subsystem that has similar functionality?
Regulators? GPIOs? Resets? I'm just curious if those subsystems
also need similar changes.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
