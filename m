Return-Path: <jcrouse@codeaurora.org>
Date: Mon, 6 Aug 2018 09:04:37 -0600
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Amit Nischal <anischal@codeaurora.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Andy Gross <andy.gross@linaro.org>,
	David Brown <david.brown@linaro.org>,
	Rajendra Nayak <rnayak@codeaurora.org>,
	Odelu Kukatla <okukatla@codeaurora.org>,
	Taniya Das <tdas@codeaurora.org>, linux-arm-msm@vger.kernel.org,
	linux-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk-owner@vger.kernel.org
Subject: Re: [PATCH 2/4] clk: qcom: Add clk_rcg2_gfx3d_ops for SDM845
Message-ID: <20180806150437.GE21283@jcrouse-lnx.qualcomm.com>
References: <1528285308-25477-1-git-send-email-anischal@codeaurora.org>
 <1528285308-25477-3-git-send-email-anischal@codeaurora.org>
 <153111693472.143105.11303543263643845656@swboyd.mtv.corp.google.com>
 <1e6d9fc284c3c118203728867f504ec6@codeaurora.org>
 <153250192252.48062.9210075387954345932@swboyd.mtv.corp.google.com>
 <07e0321116993d27d6585bd1a186328d@codeaurora.org>
 <153324986956.10763.5124619734269160725@swboyd.mtv.corp.google.com>
 <ee2113c9dd6a44e9669e60f760c76409@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <ee2113c9dd6a44e9669e60f760c76409@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On Mon, Aug 06, 2018 at 02:37:18PM +0530, Amit Nischal wrote:
> On 2018-08-03 04:14, Stephen Boyd wrote:
> >Quoting Amit Nischal (2018-07-30 04:28:56)
> >>On 2018-07-25 12:28, Stephen Boyd wrote:
> >>>
> >>> Ok. Sounds good! Is the rate range call really needed? It can't be
> >>> determined in the PLL code with some table or avoided by making sure
> >>> GPU
> >>> uses OPP table with only approved frequencies?
> >>>
> >>
> >>Currently fabia PLL code does not have any table to check this and
> >>intention
> >>was to avoid relying on the client to call set_rate with only approved
> >>frequencies so we have added the set_rate_range() call in the GPUCC
> >>driver
> >>in order to set the rate range.
> >>
> >
> >But GPU will use OPP so it doesn't seem like it really buys us anything
> >here. And it really doesn't matter when the clk driver implementation
> >doesn't use the min/max to clamp the values of the round_rate()
> >call. Is
> >that being done here? I need to double check. I would be more convinced
> >if the implementation was looking at min/max to constrain the rate
> >requested.
> >
> 
> So our understanding is that GPU(client) driver will always call the
> set_rate with approved frequencies only and we can completely rely
> on the
> client. Is our understanding is correct?


First: on sdm845 the software doesn't set the GPU clocks - we rely on the GMU
firmware to do that on our behalf but for the GPU at least this is an academic
exercise.

But that said: traditionally we've expected that the clock driver correctly
clamp the requested rate to the correct values. In the past we have taken
advantage of this and we may in the future. I don't think it is reasonable
to require the leaf driver to only pass "approved" frequencies especially
since we depend on our own OPP table that may or may not be similar to the
one used by the clock driver.

Jordan

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
