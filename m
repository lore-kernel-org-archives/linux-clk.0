Return-Path: <yamada.masahiro@socionext.com>
MIME-Version: 1.0
In-Reply-To: <20160804205734.GA15690@codeaurora.org>
References: <1468919039-23004-1-git-send-email-yamada.masahiro@socionext.com> <20160804205734.GA15690@codeaurora.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 8 Aug 2016 02:05:43 +0900
Message-ID: <CAK7LNARmsWH+G45X_KZqqAzvY_KEtLMnoui67ZXo10uaNpqObw@mail.gmail.com>
Subject: Re: [PATCH] clk: prevent __of_clk_get_hw_from_provider() from
 returning NULL
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk <linux-clk@vger.kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi Stephen,


2016-08-05 5:57 GMT+09:00 Stephen Boyd <sboyd@codeaurora.org>:
> On 07/19, Masahiro Yamada wrote:
>> The .get(_hw) callback of an OF clock provider can return a NULL
>> pointer in some cases.
>>
>> For example, of_clk_src_onecell_get() returns NULL for index 1 of a
>> sparse array of clocks like follows:
>>
>>   clk_num == 3
>>   idx 0: UART clk
>>   idx 1: NULL (no clk is allocated)
>>   idx 2: I2C clk
>>
>> In such cases, clk_get() successfully returns NULL.
>>
>> A problem is that most drivers only check IS_ERR(), like follows:
>>
>>   clk = devm_clk_get(dev, NULL);
>>   if (IS_ERR(clk))
>>           return PTR_ERR(clk);
>>
>> It carries on moving forward and will probably be hit by a different
>> error check with a different error message.
>
> NULL is a valid clk pointer, so we can't really do anything here
> besides rely on driver authors to do the right thing.

Please let me clearer, just in case.
The "driver" means clk provider, not consumer.  Correct?

So, clock providers should be responsible for not returning NULL,
for example, by filling blank entries with ERR_PTR(-ENOENT).



-- 
Best Regards
Masahiro Yamada
