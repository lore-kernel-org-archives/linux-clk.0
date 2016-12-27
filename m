Return-Path: <sboyd@codeaurora.org>
Date: Tue, 27 Dec 2016 13:45:44 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Abhishek Sahu <absahu@codeaurora.org>
Cc: mturquette@baylibre.com, andy.gross@linaro.org, david.brown@linaro.org,
	varada@codeaurora.org, snlakshm@codeaurora.org,
	pradeepb@codeaurora.org, linux-arm-msm@vger.kernel.org,
	linux-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] clk: qcom: ipq4019: Add the cpu clock frequency
 change notifier
Message-ID: <20161227214544.GF8288@codeaurora.org>
References: <1482417654-2998-1-git-send-email-absahu@codeaurora.org>
 <1482417654-2998-2-git-send-email-absahu@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1482417654-2998-2-git-send-email-absahu@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On 12/22, Abhishek Sahu wrote:
> The current driver code gives the crash or gets hang while switching
> the CPU frequency some time. The APSS CPU Clock divider is not glitch
> free so it the APPS clock need to be switched for stable clock during
> the change.
> 
> This patch adds the frequency change notifier for APSS CPU clock. It
> changes the parent of this clock to stable PLL FEPLL500 for
> PRE_RATE_CHANGE event. This event will be generated before actual
> clock set operations. The clock set operation will again change its
> corresponding parent by getting the same from frequency table.
> 
> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
> ---

Applied to clk-ipq4019 and merged into clk-next.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
