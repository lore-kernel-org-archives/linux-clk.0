Return-Path: <phil@raspberrypi.org>
Subject: Re: [PATCH 2/2] clk: bcm2835: Minimise clock jitter for PCM clock
To: Stefan Wahren <stefan.wahren@i2se.com>, linux-clk@vger.kernel.org,
        Eric Anholt <eric@anholt.net>, linux-kernel@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Florian Fainelli
 <f.fainelli@gmail.com>,
        linux-rpi-kernel@lists.infradead.org
References: <b9208d9b-c7bb-49a3-85d9-231c8b41eb8c@raspberrypi.org>
 <1412052002.45738.1496171081779@email.1und1.de>
From: Phil Elwell <phil@raspberrypi.org>
Message-ID: <7aa4fb5f-65e3-56ed-9792-e38a947346b9@raspberrypi.org>
Date: Wed, 31 May 2017 09:33:26 +0100
MIME-Version: 1.0
In-Reply-To: <1412052002.45738.1496171081779@email.1und1.de>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

Hi Stefan,

On 30/05/2017 20:04, Stefan Wahren wrote:
> Hi Phil,
> 
>> Phil Elwell <phil@raspberrypi.org> hat am 30. Mai 2017 um 18:28 geschrieben:
>>
>>
>> Fractional clock dividers generate accurate average frequencies but
>> with jitter, particularly when the integer divisor is small.
>>
>> Introduce a new metric of clock accuracy to penalise clocks with a good
>> average but worse jitter compared to clocks with an average which is no
>> better but with lower jitter. The metric is the ideal rate minus the
>> worse deviation from that ideal using the nearest integer divisors.
>>
>> Use this metric for parent selection for clocks requiring low jitter
>> (currently just PCM).
>>
>> Signed-off-by: Phil Elwell <phil@raspberrypi.org>
>> ---
>>  drivers/clk/bcm/clk-bcm2835.c | 39 ++++++++++++++++++++++++++++++++++-----
>>  1 file changed, 34 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/clk/bcm/clk-bcm2835.c b/drivers/clk/bcm/clk-bcm2835.c
>> index facc346..e0ce5e7 100644
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
>> @@ -1136,11 +1138,33 @@ static unsigned long bcm2835_clock_choose_div_and_prate(struct clk_hw *hw,
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
>> +			u32 idiv = *div & ~CM_DIV_FRAC_MASK;
>> +
>> +			high = bcm2835_clock_rate_from_divisor(clock, *prate,
>> +							       idiv);
>> +			idiv += CM_DIV_FRAC_MASK + 1;
>> +			low = bcm2835_clock_rate_from_divisor(clock, *prate,
>> +							      idiv);
> 
> What about int_div or intdiv instead of idiv as variable name?

OK - int_div matches tmp_rate.

>> +
>> +			/* Return a value which is the maximum deviation
>> +			 * below the ideal rate, for use as a metric.
>> +			 */
> 
> Please fix coding style of the comment.

Oops. I'm surprised checkpatch didn't complain about that.

Thanks,

Phil
