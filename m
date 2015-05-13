Return-Path: <sboyd@codeaurora.org>
Message-ID: <5553A9C8.2070701@codeaurora.org>
Date: Wed, 13 May 2015 12:45:12 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
MIME-Version: 1.0
To: =?windows-1252?Q?Uwe_Kleine-K=F6nig?=
 <u.kleine-koenig@pengutronix.de>
CC: Sascha Hauer <s.hauer@pengutronix.de>,
 Mike Turquette <mturquette@linaro.org>,
 kernel@pengutronix.de, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: Automatic clock disabling on clk_put()
References: <20150511060129.GG6325@pengutronix.de> <55528B84.5050700@codeaurora.org> <20150513064550.GE28888@pengutronix.de>
In-Reply-To: <20150513064550.GE28888@pengutronix.de>
Content-Type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>

On 05/12/15 23:45, Uwe Kleine-König wrote:
>
>> that hard to call clk_disable_unprepare() on a clock at the end of an
>> error path? Maybe you could add a devm_clk_get_prepare_enable() that
>> does what you want and then call clk_disable_unprepare on the exit path?
> You mean clk_disable_unprepare is called in the same function that calls
> clk_put I assume such that you don't have to do anything in the exit
> path.
>

Yes that's what I mean.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
