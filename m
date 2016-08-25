Return-Path: <sboyd@codeaurora.org>
Date: Thu, 25 Aug 2016 13:02:28 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>,
	David Brown <david.brown@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] clk: gcc-msm8996: Fix pcie 2 pipe register offset
Message-ID: <20160825200228.GO19826@codeaurora.org>
References: <1472124047-22627-1-git-send-email-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1472124047-22627-1-git-send-email-srinivas.kandagatla@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

On 08/25, Srinivas Kandagatla wrote:
> This patch corrects the register offset for pcie2 pipe clock.
> Offset according to datasheet is 0x6e018 instead of 0x6e108.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
