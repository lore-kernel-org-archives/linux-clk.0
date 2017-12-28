Return-Path: <sboyd@codeaurora.org>
Date: Thu, 28 Dec 2017 14:57:17 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Lori Hikichi <lori.hikichi@broadcom.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Jon Mason <jonmason@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Lori Hikichi <lhikichi@broadcom.com>
Subject: Re: [PATCH v1 4/4] clk: iproc: Minor tidy up of iproc pll data
 structures
Message-ID: <20171228225717.GW7997@codeaurora.org>
References: <1502737241-2040-1-git-send-email-lori.hikichi@broadcom.com>
 <1502737241-2040-5-git-send-email-lori.hikichi@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1502737241-2040-5-git-send-email-lori.hikichi@broadcom.com>
List-ID: <linux-clk.vger.kernel.org>

On 08/14, Lori Hikichi wrote:
> From: Lori Hikichi <lhikichi@broadcom.com>
> 
> There were a few fields in the iproc pll data structures that were
> holding information that was not true state information.
> Using stack variables is sufficient and simplifies the structure.
> There are not any functional changes in this commit.
> 
> Signed-off-by: Lori Hikichi <lori.hikichi@broadcom.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
