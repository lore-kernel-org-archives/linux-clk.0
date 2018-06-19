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
Subject: [PATCH 2/2] clk: mvebu: armada-37xx-periph: switch to SPDX license identifier
Date: Tue, 19 Jun 2018 14:34:46 +0200
Message-Id: <20180619123446.694-3-gregory.clement@bootlin.com>
In-Reply-To: <20180619123446.694-1-gregory.clement@bootlin.com>
References: <20180619123446.694-1-gregory.clement@bootlin.com>
List-ID: <linux-clk.vger.kernel.org>

Adopt the SPDX license identifier headers to ease license compliance
management.

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 drivers/clk/mvebu/armada-37xx-periph.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/clk/mvebu/armada-37xx-periph.c b/drivers/clk/mvebu/armada-37xx-periph.c
index 44e4e27eddad..a51edaab0c5c 100644
--- a/drivers/clk/mvebu/armada-37xx-periph.c
+++ b/drivers/clk/mvebu/armada-37xx-periph.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  * Marvell Armada 37xx SoC Peripheral clocks
  *
@@ -5,10 +6,6 @@
  *
  * Gregory CLEMENT <gregory.clement@free-electrons.com>
  *
- * This file is licensed under the terms of the GNU General Public
- * License version 2 or later. This program is licensed "as is"
- * without any warranty of any kind, whether express or implied.
- *
  * Most of the peripheral clocks can be modelled like this:
  *             _____    _______    _______
  * TBG-A-P  --|     |  |       |  |       |   ______
-- 
2.17.1
