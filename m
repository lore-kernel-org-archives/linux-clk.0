Return-Path: <rnayak@codeaurora.org>
Message-ID: <5874679B.8010102@codeaurora.org>
Date: Tue, 10 Jan 2017 10:18:27 +0530
From: Rajendra Nayak <rnayak@codeaurora.org>
MIME-Version: 1.0
To: Stanimir Varbanov <stanimir.varbanov@linaro.org>,
 Sricharan R <sricharan@codeaurora.org>,
 sboyd@codeaurora.org, mturquette@baylibre.com,
 linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 1/2] clk: qcom: gdsc: Add support for gdscs with HW
 control
References: <1479472107-18472-1-git-send-email-sricharan@codeaurora.org> <1479472107-18472-2-git-send-email-sricharan@codeaurora.org> <a0fc11d9-49de-33d1-0cea-bed4e6b0765c@linaro.org>
In-Reply-To: <a0fc11d9-49de-33d1-0cea-bed4e6b0765c@linaro.org>
Content-Type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>

[]..

>>  static int gdsc_toggle_logic(struct gdsc *sc, bool en)
>>  {
>>  	int ret;
>> @@ -164,16 +171,28 @@ static int gdsc_enable(struct generic_pm_domain *domain)
>>  	 */
>>  	udelay(1);
>>  
>> +	/* Turn on HW trigger mode if supported */
>> +	if (sc->flags & HW_CTRL)
>> +		return gdsc_hwctrl(sc, true);
>> +
>>  	return 0;
>>  }
>>  
>>  static int gdsc_disable(struct generic_pm_domain *domain)
>>  {
>>  	struct gdsc *sc = domain_to_gdsc(domain);
>> +	int ret;
>>  
>>  	if (sc->pwrsts == PWRSTS_ON)
>>  		return gdsc_assert_reset(sc);
>>  
>> +	/* Turn off HW trigger mode if supported */
>> +	if (sc->flags & HW_CTRL) {
>> +		ret = gdsc_hwctrl(sc, false);
> 
> Looking in the downstream implementation the disabling of the hw control
> bit shouldn't be enough.
> 
> After disabling hw control bit we must have a 1us delay and polling for
> enabled PWR_ON bit with timeout of 100us, only then we should continue
> with disabling the GDSC in software controlled mode.

Stan, thats right. I will send a patch to fix this up right-away.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation
