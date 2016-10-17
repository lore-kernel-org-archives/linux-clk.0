Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from szxga02-in.huawei.com ([119.145.14.65]:13792 "EHLO
        szxga02-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932691AbcJQM07 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 17 Oct 2016 08:26:59 -0400
From: Pan Wen <wenpan@hisilicon.com>
To: <mturquette@baylibre.com>, <sboyd@codeaurora.org>,
        <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <linux@armlinux.org.uk>, <xuwei5@hisilicon.com>
CC: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <howell.yang@hisilicon.com>, <xuejiancheng@hisilicon.com>,
        <jalen.hsu@hisilicon.com>, <lvkuanliang@hisilicon.com>,
        <suwenping@hisilicon.com>, <raojun@hisilicon.com>,
        <kevin.lixu@hisilicon.com>, <wenpan@hisilicon.com>
Subject: [PATCH 0/3] add basic SoC support for HiSilicon Hi3516CV300
Date: Mon, 17 Oct 2016 20:07:02 +0800
Message-ID: <20161017120705.3726-1-wenpan@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi3516CV300 is a SoC designed for HD IP camera. It has an integrated ISP and
H.265 video compression encoder. This patch set is mainly used to add basic SoC
support for Hi3516CV300. It includes crg driver and basic dts files.

Pan Wen (3):
  arm: hisi: add ARCH_MULTI_V5 support
  clk: hisilicon: add CRG driver for Hi3516CV300 SoC
  dts: hisi: add dts files for Hi3516CV300 demo board

 .../devicetree/bindings/clock/hisi-crg.txt         |  50 +++
 arch/arm/boot/dts/Makefile                         |   1 +
 arch/arm/boot/dts/hi3516cv300-demb.dts             | 148 ++++++++
 arch/arm/boot/dts/hi3516cv300.dtsi                 | 397 +++++++++++++++++++++
 arch/arm/mach-hisi/Kconfig                         |  10 +-
 drivers/clk/hisilicon/Kconfig                      |   8 +
 drivers/clk/hisilicon/Makefile                     |   1 +
 drivers/clk/hisilicon/crg-hi3516cv300.c            | 330 +++++++++++++++++
 drivers/clk/hisilicon/crg.h                        |  34 ++
 include/dt-bindings/clock/hi3516cv300-clock.h      |  48 +++
 10 files changed, 1021 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/hisi-crg.txt
 create mode 100644 arch/arm/boot/dts/hi3516cv300-demb.dts
 create mode 100644 arch/arm/boot/dts/hi3516cv300.dtsi
 create mode 100644 drivers/clk/hisilicon/crg-hi3516cv300.c
 create mode 100644 drivers/clk/hisilicon/crg.h
 create mode 100644 include/dt-bindings/clock/hi3516cv300-clock.h

-- 
2.9.3

