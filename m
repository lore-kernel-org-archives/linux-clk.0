Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:23658 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933618AbdA0LnK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 27 Jan 2017 06:43:10 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OKF00JN6QZBLS80@mailout2.w1.samsung.com> for
 linux-clk@vger.kernel.org; Fri, 27 Jan 2017 11:09:11 +0000 (GMT)
Received: from eusmges1.samsung.com (unknown [203.254.199.239])
 by     eucas1p2.samsung.com (KnoxPortal)
 with ESMTP id  20170127110910eucas1p211091bf21c9652186cad7a06512978c8~dnFc-U3Xj1629316293eucas1p2Q
        for <linux-clk@vger.kernel.org>; Fri, 27 Jan 2017 11:09:10 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179])
 by     eucas1p1.samsung.com (KnoxPortal)
 with ESMTP id  20170127110909eucas1p1d54aa2d78332ede8250cee784e70e844~dnFcPXE4E0721107211eucas1p1i
        for <linux-clk@vger.kernel.org>; Fri, 27 Jan 2017 11:09:09 +0000 (GMT)
Received: from AMDC2765.digital.local ([106.116.147.25])
 by     eusync1.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit  (built May  5 2014))
 with ESMTPA id <0OKF001FRQZ1L520@eusync1.samsung.com>  for
 linux-clk@vger.kernel.org; Fri, 27 Jan 2017 11:09:09 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-clk@vger.kernel.org
Subject: [PATCH v2 RESEND 0/3] Exynos5433/TM2: add clocks configuration for
 display subsystem
Date: Fri, 27 Jan 2017 12:08:59 +0100
Message-id: <1485515341-29911-1-git-send-email-m.szyprowski@samsung.com>
References: <CGME20170127110909eucas1p1d54aa2d78332ede8250cee784e70e844@eucas1p1.samsung.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hello,

This patchset is a next step to add support for all power domains on
Exynos5433 SoCs. This patchset contains patches for initial clocks
configuration on TM2/TM2e boards. Till now display subsystem worked only
because the clock hierarchy has been configured by the bootloader.
However when power domains are added, such configuration might be lost
if the display power domain get turned off before display clock
controller's probe.

Patches have been generated on top of linux-next from 25th January 2017.

This is a part of a larger task, which goal is to add support for power
domains on Exynos5433 SoCs and TM2/TM2e boards. All patches needed to get it
working have been pushed to the following git repo:
https://git.linaro.org/people/marek.szyprowski/linux-srpol.git v4.10-next-tm2-pd

Best regards
Marek Szyprowski
Samsung R&D Institute Poland


Changelog:
v2:
 - corrected DISP PLL rate from 266MHz to 250MHz (TM2) and 278MHz (TM2e)
 - added a patch with PLL data for 250MHZ and 278MHz rates

v1:
 - initial version


Patch summary:

Marek Szyprowski (3):
  clk: samsung: exynos5433: Add IDs for PHYCLK_MIPIDPHY0_* clocks
  clk: samsung: exynos5433: Add data for 250MHz and 278MHz PLL rates
  arm64: dts: exynos: Add initial configuration for DISP clocks for
    TM2/TM2e

 .../boot/dts/exynos/exynos5433-tm2-common.dtsi     | 12 ---------
 arch/arm64/boot/dts/exynos/exynos5433-tm2.dts      | 29 ++++++++++++++++++++++
 arch/arm64/boot/dts/exynos/exynos5433-tm2e.dts     | 29 ++++++++++++++++++++++
 drivers/clk/samsung/clk-exynos5433.c               |  8 ++++--
 include/dt-bindings/clock/exynos5433.h             |  5 +++-
 5 files changed, 68 insertions(+), 15 deletions(-)

-- 
1.9.1

