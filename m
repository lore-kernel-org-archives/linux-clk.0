Return-Path: <vz@mleia.com>
Message-ID: <568E419E.4080404@mleia.com>
Date: Thu, 07 Jan 2016 12:44:46 +0200
From: Vladimir Zapolskiy <vz@mleia.com>
MIME-Version: 1.0
To: Masahiro Yamada <yamada.masahiro@socionext.com>
CC: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH 3/3] clk: remove redundant clock parents lookup table
 allocations
References: <1452136568-478-1-git-send-email-vz@mleia.com>	<1452136568-478-4-git-send-email-vz@mleia.com> <CAK7LNASpWdpmK4xKkOV1cbKxFckKV7bZHA=fNVDYhR2e4VZzYA@mail.gmail.com>
In-Reply-To: <CAK7LNASpWdpmK4xKkOV1cbKxFckKV7bZHA=fNVDYhR2e4VZzYA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

Hi Masahiro,

On 07.01.2016 11:00, Masahiro Yamada wrote:
> Hi Vladimir,
> 
> 
> 2016-01-07 12:16 GMT+09:00 Vladimir Zapolskiy <vz@mleia.com>:
>> Since clock parents lookup table for clocks with multiple parent
>> clocks is always allocated during clock registration, remove similar
>> allocations from __clk_init_parent() and clk_fetch_parent_index().
>>
>> The change also corrects a pointer type of a single lookup table
>> entry on calculation of the lookup table size.
>>
>> Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
>> ---
>>  drivers/clk/clk.c | 20 +++-----------------
>>  1 file changed, 3 insertions(+), 17 deletions(-)
>>
>> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
>> index 2fb0dae..f8872f9 100644
>> --- a/drivers/clk/clk.c
>> +++ b/drivers/clk/clk.c
>> @@ -1067,13 +1067,6 @@ static int clk_fetch_parent_index(struct clk_core *core,
>>  {
>>         int i;
>>
>> -       if (!core->parents) {
>> -               core->parents = kcalloc(core->num_parents,
>> -                                       sizeof(struct clk *), GFP_KERNEL);
>> -               if (!core->parents)
>> -                       return -ENOMEM;
>> -       }
>> -
>>         /*
>>          * find index of new parent clock using cached parent ptrs,
>>          * or if not yet cached, use string name comparison and cache
>> @@ -1711,18 +1704,11 @@ static struct clk_core *__clk_init_parent(struct clk_core *core)
>>         }
>>
>>         /*
>> -        * Do our best to cache parent clocks in core->parents.  This prevents
>> -        * unnecessary and expensive lookups.  We don't set core->parent here;
>> -        * that is done by the calling function.
>> +        * We don't set core->parent here; that is done by the calling function.
>>          */
>>
>>         index = core->ops->get_parent(core->hw);
>>
>> -       if (!core->parents)
>> -               core->parents =
>> -                       kcalloc(core->num_parents, sizeof(struct clk *),
>> -                                       GFP_KERNEL);
>> -
>>         ret = clk_core_get_parent_by_index(core, index);
>>
>>  out:
>> @@ -2374,8 +2360,8 @@ static int __clk_init(struct device *dev, struct clk *clk_user)
>>          * look-ups of clk's possible parents.
>>          */
>>         if (core->num_parents > 1) {
>> -               core->parents = kcalloc(core->num_parents, sizeof(struct clk *),
>> -                                       GFP_KERNEL);
>> +               core->parents = kcalloc(core->num_parents,
>> +                                       sizeof(struct clk_core *), GFP_KERNEL);
>>                 if (!core->parents) {
>>                         ret = -ENOMEM;
>>                         goto out;
> 
> 
> You are doing the similar thing as mine.
> 
> See
> https://patchwork.kernel.org/patch/7925571/

Ok, I was not aware of your work, unfortunately.

> 
> This series gives a big conflict with my clean-up series,
> which Michael said he would apply after v4.5-rc1.
> 
> See
> http://www.serverphorums.com/read.php?12,1376630
> 
> 

No problem, of course your work goes first.

Obviously I have to review your changes more carefully, but do you
have something similar to my 1/3? If no, then it is a regression.

---
With best wishes,
Vladimir
