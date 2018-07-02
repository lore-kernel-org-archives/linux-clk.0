Return-Path: <Yixun.Lan@amlogic.com>
From: Yixun Lan <yixun.lan@amlogic.com>
To: Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong
	<narmstrong@baylibre.com>
CC: Yixun Lan <yixun.lan@amlogic.com>, Kevin Hilman <khilman@baylibre.com>,
	Carlo Caione <carlo@caione.org>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Qiufang Dai <qiufang.dai@amlogic.com>, Jian
 Hu <jian.hu@amlogic.com>, Jianxin Qin <jianxin.qin@amlogic.com>,
	<linux-clk@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>
Subject: [PATCH v2 0/2] clk: meson-axg: add pcie related clocks
Date: Mon, 2 Jul 2018 21:31:16 +0000
Message-ID: <20180702213118.19222-1-yixun.lan@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: yixun.lan@amlogic.com
List-ID: <linux-clk.vger.kernel.org>

This patch series try to add clocks for the pcie driver,
Due to ASIC desigin, the mipi clock is also required by the pcie
controller, so we also added in this patch series.


Changes since v1 at [1]:
  -- Separate dt-binding header files
  -- use table to exclude unwanted clock parent

[1] https://lkml.kernel.org/r/20180621122620.13195-1-yixun.lan@amlogic.com

Yixun Lan (2):
  clk: meson-axg: add pcie and mipi clock bindings
  clk: meson-axg: add clocks required by pcie driver

 drivers/clk/meson/axg.c              | 148 +++++++++++++++++++++++++++
 drivers/clk/meson/axg.h              |   6 +-
 include/dt-bindings/clock/axg-clkc.h |   3 +
 3 files changed, 156 insertions(+), 1 deletion(-)

-- 
2.18.0
