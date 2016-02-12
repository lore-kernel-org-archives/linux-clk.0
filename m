Return-Path: <sboyd@codeaurora.org>
Date: Thu, 11 Feb 2016 16:31:14 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Rajendra Nayak <rnayak@codeaurora.org>
Cc: mturquette@baylibre.com, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 3/6] clk: qcom: gdsc: Add support for votable gdscs
Message-ID: <20160212003114.GO30978@codeaurora.org>
References: <1448986336-16846-1-git-send-email-rnayak@codeaurora.org>
 <1448986336-16846-4-git-send-email-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1448986336-16846-4-git-send-email-rnayak@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On 12/01, Rajendra Nayak wrote:
> Some gdscs might be controlled via voting registers and might not
> really disable when the kernel intends to disable them (due to other
> votes keeping them enabled)
> Mark these gdscs with a flag for we do not check/wait on a disable
> status for these gdscs within the kernel disable callback.
> 
> Also at boot, if these GDSCs are found to be ON, we make sure we
> vote for them before we inform the genpd framework about their
> status. If genpd gets no users, it then disables (removes the vote)
> them as part of genpd_poweroff_unused()
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
