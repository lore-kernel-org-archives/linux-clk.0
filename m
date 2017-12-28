Return-Path: <sboyd@codeaurora.org>
Date: Thu, 28 Dec 2017 14:57:15 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Lori Hikichi <lori.hikichi@broadcom.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Jon Mason <jonmason@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Lori Hikichi <lhikichi@broadcom.com>
Subject: Re: [PATCH v1 3/4] clk: iproc: Allow plls to do minor rate changes
 without reset
Message-ID: <20171228225715.GV7997@codeaurora.org>
References: <1502737241-2040-1-git-send-email-lori.hikichi@broadcom.com>
 <1502737241-2040-4-git-send-email-lori.hikichi@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1502737241-2040-4-git-send-email-lori.hikichi@broadcom.com>
List-ID: <linux-clk.vger.kernel.org>

On 08/14, Lori Hikichi wrote:
> From: Lori Hikichi <lhikichi@broadcom.com>
> 
> The iproc plls are capable of doing small rate changes without the
> need for a full reset and re-lock procedure.  This feature will
> allow for small tweaks to the PLL rate to occur smoothly.
> 
> Signed-off-by: Lori Hikichi <lori.hikichi@broadcom.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
