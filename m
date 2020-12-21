Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CF7BC43331
	for <linux-clk@archiver.kernel.org>; Mon, 21 Dec 2020 15:07:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E425E22C7E
	for <linux-clk@archiver.kernel.org>; Mon, 21 Dec 2020 15:07:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725849AbgLUPHW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 21 Dec 2020 10:07:22 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:41453 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725807AbgLUPHV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 21 Dec 2020 10:07:21 -0500
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1krMlg-0007Vk-AC; Mon, 21 Dec 2020 16:06:36 +0100
Received: from mtr by dude03.red.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1krMle-003Aay-N4; Mon, 21 Dec 2020 16:06:34 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Cc:     rajanv@xilinx.com, tejasp@xilinx.com, dshah@xilinx.com,
        rvisaval@xilinx.com, michals@xilinx.com, kernel@pengutronix.de,
        mturquette@baylibre.com, sboyd@kernel.org
Subject: [PATCH v2 00/15] soc: xilinx: vcu: Convert driver to clock provider
Date:   Mon, 21 Dec 2020 16:06:19 +0100
Message-Id: <20201221150634.755673-1-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::39
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hello,

the xlnx_vcu soc driver is actually a clock provider of a PLL and four output
clocks created from the PLL via dividers.

This is v2 of the series to transform the driver into a proper clock provider
driver.

The main changes compared to v1 are:

Get rid of the "dummy" clock and remove the manual switching of the mux in the
output clocks. The driver now uses the pll_ref as a bypass clock. As this is
not documented, I am not sure if this is actually the case, but without
another signal for an external clock to the ip core, this seems plausible and
avoids changes to the device tree binding. The reparenting happens
automatically when setting a rate on the output clocks.

Add a few patches to cleanup checkpatch warnings on the driver itself.

Move the entire driver from drivers/soc to drivers/clk, because the driver is
now actually only clock provider driver.

A more detailed changelog is attached to the respective patches.

The series is based on the zynqmp/soc-next branch in the Xilinx downstream
repository [0] which should be merged to mainline soon.

Michael

[0] https://github.com/Xilinx/linux-xlnx/tree/zynqmp/soc-next

Changelog:

v2:
- Remove dummy clock and explicit re-parenting of mux clocks
- Add patches to fix checkpatch warnings
- Move driver from drivers/soc to drivers/clk
- Use clk_parent_data instead of parent_names
- Add missing decoder clocks
- Fix smatch warnings
- Fix kernel-doc

Michael Tretter (15):
  ARM: dts: vcu: define indexes for output clocks
  clk: divider: fix initialization with parent_hw
  soc: xilinx: vcu: drop coreclk from struct xlnx_vcu
  soc: xilinx: vcu: add helper to wait for PLL locked
  soc: xilinx: vcu: add helpers for configuring PLL
  soc: xilinx: vcu: implement PLL disable
  soc: xilinx: vcu: register PLL as fixed rate clock
  soc: xilinx: vcu: implement clock provider for output clocks
  soc: xilinx: vcu: make pll post divider explicit
  soc: xilinx: vcu: make the PLL configurable
  soc: xilinx: vcu: remove calculation of PLL configuration
  soc: xilinx: vcu: use bitfields for register definition
  soc: xilinx: vcu: fix repeated word the in comment
  soc: xilinx: vcu: fix alignment to open parenthesis
  clk: xilinx: move xlnx_vcu clock driver from soc

 drivers/clk/Kconfig                  |   1 +
 drivers/clk/Makefile                 |   1 +
 drivers/clk/clk-divider.c            |   9 +-
 drivers/clk/xilinx/Kconfig           |  19 +
 drivers/clk/xilinx/Makefile          |   2 +
 drivers/clk/xilinx/xlnx_vcu.c        | 742 +++++++++++++++++++++++++++
 drivers/soc/xilinx/Kconfig           |  17 -
 drivers/soc/xilinx/Makefile          |   1 -
 drivers/soc/xilinx/xlnx_vcu.c        | 628 -----------------------
 include/dt-bindings/clock/xlnx-vcu.h |  15 +
 10 files changed, 787 insertions(+), 648 deletions(-)
 create mode 100644 drivers/clk/xilinx/Kconfig
 create mode 100644 drivers/clk/xilinx/Makefile
 create mode 100644 drivers/clk/xilinx/xlnx_vcu.c
 delete mode 100644 drivers/soc/xilinx/xlnx_vcu.c
 create mode 100644 include/dt-bindings/clock/xlnx-vcu.h

-- 
2.20.1

