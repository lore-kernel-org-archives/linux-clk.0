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
In-Reply-To: <20180208134338.24590-2-boris.brezillon@bootlin.com>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, stable@vger.kernel.org
References: <20180208134338.24590-1-boris.brezillon@bootlin.com>
 <20180208134338.24590-2-boris.brezillon@bootlin.com>
Message-ID: <152147698429.242365.13201145820361051741@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH 2/4] clk: bcm2835: Protect sections updating shared registers
Date: Mon, 19 Mar 2018 09:29:44 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Boris Brezillon (2018-02-08 05:43:36)
> CM_PLLx and A2W_XOSC_CTRL registers are accessed by different clock
> handlers and must be accessed with ->regs_lock held.
> Update the sections where this protection is missing.
> =

> Fixes: 41691b8862e2 ("clk: bcm2835: Add support for programming the audio=
 domain clocks")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> ---

Applied to clk-fixes
