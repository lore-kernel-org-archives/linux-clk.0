Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BA5DC433F5
	for <linux-clk@archiver.kernel.org>; Mon, 13 Sep 2021 08:25:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 05E566101C
	for <linux-clk@archiver.kernel.org>; Mon, 13 Sep 2021 08:25:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237884AbhIMI03 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 13 Sep 2021 04:26:29 -0400
Received: from inva020.nxp.com ([92.121.34.13]:56050 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234575AbhIMI03 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 13 Sep 2021 04:26:29 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 90BA21A2A1B;
        Mon, 13 Sep 2021 10:25:12 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 83FE01A29F9;
        Mon, 13 Sep 2021 10:25:12 +0200 (CEST)
Received: from fsr-ub1664-175.ea.freescale.net (fsr-ub1664-175.ea.freescale.net [10.171.82.40])
        by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 36836202EC;
        Mon, 13 Sep 2021 10:25:12 +0200 (CEST)
From:   Abel Vesa <abel.vesa@nxp.com>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     NXP Linux Team <linux-imx@nxp.com>, linux-clk@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org, Abel Vesa <abel.vesa@nxp.com>
Subject: [PATCH 0/8] imx: clk: Rework all the wrappers
Date:   Mon, 13 Sep 2021 11:24:42 +0300
Message-Id: <1631521490-17171-1-git-send-email-abel.vesa@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Remove the unused wrapper and rework the rest in order to prepare
for removing the non clk_hw based ones.

Abel Vesa (8):
  clk: imx: Remove unused helpers
  clk: imx: Make mux/mux2 clk based helpers use clk_hw based ones
  clk: imx: Rework all clk_hw_register_gate wrappers
  clk: imx: Rework all clk_hw_register_gate2 wrappers
  clk: imx: Rework all clk_hw_register_mux wrappers
  clk: imx: Rework all clk_hw_register_divider wrappers
  clk: imx: Rework all imx_clk_hw_composite wrappers
  clk: imx: Rework imx_clk_hw_pll14xx wrapper

 drivers/clk/imx/clk-composite-8m.c |   4 +-
 drivers/clk/imx/clk.h              | 431 ++++++++---------------------
 2 files changed, 122 insertions(+), 313 deletions(-)

-- 
2.31.1

