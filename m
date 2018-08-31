Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Michael Turquette <mturquette@baylibre.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20180713134446.27882-2-miquel.raynal@bootlin.com>
Cc: Gregory Clement <gregory.clement@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Antoine Tenart <antoine.tenart@bootlin.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Nadav Haklai <nadavh@marvell.com>, linux-clk@vger.kernel.org,
 linux-pm@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
References: <20180713134446.27882-1-miquel.raynal@bootlin.com>
 <20180713134446.27882-2-miquel.raynal@bootlin.com>
Message-ID: <153573780249.93865.8800131343559837962@swboyd.mtv.corp.google.com>
Subject: Re: [RESEND PATCH v3 2/2] clk: mvebu: armada-37xx-periph: add suspend/resume
 support
Date: Fri, 31 Aug 2018 10:50:02 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Miquel Raynal (2018-07-13 06:44:46)
> Add suspend/resume hooks in Armada 37xx peripheral clocks driver to
> handle S2RAM operations.
> =

> One can think that these hooks are useless by comparing the register
> values before and after a suspend/resume cycle: they will look the same
> anyway. This is because of some scripts executed by the Cortex-M3 core
> during ATF operations to init both the clocks and the DDR. These values
> could be modified by the BL33 stage or by Linux itself and should be
> preserved.
> =

> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---

Applied to clk-next
