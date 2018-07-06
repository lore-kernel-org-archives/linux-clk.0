Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Marek Vasut <marek.vasut@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Steve Longerbeam <slongerbeam@gmail.com>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1527818357-8154-1-git-send-email-steve_longerbeam@mentor.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Steve Longerbeam <steve_longerbeam@mentor.com>
References: <1527818357-8154-1-git-send-email-steve_longerbeam@mentor.com>
Message-ID: <153090140728.143105.7720351459587498082@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH] clk: vc5: Avoid divide by zero when rounding or setting rates
Date: Fri, 06 Jul 2018 11:23:27 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Steve Longerbeam (2018-05-31 18:59:17)
> Add checks in the .round_rate and .set_rate ops for zero requested
> rate or zero parent rate. If either are zero in .round_rate, just
> return zero. If either are zero in .set_rate, return -EINVAL.

Are you seeing problems when the clk is unparented and we're trying to
recalculate the rate or change rates, and thus the parent frequency
looks like 0? Should this get a Fixes: tag so that it goes back to
stable kernels?
