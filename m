Return-Path: <SRS0=09nf=D4=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A75BC56202
	for <linux-clk@archiver.kernel.org>; Wed, 21 Oct 2020 17:37:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AA8482224E
	for <linux-clk@archiver.kernel.org>; Wed, 21 Oct 2020 17:36:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438226AbgJURg7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 21 Oct 2020 13:36:59 -0400
Received: from inva021.nxp.com ([92.121.34.21]:41094 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404713AbgJURg7 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 21 Oct 2020 13:36:59 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 8CBE9200046;
        Wed, 21 Oct 2020 19:36:57 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 809C4200031;
        Wed, 21 Oct 2020 19:36:57 +0200 (CEST)
Received: from fsr-ub1664-175.ea.freescale.net (fsr-ub1664-175.ea.freescale.net [10.171.82.40])
        by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 10F7C2033F;
        Wed, 21 Oct 2020 19:36:57 +0200 (CEST)
From:   Abel Vesa <abel.vesa@nxp.com>
To:     Shawn Guo <shawnguo@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Peng Fan <peng.fan@nxp.com>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Anson Huang <anson.huang@nxp.com>
Cc:     NXP Linux Team <linux-imx@nxp.com>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Abel Vesa <abel.vesa@nxp.com>
Subject: [RFC 0/4] clk: imx: Register the dram_apb and dram_alt as read-only 
Date:   Wed, 21 Oct 2020 20:36:51 +0300
Message-Id: <1603301815-24670-1-git-send-email-abel.vesa@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On i.MX8M platforms the dram_apb and dram_alt are controlled from EL3.
So in order to keep track of the actual clock tree in kernel, we need
to actually declare the clocks but never write to any of their registes.
We do that by registering the clocks with only the ops that read but
never write the registers.

Abel Vesa (4):
  clk: Add CLK_GET_PARENT_NOCACHE flag
  clk: Add clk_gate_ro_ops for read-only gate clocks
  clk: imx: composite-8m: Add DRAM clock registration variant
  clk: imx8m: Use dram variant registration for dram clocks

 drivers/clk/clk-gate.c             |  5 +++++
 drivers/clk/clk.c                  | 31 +++++++++++++++++--------------
 drivers/clk/imx/clk-composite-8m.c | 12 +++++++++++-
 drivers/clk/imx/clk-imx8mm.c       |  4 ++--
 drivers/clk/imx/clk-imx8mn.c       |  4 ++--
 drivers/clk/imx/clk-imx8mp.c       |  4 ++--
 drivers/clk/imx/clk-imx8mq.c       |  4 ++--
 drivers/clk/imx/clk.h              |  7 +++++++
 include/linux/clk-provider.h       |  2 ++
 9 files changed, 50 insertions(+), 23 deletions(-)

-- 
2.7.4

