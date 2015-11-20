Return-Path: <sboyd@codeaurora.org>
Date: Fri, 20 Nov 2015 10:49:07 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Loc Ho <lho@apm.com>
Cc: mturquette@baylibre.com, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org, patches@apm.com
Subject: Re: [PATCH] clk: xgene: Fix divider with non-zero shift value
Message-ID: <20151120184907.GU32672@codeaurora.org>
References: <1447960830-8675-1-git-send-email-lho@apm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1447960830-8675-1-git-send-email-lho@apm.com>
List-ID: <linux-clk.vger.kernel.org>

On 11/19, Loc Ho wrote:
> The X-Gene clock driver missed the divider shift operation when
> set the divider value.
> 
> Signed-off-by: Loc Ho <lho@apm.com>

Applied to clk-next + 

Fixes: 308964caeebc ("clk: Add APM X-Gene SoC clock driver")

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
