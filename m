Return-Path: <sboyd@codeaurora.org>
Date: Thu, 21 Dec 2017 16:24:07 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Abhishek Sahu <absahu@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh+dt@kernel.org>,
	Andy Gross <andy.gross@linaro.org>,
	David Brown <david.brown@linaro.org>,
	Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org,
	linux-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 08/11] clk: qcom: ipq8074: add NSS ethernet port clocks
Message-ID: <20171222002407.GP7997@codeaurora.org>
References: <1513175142-3702-1-git-send-email-absahu@codeaurora.org>
 <1513175142-3702-9-git-send-email-absahu@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
In-Reply-To: <1513175142-3702-9-git-send-email-absahu@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On 12/13, Abhishek Sahu wrote:
> IPQ8074 has 6 ethernet ports which supports all ethernet speeds
> from 10Mpbs to 10 Gpbs and each speed requires different clock
> rates. Each port has separate TX and RX clocks. These clocks
> use separate external UNIPHY PLL’s which will be registered with
> separate NSS driver. The clock frequency is 125 Mhz for UNIPHY0
> and 312.5 Mhz for UNIPHY1 and UNIPHY2.
> 
> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
