Return-Path: <sboyd@codeaurora.org>
Date: Wed, 2 Nov 2016 14:51:32 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Rajendra Nayak <rnayak@codeaurora.org>
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	tdas@codeaurora.org
Subject: Re: [PATCH v3 01/11] clk: qcom: Add support for alpha pll hwfsm ops
Message-ID: <20161102215132.GM16026@codeaurora.org>
References: <1475138152-859-1-git-send-email-rnayak@codeaurora.org>
 <1475138152-859-2-git-send-email-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1475138152-859-2-git-send-email-rnayak@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On 09/29, Rajendra Nayak wrote:
> Some PLLs can support an HW FSM mode (different from the Votable FSMs,
> though its the same bit used to enable Votable FSMs as well as HW FSMs)
> which enables the HW to do the bypass/reset/enable-output-ctrl sequence
> on its own. So all thats needed from SW is to set the FSM_ENA bit.
> PLL_ACTIVE_FLAG is whats used to check if the PLL is active/enabled.
> 
> Some of the PLLs which support HW FSM can also need an OFFLINE request
> that needs to be toggled across the enable/disable. We use a flag to
> identify such cases and handle them.
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
