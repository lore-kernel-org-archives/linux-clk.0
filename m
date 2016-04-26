Return-Path: <yamada.masahiro@socionext.com>
MIME-Version: 1.0
In-Reply-To: <20160425222702.GC29990@codeaurora.org>
References: <1461552642-10732-1-git-send-email-yamada.masahiro@socionext.com>
	<20160425222702.GC29990@codeaurora.org>
Date: Tue, 26 Apr 2016 15:19:04 +0900
Message-ID: <CAK7LNASxL6+uP_G=2ffkamt-VKJmxvU4C7waNbHRPM3uUGEP-w@mail.gmail.com>
Subject: Re: [PATCH] clk: fix member type of struct clk_hw_onecell_data
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi Stephen,


2016-04-26 7:27 GMT+09:00 Stephen Boyd <sboyd@codeaurora.org>:
> On 04/25, Masahiro Yamada wrote:
>> We cannot assign any value to an array type variable.  So,
>>
>>   hw_data->hws = kcalloc(hw_data->num, sizeof(struct clk_hw *),
>>                          GFP_KERNEL);
>>
>> fails with "invalid use of flexible array member" error.
>
> That's good. We don't want assignment to the hws member of this
> structure to happen from an allocation like kcalloc.
>
>>
>> There are two ways to fix this issue.
>>
>> [1] Make it a double-pointer
>>   struct clk_hw_onecell_data {
>>           size_t num;
>>           struct clk_hw **hws;
>>   };
>>
>> This works as struct clk_onecell_data does.
>
> True we could go back to the old style with two allocations.
>
>>
>> [2] Make it a zero-sized array
>>   struct clk_hw_onecell_data {
>>           size_t num;
>>           struct clk_hw *hws[0];
>>   };
>>
>> This allows one-shot memory allocation like this:
>>
>>   hw_data = kmalloc(sizeof(*hw_data) + clk_num * sizeof(struct clk_hw *),
>>                     GFP_KERNEL);
>>
>
> Good, that was possible before this patch wasn't it?
>
>> This commit adopts [2] because it looks like Stephen's intention
>> (he moved hws[] to the bottom of struct clk_hw_onecell_data).
>>
>> Fixes: 0861e5b8cf80 ("clk: Add clk_hw OF clk providers")
>> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>> ---
>
>>
>>  include/linux/clk-provider.h | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
>> index fd2ccd5..1850e25 100644
>> --- a/include/linux/clk-provider.h
>> +++ b/include/linux/clk-provider.h
>> @@ -769,7 +769,7 @@ struct clk_onecell_data {
>>
>>  struct clk_hw_onecell_data {
>>       size_t num;
>> -     struct clk_hw *hws[];
>> +     struct clk_hw *hws[0];
>
> I'm totally lost now. Isn't a flex array with [] or with [0] the
> same?

I was misunderstanding.

You are right.  They are the same.


> The latter being a GCC extension while the former being a
> C99 standard?


Please ignore this patch.  Sorry for noise.




-- 
Best Regards
Masahiro Yamada
