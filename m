Return-Path: <rnayak@codeaurora.org>
Message-ID: <581AF698.2030906@codeaurora.org>
Date: Thu, 03 Nov 2016 14:04:32 +0530
From: Rajendra Nayak <rnayak@codeaurora.org>
MIME-Version: 1.0
To: Stephen Boyd <sboyd@codeaurora.org>
CC: mturquette@baylibre.com, linux-clk@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 tdas@codeaurora.org
Subject: Re: [PATCH v3 10/11] clk: Add clk_hw_get_clk() helper API to be used
 by clk providers
References: <1475138152-859-1-git-send-email-rnayak@codeaurora.org> <1475138152-859-11-git-send-email-rnayak@codeaurora.org> <20161102222208.GT16026@codeaurora.org>
In-Reply-To: <20161102222208.GT16026@codeaurora.org>
Content-Type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>



On 11/03/2016 03:52 AM, Stephen Boyd wrote:
> On 09/29, Rajendra Nayak wrote:
>> Add a helper API that will allow clk providers to turn their clk_hw
>> structures into struct clk pointer.
>>
> 
> Did I suggest this?

I did this back when you suggested we store clk_hw's for all
clocks associated with a gdsc instead of extracting them from
the clients device tree node.

> 
>> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
>> ---
>>  drivers/clk/clk.c            | 6 ++++++
>>  include/linux/clk-provider.h | 1 +
>>  2 files changed, 7 insertions(+)
>>
>> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
>> index 820a939..a084132 100644
>> --- a/drivers/clk/clk.c
>> +++ b/drivers/clk/clk.c
>> @@ -186,6 +186,12 @@ const char *clk_hw_get_name(const struct clk_hw *hw)
>>  }
>>  EXPORT_SYMBOL_GPL(clk_hw_get_name);
>>  
>> +struct clk *clk_hw_get_clk(const struct clk_hw *hw)
>> +{
>> +	return hw->clk;
> 
> I'd prefer we actually went through all the work and actually
> allocated another clk structure here. We can add another string
> or two for the dev_id and con_id too for debug/accouting
> purposes.

I don't quite get the part of allocating another clk structure,
can you please elaborate?

> 
> The hw->clk is sort of a remnant of the clk_core introduction. I
> can't recall the exact plan (i.e. I should write it down
> somewhere once I do) but I think we want to get rid of hw->clk
> and have everyone use clk_hw_get_clk() instead. Then for
> traversals from the clk_hw pointer to a clk pointer are very
> clear.
> 

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation
