Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Elaine Zhang <zhangqing@rock-chips.com>
To: heiko@sntech.de, xf@rock-chips.com
Cc: linux-clk@vger.kernel.org, huangtao@rock-chips.com,
        xxx@rock-chips.com, cl@rock-chips.com,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        robh+dt@kernel.org, mark.rutland@arm.com, mturquette@baylibre.com,
        sboyd@codeaurora.org, zhengxing@rock-chips.com,
        Elaine Zhang <zhangqing@rock-chips.com>
Subject: [PATCH v1 0/3] clk: rockchip: support clk controller for RK312X SoC
Date: Wed, 17 May 2017 15:49:19 +0800
Message-Id: <1495007362-10684-1-git-send-email-zhangqing@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Elaine Zhang (3):
  clk: rockchip: add dt-binding header for rk312x
  dt-bindings: add bindings for rk312x clock controller
  clk: rockchip: add clock controller for rk312x

 .../bindings/clock/rockchip,rk312x-cru.txt         |  56 ++
 drivers/clk/rockchip/Makefile                      |   1 +
 drivers/clk/rockchip/clk-rk312x.c                  | 612 +++++++++++++++++++++
 include/dt-bindings/clock/rk312x-cru.h             | 281 ++++++++++
 4 files changed, 950 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rk312x-cru.txt
 create mode 100644 drivers/clk/rockchip/clk-rk312x.c
 create mode 100644 include/dt-bindings/clock/rk312x-cru.h

-- 
1.9.1
