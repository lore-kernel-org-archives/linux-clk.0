Return-Path: <andriy.shevchenko@linux.intel.com>
Message-ID: <1521451245.23017.50.camel@linux.intel.com>
Subject: Re: [PATCH v1 1/1] clk: Remove redundant selection of RATIONAL
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Stephen Boyd <sboyd@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@codeaurora.org>,
 linux-clk@vger.kernel.org
Date: Mon, 19 Mar 2018 11:20:45 +0200
In-Reply-To: <152124317641.242365.8789766611551244529@swboyd.mtv.corp.google.com>
References: <20180119174401.23051-1-andriy.shevchenko@linux.intel.com>
	 <152124317641.242365.8789766611551244529@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

On Fri, 2018-03-16 at 16:32 -0700, Stephen Boyd wrote:
> Quoting Andy Shevchenko (2018-01-19 09:44:01)
> > Since the commit
> > 
> >   0777591e715a ("clk: fractional-divider: switch to rational best
> > approximation")
> > 
> > enables rational best approximation to all common based clocks,
> > there is
> > no need to repeat the selection in each of them.
> > 
> > No functional changes intended.
> > 
> 
> I'd prefer we leave it alone. It would be better to push the basic clk
> types into Kconfig and then have platforms select the ones they want
> to
> use.

Fair enough.

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
