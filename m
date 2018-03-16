Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20180119174401.23051-1-andriy.shevchenko@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20180119174401.23051-1-andriy.shevchenko@linux.intel.com>
Message-ID: <152124317641.242365.8789766611551244529@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH v1 1/1] clk: Remove redundant selection of RATIONAL
Date: Fri, 16 Mar 2018 16:32:56 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Andy Shevchenko (2018-01-19 09:44:01)
> Since the commit
> =

>   0777591e715a ("clk: fractional-divider: switch to rational best approxi=
mation")
> =

> enables rational best approximation to all common based clocks, there is
> no need to repeat the selection in each of them.
> =

> No functional changes intended.
> =


I'd prefer we leave it alone. It would be better to push the basic clk
types into Kconfig and then have platforms select the ones they want to
use.
