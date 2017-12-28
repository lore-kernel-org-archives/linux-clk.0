Return-Path: <sboyd@codeaurora.org>
Date: Thu, 28 Dec 2017 14:57:13 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Lori Hikichi <lori.hikichi@broadcom.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Jon Mason <jonmason@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Simran Rai <ssimran@broadcom.com>
Subject: Re: [PATCH v1 2/4] clk: iproc: Fix error in the pll post divider
 rate calculation
Message-ID: <20171228225713.GU7997@codeaurora.org>
References: <1502737241-2040-1-git-send-email-lori.hikichi@broadcom.com>
 <1502737241-2040-3-git-send-email-lori.hikichi@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1502737241-2040-3-git-send-email-lori.hikichi@broadcom.com>
List-ID: <linux-clk.vger.kernel.org>

On 08/14, Lori Hikichi wrote:
> The pll post divider code was using DIV_ROUND_UP when determining the
> divider value best suited to produce the target frequency.
> Using DIV_ROUND_CLOSEST will give us better divider values when
> the division results in a small remainder.
> Also, change the post divider clock over to the determine_rate api
> instead of round_rate.
> 
> Signed-off-by: Simran Rai <ssimran@broadcom.com>
> Signed-off-by: Lori Hikichi <lori.hikichi@broadcom.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
