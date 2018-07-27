Return-Path: <tdas@codeaurora.org>
Subject: Re: [PATCH v5] clk: qcom: Add display clock controller driver for
 SDM845
To: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>,
 Rajendra Nayak <rnayak@codeaurora.org>,
 Amit Nischal <anischal@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 linux-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <1532343275-7027-1-git-send-email-tdas@codeaurora.org>
 <1532343275-7027-2-git-send-email-tdas@codeaurora.org>
 <153264274182.48062.5474788613503562604@swboyd.mtv.corp.google.com>
From: Taniya Das <tdas@codeaurora.org>
Message-ID: <e9771a35-d35f-18d2-2447-2c969cb8fc09@codeaurora.org>
Date: Fri, 27 Jul 2018 13:15:55 +0530
MIME-Version: 1.0
In-Reply-To: <153264274182.48062.5474788613503562604@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
List-ID: <linux-clk.vger.kernel.org>



On 7/27/2018 3:35 AM, Stephen Boyd wrote:
> Quoting Taniya Das (2018-07-23 03:54:35)
>> Add support for the display clock controller found on SDM845
>> based devices. This would allow display drivers to probe and
>> control their clocks.
>>
>> Signed-off-by: Taniya Das <tdas@codeaurora.org>
>> ---
> 
> This is fine to merge as long as you're ok with removing the no rate
> cache flag. I can do that myself so you don't have to resend.
> 

Thanks, please go ahead and remove the flags, in case the display 
drivers would require the flags for any proper use case then we could 
think on re-introducing them.

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

--
