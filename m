Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from lucky1.263xmail.com ([211.157.147.131]:49907 "EHLO
	lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750887AbcCLQdK (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Sat, 12 Mar 2016 11:33:10 -0500
From: Shawn Lin <shawn.lin@rock-chips.com>
To: Heiko Stuebner <heiko@sntech.de>,
	Xing Zheng <zhengxing@rock-chips.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	Shawn Lin <shawn.lin@rock-chips.com>
Subject: [PATCH 0/7] Some trivial patches for rockchip clk stuff
Date: Sun, 13 Mar 2016 00:24:31 +0800
Message-Id: <1457799871-3015-1-git-send-email-shawn.lin@rock-chips.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


Hi Heiko and Xing,

After reviewing some clk patches for rk3399, I found some
trivial problems. So this is another round of patches to
slightly improve the code.

Based on v4.7-clk/next branch
git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git



Shawn Lin (7):
  clk: rockchip: remove mux_core_reg from rockchip_cpuclk_reg_data
  clk: rockchip: fix warning reported by kernel-doc
  clk: rockchip: release io resource when rk3036_clk_init failed
  clk: rockchip: release io resource when rk3188_common_clk_init failed
  clk: rockchip: release io resource when rk3368_clk_init failed
  clk: rockchip: remove redundant checking of device_node
  clk: rockchip: fix a typo for rockchip_rk3399_pll_set_params

 drivers/clk/rockchip/clk-pll.c    |  2 +-
 drivers/clk/rockchip/clk-rk3036.c |  1 +
 drivers/clk/rockchip/clk-rk3188.c |  1 +
 drivers/clk/rockchip/clk-rk3368.c |  1 +
 drivers/clk/rockchip/clk.c        |  8 +++-----
 drivers/clk/rockchip/clk.h        | 10 +++++-----
 6 files changed, 12 insertions(+), 11 deletions(-)

-- 
2.3.7


