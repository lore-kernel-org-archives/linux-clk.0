Return-Path: <sboyd@codeaurora.org>
Date: Wed, 19 Apr 2017 09:50:40 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Jon Mason <jon.mason@broadcom.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	bcm-kernel-feedback-list@broadcom.com, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Bharat Kumar Reddy Gooty <bharat.gooty@broadcom.com>
Subject: Re: [PATCH] clk: ns2: Correct SDIO bits
Message-ID: <20170419165040.GJ7065@codeaurora.org>
References: <1490047934-3061-1-git-send-email-jon.mason@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1490047934-3061-1-git-send-email-jon.mason@broadcom.com>
List-ID: <linux-clk.vger.kernel.org>

On 03/20, Jon Mason wrote:
> From: Bharat Kumar Reddy Gooty <bharat.gooty@broadcom.com>
> 
> Corrected the bits for power and iso.
> 
> Signed-off-by: Bharat Kumar Reddy Gooty <bharat.gooty@broadcom.com>
> Signed-off-by: Jon Mason <jon.mason@broadcom.com>
> Fixes: f7225a83 ("clk: ns2: add clock support for Broadcom Northstar 2 SoC")
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
