Return-Path: <sboyd@codeaurora.org>
Date: Thu, 2 Jun 2016 11:35:40 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: "Banavathi, Pradeep" <pradeepb@codeaurora.org>
Cc: Abhishek Sahu <absahu@codeaurora.org>, andy.gross@linaro.org,
	david.brown@linaro.org, robh+dt@kernel.org, pawel.moll@arm.com,
	mark.rutland@arm.com, ijc+devicetree@hellion.org.uk,
	mturquette@baylibre.com, galak@codeaurora.org,
	mmcclint@codeaurora.org, varada@codeaurora.org,
	sricharan@codeaurora.org, architt@codeaurora.org,
	ntelkar@codeaurora.org, linux-arm-msm@vger.kernel.org,
	linux-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/5] clk: qcom: ipq4019: Modified the fixed clock rate to
 proper values
Message-ID: <20160602183540.GK28218@codeaurora.org>
References: <1464618758-20965-1-git-send-email-absahu@codeaurora.org>
 <1464618758-20965-2-git-send-email-absahu@codeaurora.org>
 <20160601221808.GI28218@codeaurora.org>
 <9a9ac449-4c14-e0fa-5637-5ca7aac321aa@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <9a9ac449-4c14-e0fa-5637-5ca7aac321aa@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On 06/02, Banavathi, Pradeep wrote:
> The PLLs on IPQ4019 cannot be reconfigured by design. The
> recommendation is to program these PLLS only once. Since, the
> Bootloaders configure the PLLs and clocks already. we did not
> support the recalc rate and marked them as fixed clocks.
> 

(Please don't top post)

That doesn't matter. We recalculate PLL rates on all other qcom
SoCs by reading the hardware even though an overwhelming majority
of them are fixed by the bootloader.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
