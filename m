Return-Path: <jy0922.shim@samsung.com>
Message-id: <55555176.3060703@samsung.com>
Date: Fri, 15 May 2015 10:52:54 +0900
From: Joonyoung Shim <jy0922.shim@samsung.com>
MIME-version: 1.0
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 mturquette@linaro.org, haojian.zhuang@gmail.com, james.hogan@imgtec.com
Subject: Re: [PATCH 1/2] clk: divider: don't set_rate with
 CLK_DIVIDER_READ_ONLY flag
References: <1428392806-14538-1-git-send-email-jy0922.shim@samsung.com>
 <20150512235910.GC14873@codeaurora.org>
In-reply-to: <20150512235910.GC14873@codeaurora.org>
Content-type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>

Hi Stephen,

On 05/13/2015 08:59 AM, Stephen Boyd wrote:
> On 04/07, Joonyoung Shim wrote:
>> Even if use CLK_DIVIDER_READ_ONLY flag, divider setting can be changed
>> by set_rate callback. Don't change divider setting from set_rate
>> callback of divider with CLK_DIVIDER_READ_ONLY flag.
>>
>> Signed-off-by: Joonyoung Shim <jy0922.shim@samsung.com>
>> ---
> 
> Is the rate actually changing? Or is it just a problem that we
> may be writing the register to the same value it already is?
> 

If rate and parant_rate are different, it can write the register to
different value. Even if the value is same but i think it's unnecessary
to re-write the register.

Thanks.
