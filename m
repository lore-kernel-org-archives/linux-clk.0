Return-Path: <ce3a@gmx.de>
Message-ID: <552425A9.2020004@gmx.de>
Date: Tue, 07 Apr 2015 20:44:57 +0200
From: Sergej Sawazki <ce3a@gmx.de>
MIME-Version: 1.0
To: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 mturquette@linaro.org, sboyd@codeaurora.org
CC: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: si5351: fix .round_rate for multisynth 6-7
References: <1428330321-25209-1-git-send-email-ce3a@gmx.de> <5522B7CB.40507@gmail.com>
In-Reply-To: <5522B7CB.40507@gmail.com>
Content-Type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>

Sebastian,

thanks for your reply, please find my comments below:

On 06.04.2015 18:43, Sebastian Hesselbarth wrote:
> On 06.04.2015 16:25, Sergej Sawazki wrote:
>> The divider calculation for multisynth 6 and 7 differs from the
>> calculation for multisynth 0-5.
>>
>> For MS6 and MS7, set MSx_P1 directly, MSx_P1=divide value
>> [AN619, p. 6].
>>
>> Referenced document:
>> [AN619] Manually Generating an Si5351 Register Map, Rev. 0.4
>>
>> Signed-off-by: Sergej Sawazki <ce3a@gmx.de>
>
> Sergej,
>
> thanks for the patch, I do have some remarks though.
>
>> ---
>>   drivers/clk/clk-si5351.c | 12 ++++++++++--
>>   1 file changed, 10 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/clk/clk-si5351.c b/drivers/clk/clk-si5351.c
>> index 44ea107..310078d 100644
>> --- a/drivers/clk/clk-si5351.c
>> +++ b/drivers/clk/clk-si5351.c
>> @@ -552,7 +552,8 @@ static const struct clk_ops si5351_pll_ops = {
>>    * MSx_P2[19:0] = 128 * b - c * floor(128 * b/c) = (128*b) mod c
>>    * MSx_P3[19:0] = c
>>    *
>> - * MS[6,7] are integer (P1) divide only, P2 = 0, P3 = 0
>> + * MS[6,7] are integer (P1) divide only, P1 = divide value,
>> + * P2 and P3 are not applicable
>>    *
>>    * for 150MHz < fOUT <= 160MHz:
>>    *
>> @@ -718,11 +719,18 @@ static long si5351_msynth_round_rate(struct
>> clk_hw *hw, unsigned long rate,
>>       do_div(lltmp, a * c + b);
>>       rate  = (unsigned long)lltmp;
>>
>> -    /* calculate parameters */
>> +    /*
>> +     * calculate parameters
>> +     * for multisync6-7 set p1 directly, fOUT = fIN / p1
>
> I'd say the comment about the differences of MS6,7 in the function's
> comment block is enough, no need to repeat it again here.
>
I agree.
>> +     */
>>       if (divby4) {
>>           hwdata->params.p3 = 1;
>>           hwdata->params.p2 = 0;
>>           hwdata->params.p1 = 0;
>> +    } else if (hwdata->num >= 6) {
>> +        hwdata->params.p3 = 1;
>> +        hwdata->params.p2 = 0;
>> +        hwdata->params.p1 = a;
>
> Hmm. Just overruling what will be written in the registers is
> definitely not enough. If you look at the first two lines of this
> hunk, you'll admit that the visible representation (rate) of the MS
> frequency isn't affected by your patch at all.
>
> That basically means that real frequency and frequency in the kernel
> will differ, so we have to put this change in the param calculation
> above this hunk instead. The extra else-if-path here is ok though.
>
You right, I will take a look at that and provide a patch v2.

Sergej
