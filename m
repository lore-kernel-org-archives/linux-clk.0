Return-Path: <sboyd@codeaurora.org>
Date: Wed, 23 Nov 2016 16:41:56 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Sricharan R <sricharan@codeaurora.org>
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	rnayak@codeaurora.org, stanimir.varbanov@linaro.org
Subject: Re: [PATCH V2 1/2] clk: qcom: gdsc: Add support for gdscs with HW
 control
Message-ID: <20161124004156.GG6095@codeaurora.org>
References: <1479472107-18472-1-git-send-email-sricharan@codeaurora.org>
 <1479472107-18472-2-git-send-email-sricharan@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1479472107-18472-2-git-send-email-sricharan@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On 11/18, Sricharan R wrote:
> From: Rajendra Nayak <rnayak@codeaurora.org>
> 
> Some GDSCs might support a HW control mode, where in the power
> domain (gdsc) is brought in and out of low power state (while
> unsued) without any SW assistance, saving power.
> Such GDSCs can be configured in a HW control mode when powered on
> until they are explicitly requested to be powered off by software.
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> Signed-off-by: Sricharan R <sricharan@codeaurora.org>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
