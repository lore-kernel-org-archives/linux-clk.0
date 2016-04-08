Return-Path: <jun.nie@linaro.org>
MIME-Version: 1.0
In-Reply-To: <5706F7F7.3030205@codeaurora.org>
References: <1460020558-5152-1-git-send-email-jun.nie@linaro.org>
	<5706F7F7.3030205@codeaurora.org>
Date: Fri, 8 Apr 2016 08:46:39 +0800
Message-ID: <CABymUCMLZ+UcH-Vo1i_Zj+N-r-uVeYPvnBLkJzyp1oZRRUVwjQ@mail.gmail.com>
Subject: Re: [PATCH] clk: disable unused clk if enable_count == 0
From: Jun Nie <jun.nie@linaro.org>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	Shawn Guo <shawn.guo@linaro.org>, Jason Liu <jason.liu@linaro.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

2016-04-08 8:14 GMT+08:00 Stephen Boyd <sboyd@codeaurora.org>:
> On 04/07/2016 02:15 AM, Jun Nie wrote:
>> If .is_enabled callback is not implemented, clk_core_is_enabled
>> will take software enable_count as enable status. If enable_count
>> is zero, .disable will not be called as software assume clock
>> is not enabled though clock may be booted with  free running state.
>> Disable the clock in this situation.
>>
>> Signed-off-by: Jun Nie <jun.nie@linaro.org>
>> ---
>
> Why not implement the is_enabled callback then?

The is_enabled callback is not mandatory according to sanity check
code, so there is risk that some clock is not gated even we have
called clk_disable_unused_subtree. If is_enabled callback is mandatory
when CLK_IGNORE_UNUSED is not set, Adding a sanity check will fill
this gap.

Jun

>
> --
> Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
> a Linux Foundation Collaborative Project
>
