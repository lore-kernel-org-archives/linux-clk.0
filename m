Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:31896 "EHLO
	conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751134AbcHLG77 (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Fri, 12 Aug 2016 02:59:59 -0400
MIME-Version: 1.0
In-Reply-To: <20160810232307.GK2996@codeaurora.org>
References: <1468919039-23004-1-git-send-email-yamada.masahiro@socionext.com>
 <20160804205734.GA15690@codeaurora.org> <CAK7LNAQL2u1YTxr_SWR6S_2aFPfXAPcaFfkWKSV_D-RU2vq7BQ@mail.gmail.com>
 <20160810232307.GK2996@codeaurora.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 12 Aug 2016 15:59:51 +0900
Message-ID: <CAK7LNASGVAy1Ff8Hp_s+icDEtYHMmxfJv7La=mFF0haJ0hWrUw@mail.gmail.com>
Subject: Re: [PATCH] clk: prevent __of_clk_get_hw_from_provider() from
 returning NULL
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk <linux-clk@vger.kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Russell King - ARM Linux <linux@arm.linux.org.uk>
Content-Type: text/plain; charset=UTF-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi.

(+CC Russell, perhaps he may have some comments on this topic.)

2016-08-11 8:23 GMT+09:00 Stephen Boyd <sboyd@codeaurora.org>:
> On 08/10, Masahiro Yamada wrote:
>> 2016-08-05 5:57 GMT+09:00 Stephen Boyd <sboyd@codeaurora.org>:
>> > On 07/19, Masahiro Yamada wrote:
>> >> The .get(_hw) callback of an OF clock provider can return a NULL
>> >> pointer in some cases.
>> >>
>> >> For example, of_clk_src_onecell_get() returns NULL for index 1 of a
>> >> sparse array of clocks like follows:
>> >>
>> >>   clk_num == 3
>> >>   idx 0: UART clk
>> >>   idx 1: NULL (no clk is allocated)
>> >>   idx 2: I2C clk
>> >>
>> >> In such cases, clk_get() successfully returns NULL.
>> >>
>> >> A problem is that most drivers only check IS_ERR(), like follows:
>> >>
>> >>   clk = devm_clk_get(dev, NULL);
>> >>   if (IS_ERR(clk))
>> >>           return PTR_ERR(clk);
>> >>
>> >> It carries on moving forward and will probably be hit by a different
>> >> error check with a different error message.
>> >
>> > NULL is a valid clk pointer, so we can't really do anything here
>> > besides rely on driver authors to do the right thing.
>>
>>
>> I still do not understand this.
>>
>>
>> I think clk_get() should return > 0 pointer on success,
>> error-pointer on failure.
>
> Russell King has repeatedly stated that NULL is a valid return
> value from clk_get(). I'm sure we can find numerous such
> statements on the arm mailing list.
>
>>
>> I have no idea when NULL is useful as a return value of clk_get().
>>
>
> Perhaps the provider wants to avoid allocating anything for some
> clk id and have the clk consumer API do nothing in this case?

Hmm.

I was thinking in which case we want to do this.
Perhaps, when we add the "clocks" property to DT first,
but clock driver is not implemented yet.  So clk provider
just want to return NULL to make the consumer to skip the clk set-up ??


Another possibility:
I noticed we have a stub in include/linux/clk.h,
which just returns NULL if CONFIG_HAVE_CLK is not defined.



> Consumers can be unaware of this fact by having the provider
> return NULL so things like clk_prepare/enable become nops. Of
> course, we can't make things like clk_get_rate() useful in this
> case, but at least we can have on/off simplified.

At least, this seems useful for architectures without CONFIG_HAVE_CLK.


Another case where it might be useful is,
if "clocks" property is missing in DT,
clk_get() can return NULL to make the clock optional.
Then, clk consumer can skip clk_prepare_enable() and continue probing.

But, actually, clk_get returns ERR_PTR(-ENOENT) if "clocks" property
is missing.


-- 
Best Regards
Masahiro Yamada
