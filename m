Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1482C63697
	for <linux-clk@archiver.kernel.org>; Thu, 26 Nov 2020 12:41:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 85E2E21741
	for <linux-clk@archiver.kernel.org>; Thu, 26 Nov 2020 12:41:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389041AbgKZMlq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 26 Nov 2020 07:41:46 -0500
Received: from inva021.nxp.com ([92.121.34.21]:54702 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388958AbgKZMlp (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 26 Nov 2020 07:41:45 -0500
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 2A3502000E0;
        Thu, 26 Nov 2020 13:41:44 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 1CDA52000AF;
        Thu, 26 Nov 2020 13:41:44 +0100 (CET)
Received: from fsr-ub1664-175.ea.freescale.net (fsr-ub1664-175.ea.freescale.net [10.171.82.40])
        by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 945EF2026B;
        Thu, 26 Nov 2020 13:41:43 +0100 (CET)
From:   Abel Vesa <abel.vesa@nxp.com>
To:     Stephen Boyd <sboyd@kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        Peng Fan <peng.fan@nxp.com>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        Anson Huang <anson.huang@nxp.com>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Jacky Bai <ping.bai@nxp.com>
Cc:     NXP Linux Team <linux-imx@nxp.com>, linux-clk@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org, Abel Vesa <abel.vesa@nxp.com>
Subject: [PATCH v2 0/5] clk: imx: Register the dram_apb and dram_alt as read-only
Date:   Thu, 26 Nov 2020 14:40:04 +0200
Message-Id: <1606394409-12755-1-git-send-email-abel.vesa@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On i.MX8M platforms the dram_apb and dram_alt are controlled from EL3.
So in order to keep track of the actual clock tree in kernel, we need to
actually declare the clocks but never write to any of their registes.
We do that by registering the clocks with only the ops that read but never
write the registers.

Changes since v1:
 * allow generic composite clock registration with .is_enabled gate op
   only

Abel Vesa (5):
  clk: Add clk_gate_ro_ops for read-only gate clocks
  clk: Add CLK_GET_PARENT_NOCACHE flag
  clk: composite: Allow gate ops with only .is_enabled op
  clk: imx: composite-8m: Add DRAM clock registration variant
  clk: imx8m: Use dram variant registration for dram clocks

 drivers/clk/clk-composite.c        | 19 ++++++++++---------
 drivers/clk/clk-gate.c             |  5 +++++
 drivers/clk/clk.c                  | 31 +++++++++++++++++--------------
 drivers/clk/imx/clk-composite-8m.c | 12 +++++++++++-
 drivers/clk/imx/clk-imx8mm.c       |  4 ++--
 drivers/clk/imx/clk-imx8mn.c       |  4 ++--
 drivers/clk/imx/clk-imx8mp.c       |  4 ++--
 drivers/clk/imx/clk-imx8mq.c       |  4 ++--
 drivers/clk/imx/clk.h              |  7 +++++++
 include/linux/clk-provider.h       |  2 ++
 10 files changed, 60 insertions(+), 32 deletions(-)

-- 
2.7.4

