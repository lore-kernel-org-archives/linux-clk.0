Return-Path: <sboyd@codeaurora.org>
Date: Wed, 2 Nov 2016 14:51:52 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Rajendra Nayak <rnayak@codeaurora.org>
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	tdas@codeaurora.org
Subject: Re: [PATCH v3 04/11] clk: qcom: Enable FSM mode for votable alpha
 PLLs
Message-ID: <20161102215152.GP16026@codeaurora.org>
References: <1475138152-859-1-git-send-email-rnayak@codeaurora.org>
 <1475138152-859-5-git-send-email-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1475138152-859-5-git-send-email-rnayak@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On 09/29, Rajendra Nayak wrote:
> The votable alpha PLLs need to have the fsm mode enabled as part
> of the initialization. The sequence seems to be the same as used
> by clk-pll, so move the function which does this into a common
> place and reuse it for the clk-alpha-pll
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
