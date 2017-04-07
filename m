Return-Path: <sboyd@codeaurora.org>
Date: Fri, 7 Apr 2017 12:47:04 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: aggregate return codes of notify chains
Message-ID: <20170407194704.GG7065@codeaurora.org>
References: <1490091386-4014-1-git-send-email-pdeschrijver@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1490091386-4014-1-git-send-email-pdeschrijver@nvidia.com>
List-ID: <linux-clk.vger.kernel.org>

On 03/21, Peter De Schrijver wrote:
> In case there are multiple notify chains for the same clocks (because they
> were registered by different users), we need to propagate potential failure
> of any single one of them to the caller. Otherwise we eg risk violating the
> V/f curve when a notifier is used for DVFS.
> 
> Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
> ---

Applied to clk-next. Let's see if anything blows up.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
