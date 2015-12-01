Return-Path: <rnayak@codeaurora.org>
Message-ID: <565D0DE5.50700@codeaurora.org>
Date: Tue, 01 Dec 2015 08:33:01 +0530
From: Rajendra Nayak <rnayak@codeaurora.org>
MIME-Version: 1.0
To: Stephen Boyd <sboyd@codeaurora.org>
CC: mturquette@baylibre.com, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 5/6] clk: qcom: gdsc: Do not check for disabled status
 on votable gdscs
References: <1448517297-32419-1-git-send-email-rnayak@codeaurora.org> <1448517297-32419-6-git-send-email-rnayak@codeaurora.org> <20151201015323.GF17532@codeaurora.org>
In-Reply-To: <20151201015323.GF17532@codeaurora.org>
Content-Type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>


On 12/01/2015 07:23 AM, Stephen Boyd wrote:
> On 11/26, Rajendra Nayak wrote:
>> Some gdscs might be controlled via voting registers and might not
>> really disable when the kernel intends to disable them (due to other
>> votes keeping them enabled)
>> Mark these gdscs with a flag for we do not check/wait on a disable
>> status for these gdscs within the kernel disable callback.
>>
>> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
>> ---
>>  drivers/clk/qcom/gcc-msm8996.c  |  4 ++++
>>  drivers/clk/qcom/gdsc.c         |  4 ++++
>>  drivers/clk/qcom/gdsc.h         | 15 ++++++++-------
>>  drivers/clk/qcom/mmcc-msm8996.c |  3 +++
>>  4 files changed, 19 insertions(+), 7 deletions(-)
> 
> We should have this patch before adding the gdscs that use it.
> Prevents any bisect hole.

yes, will rearrange to move this up in the series.

> 
>>  static struct gdsc usb30_gdsc = {
>> diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
>> index fb2e43c..984537f 100644
>> --- a/drivers/clk/qcom/gdsc.c
>> +++ b/drivers/clk/qcom/gdsc.c
>> @@ -65,6 +65,10 @@ static int gdsc_toggle_logic(struct gdsc *sc, bool en)
>>  	if (ret)
>>  		return ret;
>>  
>> +	/* If disabling votable gdscs, don't poll on status */
>> +	if ((sc->flags & VOTABLE) && !en)
>> +		return 0;
>> +
> 
> There's an explicit delay of 100uS on the disable path for
> votable gdscs in the downstream code. I don't see that here.

right, I just left it out as I did not see any issues testing
without it, when I did enable/disable the votable gdscs in
a tight loop. But maybe my testing was limited to only apss
voting for these so I can put it back in.

> 
>>  	timeout = jiffies + usecs_to_jiffies(TIMEOUT_US);
>>  
>>  	if (sc->gds_hw_ctrl) {
>> diff --git a/drivers/clk/qcom/gdsc.h b/drivers/clk/qcom/gdsc.h
>> index 66a43be..91cbb09 100644
>> --- a/drivers/clk/qcom/gdsc.h
>> +++ b/drivers/clk/qcom/gdsc.h
>> @@ -20,13 +20,6 @@
>>  struct regmap;
>>  struct reset_controller_dev;
>>  
>> -/* Powerdomain allowable state bitfields */
>> -#define PWRSTS_OFF		BIT(0)
>> -#define PWRSTS_RET		BIT(1)
>> -#define PWRSTS_ON		BIT(2)
>> -#define PWRSTS_OFF_ON		(PWRSTS_OFF | PWRSTS_ON)
>> -#define PWRSTS_RET_ON		(PWRSTS_RET | PWRSTS_ON)
>> -
>>  /**
>>   * struct gdsc - Globally Distributed Switch Controller
>>   * @pd: generic power domain
>> @@ -49,6 +42,14 @@ struct gdsc {
>>  	unsigned int			*cxcs;
>>  	unsigned int			cxc_count;
>>  	const u8			pwrsts;
>> +/* Powerdomain allowable state bitfields */
>> +#define PWRSTS_OFF		BIT(0)
>> +#define PWRSTS_RET		BIT(1)
>> +#define PWRSTS_ON		BIT(2)
>> +#define PWRSTS_OFF_ON		(PWRSTS_OFF | PWRSTS_ON)
>> +#define PWRSTS_RET_ON		(PWRSTS_RET | PWRSTS_ON)
> 
> Yes! We should have done this already. I guess I'm ok combining
> it with this patch.
> 
>> +	const u8			flags;
>> +#define VOTABLE		BIT(0)
>>  	struct reset_controller_dev	*rcdev;
>>  	unsigned int			*resets;
>>  	unsigned int			reset_count;
> 

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation
