Return-Path: <sboyd@codeaurora.org>
Date: Fri, 8 Dec 2017 16:18:53 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Abhishek Sahu <absahu@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Andy Gross <andy.gross@linaro.org>,
	David Brown <david.brown@linaro.org>,
	Rajendra Nayak <rnayak@codeaurora.org>,
	linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 04/13] clk: qcom: fix 16 bit alpha support calculation
Message-ID: <20171209001853.GK7997@codeaurora.org>
References: <1506621050-10129-1-git-send-email-absahu@codeaurora.org>
 <1506621050-10129-5-git-send-email-absahu@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1506621050-10129-5-git-send-email-absahu@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On 09/28, Abhishek Sahu wrote:
> The alpha value calculation function has been written for 40 bit
> alpha which is not coming properly for 16 bit
> 
> 1. Alpha value is being calculated on the basis of
>    ALPHA_BITWIDTH to make the computation easy for 40 bit alpha.
>    After calculating the 32 bit alpha, It is being converted to 40
>    bit alpha by making making lower bits zero. But if actual alpha
>    register width is less than ALPHA_BITWIDTH, then the actual width
>    can be used for calculation
> 
> 2. During 40 bit alpha pll set rate, the lower alpha register is
>    not being configured
> 
> Now the changes have been made to calculate the rate and register
> values from alpha_width instead hardcoding it so that it can work
> for all the cases.
> 
> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
