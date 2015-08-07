Return-Path: <sboyd@codeaurora.org>
Date: Fri, 7 Aug 2015 15:17:06 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 10/31] clk/mmp: use kmemdup rather than duplicating its
 implementation
Message-ID: <20150807221706.GA16477@codeaurora.org>
References: <1438934377-4922-1-git-send-email-a.hajda@samsung.com>
 <1438934377-4922-11-git-send-email-a.hajda@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1438934377-4922-11-git-send-email-a.hajda@samsung.com>
List-ID: <linux-clk.vger.kernel.org>

On 08/07, Andrzej Hajda wrote:
> The patch was generated using fixed coccinelle semantic patch
> scripts/coccinelle/api/memdup.cocci [1].
> 
> [1]: http://permalink.gmane.org/gmane.linux.kernel/2014320
> 
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
