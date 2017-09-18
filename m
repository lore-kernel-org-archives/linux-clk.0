Return-Path: <andriy.shevchenko@linux.intel.com>
Message-ID: <1505721917.25945.275.camel@linux.intel.com>
Subject: Re: [PATCH v3] clk: x86: Do not gate clocks enabled by the firmware
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Carlo
 Caione <carlo@caione.org>, alan@linux.intel.com
Cc: Michael Turquette <mturquette@baylibre.com>, "open list:COMMON CLK
 FRAMEWORK" <linux-clk@vger.kernel.org>, Darren Hart <dvhart@infradead.org>,
 Stephen Boyd <sboyd@codeaurora.org>, Linux Upstreaming Team
 <linux@endlessm.com>, Enric Balletbo Serra <eballetbo@gmail.com>, Carlo
 Caione <carlo@endlessm.com>
Date: Mon, 18 Sep 2017 11:05:17 +0300
In-Reply-To: <58ef7321-a16d-8974-6a37-db473b6bf48e@linux.intel.com>
References: <20170714082356.28117-1-carlo@caione.org>
	 <CAOQ7t2beu8CyHM1qR+DDt-BQXmFHoyJe8q_56qhkkYLM_o1upQ@mail.gmail.com>
	 <ac99f461-798b-e245-232e-5e76c2de93b0@linux.intel.com>
	 <58ef7321-a16d-8974-6a37-db473b6bf48e@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

On Thu, 2017-09-07 at 16:51 -0500, Pierre-Louis Bossart wrote:
> 
> 

> > 
> > Looks like the same code that was initially used as a reference for 
> > support of PMC clocks in the clock framework, so now we have 2
> > drivers 
> > programming the same PMC hardware, not so good. We'd probably have
> > to 
> > move the atomisp driver to move to clk_get/prepare/enable instead
> > of 
> > the old vlv2_clck_get?
> 
> See attached an untested change to show the idea on moving to the clk 
> API and get feedback (I am not a camera guy, just trying to help - 
> compile-tested/checkpatch only).
> This code *should* enable the same functionality using existing hooks
> in 
> the kernel (and handle the BYT/CHT clocking difference as a bonus).
> I am sure Andy will have plenty of comments :-)

I have one comment: nice clean up!

AtomISP is a *horrible* mess.

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
