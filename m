Return-Path: <tdas@codeaurora.org>
Subject: Re: [PATCH v3 2/2] clk: qcom: Add lpass clock controller driver for
 SDM845
To: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>,
 Rajendra Nayak <rnayak@codeaurora.org>,
 Amit Nischal <anischal@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 linux-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh@kernel.org
References: <1533298874-22863-1-git-send-email-tdas@codeaurora.org>
 <1533298874-22863-3-git-send-email-tdas@codeaurora.org>
 <153540431524.129321.12826367247850332291@swboyd.mtv.corp.google.com>
 <15984aab-d815-56bb-af9c-7be9cfd9a103@codeaurora.org>
 <153619871329.119890.8761547440925666785@swboyd.mtv.corp.google.com>
From: Taniya Das <tdas@codeaurora.org>
Message-ID: <a74ae0f1-caa7-9b49-e4f4-32b82e2ba423@codeaurora.org>
Date: Thu, 6 Sep 2018 17:01:31 +0530
MIME-Version: 1.0
In-Reply-To: <153619871329.119890.8761547440925666785@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
List-ID: <linux-clk.vger.kernel.org>



On 9/6/2018 7:21 AM, Stephen Boyd wrote:
> Quoting Taniya Das (2018-09-05 11:26:10)
>> On 8/28/2018 2:41 AM, Stephen Boyd wrote:
>>> Quoting Taniya Das (2018-08-03 05:21:14)
>>>> diff --git a/drivers/clk/qcom/lpasscc-sdm845.c b/drivers/clk/qcom/lpasscc-sdm845.c
>>>> new file mode 100644
>>>> index 0000000..6f387f9
>>>> --- /dev/null
>>>> +++ b/drivers/clk/qcom/lpasscc-sdm845.c
>>> [...]
>>>> +
>>>> +/* CLK_OFF would not toggle until LPASS is not out of reset */
>>>
>>> Can we change the branch ops to check for out of reset or not? Do the
>>> clks even work when LPASS isn't out of reset? Why would the clk APIs
>>> even be called on here if it hadn't taken LPASS out of reset?
>>>
>>
>> The branches need to be turned ON before the LPASS is out of reset.
>> But we would not be able to check the CLK_ENABLE bit.
> 
> Ok. Are the branches actually outputting any clk frequency when LPASS is
> in reset? It sounds like the hardware is broken and we can't ever check
> the halt bits?
> 
Yes, they would output when the reset is pulled for LPASS. These are as 
per the steps to be followed to bring the LPASS out of reset.

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

--
