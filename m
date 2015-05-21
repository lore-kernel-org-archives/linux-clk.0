Return-Path: <sboyd@codeaurora.org>
Message-ID: <555E2992.6080605@codeaurora.org>
Date: Thu, 21 May 2015 11:53:06 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
MIME-Version: 1.0
To: Max Filippov <jcmvbkbc@gmail.com>
CC: Axel Lin <axel.lin@ingics.com>,
 Mike Turquette <mturquette@linaro.org>,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: cdce706: Add missing of_clk_del_provider call in
 cdce706_remove
References: <1432218373.27793.0.camel@ingics.com>	<20150521181435.GA21195@codeaurora.org> <CAMo8Bf+C1J6nBh-K4VXn=tzvOGhW1s=CgZNfMV+GSi--Fjh2nA@mail.gmail.com>
In-Reply-To: <CAMo8Bf+C1J6nBh-K4VXn=tzvOGhW1s=CgZNfMV+GSi--Fjh2nA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

On 05/21/15 11:35, Max Filippov wrote:
> On Thu, May 21, 2015 at 9:14 PM, Stephen Boyd <sboyd@codeaurora.org> wrote:
>> On 05/21, Axel Lin wrote:
>>> Remove a previously registered clock provider when unload the module.
>>>
>>> Signed-off-by: Axel Lin <axel.lin@ingics.com>
>>> ---
>> What about all the clocks that are registered? Don't those need
>> to be unregistered as well?
> They're registered with devm_clk_register, should be managed automatically.
>

Ah good. Applied.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
