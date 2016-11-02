Return-Path: <sboyd@codeaurora.org>
Date: Wed, 2 Nov 2016 14:51:58 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Rajendra Nayak <rnayak@codeaurora.org>
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	tdas@codeaurora.org
Subject: Re: [PATCH v3 05/11] clk: qcom: Add .is_enabled ops for clk-alpha-pll
Message-ID: <20161102215158.GQ16026@codeaurora.org>
References: <1475138152-859-1-git-send-email-rnayak@codeaurora.org>
 <1475138152-859-6-git-send-email-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1475138152-859-6-git-send-email-rnayak@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On 09/29, Rajendra Nayak wrote:
> This would be useful in subsequent patches when the .set_rate operation
> would need to identify if the PLL is actually enabled
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
