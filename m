Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from lucky1.263xmail.com ([211.157.147.134]:37188 "EHLO
        lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751375AbeEQCcm (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 16 May 2018 22:32:42 -0400
Cc: Michael Turquette <mturquette@baylibre.com>,
        shawn.lin@rock-chips.com, linux-rockchip@lists.infradead.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: add clock panic dump in tree-view
To: Stephen Boyd <sboyd@kernel.org>
References: <1525942205-111855-1-git-send-email-shawn.lin@rock-chips.com>
 <152645814090.210890.10037636681887493249@swboyd.mtv.corp.google.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
Message-ID: <25a9c183-af5b-3310-521f-caaa5810c8e8@rock-chips.com>
Date: Thu, 17 May 2018 10:32:50 +0800
MIME-Version: 1.0
In-Reply-To: <152645814090.210890.10037636681887493249@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Stephen,

On 2018/5/16 16:09, Stephen Boyd wrote:
> Quoting Shawn Lin (2018-05-10 01:50:05)
>> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
>> index 3487be7..7bbdb6f 100644
>> --- a/Documentation/admin-guide/kernel-parameters.txt
>> +++ b/Documentation/admin-guide/kernel-parameters.txt
>> @@ -519,6 +519,9 @@
>>                          debug and development, but should not be needed on a
>>                          platform with proper driver support.  For more
>>                          information, see Documentation/clk.txt.
>> +       clk_panic_dump
>> +                       [CLK]
>> +                       Dump the whole clock tree-view upon panic.
> 
> Typically when the system panics it's because something has gone wrong.
> When a clk has gone wrong, typically the system hangs or crashes hard
> and printing out panic info just doesn't happen.
> 
> I'm not sure why clks are so special here that we need to dump the
> information about the clk tree at the point of a panic. Is this more of
> a debug patch to dump out clk tree info by calling panic() in certain
> places near where you get odd system hangs?

Yes, it's a debug patch when system in a odd hangds/hard locked. If it
crashes seriously, anything wrt. panic info is unusable, but if the
system still has a chance to dump panic info, for instance stack trace,
it would also be able to dump the clk tree.

Btw, I should marked this patch as RFC but forgot it. So if this patch
is acceptable from your point, if I address the your comment about the
code?

> 
>>   
>>          clock=          [BUGS=X86-32, HW] gettimeofday clocksource override.
>>                          [Deprecated]
>> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
>> index 9ae92aa..adb5537 100644
>> --- a/drivers/clk/clk.c
>> +++ b/drivers/clk/clk.c
>> @@ -2802,6 +2802,73 @@ static inline void clk_debug_unregister(struct clk_core *core)
>>   }
>>   #endif
>>   
>> +static bool clk_pdump_enable;
>> +static int __init clk_pdump_setup(char *__unused)
>> +{
>> +       clk_pdump_enable  = true;
>> +       return 1;
>> +}
>> +__setup("clk_panic_dump", clk_pdump_setup);
>> +
>> +static void clk_pdump_show_one(struct clk_core *c, int level)
>> +{
>> +       if (!c)
>> +               return;
>> +
>> +       pr_err("%*s%-*s %11d %12d %11lu %10lu %-3d\n",
>> +               level * 3 + 1, "", 30 - level * 3, c->name,
>> +               c->enable_count, c->prepare_count, clk_core_get_rate(c),
>> +               clk_core_get_accuracy(c), clk_core_get_phase(c));
>> +}
>> +
>> +static void clk_pdump_show_subtree(struct clk_core *c, int level)
>> +{
>> +       struct clk_core *child;
>> +
>> +       if (!c)
>> +               return;
>> +
>> +       clk_pdump_show_one(c, level);
>> +
>> +       hlist_for_each_entry(child, &c->children, child_node)
>> +               clk_pdump_show_subtree(child, level + 1);
>> +}
>> +
>> +static int clk_panic_dump(struct notifier_block *this, unsigned long ev,
>> +                         void *ptr)
>> +{
>> +       struct clk_core *c;
>> +
>> +       if (!clk_pdump_enable)
>> +               return 0;
> 
> Why register the notifier in late init if the commandline doesn't have
> the parameter set?
> 

Ok, will fix.

>> +
>> +       pr_err("clock panic dump:\n");
>> +       pr_err("   clock                         enable_cnt  prepare_cnt        rate   accuracy   phase\n");
>> +       pr_err("----------------------------------------------------------------------------------------\n");
>> +
>> +       clk_prepare_lock();
> 
> Why are we taking locks in the panic path?

ok, it's unnecessary in the special path indeed.

> 
>> +
>> +       hlist_for_each_entry(c, &clk_root_list, child_node)
>> +               clk_pdump_show_subtree(c, 0);
>> +       hlist_for_each_entry(c, &clk_orphan_list, child_node)
>> +               clk_pdump_show_subtree(c, 0);
>> +
>> +       clk_prepare_unlock();
>> +
>> +       return 0;
>> +}
>> +
>> +static struct notifier_block clk_pdump_block = {
>> +       .notifier_call = clk_panic_dump,
>> +};
>> +
>> +static int clk_register_pdump(void)
>> +{
>> +       atomic_notifier_chain_register(&panic_notifier_list, &clk_pdump_block);
>> +       return 0;
>> +}
>> +late_initcall_sync(clk_register_pdump);
> 
> Why sync?

Oh, sync is no needed.

> 
> 
> 
> 

