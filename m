Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:44982 "EHLO
        epoutp01.samsung.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1041602AbdDUShh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 21 Apr 2017 14:37:37 -0400
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
To: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        dri-devel@lists.freedesktop.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org
Cc: inki.dae@samsung.com, sw0312.kim@samsung.com,
        cw00.choi@samsung.com, javier@osg.samsung.com, krzk@kernel.org,
        jy0922.shim@samsung.com, broonie@kernel.org, robh+dt@kernel.org,
        b.zolnierkie@samsung.com,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH RFC 0/7] HDMI audio support for Exynos Odroid boards
Date: Fri, 21 Apr 2017 19:19:44 +0200
Message-id: <1492795191-31298-1-git-send-email-s.nawrocki@samsung.com>
References: <CGME20170421172007epcas1p25dba753df34c309e6b00ed08ae930043@epcas1p2.samsung.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

In this series I gathered patches touching various subsystems to make 
the overall review easier, finally I'm going to post independently
patches for each subsystem and the dts patch(es) will be postponed
to subsequent merge window.

The main purpose of this series is to add audio codec interface to the Exynos
DRM driver, so HDMI audio can be properly supported, also on boards where
HDMI is the only connector available for audio.

Currently in mainline the ASoC simple-card is used for Odroid XU3, 
I decided to change it and use a dedicated ASoC machine driver, which allowed 
to implemement specific clock settings (EPLL and the I2S root clock adjusted 
to audio sample rates) and to ensure proper number of audio channels 
gets negotiated in multicodec system configuration.

This series is based on v4.11-rc6, has been tested on Odroid XU3. 

Sylwester Nawrocki (7):
  clk: samsung: Add enable/disable operation for PLL36XX clocks
  clk: samsung: Add definitions of some audio related clocks
  clk: samsung: exynos542x: Add EPLL rate table
  drm: exynos: Add driver for HDMI audio interface
  ASoC: Add Odroid sound DT bindings documentation
  ASoC: samsung: Add Odroid ASoC machine driver
  ARM: dts: samsung: Switch to dedicated Odroid sound card binding

 .../devicetree/bindings/sound/samsung,odroid.txt   |  57 ++++++
 arch/arm/boot/dts/exynos4.dtsi                     |   1 +
 arch/arm/boot/dts/exynos5420.dtsi                  |   1 +
 arch/arm/boot/dts/exynos5422-odroidxu3-audio.dtsi  |  59 ++++--
 drivers/clk/samsung/clk-exynos5420.c               |  31 ++-
 drivers/clk/samsung/clk-pll.c                      |  85 ++++----
 drivers/gpu/drm/exynos/Kconfig                     |   1 +
 drivers/gpu/drm/exynos/exynos_hdmi.c               | 220 +++++++++++++++++----
 include/dt-bindings/clock/exynos5420.h             |   3 +
 sound/soc/samsung/Kconfig                          |   8 +
 sound/soc/samsung/Makefile                         |   2 +
 sound/soc/samsung/odroid.c                         | 219 ++++++++++++++++++++
 12 files changed, 599 insertions(+), 88 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/samsung,odroid.txt
 create mode 100644 sound/soc/samsung/odroid.c

-- 
1.9.1

