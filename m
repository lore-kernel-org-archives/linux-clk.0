Return-Path: <sboyd@codeaurora.org>
Date: Thu, 11 Feb 2016 16:31:11 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Rajendra Nayak <rnayak@codeaurora.org>
Cc: mturquette@baylibre.com, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 2/6] clk: qcom: gdsc: Add support for gdscs with gds
 hw controller
Message-ID: <20160212003111.GN30978@codeaurora.org>
References: <1448986336-16846-1-git-send-email-rnayak@codeaurora.org>
 <1448986336-16846-3-git-send-email-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1448986336-16846-3-git-send-email-rnayak@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On 12/01, Rajendra Nayak wrote:
> Some gdsc power domains can have a gds_hw_controller block inside
> to help ensure all slave devices within the power domain are idle
> before the gdsc is actually switched off.
> This is mainly useful in power domains which host a MMU, in which
> case its necessary to make sure there are no outstanding MMU operations
> or pending bus transactions before the power domain is turned off.
> 
> In gdscs with gds_hw_controller block, its necessary to check the
> gds_hw_ctrl status bits instead of the ones in gdscr, to determine
> the state of the powerdomain.
> 
> While at it, also move away from using jiffies and use ktime APIs
> instead for busy looping on status bits.
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
