Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8084C49361
	for <linux-clk@archiver.kernel.org>; Fri, 18 Jun 2021 09:58:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C8C8C60C3E
	for <linux-clk@archiver.kernel.org>; Fri, 18 Jun 2021 09:58:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232716AbhFRKAm (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 18 Jun 2021 06:00:42 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:18538 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S233069AbhFRKAj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 18 Jun 2021 06:00:39 -0400
X-IronPort-AV: E=Sophos;i="5.83,283,1616425200"; 
   d="scan'208";a="84638738"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 18 Jun 2021 18:58:28 +0900
Received: from localhost.localdomain (unknown [10.226.93.115])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 64831401A453;
        Fri, 18 Jun 2021 18:58:26 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/7] Update clock definitions
Date:   Fri, 18 Jun 2021 10:58:16 +0100
Message-Id: <20210618095823.19885-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This patch series update clock definitions as per the RZG2L_clock_list(Rev.02) manual.

As per this we need to treat each bit as a seperate clock. So
added support for multi clock PM support. Also updated clock
driver enties.

Biju Das (7):
  dt-bindings: clk: r9a07g044-cpg: Update clock definitions
  drivers: clk: renesas: renesas-rzg2l-cpg: Add multi clock PM support
  drivers: clk: renesas: r9a07g044-cpg: Update {GIC,IA55,SCIF} clock
    entries
  arm64: dts: renesas: r9a07g044: Update SCIF0 clock
  drivers: clk: renesas: r9a07g044-cpg: Add I2C Clocks
  drivers: clk: renesas: r9a07g044-cpg: Add DMAC clocks
  arm64: dts: renesas: r9a07g044: Add I2C nodes

 arch/arm64/boot/dts/renesas/r9a07g044.dtsi |  84 ++++++++++-
 drivers/clk/renesas/r9a07g044-cpg.c        |  57 ++++++--
 drivers/clk/renesas/renesas-rzg2l-cpg.c    |  51 ++++---
 drivers/clk/renesas/renesas-rzg2l-cpg.h    |   1 +
 include/dt-bindings/clock/r9a07g044-cpg.h  | 153 ++++++++++++++-------
 5 files changed, 258 insertions(+), 88 deletions(-)

-- 
2.17.1

