Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E7DEC433E9
	for <linux-clk@archiver.kernel.org>; Thu, 21 Jan 2021 07:18:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CD72723788
	for <linux-clk@archiver.kernel.org>; Thu, 21 Jan 2021 07:18:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726821AbhAUHRu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 21 Jan 2021 02:17:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727119AbhAUHRp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 21 Jan 2021 02:17:45 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2C33C0613D3
        for <linux-clk@vger.kernel.org>; Wed, 20 Jan 2021 23:17:02 -0800 (PST)
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1l2UDE-0006UD-BW; Thu, 21 Jan 2021 08:17:00 +0100
Received: from mtr by dude03.red.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1l2UDD-00596y-56; Thu, 21 Jan 2021 08:16:59 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Cc:     m.mtretter@pengutronix.de, michals@xilinx.com,
        kernel@pengutronix.de, mturquette@baylibre.com, sboyd@kernel.org
Subject: [PATCH v3 00/15] soc: xilinx: vcu: Convert driver to clock provider
Date:   Thu, 21 Jan 2021 08:16:44 +0100
Message-Id: <20210121071659.1226489-1-m.tretter@pengutronix.de>
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

This is v3 of the series to transform the xlnx_vcu driver into a proper clock
provider driver. The driver implements a clock provider of a PLL and four
output clocks created from the PLL via dividers that are used by the Xilinx
Video Codec Unit.

Compared to v2, I added a missing kernel-doc, collected Acked-By: tags, and
rebased it on clk-next.

Michael

Changelog:

v3:
- Add missing kernel-doc

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
 drivers/clk/xilinx/xlnx_vcu.c        | 743 +++++++++++++++++++++++++++
 drivers/soc/xilinx/Kconfig           |  17 -
 drivers/soc/xilinx/Makefile          |   1 -
 drivers/soc/xilinx/xlnx_vcu.c        | 628 ----------------------
 include/dt-bindings/clock/xlnx-vcu.h |  15 +
 10 files changed, 788 insertions(+), 648 deletions(-)
 create mode 100644 drivers/clk/xilinx/Kconfig
 create mode 100644 drivers/clk/xilinx/Makefile
 create mode 100644 drivers/clk/xilinx/xlnx_vcu.c
 delete mode 100644 drivers/soc/xilinx/xlnx_vcu.c
 create mode 100644 include/dt-bindings/clock/xlnx-vcu.h

-- 
2.20.1

