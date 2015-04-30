Return-Path: <sboyd@codeaurora.org>
Message-ID: <55427D83.3060900@codeaurora.org>
Date: Thu, 30 Apr 2015 12:07:47 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
MIME-Version: 1.0
To: Dong Aisheng <aisheng.dong@freescale.com>, linux-clk@vger.kernel.org
CC: linux-kernel@vger.kernel.org, mturquette@linaro.org,
 shawn.guo@linaro.org, b29396@freescale.com,
 linux-arm-kernel@lists.infradead.org,
 Ranjani.Vaidyanathan@freescale.com, b20596@freescale.com,
 r64343@freescale.com, b20788@freescale.com
Subject: Re: [PATCH RFC v1 2/5] clk: add missing lock when call clk_core_enable
 in clk_set_parent
References: <1429107999-24413-1-git-send-email-aisheng.dong@freescale.com> <1429107999-24413-3-git-send-email-aisheng.dong@freescale.com>
In-Reply-To: <1429107999-24413-3-git-send-email-aisheng.dong@freescale.com>
Content-Type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>

On 04/15/15 07:26, Dong Aisheng wrote:
> clk_core_enable is executed without &enable_clock in clk_set_parent function.
> Adding it to avoid potential race condition issue.
>
> Fixes: 035a61c314eb ("clk: Make clk API return per-user struct clk instances")
> Cc: Mike Turquette <mturquette@linaro.org>
> Cc: Stephen Boyd <sboyd@codeaurora.org>
> Signed-off-by: Dong Aisheng <aisheng.dong@freescale.com>
> ---

Can you please describe the race condition? From what I can tell there
is not a race condition here and we've gone around on this part of the
code before to fix any race conditions.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
