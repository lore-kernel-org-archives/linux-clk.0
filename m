Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67411ECAAD5
	for <linux-clk@archiver.kernel.org>; Mon,  5 Sep 2022 16:55:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230202AbiIEQzf (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 5 Sep 2022 12:55:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229625AbiIEQze (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 5 Sep 2022 12:55:34 -0400
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 309F4419A9
        for <linux-clk@vger.kernel.org>; Mon,  5 Sep 2022 09:55:31 -0700 (PDT)
Received: from [192.168.0.18] ([62.159.46.162]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MplPf-1pAKkI1H25-00qB1K; Mon, 05 Sep 2022 18:55:23 +0200
Message-ID: <0f7da2ef-9669-1a11-4093-d0be93daed1f@efe-gmbh.de>
Date:   Mon, 5 Sep 2022 18:55:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH RESEND] clk: si5351: update multisynth limits
Content-Language: de-DE
To:     Waseem Arshad <Waseem.Arshad@axis.com>, linux-clk@vger.kernel.org
Cc:     mturquette@baylibre.com, sboyd@kernel.org,
        sebastian.hesselbarth@gmail.com
References: <20211208154238.71727-1-renner@efe-gmbh.de>
 <71a9367c-6565-aaed-0bd2-13bf28658110@axis.com>
From:   Jens Renner <renner@efe-gmbh.de>
In-Reply-To: <71a9367c-6565-aaed-0bd2-13bf28658110@axis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:UQVft7Q8I8QIBQyv8OLJi0Oqv9maV2npN7uYpptxfL71yhHh64s
 pw80kCmyPKuk7kR3WxeaEamhl2o7KnvFraYgWMc4RtSNYy7462p3inOijzpqsEG4buiHun6
 erP0HdjJUB3m9koKuW/j17OL/BAZvGwBvN+c1paMwum0T3PjX08ut9Z/wSyUukGfbzrz4BL
 kU7yhC+M/pgx3aUIJIU5w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ES/+Q86T/b8=:7EZzC0fYmvwCHOgXRxsZzx
 Fr6URI8AHxTVB4ovi+WnNMK6x08wJ0liFRxVsNCafu7Tj9vICewuMIMINEjxx/1XJaj4Csfjx
 F9icZRHtyA5bDVJpfplJ2VmLh+t63ylIqTSKoN6CpETpwPnV6abbQBvWB2EXN6FH3HQoBWNYG
 RZTaYBfVASoTEn0NOk86VNPQuFxUuz6WyeeFhkBlzaSb8vgjcd1WoBpTLifpw1emeA3VYjUze
 ojJjHMbm8zKan9MI391Oe4b98QQU9ueFjjqR36RUNTsIAHMguOw720K1ol3r+MfLDIDS0OZg3
 MtRAzBUCYKr5Z6DXg65LVl8iR4dVNBIT67nHcO7bEI9tF62VoCGJgyAdyx8vK34086bJu23Sg
 WuDN5A1c7xbLERn+BqedaRUKIrd+7SDbT3hGcso/2DyqctOBTUFFje8KLkAEop9dwL9G5flYN
 idikvMlASG+rVVjblWSXa3c89TaB7sYxHzPorqL26Ib7R48wU5HWUcF9VoqyIAlG24AE7cOR/
 XAXenFw7n8UsHiD70qKiAMFz5iSP5/kWfcISTE4R4FPQqfcJZezUFzivQs7Ikqach1YjKcq9g
 Wla5bKfP51Zz7nuoES144TZ5jIlgYueGDjSZvMmMlOs371+V1WLqyf6Kvl2j/obnw/ODC9QLV
 dachJehMheBSCfh8ga2D0AQxB63HYeuoN6ntiIQt95MN2Qt82E2/Zi9vwKsY5fak4kvI6DuYT
 MP7lgpipaL0h9TchEoer1w+iNpRcrWN7WLthDWNdF/Jwkjnq/ycEmX7xtnEfgCWs2zychk61O
 yzcHJhn
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Waseem,

Thanks for figuring that out.
It was a misconception on my side as I assumed that the theoretical 
limit for SI5351_MULTISYNTH_MIN_FREQ is defined by the lowest PLL 
frequency (SI5351_PLL_VCO_MIN = 600 MHz) divided by the largest 
Multisynth divider SI5351_MULTISYNTH_A_MAX of 2048 which gives a value 
of ~ 300 kHz.

Am 05.09.22 um 16:38 schrieb Waseem Arshad:
> Hi Jens,
> 
> I had problems generating correct frequency values with your patch.
> 
> On 12/8/21 16:42, Jens Renner wrote:
> 
>> The revised datasheet (rev. 1.0 and later) specifies new limits for the
>> multisynth dividers that lead to an extended clock output frequency
>> range of 2.5 kHz - 200 MHz [1].
>>
>> [1] https://www.skyworksinc.com/-/media/Skyworks/SL/documents/public
>> /data-sheets/Si5351-B.pdf
>>
>> Signed-off-by: Jens Renner <renner@efe-gmbh.de>
>> ---
>>   drivers/clk/clk-si5351.c | 15 ++++++++-------
>>   drivers/clk/clk-si5351.h |  8 ++++----
>>   2 files changed, 12 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/clk/clk-si5351.c b/drivers/clk/clk-si5351.c
>> index 57e4597cdf4c..56bc59f91d20 100644
>> --- a/drivers/clk/clk-si5351.c
>> +++ b/drivers/clk/clk-si5351.c
>> @@ -556,7 +556,7 @@ static const struct clk_ops si5351_pll_ops = {
>>    * MS[6,7] are integer (P1) divide only, P1 = divide value,
>>    * P2 and P3 are not applicable
>>    *
>> - * for 150MHz < fOUT <= 160MHz:
>> + * for 150MHz < fOUT <= 200MHz:
>>    *
>>    * MSx_P1 = 0, MSx_P2 = 0, MSx_P3 = 1, MSx_INT = 1, MSx_DIVBY4 = 11b
>>    */
>> @@ -653,7 +653,7 @@ static long si5351_msynth_round_rate(struct clk_hw 
>> *hw, unsigned long rate,
>>       if (hwdata->num >= 6 && rate > SI5351_MULTISYNTH67_MAX_FREQ)
>>           rate = SI5351_MULTISYNTH67_MAX_FREQ;
>> -    /* multisync frequency is 1MHz .. 160MHz */
>> +    /* multisync frequency is 300kHz .. 200MHz */
>>       if (rate > SI5351_MULTISYNTH_MAX_FREQ)
>>           rate = SI5351_MULTISYNTH_MAX_FREQ;
>>       if (rate < SI5351_MULTISYNTH_MIN_FREQ)
>> @@ -681,8 +681,8 @@ static long si5351_msynth_round_rate(struct clk_hw 
>> *hw, unsigned long rate,
>>           *parent_rate = a * rate;
>>       } else if (hwdata->num >= 6) {
>> -        /* determine the closest integer divider */
>> -        a = DIV_ROUND_CLOSEST(*parent_rate, rate);
>> +        /* determine the closest even integer divider */
>> +        a = DIV_ROUND_CLOSEST(*parent_rate/2, rate) * 2;
>>           if (a < SI5351_MULTISYNTH_A_MIN)
>>               a = SI5351_MULTISYNTH_A_MIN;
>>           if (a > SI5351_MULTISYNTH67_A_MAX)
>> @@ -715,7 +715,8 @@ static long si5351_msynth_round_rate(struct clk_hw 
>> *hw, unsigned long rate,
>>           b = 0;
>>           c = 1;
>> -        if (rfrac)
>> +        /* Smallest divider in fractional mode must be > 8 (AN619)! */
>> +        if (rfrac && (a >= 8))
>>               rational_best_approximation(rfrac, denom,
>>                   SI5351_MULTISYNTH_B_MAX, SI5351_MULTISYNTH_C_MAX,
>>                   &b, &c);
>> @@ -1039,11 +1040,11 @@ static long si5351_clkout_round_rate(struct 
>> clk_hw *hw, unsigned long rate,
>>           container_of(hw, struct si5351_hw_data, hw);
>>       unsigned char rdiv;
>> -    /* clkout6/7 can only handle output freqencies < 150MHz */
>> +    /* clkout6/7 can only handle output frequencies < 150MHz */
>>       if (hwdata->num >= 6 && rate > SI5351_CLKOUT67_MAX_FREQ)
>>           rate = SI5351_CLKOUT67_MAX_FREQ;
>> -    /* clkout freqency is 8kHz - 160MHz */
>> +    /* clkout frequency is 2.5kHz - 200MHz */
>>       if (rate > SI5351_CLKOUT_MAX_FREQ)
>>           rate = SI5351_CLKOUT_MAX_FREQ;
>>       if (rate < SI5351_CLKOUT_MIN_FREQ)
>> diff --git a/drivers/clk/clk-si5351.h b/drivers/clk/clk-si5351.h
>> index 73dc8effc519..f799dc6ea8a1 100644
>> --- a/drivers/clk/clk-si5351.h
>> +++ b/drivers/clk/clk-si5351.h
>> @@ -13,11 +13,11 @@
>>   #define SI5351_PLL_VCO_MIN            600000000
>>   #define SI5351_PLL_VCO_MAX            900000000
>> -#define SI5351_MULTISYNTH_MIN_FREQ        1000000
>> +#define SI5351_MULTISYNTH_MIN_FREQ        300000
> 
>  > The lower limit should be 500KHz (AN619: 
> https://www.skyworksinc.com/-/media/Skyworks/SL/documents/public/application-notes/AN619.pdf) 

The word *about* in the sentence "The R dividers can be used to generate 
frequencies below about 500 kHz." of AN619 made me believe that 500 kHz 
is just a rough approximation and 300 kHz would be a more accurate 
limit. (It used to be 1 MHz in the beginning and they changed it later.)

I am wondering, though, why a SI5351_MULTISYNTH_MIN_FREQ of 300 kHz 
resulted in a wrong output frequency in your case. Was it a 
calculational problem (i.e. invalid register values) or did you actually 
see a wrong output frequency?


> Changing the lower limit in your patch to 500KHz solved the problem.
> 
>>   #define SI5351_MULTISYNTH_DIVBY4_FREQ        150000000
>> -#define SI5351_MULTISYNTH_MAX_FREQ        160000000
>> +#define SI5351_MULTISYNTH_MAX_FREQ        200000000
>>   #define SI5351_MULTISYNTH67_MAX_FREQ        
>> SI5351_MULTISYNTH_DIVBY4_FREQ
>> -#define SI5351_CLKOUT_MIN_FREQ            8000
>> +#define SI5351_CLKOUT_MIN_FREQ            2500
>>   #define SI5351_CLKOUT_MAX_FREQ            SI5351_MULTISYNTH_MAX_FREQ
>>   #define SI5351_CLKOUT67_MAX_FREQ        SI5351_MULTISYNTH67_MAX_FREQ
>> @@ -26,7 +26,7 @@
>>   #define SI5351_PLL_B_MAX            (SI5351_PLL_C_MAX-1)
>>   #define SI5351_PLL_C_MAX            1048575
>>   #define SI5351_MULTISYNTH_A_MIN            6
>> -#define SI5351_MULTISYNTH_A_MAX            1800
>> +#define SI5351_MULTISYNTH_A_MAX            2048
>>   #define SI5351_MULTISYNTH67_A_MAX        254
>>   #define SI5351_MULTISYNTH_B_MAX            (SI5351_MULTISYNTH_C_MAX-1)
>>   #define SI5351_MULTISYNTH_C_MAX            1048575
