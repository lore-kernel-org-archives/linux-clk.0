Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Michael Turquette <mturquette@baylibre.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20180713134446.27882-1-miquel.raynal@bootlin.com>
Cc: Gregory Clement <gregory.clement@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Antoine Tenart <antoine.tenart@bootlin.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Nadav Haklai <nadavh@marvell.com>, linux-clk@vger.kernel.org,
 linux-pm@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
References: <20180713134446.27882-1-miquel.raynal@bootlin.com>
Message-ID: <153573779941.93865.11661778631838685753@swboyd.mtv.corp.google.com>
Subject: Re: [RESEND PATCH v3 1/2] clk: mvebu: armada-37xx-periph: save the IP base
 address in the driver data
Date: Fri, 31 Aug 2018 10:49:59 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Miquel Raynal (2018-07-13 06:44:45)
> Prepare the introduction of suspend/resume hooks by having an easy way
> to access all the registers in one go just from a device: add the IP
> base address in the driver data.
> =

> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---

Applied to clk-next
