Return-Path: <yamada.masahiro@socionext.com>
MIME-Version: 1.0
In-Reply-To: <20160202023922.GL4848@codeaurora.org>
References: <1451298191-30815-1-git-send-email-yamada.masahiro@socionext.com>
	<1451298191-30815-11-git-send-email-yamada.masahiro@socionext.com>
	<20160202005051.GO4848@codeaurora.org>
	<CAK7LNASGzvbGAOnMRBH6SuZOz9O_=r3B3MdqhhkxoWzCcn9gUw@mail.gmail.com>
	<20160202023922.GL4848@codeaurora.org>
Date: Tue, 2 Feb 2016 11:48:07 +0900
Message-ID: <CAK7LNAQb-y-j46O1v6iFRHUR9Dqjzi53-nAYsYAEKmPs_PFO0w@mail.gmail.com>
Subject: Re: [RESEND PATCH v2 10/16] clk: move checking .git_parent to __clk_core_init()
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

2016-02-02 11:39 GMT+09:00 Stephen Boyd <sboyd@codeaurora.org>:
> On 02/02, Masahiro Yamada wrote:
>> 2016-02-02 9:50 GMT+09:00 Stephen Boyd <sboyd@codeaurora.org>:
>> > On 12/28, Masahiro Yamada wrote:
>> >> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
>> >> index e6e10f5..4ad0a36 100644
>> >> --- a/drivers/clk/clk.c
>> >> +++ b/drivers/clk/clk.c
>> >> @@ -1677,13 +1677,6 @@ static struct clk_core *__clk_init_parent(struct clk_core *core)
>> >>               goto out;
>> >>       }
>> >>
>> >> -     if (!core->ops->get_parent) {
>> >> -             WARN(!core->ops->get_parent,
>> >> -                     "%s: multi-parent clocks must implement .get_parent\n",
>> >> -                     __func__);
>> >> -             goto out;
>> >> -     }
>> >> -
>> >>       /*
>> >>        * Do our best to cache parent clocks in core->parents.  This prevents
>> >>        * unnecessary and expensive lookups.  We don't set core->parent here;
>> >> @@ -2315,6 +2308,11 @@ static int __clk_core_init(struct clk_core *core)
>> >>               goto out;
>> >>       }
>> >>
>> >> +     if (core->num_parents > 1 && !core->ops->get_parent) {
>> >> +             pr_err("%s: %s must implement .get_parent as it has multi parents\n",
>> >> +                    __func__, core->name);
>> >> +     }
>> >> +
>> >
>> > This would seem to allow a case where we may deref a null
>> > get_parent op if it isn't set and we call __clk_init_parent().
>> > The next patch removes that case by restructuring
>> > __clk_init_parent(), so we should just combine these two patches
>> > together and that theoretical problem goes away.
>> >
>>
>> I think the case never happens.
>>
>> __clk_init_parent() is a static function that is only called from
>> __clk_core_init().
>> So, the null pointer for .get_parent() has been already checked before
>> __clk_init_parent().
>>
>
> Right, this patch moves the check to __clk_core_init(), and it
> will print an error and then keep going (because we lost the goto
> out part). Once we keep going in __clk_core_init() we'll call
> __clk_init_parent() and NULL pointer deref.
>

Ah, I missed that.

We need

   ret = -EINVAL;
   goto out;

here, I think.

Shall I send the v3 for 08/16?

Or, if it is too late, shall I send a fix-up patch?




-- 
Best Regards
Masahiro Yamada
