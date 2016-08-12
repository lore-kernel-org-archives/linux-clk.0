Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:47153 "EHLO
	conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750878AbcHLHER (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Fri, 12 Aug 2016 03:04:17 -0400
MIME-Version: 1.0
In-Reply-To: <20160810230845.GH2996@codeaurora.org>
References: <CAK7LNAQ5uRoSEEuKys9Gs-2HFAJCbmnFDjxajWfK9ng_dtZ8yw@mail.gmail.com>
 <20160804212553.GB15690@codeaurora.org> <CAK7LNAQfwh3Z_=VWHvDi6EXFtVLuRMFVYzKMq8qCaZ30jfCq8g@mail.gmail.com>
 <20160808233711.GA2996@codeaurora.org> <CAK7LNAScz7bJABbOgUuvg9J-ORaiLEfpwA3yMP+bZbLgB+S3uQ@mail.gmail.com>
 <20160810230845.GH2996@codeaurora.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 12 Aug 2016 16:04:02 +0900
Message-ID: <CAK7LNAQ9wgpHn2LXiFfbyp_j85h8ZkGnAP39eVj+jmKczi=VSA@mail.gmail.com>
Subject: Re: of_clk_add_(hw_)providers multipule times for one node?
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Rob Herring <robh@kernel.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

2016-08-11 8:08 GMT+09:00 Stephen Boyd <sboyd@codeaurora.org>:
> On 08/10, Masahiro Yamada wrote:
>> Hi Stephen,
>>
>>
>>
>> 2016-08-09 8:37 GMT+09:00 Stephen Boyd <sboyd@codeaurora.org>:
>> > On 08/08, Masahiro Yamada wrote:
>> >> Hi Stephen,
>> >>
>> >>
>> >> 2016-08-05 6:25 GMT+09:00 Stephen Boyd <sboyd@codeaurora.org>:
>> >
>> >>
>> >> of_clk_add_provider() calls of_clk_del_provider()
>> >> in its failure path.
>> >>
>> >> Notice of_clk_del_provider() unregister
>> >> all the providers associated with the device node.
>> >
>> > Where is that? I see a break statement in the while loop after
>> > the first matching np is found.
>>
>> Ah, I missed the "break".
>>
>> So, this works *almost* well.
>>
>> I mean *almost* because the of_clk_mutex is released
>> between of_clk_add_hw_provider() and of_clk_del_provider().
>>
>> What if two providers are added concurrently.
>> I know it never happens in use-cases we assume, though.
>
> Agreed, that would be bad. We can definitely do better in that
> case and properly delete the provider that we have already
> registered without calling of_clk_del_provider() though. We have
> everything in the local scope at the time.
>
>>
>>
>> >>
>> >> Some platform drivers call of_clk_del_provider() in a .remove callback,
>> >> so the same problem could happen.
>> >>
>> >> Why does of_clk_del_provider() take (struct device_node *np) ?
>> >> Shouldn't it take (struct of_clk_provider *cp)?
>> >>
>> >
>> > Not sure. Probably someone thought they could hide the structure
>> > from consumers and just return success or failure.
>>
>> consumers?   or did you mean providers?
>> I think consumers have no chance to call of_clk_del_provider().
>
> Sorry, bad choice of words. I meant users of this
> of_clk_add*_provider() API.
>
>>
>>
>> > The best we can do is have the framework only return probe defer
>> > if there isn't a provider registered. Once a provider is
>> > registered, it needs to do the right thing and return the
>> > appropriate error (invalid or probe defer for example) at the
>> > right time.
>>
>> Agreed.
>
> Ok. I think I will merge my patch then to restore previous
> behavior.
>
>>
>> Lastly, we have two solutions so far.  Which do you think is better?
>>
>> One solution is, as others suggested,
>> CLK_OF_DECLARE() can allocate a bigger array than it needs,
>> so that blank entries can be filled by a platfrom_driver later.
>>
>>
>> The other way is,
>> CLK_OF_DECLARE() and a platfrom_driver
>> allocate separate of_clk_provider for each of them.
>>
>
> I believe we have precedence for the former case, so there's some
> momentum around that approach. It doesn't make me feel great
> though because we have published the provider before all clks are
> registered, and then we go back and modify the array in place
> while consumers could potentially be using it. I suppose we're
> saved because cpus access the pointer in the array and only see
> the whole pointer and not half of the old one and half of the new
> one?


I am not sure.

But, maybe just filling the blank entries of the array seems safe.
In this case, filling should be done at the end of the probe callback.
Otherwise, devm_clk_hw_register() will free the clk_hw when the driver
is detached.




-- 
Best Regards
Masahiro Yamada
