Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([85.220.165.71]:44735 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756038AbeFOJvQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 15 Jun 2018 05:51:16 -0400
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "A.s. Dong" <aisheng.dong@nxp.com>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, kernel@pengutronix.de,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, dl-linux-imx <linux-imx@nxp.com>
Subject: [PATCH v2 0/4] add mailbox support for i.MX7D
Date: Fri, 15 Jun 2018 11:51:03 +0200
Message-Id: <20180615095107.24610-1-o.rempel@pengutronix.de>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

20180615 changes v2:
- DT: use mailbox@ instead of mu@
- DT: change interrupts description
- clk: use imx_clk_gate4 instead of imx_clk_gate2
- imx-mailbox: remove last_tx_done support
- imx-mailbox: fix module description 

This patches are providing support for mailbox (Messaging Unit)
for i.MX7D.
Functionality was tested on PHYTEC phyBOARD-Zeta i.MX7D with
Linux running on all cores: ARM Cortex-A7 and ARM Cortex-M4.

Both parts of i.MX messaging Unit are visible for all CPUs available
on i.MX7D. Communication worked independent of MU side in combination
with CPU. For example MU-A used on ARM Cortex-A7 and MU-B used on ARM Cortex-M4
or other ways around.

The question to NXP developers: are there are limitations or
recommendations about MU vs CPU combination? The i.MX7D documentation
talks about "Processor A" and "Processor B". It is not quite clear what
processor it actually is (A7 or M4).

Oleksij Rempel (4):
  clk: imx7d: add IMX7D_MU_ROOT_CLK
  dt-bindings: mailbox: provide imx-mailbox documentation
  ARM: dts: imx7s: add i.MX7 messaging unit support
  mailbox: Add support for i.MX7D messaging unit

 .../bindings/mailbox/imx-mailbox.txt          |  35 +++
 arch/arm/boot/dts/imx7s.dtsi                  |  18 ++
 drivers/clk/imx/clk-imx7d.c                   |   1 +
 drivers/mailbox/Kconfig                       |   6 +
 drivers/mailbox/Makefile                      |   2 +
 drivers/mailbox/imx-mailbox.c                 | 288 ++++++++++++++++++
 6 files changed, 350 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/imx-mailbox.txt
 create mode 100644 drivers/mailbox/imx-mailbox.c

-- 
2.17.1

