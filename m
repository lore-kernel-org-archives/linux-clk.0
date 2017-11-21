Return-Path: <zhang.lyra@gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAfSe-s9qbRXBMZGbAuWXqhFr4Bt9LSv6=uvYCUW+UhdpcNKcg@mail.gmail.com>
References: <20171120033816.28414-1-chunyan.zhang@spreadtrum.com>
 <20171120191219.GD18379@codeaurora.org> <CAAfSe-s9qbRXBMZGbAuWXqhFr4Bt9LSv6=uvYCUW+UhdpcNKcg@mail.gmail.com>
From: Chunyan Zhang <zhang.lyra@gmail.com>
Date: Tue, 21 Nov 2017 17:21:21 +0800
Message-ID: <CAAfSe-sd=+7BrBab_gsOK5RTe2uDx0HztC3LM1k7VbRf7azz7A@mail.gmail.com>
Subject: Re: [PATCH] clk: fix a panic error caused by accessing NULL pointer
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Chunyan Zhang <chunyan.zhang@spreadtrum.com>,
	Michael Turquette <mturquette@baylibre.com>, linux-clk <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Cai Li <cai.li@spreadtrum.com>,
	Orson Zhai <orson.zhai@spreadtrum.com>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

On 21 November 2017 at 16:57, Chunyan Zhang <zhang.lyra@gmail.com> wrote:
> On 21 November 2017 at 03:12, Stephen Boyd <sboyd@codeaurora.org> wrote:
>> On 11/20, Chunyan Zhang wrote:
>>> From: Cai Li <cai.li@spreadtrum.com>
>>>
>>> In some cases the clock parent would be set NULL when doing re-parent,
>>> it will cause a NULL pointer accessing if clk_set trace event is enabled,
>>> since the trace event function would not check the input parameter.
>>>
>>> Signed-off-by: Cai Li <cai.li@spreadtrum.com>
>>> Signed-off-by: Chunyan Zhang <chunyan.zhang@spreadtrum.com>
>>
>> Fixes: tag?
>>
>>> ---
>>>  drivers/clk/clk.c | 9 ++++-----
>>>  1 file changed, 4 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
>>> index c8d83ac..64efaf0 100644
>>> --- a/drivers/clk/clk.c
>>> +++ b/drivers/clk/clk.c
>>> @@ -1242,13 +1242,12 @@ static int __clk_set_parent(struct clk_core *core, struct clk_core *parent,
>>>
>>>       old_parent = __clk_set_parent_before(core, parent);
>>>
>>> -     trace_clk_set_parent(core, parent);
>>> -
>>>       /* change clock input source */
>>> -     if (parent && core->ops->set_parent)
>>> +     if (parent && core->ops->set_parent) {
>>> +             trace_clk_set_parent(core, parent);
>>>               ret = core->ops->set_parent(core->hw, p_index);
>>> -
>>> -     trace_clk_set_parent_complete(core, parent);
>>> +             trace_clk_set_parent_complete(core, parent);
>>> +     }
>>
>> Is the problem that parent may be NULL and the tracepoint
>> dereferences it?
>
> Yes, I think that probably is uncommon usage though, it revealed that
> the tracepoint could be stronger :)

The reason we need to set the parent as NULL is to disable the clk for
the purpose of saving power.

>
>> Perhaps we need to update the tracepoint code
>> instead so that we always see that the tracepoint is called even
>> if we don't actually touch the hardware. Something like the patch
>> below instead.
>
> Ok, we will cook a new patch according to your comments.
>
> Thanks,
> Chunyan
>
>>
>> ---8<----
>> diff --git a/include/trace/events/clk.h b/include/trace/events/clk.h
>> index 758607226bfd..5a85ea2090c4 100644
>> --- a/include/trace/events/clk.h
>> +++ b/include/trace/events/clk.h
>> @@ -139,7 +139,7 @@ DECLARE_EVENT_CLASS(clk_parent,
>>
>>         TP_fast_assign(
>>                 __assign_str(name, core->name);
>> -               __assign_str(pname, parent->name);
>> +               __assign_str(pname, parent ? parent->name : NULL);
>>         ),
>>
>>         TP_printk("%s %s", __get_str(name), __get_str(pname))
>> --
>> Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
>> a Linux Foundation Collaborative Project
