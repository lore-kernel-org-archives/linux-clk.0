Return-Path: <sboyd@codeaurora.org>
Date: Thu, 25 Aug 2016 12:51:13 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>,
	David Brown <david.brown@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: select GDSC for msm8996 gcc and mmcc
Message-ID: <20160825195113.GL19826@codeaurora.org>
References: <1472124487-22776-1-git-send-email-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1472124487-22776-1-git-send-email-srinivas.kandagatla@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

On 08/25, Srinivas Kandagatla wrote:
> This patch selects QCOM_GDSC Kconfig for msm8996 GCC and MMCC clock
> controllers, as these provide some of the gdscs on the SOC.
> 
> Also selecting this config will make it align with other drivers which
> do the same.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

This is a bug fix? Needs a fixes tag I think

Fixes: 52111672f791 ("clk: qcom: gdsc: Add GDSCs in msm8996 GCC")
Fixes: 7e824d507909 ("clk: qcom: gdsc: Add mmcc gdscs for msm8996 family")

I'll queue it up in linux-next.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
