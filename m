Return-Path: <sboyd@codeaurora.org>
Message-ID: <55B27509.8080108@codeaurora.org>
Date: Fri, 24 Jul 2015 10:25:29 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
MIME-Version: 1.0
To: Georgi Djakov <georgi.djakov@linaro.org>
CC: agross@codeaurora.org, mturquette@linaro.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 1/5] clk: qcom: Enable gpll0_vote rate propagation
 on MSM8916
References: <1437757119-6910-1-git-send-email-georgi.djakov@linaro.org> <1437757119-6910-2-git-send-email-georgi.djakov@linaro.org>
In-Reply-To: <1437757119-6910-2-git-send-email-georgi.djakov@linaro.org>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
List-ID: <linux-clk.vger.kernel.org>

On 07/24/2015 09:58 AM, Georgi Djakov wrote:
> Currently we are missing the SET_RATE_PARENT flag on gpll0_vote and
> as a result of that, when it has a child with SET_RATE_PARENT flag,
> the rate of the child is not propagated up to the gpll0. Fix that
> by adding the SET_RATE_PARENT flag to gpll0_vote.
>
> Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>

This doesn't make any sense. GPLL0 doesn't change rate, so having the 
flag here on the GPLL0 vote clock doesn't help anything.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
