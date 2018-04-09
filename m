Return-Path: <tdas@codeaurora.org>
Subject: Re: [PATCH 2/3] clk: qcom: gdsc: Add support to poll for higher
 timeout value
To: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>,
 Rajendra Nayak <rnayak@codeaurora.org>,
 Odelu Kukatla <okukatla@codeaurora.org>,
 Amit Nischal <anischal@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 linux-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <1522665945-28147-1-git-send-email-tdas@codeaurora.org>
 <1522665945-28147-3-git-send-email-tdas@codeaurora.org>
 <152297065260.143116.4250583205921081457@swboyd.mtv.corp.google.com>
From: Taniya Das <tdas@codeaurora.org>
Message-ID: <aa305cce-1244-45cb-267d-565f1f95b0e8@codeaurora.org>
Date: Mon, 9 Apr 2018 14:10:06 +0530
MIME-Version: 1.0
In-Reply-To: <152297065260.143116.4250583205921081457@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
List-ID: <linux-clk.vger.kernel.org>

Hello Stephen,

Thanks for the review comments.

On 4/6/2018 4:54 AM, Stephen Boyd wrote:
> Quoting Taniya Das (2018-04-02 03:45:44)
>> From: Amit Nischal <anischal@codeaurora.org>
>>
>> For some gdscs, it might take longer time up to 500us for
>> updating their status. So add support for the same by
>> defining a new flag 'GDS_TIMEOUT' to mark such gdsc in
>> order to poll their status for longer timeout value.
>>
>> Signed-off-by: Amit Nischal <anischal@codeaurora.org>
>> Signed-off-by: Taniya Das <tdas@codeaurora.org>
>> ---
> 
> Let's just increase the timeout to 500 if it's required? This is a
> timeout, so we're not really expecting to hit it anyway so optimizing
> the uncommon case is not useful.
> --

Will fix this in the next series.

> To unsubscribe from this list: send the line "unsubscribe linux-arm-msm" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

--
