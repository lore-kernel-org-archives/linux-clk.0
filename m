Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-wr0-f193.google.com ([209.85.128.193]:45507 "EHLO
        mail-wr0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S936821AbeE2RFP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 29 May 2018 13:05:15 -0400
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Colin Didier <colin.didier@devialet.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org
Cc: Fabio Estevam <fabio.estevam@nxp.com>,
        Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Rob Herring <robh@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        =?UTF-8?q?Cl=C3=A9ment=20Peron?= <clement.peron@devialet.com>
Subject: [PATCH v3 0/5] Reintroduce i.MX EPIT Timer
Date: Tue, 29 May 2018 19:04:31 +0200
Message-Id: <20180529170436.22711-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

From: Clément Peron <clement.peron@devialet.com>

As suggested in the commit message we have added the device tree support,
proper bindings and we moved the driver into the correct folder.

Moreover we made some changes like use of relaxed IO accesor,
implement sched_clock, delay_timer and reduce the clockevents min_delta.

Changes since v2 (Thanks Fabio Estevam):
- Removed unused "ckil" clock
- Add out_iounmap
- Check and handle if clk_prepare_enable failed
- Fix comment typo

Changes since v1 (Thanks Vladimir Zapolskiy):
- Add OF dependency in Kconfig
- Sort header
- Use BIT macro
- Remove useless comments
- Fix incorrect indent
- Fix memory leak
- Add check and handle possible returned error

Clément Peron (2):
  ARM: imx: remove inexistant EPIT timer init
  Documentation: DT: add i.MX EPIT timer binding

Colin Didier (3):
  clk: imx6: add EPIT clock support
  clocksource: add driver for i.MX EPIT timer
  ARM: dts: imx6qdl: add missing compatible and clock properties for
    EPIT

 .../devicetree/bindings/clock/imx6q,epit.txt  |  24 ++
 arch/arm/boot/dts/imx6qdl.dtsi                |  10 +
 arch/arm/mach-imx/common.h                    |   1 -
 drivers/clk/imx/clk-imx6q.c                   |   2 +
 drivers/clocksource/Kconfig                   |  12 +
 drivers/clocksource/Makefile                  |   1 +
 drivers/clocksource/timer-imx-epit.c          | 283 ++++++++++++++++++
 include/dt-bindings/clock/imx6qdl-clock.h     |   4 +-
 8 files changed, 335 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/imx6q,epit.txt
 create mode 100644 drivers/clocksource/timer-imx-epit.c

-- 
2.17.0

