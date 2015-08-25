Return-Path: <sboyd@codeaurora.org>
Date: Tue, 25 Aug 2015 11:29:28 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Georgi Djakov <georgi.djakov@linaro.org>
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	stanimir.varbanov@linaro.org
Subject: Re: [PATCH] clk: qcom: Fix MSM8916 prng clock enable bit
Message-ID: <20150825182928.GI19120@codeaurora.org>
References: <1440505663-6218-1-git-send-email-georgi.djakov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1440505663-6218-1-git-send-email-georgi.djakov@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

On 08/25, Georgi Djakov wrote:
> Fix the enable bit of the pseudorandom number generator clock.
> 
> Reported-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> Fixes: 3966fab8b6ab "clk: qcom: Add MSM8916 Global Clock Controller support"
> Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
