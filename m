Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:27937 "EHLO
	conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751699AbcHGQyi (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Sun, 7 Aug 2016 12:54:38 -0400
MIME-Version: 1.0
In-Reply-To: <20160804212553.GB15690@codeaurora.org>
References: <CAK7LNAQ5uRoSEEuKys9Gs-2HFAJCbmnFDjxajWfK9ng_dtZ8yw@mail.gmail.com>
 <20160804212553.GB15690@codeaurora.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 8 Aug 2016 01:54:23 +0900
Message-ID: <CAK7LNAQfwh3Z_=VWHvDi6EXFtVLuRMFVYzKMq8qCaZ30jfCq8g@mail.gmail.com>
Subject: Re: of_clk_add_(hw_)providers multipule times for one node?
To: Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh@kernel.org>
Cc: linux-clk <linux-clk@vger.kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Stephen,


2016-08-05 6:25 GMT+09:00 Stephen Boyd <sboyd@codeaurora.org>:
> +Rob in case he has any insight
>
> On 07/09, Masahiro Yamada wrote:
>> Hi.
>>
>> I think the current code allows to add
>> clk_providers multiple times against one DT node.
>>
>> Are there cases that really need to do so?
>
> If we have clk drivers that have a device driver structure and
> also use CLK_OF_DECLARE then we could get into a situation where
> they register two providers for the same device node. I can't
> think of any other situation where this would happen though.


What is the benefit for splitting one clock device
into CLK_OF_DECLARE() and a platform_driver?


If we go this way, I think we need to fix the current code.

of_clk_add_provider() calls of_clk_del_provider()
in its failure path.

Notice of_clk_del_provider() unregister
all the providers associated with the device node.

So, if of_clk_add_provider() fails to register a platform driver,
it may unregister another provider added by OF_CLK_DECLARE().

Some platform drivers call of_clk_del_provider() in a .remove callback,
so the same problem could happen.

Why does of_clk_del_provider() take (struct device_node *np) ?
Shouldn't it take (struct of_clk_provider *cp)?




> It used to return the last provider's error, but I accidentally
> changed that behavior when adding clk_hw providers in commit
> 0861e5b8cf80 (clk: Add clk_hw OF clk providers, 2016-02-05).
> Nobody seems to have complained though, so you're the first to
> have reported this.


If we allow multiple OF-providers for one device node,
I think any error should be treated as EPROBE_DEFER,
i.e. the current code is good.


The scenario is:

 - Clocks with ID 0 thru 3 are provided by CLK_OF_DECLARE()
 - Clocks with ID 4 thru 9 are provided by a platform driver.

What if a clock consumer requests the clk ID 5
after CLK_OF_DECLARE(), but before the clk platform driver is registered?

If the clock consumer gets the last provider's error
(-EINVAL returned from CLK_OR_DECLARE one in this case)
it will lose a chance to retry it after clocks from a platform driver
are registered.

A bit nasty...



-- 
Best Regards
Masahiro Yamada
