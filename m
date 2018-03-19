Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Boris Brezillon <boris.brezillon@bootlin.com>, Eric Anholt <eric@anholt.net>,
 Florian Fainelli <f.fainelli@gmail.com>, Lee Jones <lee@kernel.org>,
 Mike Turquette <mturquette@baylibre.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, Stephen Boyd <sboyd@codeaurora.org>,
 Stephen Warren <swarren@wwwdotorg.org>,
 bcm-kernel-feedback-list@broadcom.com, linux-clk@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20180208134338.24590-1-boris.brezillon@bootlin.com>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, stable@vger.kernel.org
References: <20180208134338.24590-1-boris.brezillon@bootlin.com>
Message-ID: <152147697810.242365.18045288520177640685@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH 1/4] clk: bcm2835: Fix ana->maskX definitions
Date: Mon, 19 Mar 2018 09:29:38 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Boris Brezillon (2018-02-08 05:43:35)
> ana->maskX values are already '~'-ed in bcm2835_pll_set_rate(). Remove
> the '~' in the definition to fix ANA setup.
> =

> Note that this commit fixes a long standing bug preventing one from
> using an HDMI display if it's plugged after the FW has booted Linux.
> This is because PLLH is used by the HDMI encoder to generate the pixel
> clock.
> =

> Fixes: 41691b8862e2 ("clk: bcm2835: Add support for programming the audio=
 domain clocks")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> Reviewed-by: Eric Anholt <eric@anholt.net>
> ---

Applied to clk-fixes
