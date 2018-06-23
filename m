Return-Path: <tdas@codeaurora.org>
Subject: Re: [PATCH v2 0/2] Add display clock controller driver for SDM845
To: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>,
 Rajendra Nayak <rnayak@codeaurora.org>,
 Amit Nischal <anischal@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 linux-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <1528885997-10311-1-git-send-email-tdas@codeaurora.org>
 <152942182329.16708.17615552184746348831@swboyd.mtv.corp.google.com>
From: Taniya Das <tdas@codeaurora.org>
Message-ID: <88b6cfa5-27fd-7fd0-e306-ae9580a39775@codeaurora.org>
Date: Sat, 23 Jun 2018 19:54:03 +0530
MIME-Version: 1.0
In-Reply-To: <152942182329.16708.17615552184746348831@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
List-ID: <linux-clk.vger.kernel.org>

Hello Stephen,

Thanks for the comments.

On 6/19/2018 8:53 PM, Stephen Boyd wrote:
> Quoting Taniya Das (2018-06-13 03:33:15)
>>   [v2]
>>    * Removed unused header file includes.
>>    * Moved the frequency table macro to a common file [1].
>>    * Move to pll config to probe.
>>    * Update SoC name in device tree binding and
>>      also update the Kconfig.
>>
>> Add support for the display clock controller found on SDM845
>> based devices. This would allow display drivers to probe and
>> control their clocks.
>>
>> The Display clock driver depends on the frequency table macro
>> movement to a common file [1].
> 
> Please send that patch along with these patches so the dependency is
> clear.
> 

Please check the latest patch series :
  https://lkml.org/lkml/2018/6/23/109

>>
>>   [1]:  https://lkml.org/lkml/2018/6/13/216
>>

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

--
