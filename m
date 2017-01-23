Return-Path: <rnayak@codeaurora.org>
Message-ID: <5885814A.9040304@codeaurora.org>
Date: Mon, 23 Jan 2017 09:36:34 +0530
From: Rajendra Nayak <rnayak@codeaurora.org>
MIME-Version: 1.0
To: Stanimir Varbanov <stanimir.varbanov@linaro.org>,
 sboyd@codeaurora.org, mturquette@baylibre.com
CC: linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, sricharan@codeaurora.org
Subject: Re: [PATCH] clk: qcom: gdsc: Fix handling of hw control enable/disable
References: <1484027679-18397-1-git-send-email-rnayak@codeaurora.org> <3164de46-a251-3b3f-e6f5-5c3699bb4df8@linaro.org>
In-Reply-To: <3164de46-a251-3b3f-e6f5-5c3699bb4df8@linaro.org>
Content-Type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>


[]..

>> ---
>>
>> Stan,
>> If there was a specific issue you saw with venus because of the missing
>> delay and poll, can you check if this fixes any of that.
>>
>>  drivers/clk/qcom/gdsc.c | 58 ++++++++++++++++++++++++++++++++++++++-----------
>>  1 file changed, 45 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
>> index 288186c..6fbd6df 100644
>> --- a/drivers/clk/qcom/gdsc.c
>> +++ b/drivers/clk/qcom/gdsc.c
>> @@ -63,11 +63,26 @@ static int gdsc_hwctrl(struct gdsc *sc, bool en)
>>  	return regmap_update_bits(sc->regmap, sc->gdscr, HW_CONTROL_MASK, val);
>>  }
>>  
>> +static int gdsc_poll_status(struct gdsc *sc, unsigned int reg, bool val)
> 
> Could you rename 'val' to 'en'.

yes, I seem to have messed up with the value to write into the register and
the one to poll. I will fix this up and post a v2.

> 
>> +{
>> +	ktime_t start;
>> +
>> +	start = ktime_get();
>> +	do {
>> +		if (gdsc_is_enabled(sc, reg) == val)
>> +			return 0;
>> +	} while (ktime_us_delta(ktime_get(), start) < TIMEOUT_US);
>> +
>> +	if (gdsc_is_enabled(sc, reg) == val)
>> +		return 0;
>> +
>> +	return -ETIMEDOUT;
>> +}
>> +
>>  static int gdsc_toggle_logic(struct gdsc *sc, bool en)
>>  {
>>  	int ret;
>>  	u32 val = en ? 0 : SW_COLLAPSE_MASK;
>> -	ktime_t start;
>>  	unsigned int status_reg = sc->gdscr;
>>  
>>  	ret = regmap_update_bits(sc->regmap, sc->gdscr, SW_COLLAPSE_MASK, val);
>> @@ -100,16 +115,7 @@ static int gdsc_toggle_logic(struct gdsc *sc, bool en)
>>  		udelay(1);
>>  	}
>>  
>> -	start = ktime_get();
>> -	do {
>> -		if (gdsc_is_enabled(sc, status_reg) == en)
>> -			return 0;
>> -	} while (ktime_us_delta(ktime_get(), start) < TIMEOUT_US);
>> -
>> -	if (gdsc_is_enabled(sc, status_reg) == en)
>> -		return 0;
>> -
>> -	return -ETIMEDOUT;
>> +	return gdsc_poll_status(sc, status_reg, en);
>>  }
>>  
>>  static inline int gdsc_deassert_reset(struct gdsc *sc)
>> @@ -188,8 +194,19 @@ static int gdsc_enable(struct generic_pm_domain *domain)
>>  	udelay(1);
>>  
>>  	/* Turn on HW trigger mode if supported */
>> -	if (sc->flags & HW_CTRL)
>> -		return gdsc_hwctrl(sc, true);
>> +	if (sc->flags & HW_CTRL) {
>> +		ret = gdsc_hwctrl(sc, true);
>> +		/*
>> +		 * Wait for the GDSC to go through a power down and
>> +		 * up cycle.  In case a firmware ends up polling status
>> +		 * bits for the gdsc, it might read an 'on' status before
>> +		 * the GDSC can finish the power cycle.
>> +		 * We wait 1us before returning to ensure the firmware
>> +		 * can't immediately poll the status bits.
>> +		 */
>> +		mb();
> 
> Missing comment for this memory barrier, although I think it is
> pointless because regmap-mmio using readl and writel.

will get rid of the barrier here and below

> 
> 
>> +		udelay(1);
>> +	}
>>  
>>  	return 0;
>>  }
>> @@ -204,9 +221,24 @@ static int gdsc_disable(struct generic_pm_domain *domain)
>>  
>>  	/* Turn off HW trigger mode if supported */
>>  	if (sc->flags & HW_CTRL) {
>> +		unsigned int reg;
>> +
[]..

> 
>> +		udelay(1);
>> +
>> +		reg = sc->gds_hw_ctrl ? sc->gds_hw_ctrl : sc->gdscr;
>> +		ret = gdsc_poll_status(sc, reg, 0);
> 
> This should be gdsc_poll_status(sc, reg, true) because after disabling
> hw_control we expect that the GDSC is in power_on state.

correct, will fix. thanks for the review.


-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation
