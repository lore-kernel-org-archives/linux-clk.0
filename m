Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from hermes.aosc.io ([199.195.250.187]:56618 "EHLO hermes.aosc.io"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751307AbeFVM1C (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 22 Jun 2018 08:27:02 -0400
From: Icenowy Zheng <icenowy@aosc.io>
To: Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-sunxi@googlegroups.com, Icenowy Zheng <icenowy@aosc.io>
Subject: [PATCH v2 0/7] Allwinner A64 DE2 CCU support with dedicated DE2 bus driver
Date: Fri, 22 Jun 2018 20:26:08 +0800
Message-Id: <20180622122615.55836-1-icenowy@aosc.io>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

This patchset tries to implement the Allwinner A64 DE2 as a bus driver,
in order to model the fact that the SRAM claim controls the access to
the whole DE2 memory space.

PATCH 1 and PATCH 4 are for the CCU part.

PATCH 2 is the device tree binding for the A64 DE2 bus, and PATCH 3
implements the bus driver.

PATCH 5 adds the DE2 CCU device tree node, with the DE2 bus node.

PATCH 6 and 7 are HDMI simplefb patches for A64. They're present as a
test to this patchset.

Icenowy Zheng (7):
  dt-bindings: add compatible string for the A64 DE2 CCU
  dt-bindings: add binding for the Allwinner A64 DE2 bus
  bus: add bus driver for accessing Allwinner A64 DE2
  clk: sunxi-ng: add A64 compatible string
  arm64: allwinner: a64: add necessary device tree nodes for DE2 CCU
  arm64: allwinner: a64: add device tree node for HDMI simplefb
  arm64: allwinner: a64: add HDMI regulator to all DTs' simplefb_hdmi

 .../bindings/bus/sun50i-de2-bus.txt           | 37 ++++++++++++++
 .../devicetree/bindings/clock/sun8i-de2.txt   |  1 +
 .../dts/allwinner/sun50i-a64-bananapi-m64.dts |  4 ++
 .../dts/allwinner/sun50i-a64-nanopi-a64.dts   |  4 ++
 .../dts/allwinner/sun50i-a64-olinuxino.dts    |  4 ++
 .../dts/allwinner/sun50i-a64-orangepi-win.dts |  4 ++
 .../boot/dts/allwinner/sun50i-a64-pine64.dts  |  4 ++
 .../dts/allwinner/sun50i-a64-pinebook.dts     |  4 ++
 .../allwinner/sun50i-a64-sopine-baseboard.dts |  4 ++
 .../boot/dts/allwinner/sun50i-a64-teres-i.dts |  4 ++
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 39 ++++++++++++---
 drivers/bus/Kconfig                           | 10 ++++
 drivers/bus/Makefile                          |  1 +
 drivers/bus/sun50i-de2.c                      | 49 +++++++++++++++++++
 drivers/clk/sunxi-ng/ccu-sun8i-de2.c          | 11 ++---
 15 files changed, 167 insertions(+), 13 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/bus/sun50i-de2-bus.txt
 create mode 100644 drivers/bus/sun50i-de2.c

-- 
2.17.1

