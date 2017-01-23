Return-Path: <rnayak@codeaurora.org>
Message-ID: <5885807E.7040500@codeaurora.org>
Date: Mon, 23 Jan 2017 09:33:10 +0530
From: Rajendra Nayak <rnayak@codeaurora.org>
MIME-Version: 1.0
To: Stephen Boyd <sboyd@codeaurora.org>,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>
CC: mturquette@baylibre.com, linux-clk@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 sricharan@codeaurora.org
Subject: Re: [PATCH] clk: qcom: gdsc: Fix handling of hw control enable/disable
References: <1484027679-18397-1-git-send-email-rnayak@codeaurora.org> <3164de46-a251-3b3f-e6f5-5c3699bb4df8@linaro.org> <20170120232049.GB20800@codeaurora.org>
In-Reply-To: <20170120232049.GB20800@codeaurora.org>
Content-Type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>



On 01/21/2017 04:50 AM, Stephen Boyd wrote:
> On 01/10, Stanimir Varbanov wrote:
>>
>>> +		udelay(1);
>>> +
>>> +		reg = sc->gds_hw_ctrl ? sc->gds_hw_ctrl : sc->gdscr;
>>> +		ret = gdsc_poll_status(sc, reg, 0);
>>
>> This should be gdsc_poll_status(sc, reg, true) because after disabling
>> hw_control we expect that the GDSC is in power_on state.
>>
>>> +		if (ret)
>>> +			return ret;
>>>  	}
>>>  
>>>  	if (sc->pwrsts & PWRSTS_OFF)
>>>
> 
> I expect this patch is going for v2?

Yes, sorry, coming up shortly.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation
