Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 256AFC432BE
	for <linux-clk@archiver.kernel.org>; Sun, 15 Aug 2021 10:30:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 082566109E
	for <linux-clk@archiver.kernel.org>; Sun, 15 Aug 2021 10:30:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237148AbhHOKav (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 15 Aug 2021 06:30:51 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:22960 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S237053AbhHOKau (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 15 Aug 2021 06:30:50 -0400
X-IronPort-AV: E=Sophos;i="5.84,322,1620658800"; 
   d="scan'208";a="90677805"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 15 Aug 2021 19:30:19 +0900
Received: from localhost.localdomain (unknown [10.226.92.6])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 2107D400754C;
        Sun, 15 Aug 2021 19:30:16 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        Andrew Lunn <andrew@lunn.ch>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 0/4] Add GbEthernet Clock support
Date:   Sun, 15 Aug 2021 11:30:10 +0100
Message-Id: <20210815103014.21208-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This patch series aims to add GbEthernet clock support.
GbEthernet clock support involves handing mux clock support
for HP clock and coupled clock for axi/chi module clocks which
shares same bit for controlling the clock output.

This patch series is based on renesas-clk-for-v5.15.
v2->v3:
 * Rebased to latest renesas-clk
 * Updated commit header for all patches
 * Replaced CLK_PLL5_2 with PLL5_FOUT3
 * Removed CLK_PLL6_2 and pll6_2 as the clk is sourced from PLL6
 * Added enabled flag to track the status of clock, if it is coupled
   with another clock
 * Introduced siblings pointer which points to the other coupled
   clock
 * coupled clock linking is done during module clk register.
 * rzg2l_mod_clock_is_enabled function returns soft state of the
   module clocks, if it is coupled with another clock
v1->v2:
 * No change. Separated clock patches from driver patch series as per [1]
 [1]
  https://www.spinics.net/lists/linux-renesas-soc/msg59067.html
v1:-
 * New patch

Biju Das (4):
  clk: renesas: rzg2l: Add support to handle MUX clocks
  clk: renesas: r9a07g044: Add ethernet clock sources
  clk: renesas: rzg2l: Add support to handle coupled clocks
  clk: renesas: r9a07g044: Add GbEthernet clock/reset

 drivers/clk/renesas/r9a07g044-cpg.c | 29 +++++++++-
 drivers/clk/renesas/rzg2l-cpg.c     | 85 +++++++++++++++++++++++++++++
 drivers/clk/renesas/rzg2l-cpg.h     | 26 ++++++++-
 3 files changed, 138 insertions(+), 2 deletions(-)

-- 
2.17.1

