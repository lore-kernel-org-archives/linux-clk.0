Return-Path: <sboyd@codeaurora.org>
Date: Mon, 22 Feb 2016 12:59:03 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: msm8960: fix ce3_core clk enable register
Message-ID: <20160222205903.GU4847@codeaurora.org>
References: <1456141419-7439-1-git-send-email-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1456141419-7439-1-git-send-email-srinivas.kandagatla@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

On 02/22, Srinivas Kandagatla wrote:
> This patch corrects the enable register offset which is actually 0x36cc
> instead of 0x36c4
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---

Applied to clk-next + added fixes tag

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
