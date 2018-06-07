Return-Path: <shawn.lin@rock-chips.com>
Cc: shawn.lin@rock-chips.com, Heiko Stuebner <heiko@sntech.de>,
 linux-clk@vger.kernel.org, Elaine Zhang <zhangqing@rock-chips.com>
Subject: Re: [PATCH 1/2] clk: Add clk_set_rate_safe() API support
To: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>
References: <1524907018-195819-1-git-send-email-shawn.lin@rock-chips.com>
 <152792179514.225090.14160753405751043107@swboyd.mtv.corp.google.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
Message-ID: <1f0e27cd-1c73-4f25-feba-00079b010f07@rock-chips.com>
Date: Thu, 7 Jun 2018 10:11:05 +0800
MIME-Version: 1.0
In-Reply-To: <152792179514.225090.14160753405751043107@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
List-ID: <linux-clk.vger.kernel.org>

Hi Stephen,

On 2018/6/2 14:43, Stephen Boyd wrote:
> Quoting Shawn Lin (2018-04-28 02:16:57)
>> From: Elaine Zhang <zhangqing@rock-chips.com>
>>
>> Compared with clk_set_rate(), this API would maintain the clock rate
>> of its children to avoid exception if the new rate is higher than
>> the old rate.
>>
>> Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
>> Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
>> ---
> 
> There's no cover letter, and the length and quality of the commit
> message leaves me with more questions than answers. Please resend with a
> proper argument for this patch set.

Sure.

> 
> My first question is why can't we fix clk_set_rate() or
> clk_set_rate_range() APIs to do what you want?

Yep, I was thinking if there are any drivers/instances implicitly
set child's rate depending on seting a higher rate for its
parent?

But now I think if that happens, we need fixes for the
drivers/instances, as clk_set_rate*() didn't guarantee this. So we could
do the right constraint for clk_set_rate() or clk_set_rate_range().

Will update V2.

> 
> 
> 
> 
