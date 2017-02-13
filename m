Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from regular1.263xmail.com ([211.150.99.134]:37421 "EHLO
        regular1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751948AbdBMK7y (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 13 Feb 2017 05:59:54 -0500
From: Andy Yan <andy.yan@rock-chips.com>
To: heiko@sntech.de, linus.walleij@linaro.org, robh+dt@kernel.org
Cc: shawn.lin@rock-chips.com, linux-clk@vger.kernel.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        sboyd@codeaurora.org, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH 0/7] Rename RK1108 to RV1108
Date: Mon, 13 Feb 2017 18:59:26 +0800
Message-Id: <1486983566-32265-1-git-send-email-andy.yan@rock-chips.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


Rockchip finally named this soc as RV1108, so change
RK1108/rk1108 to RV1108/rv1108 for compatible.


Andy Yan (7):
  dt-bindings: rockchip-dw-mshc: rename RK1108 to RV1108
  dt-bindings: rk1108-cru: rename RK1108 to RV1108
  clk: rockchip: rename RK1108 to RV1108
  dt-bindings: rockchip,pinctrl: rename RK1108 to RV1108
  pinctrl: rockchip: rename RK1108 to RV1108
  ARM: dts: rename RK1108 to RV1108
  ARM: rockchip: reanme RK1108 to RV1108

 Documentation/devicetree/bindings/arm/rockchip.txt |   4 +-
 ...chip,rk1108-cru.txt => rockchip,rv1108-cru.txt} |  12 +-
 .../devicetree/bindings/mmc/rockchip-dw-mshc.txt   |   2 +-
 .../bindings/pinctrl/rockchip,pinctrl.txt          |  16 +-
 arch/arm/boot/dts/Makefile                         |   2 +-
 .../boot/dts/{rk1108-evb.dts => rv1108-evb.dts}    |   7 +-
 arch/arm/boot/dts/{rk1108.dtsi => rv1108.dtsi}     |  24 +-
 drivers/clk/rockchip/Makefile                      |   2 +-
 .../clk/rockchip/{clk-rk1108.c => clk-rv1108.c}    | 414 ++++++++++-----------
 drivers/clk/rockchip/clk.h                         |  28 +-
 drivers/pinctrl/pinctrl-rockchip.c                 |  76 ++--
 .../clock/{rk1108-cru.h => rv1108-cru.h}           |   6 +-
 12 files changed, 300 insertions(+), 293 deletions(-)
 rename Documentation/devicetree/bindings/clock/{rockchip,rk1108-cru.txt => rockchip,rv1108-cru.txt} (83%)
 rename arch/arm/boot/dts/{rk1108-evb.dts => rv1108-evb.dts} (89%)
 rename arch/arm/boot/dts/{rk1108.dtsi => rv1108.dtsi} (94%)
 rename drivers/clk/rockchip/{clk-rk1108.c => clk-rv1108.c} (57%)
 rename include/dt-bindings/clock/{rk1108-cru.h => rv1108-cru.h} (97%)

-- 
2.7.4


