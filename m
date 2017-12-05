Return-Path: <sboyd@codeaurora.org>
Date: Tue, 5 Dec 2017 15:28:54 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Chunyan Zhang <chunyan.zhang@spreadtrum.com>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, Cai Li <cai.li@spreadtrum.com>,
	Orson Zhai <orson.zhai@spreadtrum.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>
Subject: Re: [PATCH V2] clk: fix a panic error caused by accessing NULL
 pointer
Message-ID: <20171205232854.GC4283@codeaurora.org>
References: <20171121092438.19316-1-chunyan.zhang@spreadtrum.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20171121092438.19316-1-chunyan.zhang@spreadtrum.com>
List-ID: <linux-clk.vger.kernel.org>

On 11/21, Chunyan Zhang wrote:
> From: Cai Li <cai.li@spreadtrum.com>
> 
> In some cases the clock parent would be set NULL when doing re-parent,
> it will cause a NULL pointer accessing if clk_set trace event is
> enabled.
> 
> This patch sets the parent as "none" if the input parameter is NULL.
> 
> Fixes: dfc202ead312 (clk: Add tracepoints for hardware operations)
> Signed-off-by: Cai Li <cai.li@spreadtrum.com>
> Signed-off-by: Chunyan Zhang <chunyan.zhang@spreadtrum.com>
> ---

Applied to clk-fixes

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
