Return-Path: <sboyd@codeaurora.org>
Date: Wed, 19 Apr 2017 09:50:28 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>, linux-clk@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] clk: qcom: clk-smd-rpm: fix rate for branch clks during
 handoff
Message-ID: <20170419165028.GI7065@codeaurora.org>
References: <1490091179-4348-1-git-send-email-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1490091179-4348-1-git-send-email-srinivas.kandagatla@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

On 03/21, Srinivas Kandagatla wrote:
> rpm branch clk rate should requested as either 0 or 1 but not INT_MAX.
> This patch fixes rate request for branch clocks during clk handoff.
> 
> Suggested-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
