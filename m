Return-Path: <sboyd@codeaurora.org>
Date: Wed, 12 Apr 2017 09:48:56 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, Alex Frid <afrid@nvidia.com>
Subject: Re: [PATCH] clk: Add requested rate to clock summary output
Message-ID: <20170412164856.GP7065@codeaurora.org>
References: <1490188803-13034-1-git-send-email-pdeschrijver@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1490188803-13034-1-git-send-email-pdeschrijver@nvidia.com>
List-ID: <linux-clk.vger.kernel.org>

On 03/22, Peter De Schrijver wrote:
> From: Alex Frid <afrid@nvidia.com>
> 
> Added requested rate to clock summary output and to clock dump. This is
> useful for clock tree debugging. Also expand the clock name field in the
> clock tree debugfs output to provide room for deep multi-tier trees like
> on Tegra.
> 
> Signed-off-by: Alex Frid <afrid@nvidia.com>
> Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>

We should print out all the consumers (struct clks) and their
requested rates + prepare/enable counts instead. req_rate is sort
of an internal variable that records what the last aggregated
rate was. I'm not sure if we want to expose that to debugfs.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
