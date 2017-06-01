Return-Path: <phil@raspberrypi.org>
Subject: Re: [PATCH v2 2/2] clk: bcm2835: Minimise clock jitter for PCM clock
To: Eric Anholt <eric@anholt.net>,
        Michael Turquette
 <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Florian Fainelli <f.fainelli@gmail.com>, linux-clk@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <b9208d9b-c7bb-49a3-85d9-231c8b41eb8c@raspberrypi.org>
 <a507a7e7-3c64-1dcb-98f1-a7f94364f26c@raspberrypi.org>
 <87bmq8btfe.fsf@eliezer.anholt.net>
From: Phil Elwell <phil@raspberrypi.org>
Message-ID: <1c434318-eb0a-b669-9a0a-780993b1c03d@raspberrypi.org>
Date: Thu, 1 Jun 2017 09:46:33 +0100
MIME-Version: 1.0
In-Reply-To: <87bmq8btfe.fsf@eliezer.anholt.net>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

On 31/05/2017 22:36, Eric Anholt wrote:
> Phil Elwell <phil@raspberrypi.org> writes:
> 
>> Fractional clock dividers generate accurate average frequencies but
>> with jitter, particularly when the integer divisor is small.
>>
>> Introduce a new metric of clock accuracy to penalise clocks with a good
>> average but worse jitter compared to clocks with an average which is no
>> better but with lower jitter. The metric is the ideal rate minus the
>> worse deviation from that ideal using the nearest integer divisors.
> 
> "worst" the second time

According to the rules of English grammar, you should only use the superlative
("worst") when comparing something to a group. In this case we are only
comparing two things - the distance to the nearest-neighbour integers - so the
comparitive ("worse") is correct.

>> Use this metric for parent selection for clocks requiring low jitter
>> (currently just PCM).
>>
>> Signed-off-by: Phil Elwell <phil@raspberrypi.org>
>> ---
>>  drivers/clk/bcm/clk-bcm2835.c | 40 +++++++++++++++++++++++++++++++++++-----
>>  1 file changed, 35 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/clk/bcm/clk-bcm2835.c b/drivers/clk/bcm/clk-bcm2835.c
>> index 81ecd4c..c7ee951 100644
>> --- a/drivers/clk/bcm/clk-bcm2835.c
>> +++ b/drivers/clk/bcm/clk-bcm2835.c
>> @@ -530,6 +530,7 @@ struct bcm2835_clock_data {
>>  
>>  	bool is_vpu_clock;
>>  	bool is_mash_clock;
>> +	bool low_jitter;
>>  
>>  	u32 tcnt_mux;
>>  };
>> @@ -1124,7 +1125,8 @@ static unsigned long bcm2835_clock_choose_div_and_prate(struct clk_hw *hw,
>>  							int parent_idx,
>>  							unsigned long rate,
>>  							u32 *div,
>> -							unsigned long *prate)
>> +							unsigned long *prate,
>> +							unsigned long *avgrate)
>>  {
>>  	struct bcm2835_clock *clock = bcm2835_clock_from_hw(hw);
>>  	struct bcm2835_cprman *cprman = clock->cprman;
>> @@ -1136,11 +1138,34 @@ static unsigned long bcm2835_clock_choose_div_and_prate(struct clk_hw *hw,
>>  	parent = clk_hw_get_parent_by_index(hw, parent_idx);
>>  
>>  	if (!(BIT(parent_idx) & data->set_rate_parent)) {
>> +		unsigned long tmp_rate;
>> +
>>  		*prate = clk_hw_get_rate(parent);
>>  		*div = bcm2835_clock_choose_div(hw, rate, *prate, true);
>>  
>> -		return bcm2835_clock_rate_from_divisor(clock, *prate,
>> -						       *div);
>> +		tmp_rate = bcm2835_clock_rate_from_divisor(clock, *prate, *div);
>> +		*avgrate = tmp_rate;
>> +
>> +		if (data->low_jitter && (*div & CM_DIV_FRAC_MASK)) {
>> +			unsigned long high, low;
>> +			u32 int_div = *div & ~CM_DIV_FRAC_MASK;
>> +
>> +			high = bcm2835_clock_rate_from_divisor(clock, *prate,
>> +							       int_div);
>> +			int_div += CM_DIV_FRAC_MASK + 1;
>> +			low = bcm2835_clock_rate_from_divisor(clock, *prate,
>> +							      int_div);
>> +
>> +			/*
>> +			 * Return a value which is the maximum deviation
>> +			 * below the ideal rate, for use as a metric.
>> +			 */
>> +			if ((tmp_rate - low) < (high - tmp_rate))
>> +				tmp_rate = low;
>> +			else
>> +				tmp_rate -= high - tmp_rate;
> 
> Simplification suggestion: Remove tmp_rate variable, just assign to
> rate_from_divisor result to *avgrate.  At the end of the low_jitter
> block, just "return *avgrate - max(*avgrate - low, high - *avgrate)".

Yes, I like that.

> With that, feel free to add:
> 
> Reviewed-by: Eric Anholt <eric@anholt.net>

Thanks - I will.

Phil
