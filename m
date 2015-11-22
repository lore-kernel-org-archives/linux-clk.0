Return-Path: <yamada.masahiro@socionext.com>
MIME-Version: 1.0
In-Reply-To: <20151120174509.GQ32672@codeaurora.org>
References: <1448004981-11133-1-git-send-email-yamada.masahiro@socionext.com>
	<1448004981-11133-2-git-send-email-yamada.masahiro@socionext.com>
	<20151120174509.GQ32672@codeaurora.org>
Date: Sun, 22 Nov 2015 15:03:38 +0900
Message-ID: <CAK7LNASQGBn32N4=CM+notaVv1ZLotaydRhe-GiOF6nLhbmABA@mail.gmail.com>
Subject: Re: [PATCH 2/3] clk: let of_clk_get_parent_name() fail for invalid clock-indices
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Ben Dooks <ben.dooks@codethink.co.uk>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi Stephen,


2015-11-21 2:45 GMT+09:00 Stephen Boyd <sboyd@codeaurora.org>:
> On 11/20, Masahiro Yamada wrote:
>> Currently, of_clk_get_parent_name() returns a wrong parent clock name
>> when "clock-indices" property exists and the given index is not found
>> in the property.  In this case, NULL should be returned.
>>
>> For example,
>>
>>         oscillator {
>>                 compatible = "myclocktype";
>>                 #clock-cells = <1>;
>>                 clock-indices = <1>, <3>;
>>                 clock-output-names = "clka", "clkb";
>>         };
>>
>> Currently, of_clk_get_parent_name(np, 0) returns "clka", but should
>> return NULL because "clock-indices" does not contain <0>.
>
> What is np pointing at? Something like:
>
>         consumer {
>                 clocks = <&oscillator 0>;
>         };
>
> Which would be invalid DT because oscillator doesn't have an
> output for index 0?


You are right.  My example was confusing.



         oscillator: oscillator {
                 compatible = "myclocktype";
                 #clock-cells = <1>;
                 clock-indices = <1>, <3>;
                 clock-output-names = "clka", "clkb";
         };

         consumer {
                 compatible = "myclockconsumer";
                 clocks = <&oscillator 0>;
         };

Currently, of_clk_get_parent_name(consumer_np, 0) returns "clks", but
should return NULL;

I will rephrase the git-log in v2.




>>
>> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>> @@ -3068,17 +3065,20 @@ const char *of_clk_get_parent_name(struct device_node *np, int index)
>>               return NULL;
>>
>>       index = clkspec.args_count ? clkspec.args[0] : 0;
>> -     count = 0;
>>
>>       /* if there is an indices property, use it to transfer the index
>>        * specified into an array offset for the clock-output-names property.
>>        */
>> -     of_property_for_each_u32(clkspec.np, "clock-indices", prop, vp, pv) {
>> -             if (index == pv) {
>> -                     index = count;
>> -                     break;
>> -             }
>> -             count++;
>> +     list = of_get_property(clkspec.np, "clock-indices", &len);
>> +     if (list) {
>> +             len /= sizeof(*list);
>> +             for (i = 0; i < len; i++)
>> +                     if (index == be32_to_cpup(list++)) {
>> +                             index = i;
>> +                             break;
>> +                     }
>> +             if (i == len)
>> +                     return NULL;
>>       }
>
> Why can't we leave everything in place and check count == len at
> the end? i.e.
>
>         of_property_for_each_u32(clkspec.np, "clock-indices", prop, vp, pv) {
>                 if (index == pv) {
>                         index = count;
>                         break;
>                 }
>                 count++;
>         }
>
>         if (count == of_property_count_u32_elems(clkspec.np, "clock-indices"))
>                 return NULL
>


Of course we can, although we have to mention "clock-indices" twice.

A good thing for of_get_property() is that we can get both the value
and the length
at the same time.



-- 
Best Regards
Masahiro Yamada
