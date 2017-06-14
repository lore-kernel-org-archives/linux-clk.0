Return-Path: <sboyd@codeaurora.org>
Date: Wed, 14 Jun 2017 09:09:09 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Stefan Wahren <stefan.wahren@i2se.com>
Cc: Danilo Krummrich <danilokrummrich@dk-develop.de>, rjui@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-rpi-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Eric Anholt <eric@anholt.net>,
	Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v3] clk: bcm2835: remove remains from stub clk driver
Message-ID: <20170614160909.GA20170@codeaurora.org>
References: <20170608222900.18039-1-danilokrummrich@dk-develop.de>
 <a6facd69-ca86-1527-52af-f097a905027e@i2se.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <a6facd69-ca86-1527-52af-f097a905027e@i2se.com>
List-ID: <linux-clk.vger.kernel.org>

On 06/13, Stefan Wahren wrote:
> [add Michael, Eric and Florian]
> 
> Am 09.06.2017 um 00:29 schrieb Danilo Krummrich:
> > This commit removes the fixed clocks introduced as a stub clock driver
> > added with commit 75fabc3f6448 ("ARM: bcm2835: add stub clock driver").
> > Originally they were used to drive the AMBA bus and PL011 uart driver.
> > Now these clocks are derived by the CPRMAN clock driver and configured
> > in DT.
> >
> > Additionally, get rid of init_machine function in bcm2835 board file
> > as there's nothing to do any longer.
> >
> > Signed-off-by: Danilo Krummrich <danilokrummrich@dk-develop.de>
> > ---
> > v2: v2: added ACK from Eric Anholt
> > v3: rebased onto: [PATCH] irqchip/bcm2836: Move SMP startup code to arch/arm
> 
> @Michael, @Stephen:
> 
> In case you are okay with this patch, can this go via bcm2835-tree?

There are some patches already in clk-next for
drivers/clk/bcm/clk-bcm2835.c but overall the change looks ok to
me. It looks like conflicts will be minimal to non-existent, so
it should be fine to take outside clk tree.

Acked-by: Stephen Boyd <sboyd@codeaurora.org>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
