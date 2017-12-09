Return-Path: <sboyd@codeaurora.org>
Date: Fri, 8 Dec 2017 16:18:27 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Abhishek Sahu <absahu@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Andy Gross <andy.gross@linaro.org>,
	David Brown <david.brown@linaro.org>,
	Rajendra Nayak <rnayak@codeaurora.org>,
	linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	Taniya Das <tdas@codeaurora.org>
Subject: Re: [PATCH 08/13] clk: qcom: support for dynamic updating the PLL
Message-ID: <20171209001827.GG7997@codeaurora.org>
References: <1506621050-10129-1-git-send-email-absahu@codeaurora.org>
 <1506621050-10129-9-git-send-email-absahu@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
In-Reply-To: <1506621050-10129-9-git-send-email-absahu@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On 09/28, Abhishek Sahu wrote:
> Some of the Alpha PLL’s support dynamic update in which the
> frequency can be changed dynamically without turning off the PLL.
> 
> This dynamic update requires the following sequence
> 
> 1. Write the desired values to pll_l_val and pll_alpha_val
> 2. Toggle pll_latch_input from low to high
> 3. Wait for pll_ack_latch to transition from low to high
>    The new L and alpha values have been latched. It make
>    take some time for the PLL to fully settle with these
>    new values
> 4. Pull pll_latch_input low
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
