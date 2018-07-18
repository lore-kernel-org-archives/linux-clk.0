Return-Path: <slongerbeam@gmail.com>
Return-Path: <slongerbeam@gmail.com>
Subject: Re: [PATCH] clk: vc5: Avoid divide by zero when rounding or setting
 rates
To: Stephen Boyd <sboyd@kernel.org>, Marek Vasut <marek.vasut@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Steve Longerbeam <steve_longerbeam@mentor.com>
References: <1527818357-8154-1-git-send-email-steve_longerbeam@mentor.com>
 <153090140728.143105.7720351459587498082@swboyd.mtv.corp.google.com>
From: Steve Longerbeam <slongerbeam@gmail.com>
Message-ID: <9b8f68f6-dd88-cc1a-6f13-b4d2fedadead@gmail.com>
Date: Wed, 18 Jul 2018 10:56:51 -0700
MIME-Version: 1.0
In-Reply-To: <153090140728.143105.7720351459587498082@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
List-ID: <linux-clk.vger.kernel.org>



On 07/06/2018 11:23 AM, Stephen Boyd wrote:
> Quoting Steve Longerbeam (2018-05-31 18:59:17)
>> Add checks in the .round_rate and .set_rate ops for zero requested
>> rate or zero parent rate. If either are zero in .round_rate, just
>> return zero. If either are zero in .set_rate, return -EINVAL.
> Are you seeing problems when the clk is unparented and we're trying to
> recalculate the rate or change rates, and thus the parent frequency
> looks like 0?

The problem appeared when suspending the rcar-du driver.
The kernel tested is a Renesas BSP release (3.6.2), and in the
version of the rcar-du driver from that release, the driver calls
clk_set_rate() with a rate of zero in its suspend PM op. This is
fixed in mainline kernel. So the divide-by-zero in vc5 clock driver
probably will not show up in mainline.

>   Should this get a Fixes: tag so that it goes back to
> stable kernels?
>

Zero rates are not checked beginning with the initial commit
3e1aec4e2c ("clk: vc5: Add support for IDT VersaClock 5P49V5923 and 
5P49V5933").
so that would have to be the Fixes: tag.

Steve
