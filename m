Return-Path: <sboyd@codeaurora.org>
Date: Mon, 13 Nov 2017 17:56:59 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Colin King <colin.king@canonical.com>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: cdce925: remove redundant check for non-null
 parent_name
Message-ID: <20171114015659.GB11955@codeaurora.org>
References: <20170905150348.20041-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170905150348.20041-1-colin.king@canonical.com>
List-ID: <linux-clk.vger.kernel.org>

On 09/05, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The check for a non-null parent_name is always true as there is an
> earlier check for a null parent_name that returns -ENODEV. Remove this
> redundant check and always set init.num_parents to 1.
> 
> Detected by CoverityScan CID#1309477 ("Logically dead code")
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
