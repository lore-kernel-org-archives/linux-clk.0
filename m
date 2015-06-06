Return-Path: <sboyd@codeaurora.org>
Date: Fri, 5 Jun 2015 18:14:40 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Georgi Djakov <georgi.djakov@linaro.org>
Cc: mturquette@linaro.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 1/5] clk: qcom: Add support for read-only rcg2 ops
Message-ID: <20150606011440.GG29237@codeaurora.org>
References: <1433508036-28644-1-git-send-email-georgi.djakov@linaro.org>
 <1433508036-28644-2-git-send-email-georgi.djakov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1433508036-28644-2-git-send-email-georgi.djakov@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

On 06/05, Georgi Djakov wrote:
> Some root clock generators can be controlled by other processors. In this
> case modifying them is not recommended. By using the read-only operations,
> the child clocks will be able to get information about their parent - like
> rate etc.
> 
> Suggested-by: Stephen Boyd <sboyd@codeaurora.org>
> Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>

Do we actually need this? I think I wrote the clk ops for the RCG
to make it skip doing anything if there isn't a frequency table.
So to make a read-only RCG all we need to do is remove the
frequency table? Sorry if I led you down the wrong path.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
