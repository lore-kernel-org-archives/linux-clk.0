Return-Path: <sboyd@codeaurora.org>
Date: Thu, 3 Nov 2016 13:34:18 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Sricharan R <sricharan@codeaurora.org>
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	rnayak@codeaurora.org, stanimir.varbanov@linaro.org
Subject: Re: [PATCH 3/3] clk: qcom: Set BRANCH_HALT_DELAY flags for venus
 core0/1 clks
Message-ID: <20161103203418.GA16026@codeaurora.org>
References: <1477304297-5248-1-git-send-email-sricharan@codeaurora.org>
 <1477304297-5248-4-git-send-email-sricharan@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1477304297-5248-4-git-send-email-sricharan@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On 10/24, Sricharan R wrote:
> With the venus subcore0/1 gdscs(powerdomains) in
> hw controlled mode, the clock controller does not handle
> the status bit for the clocks in that domain. So avoid
> checking for the status bit of those clocks by setting the
> BRANCH_HALT_DELAY flag. This avoids the WARN_ONs which
> otherwise occurs when enabling/disabling those clocks.
> 
> Signed-off-by: Sricharan R <sricharan@codeaurora.org>

A better design would be to check if the associated GDSC is in hw
control mode and then skip the checks because the clocks are no
longer under the control of the registers. I presume we only
enable the clocks here to turn on parent clocks which don't turn
on/off automatically, i.e. the PLL.

Given that hw control is a static decision I guess that is an
over-engineered solution though? The problem is that this seems
brittle because we have to keep two things in sync, the branches
and the gdsc. So I guess this is ok, but it deserves a comment
like "GDSC is in HW control" so we know what's going on. Also the
commit text could be more explicit that clocks within the gdsc
power domain don't work when the gdsc is off, and with hw control
of a gdsc we can't tell when the gdsc may be off or on.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
