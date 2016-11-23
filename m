Return-Path: <sboyd@codeaurora.org>
Date: Wed, 23 Nov 2016 11:57:45 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Eric Anholt <eric@anholt.net>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>,
	bcm-kernel-feedback-list@broadcom.com, linux-clk@vger.kernel.org,
	Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH] clk: bcm2835: Fix ->fixed_divider of pllh_aux
Message-ID: <20161123195745.GH25626@codeaurora.org>
References: <20161122204528.18435-1-eric@anholt.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20161122204528.18435-1-eric@anholt.net>
List-ID: <linux-clk.vger.kernel.org>

On 11/22, Eric Anholt wrote:
> From: Boris Brezillon <boris.brezillon@free-electrons.com>
> 
> There is no fixed divider on pllh_aux.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> Signed-off-by: Eric Anholt <eric@anholt.net>
> Reviewed-by: Eric Anholt <eric@anholt.net>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
