Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Boris Brezillon <boris.brezillon@bootlin.com>, Eric Anholt <eric@anholt.net>,
 Florian Fainelli <f.fainelli@gmail.com>, Lee Jones <lee@kernel.org>,
 Mike Turquette <mturquette@baylibre.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Stefan Wahren <stefan.wahren@i2se.com>, Stephen Boyd <sboyd@codeaurora.org>,
 bcm-kernel-feedback-list@broadcom.com, linux-clk@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20180322091130.5997-1-boris.brezillon@bootlin.com>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, stable@vger.kernel.org
References: <20180322091130.5997-1-boris.brezillon@bootlin.com>
Message-ID: <152303857267.143116.15438875333965911725@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH v2] clk: bcm2835: De-assert/assert PLL reset signal when
 appropriate
Date: Fri, 06 Apr 2018 11:16:12 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Boris Brezillon (2018-03-22 02:11:30)
> In order to enable a PLL, not only the PLL has to be powered up and
> locked, but you also have to de-assert the reset signal. The last part
> was missing. Add it so PLLs that were not enabled by the FW/bootloader
> can be enabled from Linux.
> =

> Fixes: 41691b8862e2 ("clk: bcm2835: Add support for programming the audio=
 domain clocks")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> ---

Applied to clk-next
