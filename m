Return-Path: <sboyd@codeaurora.org>
Date: Fri, 8 Dec 2017 16:18:14 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Abhishek Sahu <absahu@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Andy Gross <andy.gross@linaro.org>,
	David Brown <david.brown@linaro.org>,
	Rajendra Nayak <rnayak@codeaurora.org>,
	linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 13/13] clk: qcom: add read-only alpha pll post divider
 operations
Message-ID: <20171209001814.GB7997@codeaurora.org>
References: <1506621050-10129-1-git-send-email-absahu@codeaurora.org>
 <1506621050-10129-14-git-send-email-absahu@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1506621050-10129-14-git-send-email-absahu@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On 09/28, Abhishek Sahu wrote:
> Some of the divider settings are preconfigured and should not
> be changed by the clock framework during frequency change. This
> patch adds the read-only divider operation for QCOM alpha pll
> post divider which is equivalent to generic divider operations in
> 'commit 79c6ab509558 ("clk: divider: add CLK_DIVIDER_READ_ONLY flag")'.
> 
> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
