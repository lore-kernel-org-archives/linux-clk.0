Return-Path: <sboyd@codeaurora.org>
Date: Thu, 21 Dec 2017 16:23:54 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Abhishek Sahu <absahu@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh+dt@kernel.org>,
	Andy Gross <andy.gross@linaro.org>,
	David Brown <david.brown@linaro.org>,
	Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org,
	linux-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 03/11] clk: qcom: ipq8074: fix missing GPLL0 divider
 width
Message-ID: <20171222002354.GL7997@codeaurora.org>
References: <1513175142-3702-1-git-send-email-absahu@codeaurora.org>
 <1513175142-3702-4-git-send-email-absahu@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1513175142-3702-4-git-send-email-absahu@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On 12/13, Abhishek Sahu wrote:
> GPLL0 uses 4 bits post divider which should be specified
> in clock driver structure.
> 
> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
