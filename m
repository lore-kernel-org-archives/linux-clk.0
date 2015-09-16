Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Wed, 16 Sep 2015 15:15:31 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Vince Hsu <vinceh@nvidia.com>
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com,
	mturquette@baylibre.com, swarren@wwwdotorg.org,
	thierry.reding@gmail.com, gnurou@gmail.com,
	linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org, Vince Hsu <vince.h@nvidia.com>
Subject: Re: [PATCH] clk: tegra: dfll: add missing rcu_read_unlock() for
 error path
Message-ID: <20150916221531.GN23081@codeaurora.org>
References: <1442384094-22144-1-git-send-email-vinceh@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1442384094-22144-1-git-send-email-vinceh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 09/16, Vince Hsu wrote:
> From: Vince Hsu <vince.h@nvidia.com>
> 
> The commit e770940218028c6a5927fda45f2ca9db5d9b35e0 ("clk: tegra: dfll:
> Properly protect OPP list") added the rcu_read_{lock,unlock} but missed
> one in the error path. So add the missing one.
> 
> Signed-off-by: Vince Hsu <vince.h@nvidia.com>
> ---

I think we'll just squash this into the original patch from
Thierry.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
