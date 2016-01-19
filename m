Return-Path: <andi.shyti@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=iso-8859-15
Date: Tue, 19 Jan 2016 11:43:16 +0900
From: Andi Shyti <andi.shyti@samsung.com>
To: Yadwinder Singh Brar <yadi.brar01@gmail.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Sangbeom Kim <sbkim73@samsung.com>,
 Krzysztof Kozlowski <k.kozlowski@samsung.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, linux-clk@vger.kernel.org,
 Andi Shyti <andi@etezian.org>
Subject: Re: [PATCH 2/2] clk: s2mps11: allocate only one structure for clock
 init
Message-id: <20160119024316.GA3793@samsunx.samsung>
References: <1453105525-31506-1-git-send-email-andi.shyti@samsung.com>
 <1453105525-31506-3-git-send-email-andi.shyti@samsung.com>
 <CAKew6eX4WZa4595ZUhiX+Ndc_WCzBNJBh5ejzxaJVkCnAskCYw@mail.gmail.com>
In-reply-to: 
 <CAKew6eX4WZa4595ZUhiX+Ndc_WCzBNJBh5ejzxaJVkCnAskCYw@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>

Hi Yadwinder,

>     The driver allocates three structures for three different clock
>     types. They are quite similar and in the clock init data they
>     differ only by the name. Only one of these structure is used,
>     while the others lie unused in the memory.
> 
> 
> If you are worried about memory, they can be made __initdata by
> creating a copy during probe.

mmmhhh... allocating in boot time as much as we want and then copy
what we need? It doesn't look that pretty to me.

>     The clock's name, though, is not such a meaningful information
> 
> 
> I think it can be meaningful in debugging.

Can you explain what's the use of the naming other than
debugging?

>     and by assigning the same name to the initial data we can avoid
>     over allocation. The common name chosen will be s2mps11,
>     coherently with the device driver name, instead of the clock
>     device.
> 
>     Therefore, remove the structures associated to s2mps13 and
>     s2mps14 and use only the one referred to s2mps11 for all kind of
>     clocks.
> 
> 
> IMHO, with all these modifications, it will leave driver with some extra
> checks and reduced readability, perhaps will make it complex to add
> support for similar clocks but with different clk_ops, if next version or
>  any similar mfd chip comes up in future.

In that case, when the new chip will come, we would need to
figure out something, but for sure I don't see it as a good idea
to leave allocated unused structures.

Thanks,
Andi
