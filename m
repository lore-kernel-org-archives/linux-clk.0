Return-Path: <sricharan@codeaurora.org>
From: "Sricharan" <sricharan@codeaurora.org>
To: "'Stanimir Varbanov'" <stanimir.varbanov@linaro.org>,
	<sboyd@codeaurora.org>,
	<mturquette@baylibre.com>,
	<linux-clk@vger.kernel.org>,
	<linux-arm-msm@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>,
	<rnayak@codeaurora.org>
References: <1477304297-5248-1-git-send-email-sricharan@codeaurora.org> <1477304297-5248-2-git-send-email-sricharan@codeaurora.org> <e7fe9301-e7ae-1ad3-571c-f5988c5970be@linaro.org>
In-Reply-To: <e7fe9301-e7ae-1ad3-571c-f5988c5970be@linaro.org>
Subject: RE: [PATCH 1/3] clk: qcom: gdsc: Add support for gdscs with HW control
Date: Wed, 26 Oct 2016 09:42:51 +0530
Message-ID: <001201d22f3f$3bb92440$b32b6cc0$@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

Hi Stan,

>Hi Sricharan,
>
>On 10/24/2016 01:18 PM, Sricharan R wrote:
>> From: Rajendra Nayak <rnayak@codeaurora.org>
>>
>> Some GDSCs might support a HW control mode, where in the power
>> domain (gdsc) is brought in and out of low power state (while
>> unsued) without any SW assistance, saving power.
>> Such GDSCs can be configured in a HW control mode when powered on
>> until they are explicitly requested to be powered off by software.
>>
>> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
>> Signed-off-by: Sricharan R <sricharan@codeaurora.org>
>> ---
>>  drivers/clk/qcom/gdsc.c | 15 +++++++++++++++
>>  drivers/clk/qcom/gdsc.h |  1 +
>>  2 files changed, 16 insertions(+)
>>
>> diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
>> index f12d7b2..a5e1c8c 100644
>> --- a/drivers/clk/qcom/gdsc.c
>> +++ b/drivers/clk/qcom/gdsc.c
>> @@ -55,6 +55,13 @@ static int gdsc_is_enabled(struct gdsc *sc, unsigned int reg)
>>  	return !!(val & PWR_ON_MASK);
>>  }
>>
>> +static int gdsc_hwctrl(struct gdsc *sc, bool en)
>> +{
>> +	u32 val = en ? HW_CONTROL_MASK : 0;
>> +
>> +	return regmap_update_bits(sc->regmap, sc->gdscr, HW_CONTROL_MASK, val);
>> +}
>> +
>>  static int gdsc_toggle_logic(struct gdsc *sc, bool en)
>>  {
>>  	int ret;
>> @@ -164,6 +171,10 @@ static int gdsc_enable(struct generic_pm_domain *domain)
>>  	 */
>>  	udelay(1);
>>
>> +	/* Turn on HW trigger mode if supported */
>> +	if (sc->flags & HW_CTRL)
>> +		gdsc_hwctrl(sc, true);
>
   Sure, will add the check.

Regards,
 Sricharan
