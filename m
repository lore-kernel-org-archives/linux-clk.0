Return-Path: <sboyd@codeaurora.org>
Date: Fri, 2 Jun 2017 15:45:26 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Phil Elwell <phil@raspberrypi.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Eric Anholt <eric@anholt.net>,
	Stefan Wahren <stefan.wahren@i2se.com>,
	Florian Fainelli <f.fainelli@gmail.com>, linux-clk@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] clk: bcm2835: Minimise clock jitter for PCM clock
Message-ID: <20170602224526.GC20170@codeaurora.org>
References: <9989244b-ca4d-9081-95d9-b24f51099222@raspberrypi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <9989244b-ca4d-9081-95d9-b24f51099222@raspberrypi.org>
List-ID: <linux-clk.vger.kernel.org>

On 06/01, Phil Elwell wrote:
> Fractional clock dividers generate accurate average frequencies but
> with jitter, particularly when the integer divisor is small.
> 
> Introduce a new metric of clock accuracy to penalise clocks with a good
> average but worse jitter compared to clocks with an average which is no
> better but with lower jitter. The metric is the ideal rate minus the
> worse deviation from that ideal using the nearest integer divisors.
> 
> Use this metric for parent selection for clocks requiring low jitter
> (currently just PCM).
> 
> Signed-off-by: Phil Elwell <phil@raspberrypi.org>
> Reviewed-by: Eric Anholt <eric@anholt.net>
> Acked-by: Stefan Wahren <stefan.wahren@i2se.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
