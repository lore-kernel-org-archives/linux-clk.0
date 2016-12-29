Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from regular1.263xmail.com ([211.150.99.137]:40055 "EHLO
        regular1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752133AbcL2CpN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 28 Dec 2016 21:45:13 -0500
From: Elaine Zhang <zhangqing@rock-chips.com>
To: heiko@sntech.de, mturquette@baylibre.com, sboyd@codeaurora.org,
        xf@rock-chips.com
Cc: robh+dt@kernel.org, mark.rutland@arm.com,
        linux-clk@vger.kernel.org, huangtao@rock-chips.com,
        xxx@rock-chips.com, cl@rock-chips.com,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Elaine Zhang <zhangqing@rock-chips.com>
Subject: [PATCH v5 0/4] clk: rockchip: support clk controller for rk3328 SoC
Date: Thu, 29 Dec 2016 10:45:07 +0800
Message-Id: <1482979511-6847-1-git-send-email-zhangqing@rock-chips.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Changes in v5:
  fix up some code style, remove grf clk init and cru dump.
Changes in v4:
  dropping the "rockchip,cru" and "syscon" properties for bindings of rk3328
  adjust the pacth 3 and 4 order.
  move pll_rk3328 to patch 3.
Changes in v3:
  fix up the pll type pll_rk3328 description and use.
Changes in v2:
  add bindings for rk3328 clock controller

Elaine Zhang (4):
  clk: rockchip: add dt-binding header for rk3328
  dt-bindings: add bindings for rk3328 clock controller
  clk: rockchip: add new pll-type for rk3328
  clk: rockchip: add clock controller for rk3328

 .../bindings/clock/rockchip,rk3328-cru.txt         |  57 ++
 drivers/clk/rockchip/Makefile                      |   1 +
 drivers/clk/rockchip/clk-pll.c                     |  16 +-
 drivers/clk/rockchip/clk-rk3328.c                  | 896 +++++++++++++++++++++
 drivers/clk/rockchip/clk.h                         |  19 +
 include/dt-bindings/clock/rk3328-cru.h             | 403 +++++++++
 6 files changed, 1389 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rk3328-cru.txt
 create mode 100644 drivers/clk/rockchip/clk-rk3328.c
 create mode 100644 include/dt-bindings/clock/rk3328-cru.h

-- 
1.9.1


