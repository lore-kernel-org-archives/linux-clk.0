Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp5-g21.free.fr ([212.27.42.5]:59613 "EHLO smtp5-g21.free.fr"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1162056AbcEaIjS (ORCPT <rfc822;linux-clk@vger.kernel.org>);
	Tue, 31 May 2016 04:39:18 -0400
Message-Id: <cover.1464680865.git.moinejf@free.fr>
From: Jean-Francois Moine <moinejf@free.fr>
Date: Tue, 31 May 2016 09:47:45 +0200
Subject: [PATCH RFC 0/2] clk: sunxi-ng: Add the A83T clocks
To: Emilio Lopez <emilio@elopez.com.ar>,
	Maxime Ripard <maxime.ripard@free-electrons.com>,
	Chen-Yu Tsai <wens@csie.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-sunxi@googlegroups.com
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

This patch series is a proposal to add the clocks of the sunxi A83T
in the "modern" clock framework proposed by Maxime Ripard.
It is currently being tested on a Banana Pi M3.

Jean-Francois Moine (2):
  clk: sunxi: Add the PLL clocks of the A83T and A80 SoCs
  clk: sunxi-ng: Add the A83T clocks

 drivers/clk/sunxi-ng/ccu-sun8i-a83t.c  | 755 +++++++++++++++++++++++++++++++++
 drivers/clk/sunxi-ng/ccu_ndmp.c        | 247 +++++++++++
 drivers/clk/sunxi-ng/ccu_ndmp.h        |  45 ++
 include/dt-bindings/clock/sun8i-a83t.h | 150 +++++++
 include/dt-bindings/reset/sun8i-a83t.h |  96 +++++
 5 files changed, 1293 insertions(+)
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-a83t.c
 create mode 100644 drivers/clk/sunxi-ng/ccu_ndmp.c
 create mode 100644 drivers/clk/sunxi-ng/ccu_ndmp.h
 create mode 100644 include/dt-bindings/clock/sun8i-a83t.h
 create mode 100644 include/dt-bindings/reset/sun8i-a83t.h

-- 
2.8.3

