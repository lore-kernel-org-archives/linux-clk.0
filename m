Return-Path: <sboyd@codeaurora.org>
Date: Tue, 23 Aug 2016 23:28:32 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Rajendra Nayak <rnayak@codeaurora.org>
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	tdas@codeaurora.org
Subject: Re: [PATCH v2 09/10] clk: qcom: Add .is_enabled ops for clk-alpha-pll
Message-ID: <20160824062832.GX6502@codeaurora.org>
References: <1470904858-11930-1-git-send-email-rnayak@codeaurora.org>
 <1470904858-11930-10-git-send-email-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1470904858-11930-10-git-send-email-rnayak@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On 08/11, Rajendra Nayak wrote:
> This would be useful in subsequent patches when the .set_rate operation
> would need to identify if the PLL is actually enabled
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---

Hmmm I suspect I never implemented the is_enabled op because that
will happen to turn off clks during late init that shouldn't
otherwise be disabled because the framework now can see that some
PLL is enabled out of the bootloader. Is that happening now? We
really should fix the framework to make this not be a problem,
mostly by finishing off the clk handoff patches that Mike posted
a while back. But either way, I'm worried with these patches that
implement is_enabled ops.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
