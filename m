Return-Path: <georgi.djakov@linaro.org>
Return-Path: <georgi.djakov@linaro.org>
Subject: Re: [PATCH v2 1/5] clk: qcom: Enable gpll0_vote rate propagation on
 MSM8916
To: Stephen Boyd <sboyd@codeaurora.org>
References: <1437757119-6910-1-git-send-email-georgi.djakov@linaro.org>
 <1437757119-6910-2-git-send-email-georgi.djakov@linaro.org>
 <55B27509.8080108@codeaurora.org>
Cc: agross@codeaurora.org, mturquette@linaro.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
From: Georgi Djakov <georgi.djakov@linaro.org>
Message-ID: <55B2F0A7.8070005@linaro.org>
Date: Sat, 25 Jul 2015 05:12:55 +0300
MIME-Version: 1.0
In-Reply-To: <55B27509.8080108@codeaurora.org>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

On 24.07.15 20:25, Stephen Boyd wrote:
> On 07/24/2015 09:58 AM, Georgi Djakov wrote:
>> Currently we are missing the SET_RATE_PARENT flag on gpll0_vote and
>> as a result of that, when it has a child with SET_RATE_PARENT flag,
>> the rate of the child is not propagated up to the gpll0. Fix that
>> by adding the SET_RATE_PARENT flag to gpll0_vote.
>>
>> Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
> 
> This doesn't make any sense. GPLL0 doesn't change rate, so having the flag here on the GPLL0 vote clock doesn't help anything.
> 

Right, gpll0 has a fixed rate. Sorry for the confusion.
