Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E40B7C433F5
	for <linux-clk@archiver.kernel.org>; Fri, 12 Nov 2021 08:10:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C5D1060FE3
	for <linux-clk@archiver.kernel.org>; Fri, 12 Nov 2021 08:10:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233883AbhKLINB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 12 Nov 2021 03:13:01 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:35406 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S233914AbhKLINA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 12 Nov 2021 03:13:00 -0500
X-IronPort-AV: E=Sophos;i="5.87,228,1631545200"; 
   d="scan'208";a="100363404"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 12 Nov 2021 17:10:08 +0900
Received: from localhost.localdomain (unknown [10.226.93.91])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id CF3764223898;
        Fri, 12 Nov 2021 17:10:06 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 0/4] Add OPP table for RZ/G2L SoC
Date:   Fri, 12 Nov 2021 08:09:59 +0000
Message-Id: <20211112081003.15453-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This patch series aims to add OPP table for RZ/G2L SoC.
Supported frequencies are 1.2GHz, 600MHz, 300MHz and 150MHz.

V1->v2:
 * Fixed typo cluster1_opp->cluster0_opp

Biju Das (4):
  clk: renesas: rzg2l: Add CPG_PL1_DDIV macro
  clk: renesas: r9a07g044: Change core clock "I" from DEF_FIXED->DEF_DIV
  arm64: dts: renesas: r9a07g044: Sort psci node
  arm64: dts: renesas: r9a07g044: Add OPP table

 arch/arm64/boot/dts/renesas/r9a07g044.dtsi | 36 ++++++++++++++++++++--
 drivers/clk/renesas/r9a07g044-cpg.c        | 11 ++++++-
 drivers/clk/renesas/rzg2l-cpg.h            |  2 ++
 3 files changed, 45 insertions(+), 4 deletions(-)

-- 
2.17.1

