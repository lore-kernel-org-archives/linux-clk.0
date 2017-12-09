Return-Path: <sboyd@codeaurora.org>
Date: Fri, 8 Dec 2017 16:18:51 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Abhishek Sahu <absahu@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Andy Gross <andy.gross@linaro.org>,
	David Brown <david.brown@linaro.org>,
	Rajendra Nayak <rnayak@codeaurora.org>,
	linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 05/13] clk: qcom: add and use alpha register width from
 PLL properties
Message-ID: <20171209001851.GJ7997@codeaurora.org>
References: <1506621050-10129-1-git-send-email-absahu@codeaurora.org>
 <1506621050-10129-6-git-send-email-absahu@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
In-Reply-To: <1506621050-10129-6-git-send-email-absahu@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On 09/28, Abhishek Sahu wrote:
> Currently SUPPORTS_16BIT_ALPHA flag determines the PLL alpha
> register width. If this flag is set then the alpha register width
> is 16 bits otherwise it is 40 bits. The alpha width is always
> fixed for PLL type so it can be added in PLL properties and clock
> driver don’t have to specify explicitly.
> 
> The SUPPORTS_16BIT_ALPHA flag is unused in the current code so
> it’s safe to remove this flags.
> 
> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
