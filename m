Return-Path: <linux-kernel-owner@vger.kernel.org>
Message-ID: <55A7F646.1070000@codeaurora.org>
Date: Thu, 16 Jul 2015 11:21:58 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
MIME-Version: 1.0
To: Daniel Lezcano <daniel.lezcano@linaro.org>
CC: Mike Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH 4/7] clocksource: cadence_ttc: Remove clk-provider.h include
References: <1436569409-27964-1-git-send-email-sboyd@codeaurora.org> <1436569409-27964-5-git-send-email-sboyd@codeaurora.org> <55A7908A.2080306@linaro.org>
In-Reply-To: <55A7908A.2080306@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 07/16/2015 04:07 AM, Daniel Lezcano wrote:
> On 07/11/2015 01:03 AM, Stephen Boyd wrote:
>> This file doesn't use the clk provider APIs. Remove the include.
>>
>> Cc: Michal Simek <michal.simek@xilinx.com>
>> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
>> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
>> ---
>>
>> Please ack if you want this to go through clk-tree, otherwise
>> it's ok to take it through the clocksource side.
>
> This patchset touches different parts, so I guess it makes sense I 
> take this one through my tree. But if Mike is willing to take it I am 
> ok with that.
>

I'm willing to take it through clk-tree with your ack. Or you can take 
it directly. It's not strictly necessary for the larger series.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

