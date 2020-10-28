Return-Path: <SRS0=O9me=ED=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 598A3C55179
	for <linux-clk@archiver.kernel.org>; Wed, 28 Oct 2020 22:25:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1CD9720704
	for <linux-clk@archiver.kernel.org>; Wed, 28 Oct 2020 22:25:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732092AbgJ1WZq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 28 Oct 2020 18:25:46 -0400
Received: from inva021.nxp.com ([92.121.34.21]:58412 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732965AbgJ1WZo (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 28 Oct 2020 18:25:44 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 23D372015FE;
        Wed, 28 Oct 2020 13:59:35 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 16AA92015F8;
        Wed, 28 Oct 2020 13:59:35 +0100 (CET)
Received: from fsr-ub1664-175.ea.freescale.net (fsr-ub1664-175.ea.freescale.net [10.171.82.40])
        by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 6391A2030E;
        Wed, 28 Oct 2020 13:59:34 +0100 (CET)
From:   Abel Vesa <abel.vesa@nxp.com>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Lucas Stach <l.stach@pengutronix.de>,
        Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        Anson Huang <anson.huang@nxp.com>,
        Jacky Bai <ping.bai@nxp.com>, Peng Fan <peng.fan@nxp.com>,
        Dong Aisheng <aisheng.dong@nxp.com>
Cc:     NXP Linux Team <linux-imx@nxp.com>,
        linux-arm-kernel@lists.infradead.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@nxp.com>
Subject: [PATCH v2 0/5] Fix the gate2 and make it more flexible
Date:   Wed, 28 Oct 2020 14:58:57 +0200
Message-Id: <1603889942-27026-1-git-send-email-abel.vesa@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

First version here: https://lkml.org/lkml/2020/10/26/988

Changes since v1:
 * split the work in multiple iterative patches

Abel Vesa (5):
  clk: imx: gate2: Remove the IMX_CLK_GATE2_SINGLE_BIT special case
  clk: imx: gate2: Keep the register writing in on place
  clk: imx: gate2: Check if clock is enabled against cgr_val
  clk: imx: gate2: Add cgr_mask for more flexible number of control bits
  clk: imx: gate2: Add locking in is_enabled op

 drivers/clk/imx/clk-gate2.c | 65 +++++++++++++++++++++------------------------
 drivers/clk/imx/clk.h       | 27 +++++++++----------
 2 files changed, 43 insertions(+), 49 deletions(-)

-- 
2.7.4

