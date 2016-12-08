Return-Path: <sboyd@codeaurora.org>
Date: Thu, 8 Dec 2016 15:06:32 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Mike Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	Florian Fainelli <f.fainelli@gmail.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>,
	Eric Anholt <eric@anholt.net>, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] clk: bcm: Support rate change propagation on bcm2835
 clocks
Message-ID: <20161208230632.GS5423@codeaurora.org>
References: <1480626020-20031-1-git-send-email-boris.brezillon@free-electrons.com>
 <1480626020-20031-2-git-send-email-boris.brezillon@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1480626020-20031-2-git-send-email-boris.brezillon@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

On 12/01, Boris Brezillon wrote:
> Some peripheral clocks, like the VEC (Video EnCoder) clock need to be set
> to a precise rate (in our case 108MHz). With the current implementation,
> where peripheral clocks are not allowed to forward rate change requests
> to their parents, it is impossible to match this requirement unless the
> bootloader has configured things correctly, or a specific rate has been
> assigned through the DT (with the assigned-clk-rates property).
> 
> Add a new field to struct bcm2835_clock_data to specify which parent
> clocks accept rate change propagation, and support set rate propagation
> in bcm2835_clock_determine_rate().
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
