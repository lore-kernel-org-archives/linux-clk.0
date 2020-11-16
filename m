Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 447A2C4742C
	for <linux-clk@archiver.kernel.org>; Mon, 16 Nov 2020 08:03:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F10132222E
	for <linux-clk@archiver.kernel.org>; Mon, 16 Nov 2020 08:03:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728060AbgKPHzl (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 16 Nov 2020 02:55:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727895AbgKPHzk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 16 Nov 2020 02:55:40 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3861C0613D2
        for <linux-clk@vger.kernel.org>; Sun, 15 Nov 2020 23:55:40 -0800 (PST)
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1keZMO-0007YL-0W; Mon, 16 Nov 2020 08:55:37 +0100
Received: from mtr by dude03.red.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@dude03.red.stw.pengutronix.de>)
        id 1keZMM-00GrbL-Px; Mon, 16 Nov 2020 08:55:34 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     rajanv@xilinx.com, tejasp@xilinx.com, dshah@xilinx.com,
        rvisaval@xilinx.com, michals@xilinx.com, kernel@pengutronix.de,
        robh+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        Michael Tretter <m.tretter@pengutronix.de>
Date:   Mon, 16 Nov 2020 08:55:20 +0100
Message-Id: <20201116075532.4019252-1-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::39
X-SA-Exim-Mail-From: mtr@pengutronix.de
Subject: [PATCH 00/12] soc: xilinx: vcu: Convert driver to clock provider
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on metis.ext.pengutronix.de)
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hello,

the xlnx_vcu soc driver is actually a clock provider of a PLL and four output
clocks created from the PLL via dividers.

This series reworks the xlnx_vcu driver to use the common clock framework to
enable other drivers to use the clocks. I originally posted a series to expose
the output clocks as fixed clocks [0]. This series now implements the full
tree from the PLL to the output clocks. Therefore, I am sending a separate
series that focuses on the clocks, but it depends on v4 of the previous series
[1].

Possible consumers for the clocks are the allegro-dvt video encoder driver or
the Xilinx Video Codec Unit [2] out of tree driver.

Patch 1 defines the identifiers that shall be used by clock consumers in the
device tree.

Patch 2 fixes the generic clk-divider to correctly use parents that are passed
via struct clk_hw instead of the clock name.

Patches 3-6 refactor the existing driver and split the function to configure
the PLL into smaller helper functions.

Patch 7 registers a fixed rate clock for the PLL. The driver calculated and
set the PLL configuration during probe, and exposing a fixed rate clock for
that rate allows to use the existing configuration with output clocks from the
common clock framework.

Patches 8-10 switch the driver to the common clock framework and register the
clock provider.

Patches 11-12 are cleanup patches.

Michael

[0] https://lore.kernel.org/linux-arm-kernel/20200619075913.18900-1-m.tretter@pengutronix.de/
[1] https://lore.kernel.org/linux-arm-kernel/20201109134818.4159342-3-m.tretter@pengutronix.de/
[2] https://github.com/Xilinx/vcu-modules

Michael Tretter (12):
  ARM: dts: define indexes for output clocks
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

 drivers/clk/clk-divider.c            |   9 +-
 drivers/soc/xilinx/Kconfig           |   2 +-
 drivers/soc/xilinx/xlnx_vcu.c        | 613 ++++++++++++++++-----------
 include/dt-bindings/clock/xlnx-vcu.h |  15 +
 4 files changed, 383 insertions(+), 256 deletions(-)
 create mode 100644 include/dt-bindings/clock/xlnx-vcu.h

-- 
2.20.1

