Return-Path: <gregory.clement@free-electrons.com>
From: Gregory CLEMENT <gregory.clement@free-electrons.com>
To: Stephen Boyd <sboyd@codeaurora.org>,
	Mike Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jason Cooper <jason@lakedaemon.net>,
	Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Gregory CLEMENT <gregory.clement@free-electrons.com>,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
	linux-arm-kernel@lists.infradead.org,
	Antoine Tenart <antoine.tenart@free-electrons.com>,
	=?UTF-8?q?Miqu=C3=A8l=20Raynal?= <miquel.raynal@free-electrons.com>,
	Nadav Haklai <nadavh@marvell.com>,
	Victor Gu <xigu@marvell.com>,
	Marcin Wojtas <mw@semihalf.com>,
	Wilson Ding <dingwei@marvell.com>,
	Hua Jing <jinghua@marvell.com>,
	Neta Zur Hershkovits <neta@marvell.com>
Subject: [PATCH 0/3] Add DVFS support on CPU clock for Armada 37xx
Date: Thu, 30 Nov 2017 14:40:26 +0100
Message-Id: <20171130134029.20751-1-gregory.clement@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

Hi,

This small series is needed to use DVFS on Armada 37xx. When DVFS is
enabled the CPU clock setting is done using an other set of registers
from the North Bridge Power Management block.

The series adds the possibility to modify the CPU frequency using the
associate load level matching the target frequency. However
configuring the frequencies for each load is done by the cpufreq
driver submitted in a separate series.

Obviously having both series (cpufreq and clk) is needed to support
DVFS on Armada 37xx, but there is no dependencies between the series
(for building or at runtime).

Thanks,

Gregory

Gregory CLEMENT (3):
  clk: mvebu: armada-37xx-periph: cosmetic changes
  clk: mvebu: armada-37xx-periph: prepare cpu clk to be used with DVFS
  clk: mvebu: armada-37xx-periph: add DVFS support for cpu clocks

 drivers/clk/mvebu/armada-37xx-periph.c | 310 +++++++++++++++++++++++++++++++--
 1 file changed, 293 insertions(+), 17 deletions(-)

-- 
2.15.0
