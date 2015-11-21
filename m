Return-Path: <sboyd@codeaurora.org>
Date: Fri, 20 Nov 2015 16:41:41 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Georgi Djakov <georgi.djakov@linaro.org>
Cc: agross@codeaurora.org, mturquette@baylibre.com,
	linux-clk@vger.kernel.org, bjorn.andersson@sonymobile.com,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v4 2/5] arm64: dts: qcom: msm8916: Add fixed rate
 on-board oscillator
Message-ID: <20151121004141.GF28998@codeaurora.org>
References: <1447941480-27487-1-git-send-email-georgi.djakov@linaro.org>
 <1447941480-27487-3-git-send-email-georgi.djakov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1447941480-27487-3-git-send-email-georgi.djakov@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

On 11/19, Georgi Djakov wrote:
> Currently the rates of the xo and sleep clocks are hard-coded in the
> GCC driver, but this is a board layout description that actually should
> be in the DT. Moving them into DT also allows us to insert the RPM
> controlled clocks between the DT and GCC clocks.
> 
> Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
> ---

I'll leave this one to Andy.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
