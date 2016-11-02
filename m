Return-Path: <sboyd@codeaurora.org>
Date: Wed, 2 Nov 2016 13:39:50 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Rajendra Nayak <rnayak@codeaurora.org>
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	tdas@codeaurora.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 1/7] clk: qcom: Mark a few branch clocks with
 BRANCH_HALT_DELAY
Message-ID: <20161102203950.GK16026@codeaurora.org>
References: <1476876523-27378-1-git-send-email-rnayak@codeaurora.org>
 <1476876523-27378-2-git-send-email-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1476876523-27378-2-git-send-email-rnayak@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On 10/19, Rajendra Nayak wrote:
> We seem to have a few branch clocks within gcc for msm8996 which do
> have a valid halt bit but can't be used to check branch enable/disable
> status as they rely on external clocks in some cases and in some 
> others only toggle during an ongoing bus transaction.
> Mark these with BRANCH_HALT_DELAY, so we just add a delay instead.
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---

Srini tells me that if the pcie pipe clocks are enabled after the
phy is powered up things work fine and the halt bit checks work.
So I don't think we need this patch. Probably the drivers are
enabling all their clocks at probe instead of understanding that
the phy is outputting a clock that goes into gcc to be gated and
then back out into their controller and/or phy.

Also, note that these clocks have parents that should be
populated by the phys, but so far we haven't done that. That
should be fixed as well.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
