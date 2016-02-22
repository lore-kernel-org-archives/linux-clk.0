Return-Path: <yamada.masahiro@socionext.com>
MIME-Version: 1.0
In-Reply-To: <CAGhQ9VyaG+hcwNfXr7soP84G8Sq7DJmz8oMqZ1ALef6hcc0auw@mail.gmail.com>
References: <1451297429-21689-1-git-send-email-yamada.masahiro@socionext.com>
	<1451297429-21689-13-git-send-email-yamada.masahiro@socionext.com>
	<CAGhQ9VyaG+hcwNfXr7soP84G8Sq7DJmz8oMqZ1ALef6hcc0auw@mail.gmail.com>
Date: Mon, 22 Feb 2016 11:29:46 +0900
Message-ID: <CAK7LNARhh0o8t_qLHc4_+yyZE6Hx6cwL2XEKbFsHZJmeHndzyA@mail.gmail.com>
Subject: Re: [PATCH v2 12/16] clk: avoid circular clock topology
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: Joachim Eastwood <manabian@gmail.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>,
        Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi Joachim,


2016-02-22 6:39 GMT+09:00 Joachim Eastwood <manabian@gmail.com>:
> Hi everyone,
>
> On 28 December 2015 at 11:10, Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
>> Currently, clk_register() never checks a circular parent looping,
>> but clock providers could register such an insane clock topology.
>> For example, "clk_a" could have "clk_b" as a parent, and vice versa.
>> In this case, clk_core_reparent() creates a circular parent list
>> and __clk_recalc_accuracies() calls itself recursively forever.
>>
>> The core infrastructure should be kind enough to bail out, showing
>> an appropriate error message in such a case.  This helps to easily
>> find a bug in clock providers.  (uh, I made such a silly mistake
>> when I was implementing my clock providers first.  I was upset
>> because the kernel did not respond, without any error message.)
>>
>> This commit adds a new helper function, __clk_is_ancestor().  It
>> returns true if the second argument is a possible ancestor of the
>> first one.  If a clock core is a possible ancestor of itself, it
>> would make a loop when it were registered.  That should be detected
>> as an error.
>
> This commit breaks lpc18xx boot in next right now. See
> http://marc.info/?l=linux-arm-kernel&m=145608597106087&w=2
>
> The Clock Generation Unit (CGU) on lpc18xx allow for circular parents
> in hardware. While it is obliviously not a good idea to configure the
> clocks in that manner there is nothing that stops you either.
>
> Please take a look at the second figure on:
> https://github.com/manabian/linux-lpc/wiki/LPC18xx-LPC43xx-clocks
> All PLLs can feed clock into the dividers and the dividers can feed
> clock into the PLLs.
>
> The reason why this is made possible in the CGU is because you can
> then choose where to put your divider; either before the PLL or after.
>


Sorry for breaking your board.

I am OK with reverting b58f75aa83fb.



I guess your hardware could make clock looping for the best flexibility
but you do not make clock looping in actual use cases.

Maybe, does it make sense to check the parent looping
in clk_set_parent() or somewhere, not in clk_register()?


-- 
Best Regards
Masahiro Yamada
