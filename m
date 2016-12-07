Return-Path: <yamada.masahiro@socionext.com>
MIME-Version: 1.0
In-Reply-To: <20161206231642.GA4388@codeaurora.org>
References: <1480725436-9628-1-git-send-email-vlee@freedesktop.org>
 <CAK7LNATeswNhoFsA90k=qF4Jock0ytNT-pPT6j+0b9MJFJwu9Q@mail.gmail.com> <20161206231642.GA4388@codeaurora.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 7 Dec 2016 10:34:53 +0900
Message-ID: <CAK7LNARZvDJnZTVJP8kxvCoGf_HFyGi0A0Y4rBVeLft4Hj19ZA@mail.gmail.com>
Subject: Re: [PATCH] clk: uniphier: Fix build with gcc-4.4.
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Vinson Lee <vlee@freedesktop.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi Stephen,


2016-12-07 8:16 GMT+09:00 Stephen Boyd <sboyd@codeaurora.org>:
> On 12/03, Masahiro Yamada wrote:
>> Hi Vinson,
>>
>> 2016-12-03 9:37 GMT+09:00 Vinson Lee <vlee@freedesktop.org>:
>> > gcc-4.4 has issues with anonymous unions in initializers.
>> >
>> >   CC      drivers/clk/uniphier/clk-uniphier-sys.o
>> > drivers/clk/uniphier/clk-uniphier-sys.c:45: error: unknown field =E2=
=80=98factor=E2=80=99 specified in initializer
>> >
>> > Fixes: 1574d5722636 ("clk: uniphier: remove unneeded member name for u=
nion")
>> > Signed-off-by: Vinson Lee <vlee@freedesktop.org>
>>
>>
>> This driver has COMPILE_TEST option, but kbuild test robot
>> did not mention about this.
>>
>>
>>
>> This is a bad way of fixing, I think.
>> (what if a new member is inserted before the union in the future?)
>>
>> Rather, please revert the bad commit.
>>
>
> Reverting on top of clk-next will cause build failures though.
> Can you resend the patch series without this first patch please?
> I'll apply them then.
>
> I'll go drop all three patches and wreck Andrew's merge of this
> patch to -mm.


I dropped the first one
and v3 (for the last two) is on the ML now.

Thanks a lot for taking care of this!



--=20
Best Regards
Masahiro Yamada
