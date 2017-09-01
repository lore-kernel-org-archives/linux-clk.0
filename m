Return-Path: <sboyd@codeaurora.org>
Date: Thu, 31 Aug 2017 18:45:15 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Colin King <colin.king@canonical.com>
Cc: Tero Kristo <t-kristo@ti.com>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-omap@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] clk: ti: check for null return in strrchr to avoid
 null dereferencing
Message-ID: <20170901014515.GW21656@codeaurora.org>
References: <20170726235627.9163-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170726235627.9163-1-colin.king@canonical.com>
List-ID: <linux-clk.vger.kernel.org>

On 07/27, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> strrchr can potentially return a null so the following strlen on the
> null pointer can cause a null dereference. Add a check to see if
> the string postfix is not null before calling strlen.
> 
> Detected by CoverityScan, CID#1452039 ("Dereference null return")
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
