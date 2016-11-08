Return-Path: <rnayak@codeaurora.org>
Message-ID: <5821A331.5060405@codeaurora.org>
Date: Tue, 08 Nov 2016 15:34:33 +0530
From: Rajendra Nayak <rnayak@codeaurora.org>
MIME-Version: 1.0
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Stephen Boyd <sboyd@codeaurora.org>,
 Michael Turquette <mturquette@baylibre.com>,
 linux-clk <linux-clk@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] clk: Free struct clk allocated during clk_hw_register()
References: <1478593430-23102-1-git-send-email-rnayak@codeaurora.org> <CAMuHMdW6-oRJ4CKbUeXOixvKFOZ3vf8pGhCH87rOx1KuE8bdGQ@mail.gmail.com>
In-Reply-To: <CAMuHMdW6-oRJ4CKbUeXOixvKFOZ3vf8pGhCH87rOx1KuE8bdGQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>



On 11/08/2016 03:06 PM, Geert Uytterhoeven wrote:
> Hi Rajendra,
> 
> On Tue, Nov 8, 2016 at 9:23 AM, Rajendra Nayak <rnayak@codeaurora.org> wrote:
>> With clk_hw_register() API we hide the struct clk from the caller
>> and return an int error code instead, so the caller (clk provider)
>> is not expected to use hw->clk on return.
> 
> That's correct, in case of failure.

sorry, maybe the commit text needs to be reworded. I meant 'clk_hw_register() returns
an int (not a struct clk pointer), 0 on success or an error code in case of a failure.

> 
>> Free the memory, and mark hw->clk as NULL before returning.
>>
>> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
>> ---
>>  drivers/clk/clk.c | 10 +++++++++-
>>  1 file changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
>> index 0fb39fe..f81e4aa 100644
>> --- a/drivers/clk/clk.c
>> +++ b/drivers/clk/clk.c
>> @@ -2628,7 +2628,15 @@ struct clk *clk_register(struct device *dev, struct clk_hw *hw)
>>   */
>>  int clk_hw_register(struct device *dev, struct clk_hw *hw)
>>  {
>> -       return PTR_ERR_OR_ZERO(clk_register(dev, hw));
>> +       struct clk *c;
>> +
>> +       c = clk_register(dev, hw);
>> +       if (IS_ERR(c))
>> +               return PTR_ERR(c);
>> +
>> +       __clk_free_clk(c);
>> +       hw->clk = NULL;
> 
> This is the success path, not the failure path (on failure, clk_register()
> has already freed the struct clk).
> Why do you free the struct clk in case of success?
> 
> What am I missing?

so with 'per-user' clks, I thought we now have one struct clk per user, allocated
when the user does a clk_get() and freed with a clk_put(), so we shouldn't ideally
need one during clk registration?
The one allocated in clk_register() is for legacy users who need to get a struct clk *
back. For users of clk_hw_register() this should not be needed, no? 
 
> 
>> +       return 0;
>>  }
>>  EXPORT_SYMBOL_GPL(clk_hw_register);
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
> 

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation
