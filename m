Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from hermes.aosc.io ([199.195.250.187]:44890 "EHLO hermes.aosc.io"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726093AbeIDJEh (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 4 Sep 2018 05:04:37 -0400
From: Icenowy Zheng <icenowy@aosc.io>
To: Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-sunxi@googlegroups.com,
        Icenowy Zheng <icenowy@aosc.io>
Subject: [PATCH v4 00/11] arm64: allwinner: Add A64 DE2 HDMI support
Date: Tue,  4 Sep 2018 12:40:42 +0800
Message-Id: <20180904044053.15425-1-icenowy@aosc.io>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Allwinner A64 has display engine pipeline like other Allwinner SOC's A83T/H3/H5.

A64 behaviour similar to Allwinner A83T where
Mixer0 => TCON0 => LVDS/RGB/MIPI-DSI
Mixer1 => TCON1 => HDMI
as per Display System Block Diagram from the A64 user manual.

This patchset adds support for the two display pipelines, and enables
the HDMI output on several boards. The first pipeline is not enabled in
this patchset yet, although it's added.

Icenowy Zheng (2):
  clk: sunxi-ng: a64: Add max. rate constraint to video PLLs
  dt-bindings: sun4i-drm: add HDMI VCC supply property for sun8i-dw-hdmi

Jagan Teki (8):
  clk: sunxi-ng: a64: Add minimal rate for video PLLs
  dt-bindings: display: Add compatible for A64 DE2 display pipeline
  drm/sun4i: Add support for A64 mixers
  drm/sun4i: Add support for A64 display engine
  dt-bindings: display: Add compatible for A64 HDMI
  dt-bindings: clock: sun50i-a64-ccu: Add PLL_VIDEO0 macro
  arm64: dts: allwinner: a64: Add display pipeline
  arm64: dts: allwinner: a64: Enable HDMI output on A64 boards w/ HDMI

Jernej Skrabec (1):
  drm/sun4i: Add support for HDMI voltage regulator

 .../bindings/display/sunxi/sun4i-drm.txt      |   9 +
 .../dts/allwinner/sun50i-a64-bananapi-m64.dts |  34 ++++
 .../dts/allwinner/sun50i-a64-nanopi-a64.dts   |  34 ++++
 .../dts/allwinner/sun50i-a64-olinuxino.dts    |  34 ++++
 .../dts/allwinner/sun50i-a64-orangepi-win.dts |  34 ++++
 .../boot/dts/allwinner/sun50i-a64-pine64.dts  |  34 ++++
 .../allwinner/sun50i-a64-sopine-baseboard.dts |  34 ++++
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 170 ++++++++++++++++++
 drivers/clk/sunxi-ng/ccu-sun50i-a64.c         |  48 ++---
 drivers/clk/sunxi-ng/ccu-sun50i-a64.h         |   4 +-
 drivers/gpu/drm/sun4i/sun4i_drv.c             |   1 +
 drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c         |  17 +-
 drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h         |   2 +
 drivers/gpu/drm/sun4i/sun8i_mixer.c           |  24 +++
 include/dt-bindings/clock/sun50i-a64-ccu.h    |   1 +
 15 files changed, 456 insertions(+), 24 deletions(-)

-- 
2.18.0
