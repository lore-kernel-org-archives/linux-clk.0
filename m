Return-Path: <sboyd@codeaurora.org>
Date: Fri, 8 Dec 2017 16:18:22 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Abhishek Sahu <absahu@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Andy Gross <andy.gross@linaro.org>,
	David Brown <david.brown@linaro.org>,
	Rajendra Nayak <rnayak@codeaurora.org>,
	linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 10/13] clk: qcom: support for Huayra PLL
Message-ID: <20171209001822.GE7997@codeaurora.org>
References: <1506621050-10129-1-git-send-email-absahu@codeaurora.org>
 <1506621050-10129-11-git-send-email-absahu@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
In-Reply-To: <1506621050-10129-11-git-send-email-absahu@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On 09/28, Abhishek Sahu wrote:
> Following are the major differences in Huayra PLL
> 
> 1. PLL Alpha Value is 16 bits
> 2. Depending on alpha_mode, the pll_alpha_val can be treated as
>    M/N value or as a two’s compliment number.
> 3. Huayra PLL supports PLL dynamic programming. User can change
>    L_VAL, without having to go through the power on sequence.
> 
> Since the decoding of alpha val and dynamic programming are
> completely different from other Alpha PLL’s so this patch
> made adds separate functions for Huayra PLL.
> 
> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
