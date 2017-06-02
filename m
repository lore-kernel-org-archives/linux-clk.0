Return-Path: <sboyd@codeaurora.org>
Date: Fri, 2 Jun 2017 15:41:53 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Eric Anholt <eric@anholt.net>
Cc: Lee Jones <lee@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Stefan Wahren <stefan.wahren@i2se.com>,
	bcm-kernel-feedback-list@broadcom.com, linux-clk@vger.kernel.org,
	Phil Elwell <phil@raspberrypi.org>
Subject: Re: [PATCH] clk: bcm2835: Correct the prediv logic
Message-ID: <20170602224153.GZ20170@codeaurora.org>
References: <20170515173504.11337-1-eric@anholt.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170515173504.11337-1-eric@anholt.net>
List-ID: <linux-clk.vger.kernel.org>

On 05/15, Eric Anholt wrote:
> From: Phil Elwell <phil@raspberrypi.org>
> 
> If a clock has the prediv flag set, both the integer and fractional
> parts must be scaled when calculating the resulting frequency.
> 
> Signed-off-by: Phil Elwell <phil@raspberrypi.org>
> Signed-off-by: Eric Anholt <eric@anholt.net>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
