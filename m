Return-Path: <pradeepb@codeaurora.org>
Subject: Re: [PATCH 1/5] clk: qcom: ipq4019: Modified the fixed clock rate to
 proper values
To: Stephen Boyd <sboyd@codeaurora.org>, Abhishek Sahu <absahu@codeaurora.org>
References: <1464618758-20965-1-git-send-email-absahu@codeaurora.org>
 <1464618758-20965-2-git-send-email-absahu@codeaurora.org>
 <20160601221808.GI28218@codeaurora.org>
Cc: andy.gross@linaro.org, david.brown@linaro.org, robh+dt@kernel.org,
 pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk,
 mturquette@baylibre.com, galak@codeaurora.org, mmcclint@codeaurora.org,
 varada@codeaurora.org, sricharan@codeaurora.org, architt@codeaurora.org,
 ntelkar@codeaurora.org, linux-arm-msm@vger.kernel.org,
 linux-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
From: "Banavathi, Pradeep" <pradeepb@codeaurora.org>
Message-ID: <9a9ac449-4c14-e0fa-5637-5ca7aac321aa@codeaurora.org>
Date: Thu, 2 Jun 2016 19:48:38 +0530
MIME-Version: 1.0
In-Reply-To: <20160601221808.GI28218@codeaurora.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
List-ID: <linux-clk.vger.kernel.org>

The PLLs on IPQ4019 cannot be reconfigured by design. The recommendation 
is to program these PLLS only once. Since, the  Bootloaders configure 
the PLLs and clocks already. we did not support the recalc rate and 
marked them as fixed clocks.


On 6/2/2016 3:48 AM, Stephen Boyd wrote:
> This was a temporary solution until the PLL recalc code could be
> written. When is the real clk driver coming so we can get rid of
> these fixed rate clks being registered in this driver?
