Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20180214154800.55292-1-andriy.shevchenko@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20180214154800.55292-1-andriy.shevchenko@linux.intel.com>
Message-ID: <152148202777.242365.14075999608757518004@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH v1] clk: Re-use DEFINE_SHOW_ATTRIBUTE() macro
Date: Mon, 19 Mar 2018 10:53:47 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Andy Shevchenko (2018-02-14 07:48:00)
> ...instead of open coding file operations followed by custom ->open()
> callbacks per each attribute.
> =

> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---

Applied to clk-next
