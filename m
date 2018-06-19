Return-Path: <gregory.clement@bootlin.com>
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Stephen Boyd <sboyd@codeaurora.org>,
	Mike Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jason Cooper <jason@lakedaemon.net>,
	Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-arm-kernel@lists.infradead.org,
	Antoine Tenart <antoine.tenart@bootlin.com>,
	=?UTF-8?q?Miqu=C3=A8l=20Raynal?= <miquel.raynal@bootlin.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Nadav Haklai <nadavh@marvell.com>,
	Victor Gu <xigu@marvell.com>,
	Marcin Wojtas <mw@semihalf.com>,
	Wilson Ding <dingwei@marvell.com>,
	Hua Jing <jinghua@marvell.com>,
	Neta Zur Hershkovits <neta@marvell.com>,
	Ken Ma <make@marvell.com>
Subject: [PATCH 0/2] clk: Fix switching CPU rate from 300Mhz to 1.2GHz on Armada 3700
Date: Tue, 19 Jun 2018 14:34:44 +0200
Message-Id: <20180619123446.694-1-gregory.clement@bootlin.com>
List-ID: <linux-clk.vger.kernel.org>

Hello,

in this series the first patch is the main patch which fixes the case
when switching CPU rate from 300Mhz (or 200M MHz) to 1.2GH. See the
commit log for the details. As this one is a fix, it should be applied
on v4.18-rc.

While I was on this file, I also switch to SPDX license identifier,
this one is fine for 4.19*;

Thanks,

Gregory

Gregory CLEMENT (2):
  clk: mvebu: armada-37xx-periph: Fix switching CPU rate from 300Mhz to
    1.2GHz
  clk: mvebu: armada-37xx-periph: switch to SPDX license identifier

 drivers/clk/mvebu/armada-37xx-periph.c | 43 +++++++++++++++++++++++---
 1 file changed, 39 insertions(+), 4 deletions(-)

-- 
2.17.1
