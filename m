Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A69C4C4338F
	for <linux-clk@archiver.kernel.org>; Tue, 27 Jul 2021 14:17:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8845861ABB
	for <linux-clk@archiver.kernel.org>; Tue, 27 Jul 2021 14:17:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236774AbhG0OR6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 27 Jul 2021 10:17:58 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:6079 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S236762AbhG0OR6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 27 Jul 2021 10:17:58 -0400
X-IronPort-AV: E=Sophos;i="5.84,273,1620658800"; 
   d="scan'208";a="88924165"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 27 Jul 2021 23:17:57 +0900
Received: from localhost.localdomain (unknown [10.226.92.236])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 200FC400D4E1;
        Tue, 27 Jul 2021 23:17:51 +0900 (JST)
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
Subject: [PATCH v2 0/4] Add GbEthernet Clock support
Date:   Tue, 27 Jul 2021 15:17:45 +0100
Message-Id: <20210727141749.17783-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This patch series aims to add GbEthernet clock support.
GbEthernet clock support involves handing mux clock support
for HP clock and coupled clock for axi/chi module clocks which
shares same bit for controlling the clock output.

This patch series is based on renesas-clk-for-v5.15.

v1->v2:
 * No change. Separated clock patches from driver patch series as per [1]
 [1]
  https://www.spinics.net/lists/linux-renesas-soc/msg59067.html
v1:-
 * New patch

Biju Das (4):
  drivers: clk: renesas: rzg2l-cpg: Add support to handle MUX clocks
  drivers: clk: renesas: r9a07g044-cpg: Add ethernet clock sources
  drivers: clk: renesas: rzg2l-cpg: Add support to handle coupled clocks
  drivers: clk: renesas: r9a07g044-cpg: Add GbEthernet clock/reset

 drivers/clk/renesas/r9a07g044-cpg.c | 31 ++++++++++++++++-
 drivers/clk/renesas/rzg2l-cpg.c     | 54 +++++++++++++++++++++++++++++
 drivers/clk/renesas/rzg2l-cpg.h     | 26 +++++++++++++-
 3 files changed, 109 insertions(+), 2 deletions(-)

-- 
2.17.1

