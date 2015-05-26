Return-Path: <jim2101024@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20150523191750.9817.78709@quantum>
References: <1431719147-10153-1-git-send-email-jim2101024@gmail.com>
	<20150523191750.9817.78709@quantum>
Date: Tue, 26 May 2015 10:43:35 -0400
Message-ID: <CANCKTBsKYikUquheryHA=618sgQ5gd0-h3qTosxyA-XZjjodOQ@mail.gmail.com>
Subject: Re: [PATCH] clk: allow a clk divider with max divisor when zero
From: Jim Quinlan <jim2101024@gmail.com>
To: Michael Turquette <mturquette@linaro.org>
Cc: linux-clk@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi Mike,

I don't think using a table approach is acceptable.  First, a number
of our dividers have an eight bit value field.  Second, we do not
necessarily know a priori which of the 256 settings will be chosen:
we could make a table with the N most popular choices, and then
someone -- possibly in app-land -- may decide they want a different
frequency for necessity, power savings, reliability, whatever.  They
want to make this change immediately and cannot wait for us to produce
and QA another device tree with the new table.

Regards,
Jim

On Sat, May 23, 2015 at 3:17 PM, Michael Turquette
<mturquette@linaro.org> wrote:
> Quoting Jim Quinlan (2015-05-15 12:45:47)
>> This commit allows certain Broadcom STB clock dividers to be used with
>> clk-divider.c.  It allows for a clock whose field value is the equal
>> to the divisor, execpt when the field value is zero, in which case the
>> divisor is 2^width.  For example, consider a divisor clock with a two
>> bit field:
>>
>> value           divisor
>> 0               4
>> 1               1
>> 2               2
>> 3               3
>
> Hi Jim,
>
> Instead of introducing this flag, could you use the divider table? New
> stuff is generally added to clk-divider.c when it is common and used by
> multiple platforms. If this is not the case then using a table-based
> approach is a nice solution.
>
> Regards,
> Mike
>
>>
>> Signed-off-by: Jim Quinlan <jim2101024@gmail.com>
>> ---
>>  drivers/clk/clk-divider.c    | 16 +++++++++++-----
>>  include/linux/clk-provider.h |  4 ++++
>>  2 files changed, 15 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/clk/clk-divider.c b/drivers/clk/clk-divider.c
>> index 25006a8..fce0d8b 100644
>> --- a/drivers/clk/clk-divider.c
>> +++ b/drivers/clk/clk-divider.c
>> @@ -78,12 +78,14 @@ static unsigned int _get_table_div(const struct clk_div_table *table,
>>  }
>>
>>  static unsigned int _get_div(const struct clk_div_table *table,
>> -                            unsigned int val, unsigned long flags)
>> +                            unsigned int val, unsigned long flags, u8 width)
>>  {
>>         if (flags & CLK_DIVIDER_ONE_BASED)
>>                 return val;
>>         if (flags & CLK_DIVIDER_POWER_OF_TWO)
>>                 return 1 << val;
>> +       if (flags & CLK_DIVIDER_MAX_AT_ZERO)
>> +               return val ? val : div_mask(width) + 1;
>>         if (table)
>>                 return _get_table_div(table, val);
>>         return val + 1;
>> @@ -101,12 +103,14 @@ static unsigned int _get_table_val(const struct clk_div_table *table,
>>  }
>>
>>  static unsigned int _get_val(const struct clk_div_table *table,
>> -                            unsigned int div, unsigned long flags)
>> +                            unsigned int div, unsigned long flags, u8 width)
>>  {
>>         if (flags & CLK_DIVIDER_ONE_BASED)
>>                 return div;
>>         if (flags & CLK_DIVIDER_POWER_OF_TWO)
>>                 return __ffs(div);
>> +       if (flags & CLK_DIVIDER_MAX_AT_ZERO)
>> +               return (div == div_mask(width) + 1) ? 0 : div;
>>         if (table)
>>                 return  _get_table_val(table, div);
>>         return div - 1;
>> @@ -117,9 +121,10 @@ unsigned long divider_recalc_rate(struct clk_hw *hw, unsigned long parent_rate,
>>                                   const struct clk_div_table *table,
>>                                   unsigned long flags)
>>  {
>> +       struct clk_divider *divider = to_clk_divider(hw);
>>         unsigned int div;
>>
>> -       div = _get_div(table, val, flags);
>> +       div = _get_div(table, val, flags, divider->width);
>>         if (!div) {
>>                 WARN(!(flags & CLK_DIVIDER_ALLOW_ZERO),
>>                         "%s: Zero divisor and CLK_DIVIDER_ALLOW_ZERO not set\n",
>> @@ -351,7 +356,8 @@ static long clk_divider_round_rate(struct clk_hw *hw, unsigned long rate,
>>         if (divider->flags & CLK_DIVIDER_READ_ONLY) {
>>                 bestdiv = readl(divider->reg) >> divider->shift;
>>                 bestdiv &= div_mask(divider->width);
>> -               bestdiv = _get_div(divider->table, bestdiv, divider->flags);
>> +               bestdiv = _get_div(divider->table, bestdiv, divider->flags,
>> +                       divider->width);
>>                 return DIV_ROUND_UP(*prate, bestdiv);
>>         }
>>
>> @@ -370,7 +376,7 @@ int divider_get_val(unsigned long rate, unsigned long parent_rate,
>>         if (!_is_valid_div(table, div, flags))
>>                 return -EINVAL;
>>
>> -       value = _get_val(table, div, flags);
>> +       value = _get_val(table, div, flags, width);
>>
>>         return min_t(unsigned int, value, div_mask(width));
>>  }
>> diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
>> index df69531..a30c24c 100644
>> --- a/include/linux/clk-provider.h
>> +++ b/include/linux/clk-provider.h
>> @@ -342,6 +342,9 @@ struct clk_div_table {
>>   *     to the closest integer instead of the up one.
>>   * CLK_DIVIDER_READ_ONLY - The divider settings are preconfigured and should
>>   *     not be changed by the clock framework.
>> + * CLK_DIVIDER_MAX_AT_ZERO - For dividers which are like CLK_DIVIDER_ONE_BASED
>> + *     except when the value read from the register is zero, the divisor is
>> + *     2^width of the field.
>>   */
>>  struct clk_divider {
>>         struct clk_hw   hw;
>> @@ -359,6 +362,7 @@ struct clk_divider {
>>  #define CLK_DIVIDER_HIWORD_MASK                BIT(3)
>>  #define CLK_DIVIDER_ROUND_CLOSEST      BIT(4)
>>  #define CLK_DIVIDER_READ_ONLY          BIT(5)
>> +#define CLK_DIVIDER_MAX_AT_ZERO                BIT(6)
>>
>>  extern const struct clk_ops clk_divider_ops;
>>
>> --
>> 1.9.0.138.g2de3478
>>
