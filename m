Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from conssluserg004.nifty.com ([202.248.44.42]:29920 "EHLO
	conssluserg004-v.nifty.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1752018AbcAGLd4 (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Thu, 7 Jan 2016 06:33:56 -0500
Received: from mail-yk0-f177.google.com (mail-yk0-f177.google.com [209.85.160.177]) (authenticated)
	by conssluserg004-v.nifty.com with ESMTP id u07BXpR9031458
	for <linux-clk@vger.kernel.org>; Thu, 7 Jan 2016 20:33:52 +0900
Received: by mail-yk0-f177.google.com with SMTP id v14so243111124ykd.3
        for <linux-clk@vger.kernel.org>; Thu, 07 Jan 2016 03:33:52 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <568E419E.4080404@mleia.com>
References: <1452136568-478-1-git-send-email-vz@mleia.com>
	<1452136568-478-4-git-send-email-vz@mleia.com>
	<CAK7LNASpWdpmK4xKkOV1cbKxFckKV7bZHA=fNVDYhR2e4VZzYA@mail.gmail.com>
	<568E419E.4080404@mleia.com>
Date: Thu, 7 Jan 2016 20:33:51 +0900
Message-ID: <CAK7LNATiHJa8XwigMj6dWFauUC9TV-_Ypw-i_agn5hCD_6Yb4g@mail.gmail.com>
Subject: Re: [PATCH 3/3] clk: remove redundant clock parents lookup table allocations
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: Vladimir Zapolskiy <vz@mleia.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Vladimir,

2016-01-07 19:44 GMT+09:00 Vladimir Zapolskiy <vz@mleia.com>:
> Hi Masahiro,
>
> On 07.01.2016 11:00, Masahiro Yamada wrote:
>> Hi Vladimir,
>>
>>
>> 2016-01-07 12:16 GMT+09:00 Vladimir Zapolskiy <vz@mleia.com>:
>>> Since clock parents lookup table for clocks with multiple parent
>>> clocks is always allocated during clock registration, remove similar
>>> allocations from __clk_init_parent() and clk_fetch_parent_index().
>>>
>>> The change also corrects a pointer type of a single lookup table
>>> entry on calculation of the lookup table size.
>>>
>>> Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
>>> ---
>>>  drivers/clk/clk.c | 20 +++-----------------
>>>  1 file changed, 3 insertions(+), 17 deletions(-)
>>>
>>> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
>>> index 2fb0dae..f8872f9 100644
>>> --- a/drivers/clk/clk.c
>>> +++ b/drivers/clk/clk.c
>>> @@ -1067,13 +1067,6 @@ static int clk_fetch_parent_index(struct clk_core *core,
>>>  {
>>>         int i;
>>>
>>> -       if (!core->parents) {
>>> -               core->parents = kcalloc(core->num_parents,
>>> -                                       sizeof(struct clk *), GFP_KERNEL);
>>> -               if (!core->parents)
>>> -                       return -ENOMEM;
>>> -       }
>>> -
>>>         /*
>>>          * find index of new parent clock using cached parent ptrs,
>>>          * or if not yet cached, use string name comparison and cache
>>> @@ -1711,18 +1704,11 @@ static struct clk_core *__clk_init_parent(struct clk_core *core)
>>>         }
>>>
>>>         /*
>>> -        * Do our best to cache parent clocks in core->parents.  This prevents
>>> -        * unnecessary and expensive lookups.  We don't set core->parent here;
>>> -        * that is done by the calling function.
>>> +        * We don't set core->parent here; that is done by the calling function.
>>>          */
>>>
>>>         index = core->ops->get_parent(core->hw);
>>>
>>> -       if (!core->parents)
>>> -               core->parents =
>>> -                       kcalloc(core->num_parents, sizeof(struct clk *),
>>> -                                       GFP_KERNEL);
>>> -
>>>         ret = clk_core_get_parent_by_index(core, index);
>>>
>>>  out:
>>> @@ -2374,8 +2360,8 @@ static int __clk_init(struct device *dev, struct clk *clk_user)
>>>          * look-ups of clk's possible parents.
>>>          */
>>>         if (core->num_parents > 1) {
>>> -               core->parents = kcalloc(core->num_parents, sizeof(struct clk *),
>>> -                                       GFP_KERNEL);
>>> +               core->parents = kcalloc(core->num_parents,
>>> +                                       sizeof(struct clk_core *), GFP_KERNEL);
>>>                 if (!core->parents) {
>>>                         ret = -ENOMEM;
>>>                         goto out;
>>
>>
>> You are doing the similar thing as mine.
>>
>> See
>> https://patchwork.kernel.org/patch/7925571/
>
> Ok, I was not aware of your work, unfortunately.
>
>>
>> This series gives a big conflict with my clean-up series,
>> which Michael said he would apply after v4.5-rc1.
>>
>> See
>> http://www.serverphorums.com/read.php?12,1376630
>>
>>
>
> No problem, of course your work goes first.
>
> Obviously I have to review your changes more carefully, but do you
> have something similar to my 1/3? If no, then it is a regression.


No.

I solved the problem in a different way.
https://patchwork.kernel.org/patch/7925571/

In my way, core->parents is always allocated.
1/3 is not needed.

If I am wrong, please point out.


-- 
Best Regards
Masahiro Yamada
