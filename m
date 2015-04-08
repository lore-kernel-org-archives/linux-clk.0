Return-Path: <ce3a@gmx.de>
MIME-Version: 1.0
Message-ID: <trinity-d1320d47-a158-4f77-8ddc-8dbeb74c6f8b-1428501608111@3capp-gmx-bs05>
From: "S. S." <ce3a@gmx.de>
To: "Sebastian Hesselbarth" <sebastian.hesselbarth@gmail.com>,
 mturquette@linaro.org, sboyd@codeaurora.org
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Aw: Re: [PATCH v2] clk: si5351: fix .round_rate for multisynth 6-7
Content-Type: text/plain; charset=UTF-8
Date: Wed, 8 Apr 2015 16:00:08 +0200
In-Reply-To: <552523BC.7010500@gmail.com>
References: <1428433918-6339-1-git-send-email-ce3a@gmx.de>,
 <552523BC.7010500@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

>> @@ -645,7 +646,7 @@ static long si5351_msynth_round_rate(struct clk_hw *hw, unsigned long rate,
>> struct si5351_hw_data *hwdata =
>> container_of(hw, struct si5351_hw_data, hw);
>> unsigned long long lltmp;
>> - unsigned long a, b, c;
>> + unsigned long a, b = 0, c = 1;
>
> Actually, moving b,c initialization up here is neither related
> to the patch itself nor is it mentioned in the commit log.
>
> Please do not mix different patches.

I agree. I just thought we could avoid repeating the b,c initialization
in the code, but You are right, that would be a different patch, if any 
at all.

>> *parent_rate = a * rate;
>
>> + if (rfrac)
>> + rational_best_approximation(rfrac, denom,
>> + SI5351_MULTISYNTH_B_MAX,
>> + SI5351_MULTISYNTH_C_MAX,
>> + &b, &c);
>> + }
>
> I am still not convinced that this is the right way to calculate the
> _best_ integer divider for ms6,7.
>
> The code above is written to (a) find the _largest_ integer "a" that
> will match
>
> a * rate <= parent_rate
>
> and then (b) determines the fractional part of the divider.
>
> As you correctly stated, ms6,7 do not support (b) but if we use (a) for
> those msynths, we will determine an "a" so that "a * rate" is always
> smaller than parent_rate.
> 
> What we actually want is the smallest error between generated and
> requested rate, so we have to find the closest integer with
> 
> a = DIV_ROUND_CLOSEST(parent_rate, rate)

Agreed, that's probably better.

> IMHO, the special divider calculation for ms6,7 is best dealt with
> in an extra else-if branch after the check for CLK_SET_RATE_PARENT
> flag.

Agreed.

> hwdata->params.p3 = 0;
> hwdata->params.p2 = 0;

Agreed.

> Out of curiosity, do you actually have a device that uses ms6,7 and can
> you measure the generated frequency - or did you just read the code as
> a bedtime story? ;)

:) I do have a device and have to use ms6,7, those are connected to pllb.
I have tested some integer pll dividers in a range from 30 to 130.
Measured frequencies and the frequencies shown in <debugfs>/clk/clk_summery
are the same.

I am going to send a patch v3.
Thanks for your feedback.

Sergej
