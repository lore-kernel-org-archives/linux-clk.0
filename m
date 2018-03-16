Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Sudeep Holla <sudeep.holla@arm.com>, linux-kernel@vger.kernel.org
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1510330017-32200-1-git-send-email-sudeep.holla@arm.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org
References: <1510330017-32200-1-git-send-email-sudeep.holla@arm.com>
Message-ID: <152123945267.242365.14442807869805498253@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH] clk: versatile: add min/max rate boundaries for vexpress osc
 clock
Date: Fri, 16 Mar 2018 15:30:52 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Sudeep Holla (2017-11-10 08:06:57)
> Clock framework has a provider API(clk_hw_set_rate_range) to set the
> min/max rate of a clock. Use the same to set the boundaries for the
> vexpress osc clock.
> =

> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@codeaurora.org>
> Cc: linux-clk@vger.kernel.org
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> ---

Applied to clk-next
