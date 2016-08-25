Return-Path: <rnayak@codeaurora.org>
Message-ID: <57BEB77F.4090906@codeaurora.org>
Date: Thu, 25 Aug 2016 14:46:47 +0530
From: Rajendra Nayak <rnayak@codeaurora.org>
MIME-Version: 1.0
To: Stephen Boyd <sboyd@codeaurora.org>
CC: mturquette@baylibre.com, linux-clk@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 tdas@codeaurora.org
Subject: Re: [PATCH v2 07/10] clk: qcom: Add support to enable FSM mode for
 votable alpha PLLs
References: <1470904858-11930-1-git-send-email-rnayak@codeaurora.org> <1470904858-11930-8-git-send-email-rnayak@codeaurora.org> <20160824063152.GY6502@codeaurora.org>
In-Reply-To: <20160824063152.GY6502@codeaurora.org>
Content-Type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>



On 08/24/2016 12:01 PM, Stephen Boyd wrote:
> On 08/11, Rajendra Nayak wrote:
>> diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
>> index f7c226a..6bf5abd 100644
>> --- a/drivers/clk/qcom/common.c
>> +++ b/drivers/clk/qcom/common.c
>> @@ -25,6 +25,14 @@
>>  #include "reset.h"
>>  #include "gdsc.h"
>>  
>> +#define PLL_LOCK_COUNT_SHIFT	8
>> +#define PLL_LOCK_COUNT_MASK	0x3f
>> +#define PLL_BIAS_COUNT_SHIFT	14
>> +#define PLL_BIAS_COUNT_MASK	0x3f
>> +#define PLL_VOTE_FSM_ENA	BIT(20)
>> +#define PLL_DYN_FSM_ENA		BIT(20)
>> +#define PLL_VOTE_FSM_RESET	BIT(21)
> 
> These appear but aren't deleted from anywhere else so I suspect
> now we have two copies of these defines somewhere? Perhaps this
> should go into common.h as well?

yes, these are used in clk-pll.c as well, so could as well move them
over to common.h instead of having two copies

> 

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation
