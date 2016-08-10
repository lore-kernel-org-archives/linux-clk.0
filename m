Return-Path: <yamada.masahiro@socionext.com>
MIME-Version: 1.0
In-Reply-To: <20160808233711.GA2996@codeaurora.org>
References: <CAK7LNAQ5uRoSEEuKys9Gs-2HFAJCbmnFDjxajWfK9ng_dtZ8yw@mail.gmail.com>
 <20160804212553.GB15690@codeaurora.org> <CAK7LNAQfwh3Z_=VWHvDi6EXFtVLuRMFVYzKMq8qCaZ30jfCq8g@mail.gmail.com>
 <20160808233711.GA2996@codeaurora.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 10 Aug 2016 16:59:47 +0900
Message-ID: <CAK7LNAScz7bJABbOgUuvg9J-ORaiLEfpwA3yMP+bZbLgB+S3uQ@mail.gmail.com>
Subject: Re: of_clk_add_(hw_)providers multipule times for one node?
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Rob Herring <robh@kernel.org>, linux-clk <linux-clk@vger.kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi Stephen,



2016-08-09 8:37 GMT+09:00 Stephen Boyd <sboyd@codeaurora.org>:
> On 08/08, Masahiro Yamada wrote:
>> Hi Stephen,
>>
>>
>> 2016-08-05 6:25 GMT+09:00 Stephen Boyd <sboyd@codeaurora.org>:
>> > +Rob in case he has any insight
>> >
>> > On 07/09, Masahiro Yamada wrote:
>> >> Hi.
>> >>
>> >> I think the current code allows to add
>> >> clk_providers multiple times against one DT node.
>> >>
>> >> Are there cases that really need to do so?
>> >
>> > If we have clk drivers that have a device driver structure and
>> > also use CLK_OF_DECLARE then we could get into a situation where
>> > they register two providers for the same device node. I can't
>> > think of any other situation where this would happen though.
>>
>>
>> What is the benefit for splitting one clock device
>> into CLK_OF_DECLARE() and a platform_driver?
>>
>>
>> If we go this way, I think we need to fix the current code.
>
> Sure. Do we have anyone registering two providers for the same
> node? I'm trying to weigh the urgency of this.
>
>>
>> of_clk_add_provider() calls of_clk_del_provider()
>> in its failure path.
>>
>> Notice of_clk_del_provider() unregister
>> all the providers associated with the device node.
>
> Where is that? I see a break statement in the while loop after
> the first matching np is found.

Ah, I missed the "break".

So, this works *almost* well.

I mean *almost* because the of_clk_mutex is released
between of_clk_add_hw_provider() and of_clk_del_provider().

What if two providers are added concurrently.
I know it never happens in use-cases we assume, though.



>>
>> So, if of_clk_add_provider() fails to register a platform driver,
>> it may unregister another provider added by OF_CLK_DECLARE().
>
> I suppose if we loop over the list in the incorrect order we
> would unregister the wrong one.

Right.

Here, the last added will be first deleted.


>>
>> Some platform drivers call of_clk_del_provider() in a .remove callback,
>> so the same problem could happen.
>>
>> Why does of_clk_del_provider() take (struct device_node *np) ?
>> Shouldn't it take (struct of_clk_provider *cp)?
>>
>
> Not sure. Probably someone thought they could hide the structure
> from consumers and just return success or failure.

consumers?   or did you mean providers?
I think consumers have no chance to call of_clk_del_provider().


> We could make
> it an opaque pointer though and properly cleanup without
> iterating the list. Maybe we should do that for the hw provider
> API so that it simplifies the search.
>
>>
>>
>>
>> > It used to return the last provider's error, but I accidentally
>> > changed that behavior when adding clk_hw providers in commit
>> > 0861e5b8cf80 (clk: Add clk_hw OF clk providers, 2016-02-05).
>> > Nobody seems to have complained though, so you're the first to
>> > have reported this.
>>
>>
>> If we allow multiple OF-providers for one device node,
>> I think any error should be treated as EPROBE_DEFER,
>> i.e. the current code is good.
>>
>>
>> The scenario is:
>>
>>  - Clocks with ID 0 thru 3 are provided by CLK_OF_DECLARE()
>>  - Clocks with ID 4 thru 9 are provided by a platform driver.
>>
>> What if a clock consumer requests the clk ID 5
>> after CLK_OF_DECLARE(), but before the clk platform driver is registered?
>>
>> If the clock consumer gets the last provider's error
>> (-EINVAL returned from CLK_OR_DECLARE one in this case)
>> it will lose a chance to retry it after clocks from a platform driver
>> are registered.
>>
>> A bit nasty...
>>
>
> Yes, but right now if we get an error from a provider and that's
> the only provider in the list we don't return the error. Also,
> this case should be fixed by having the first provider return
> EPROBE_DEFER for clks that aren't populated early on.

OK.  I like this idea.


> The best we can do is have the framework only return probe defer
> if there isn't a provider registered. Once a provider is
> registered, it needs to do the right thing and return the
> appropriate error (invalid or probe defer for example) at the
> right time.

Agreed.




Lastly, we have two solutions so far.  Which do you think is better?



One solution is, as others suggested,
CLK_OF_DECLARE() can allocate a bigger array than it needs,
so that blank entries can be filled by a platfrom_driver later.


The other way is,
CLK_OF_DECLARE() and a platfrom_driver
allocate separate of_clk_provider for each of them.





-- 
Best Regards
Masahiro Yamada
