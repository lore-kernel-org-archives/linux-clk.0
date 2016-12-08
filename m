Return-Path: <sboyd@codeaurora.org>
Date: Thu, 8 Dec 2016 15:06:36 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Mike Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	Florian Fainelli <f.fainelli@gmail.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>,
	Eric Anholt <eric@anholt.net>, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] clk: bcm: Allow rate change propagation to PLLH_AUX
 on VEC clock
Message-ID: <20161208230636.GT5423@codeaurora.org>
References: <1480626020-20031-1-git-send-email-boris.brezillon@free-electrons.com>
 <1480626020-20031-3-git-send-email-boris.brezillon@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1480626020-20031-3-git-send-email-boris.brezillon@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

On 12/01, Boris Brezillon wrote:
> The VEC clock requires needs to be set at exactly 108MHz. Allow rate
> change propagation on PLLH_AUX to match this requirement wihtout
> impacting other IPs (PLLH is currently only used by the HDMI encoder,
> which cannot be enabled when the VEC encoder is enabled).
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
