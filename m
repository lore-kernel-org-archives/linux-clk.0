Return-Path: <sboyd@codeaurora.org>
Date: Thu, 18 Aug 2016 16:51:13 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: yuantian.tang@nxp.com
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, scott.wood@nxp.com
Subject: Re: [PATCH] clk: qoriq: fix a register offset error
Message-ID: <20160818235113.GJ361@codeaurora.org>
References: <1471246100-40713-1-git-send-email-yuantian.tang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1471246100-40713-1-git-send-email-yuantian.tang@nxp.com>
List-ID: <linux-clk.vger.kernel.org>

On 08/15, yuantian.tang@nxp.com wrote:
> From: Tang Yuantian <Yuantian.Tang@nxp.com>
> 
> The offset of Core Cluster clock control/status register
> on cluster group V3 version is different from others, and
> should be plus 0x70000.
> 
> Signed-off-by: Tang Yuantian <yuantian.tang@nxp.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
