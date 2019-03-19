Return-Path: <SRS0=gal5=RW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E0ACC10F0E
	for <linux-clk@archiver.kernel.org>; Tue, 19 Mar 2019 10:01:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 522F220857
	for <linux-clk@archiver.kernel.org>; Tue, 19 Mar 2019 10:01:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727479AbfCSKBw (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 19 Mar 2019 06:01:52 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:59947 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727476AbfCSKBv (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 19 Mar 2019 06:01:51 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <mtr@pengutronix.de>)
        id 1h6BZ7-0003IE-CI; Tue, 19 Mar 2019 11:01:49 +0100
Received: from mtr by dude02.lab.pengutronix.de with local (Exim 4.89)
        (envelope-from <mtr@pengutronix.de>)
        id 1h6BZ6-00016a-KY; Tue, 19 Mar 2019 11:01:48 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     kernel@pengutronix.de, Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Jolly Shah <jolly.shah@xilinx.com>,
        Michael Tretter <m.tretter@pengutronix.de>
Subject: [PATCH v2 0/4] clk: zynqmp: fix CLK_FRAC and various cleanups
Date:   Tue, 19 Mar 2019 11:01:43 +0100
Message-Id: <20190319100147.4178-1-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hello,

This is v2 of the patchset to cleanup the ZynqMP clock driver.

I introduced the new is_frac field in zynqmp_clk_divider. The driver uses this
field to flag fractional dividers instead of misusing the clk_hw::core::flags
field.

Furthermore, the driver uses structs for the query responses from the firmware
instead of passing arrays with implicit size.

Michael

v1 -> v2:
- remove export of zynqmp_clk_register_divider
- move CLK_FLAG to property in zynqmp_clk_divider
- merge and rewrite patches 4 and 5 to use structs for responses

Michael Tretter (4):
  clk: zynqmp: fix kerneldoc of __zynqmp_clock_get_parents
  clk: zynqmp: do not export zynqmp_clk_register_* functions
  clk: zynqmp: fix check for fractional clock
  clk: zynqmp: use structs for clk query responses

 drivers/clk/zynqmp/clk-mux-zynqmp.c |   1 -
 drivers/clk/zynqmp/clk-zynqmp.h     |   6 --
 drivers/clk/zynqmp/clkc.c           | 148 ++++++++++++++++------------
 drivers/clk/zynqmp/divider.c        |  10 +-
 4 files changed, 92 insertions(+), 73 deletions(-)

-- 
2.20.1

