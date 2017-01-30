Return-Path: <linux+mturquette=baylibre.com@armlinux.org.uk>
Date: Mon, 30 Jan 2017 22:25:35 +0000
From: Russell King - ARM Linux <linux@armlinux.org.uk>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Stephen Boyd <sboyd@codeaurora.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	linux-clk@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] clk: add more managed APIs
Message-ID: <20170130222534.GJ27312@n2100.armlinux.org.uk>
References: <20170128184047.GA24957@dtor-ws>
 <20170128190309.GN27312@n2100.armlinux.org.uk>
 <20170128192207.GA38136@dtor-ws>
 <64ed0890-14f6-42ff-66b1-60f7b3d7d02f@roeck-us.net>
 <20170128233911.GO27312@n2100.armlinux.org.uk>
 <20170129180743.GA10917@dtor-ws>
 <20170130185551.GM8801@codeaurora.org>
 <20170130192214.GC11199@roeck-us.net>
 <20170130214227.GI27312@n2100.armlinux.org.uk>
 <CAKdAkRREDjH4+qxs6AOHHmftPi4HFuDwi8=m4WQJdyhs5ApNPg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <CAKdAkRREDjH4+qxs6AOHHmftPi4HFuDwi8=m4WQJdyhs5ApNPg@mail.gmail.com>
Sender: Russell King - ARM Linux <linux@armlinux.org.uk>
List-ID: <linux-clk.vger.kernel.org>

On Mon, Jan 30, 2017 at 01:58:05PM -0800, Dmitry Torokhov wrote:
> FWIW I do not think that kitchen sink calls, like
> "devm_clk_get_prepare_set_rate_enable" are helpful. Resource
> acquisition and use of said resource are logically separate.

That alone is an argument against devm_clk_get_prepare_enable() in
so far that drivers should really get all their resources before
they start to enable anything.

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
