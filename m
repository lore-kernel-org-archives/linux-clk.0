Return-Path: <sboyd@codeaurora.org>
Date: Fri, 28 Jul 2017 11:34:28 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Abhishek Sahu <absahu@codeaurora.org>
Cc: mturquette@baylibre.com, andy.gross@linaro.org, david.brown@linaro.org,
	rnayak@codeaurora.org, linux-arm-msm@vger.kernel.org,
	linux-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC 06/12] Clk: qcom: support for dynamic updating the PLL
Message-ID: <20170728183428.GH2146@codeaurora.org>
References: <1501153825-5181-1-git-send-email-absahu@codeaurora.org>
 <1501153825-5181-7-git-send-email-absahu@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
In-Reply-To: <1501153825-5181-7-git-send-email-absahu@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On 07/27, Abhishek Sahu wrote:
> Some of the Alpha PLL’s support dynamic update in which the
> frequency can be changed dynamically without turning off the PLL.
> 
> This dynamic update requires the following sequence
> 
> 1. Write the desired values to pll_l_val and pll_alpha_val.
> 2. Toggle pll_latch_input from low to high.
> 3. Wait for pll_ack_latch to transition from low to high.
>    The new L and alpha values have been latched. It make
>    take some time for the PLL to fully settle with these
>    new values.
> 4. Pull pll_latch_input low.
> 
> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>

I think Rajendra has a similar patch that was sent. Is this the
same? Can you please look on the list and find it and compare?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
