Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEA81C2B9F4
	for <linux-clk@archiver.kernel.org>; Fri, 25 Jun 2021 19:55:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C375B6195F
	for <linux-clk@archiver.kernel.org>; Fri, 25 Jun 2021 19:55:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229531AbhFYT5X (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 25 Jun 2021 15:57:23 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:8739 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229712AbhFYT5X (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 25 Jun 2021 15:57:23 -0400
X-IronPort-AV: E=Sophos;i="5.83,299,1616425200"; 
   d="scan'208";a="85449030"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 26 Jun 2021 04:55:00 +0900
Received: from localhost.localdomain (unknown [10.226.92.12])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 5FE2840E6220;
        Sat, 26 Jun 2021 04:54:58 +0900 (JST)
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
Subject: [PATCH v3 00/10] Update clock definitions
Date:   Fri, 25 Jun 2021 20:54:45 +0100
Message-Id: <20210625195455.3607-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This patch series aims to update clock and reset definitions as per
RZ/G2L_clock_list_r02_02.xlsx and RZ/G2L HW(Rev.0.50) manual.

As per this, we need to separate resets from module clocks in order to
handle it efficiently.

Added support for multi clock PM support and updated clock driver enties.

This patch series is tested with USB Host, USB Device, I2C, DMAC and SSI.

This patch series is based on [1] and [2]
[1] https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/commit/?h=renesas-clk-for-v5.15
[2] https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git/

v2->v3
 * Improved clk/reset code as per Geert's suggestion.
 * Added Geert's Rb tag

v1->v2
 * Updated reset entries
 * Added Geert's Rb tag for multi clock PM support.

v1:
 * https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=503135


Biju Das (10):
  drivers: clk: renesas: renesas-rzg2l-cpg: Add multi clock PM support
  drivers: clk: renesas: r9a07g044-cpg: Rename divider table
  drivers: clk: renesas: r9a07g044-cpg: Fix P1 Clock
  drivers: clk: renesas: r9a07g044-cpg: Add P2 Clock support
  dt-bindings: clk: r9a07g044-cpg: Update clock/reset definitions
  drivers: clk: renesas: r9a07g044-cpg: Update {GIC,IA55,SCIF}
    clock/reset entries
  arm64: dts: renesas: r9a07g044: Update SCIF0 clock/reset
  drivers: clk: renesas: r9a07g044-cpg: Add I2C clocks/resets
  drivers: clk: renesas: r9a07g044-cpg: Add DMAC clocks/resets
  arm64: dts: renesas: r9a07g044: Add I2C nodes

 arch/arm64/boot/dts/renesas/r9a07g044.dtsi |  84 +++++++-
 drivers/clk/renesas/r9a07g044-cpg.c        |  99 ++++++---
 drivers/clk/renesas/renesas-rzg2l-cpg.c    | 108 +++++-----
 drivers/clk/renesas/renesas-rzg2l-cpg.h    |  37 +++-
 include/dt-bindings/clock/r9a07g044-cpg.h  | 236 ++++++++++++++++-----
 5 files changed, 418 insertions(+), 146 deletions(-)

-- 
2.17.1

