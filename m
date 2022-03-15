Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55407C433FE
	for <linux-clk@archiver.kernel.org>; Tue, 15 Mar 2022 15:46:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349722AbiCOPsH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 15 Mar 2022 11:48:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233153AbiCOPsH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 15 Mar 2022 11:48:07 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id ACB7313CD6;
        Tue, 15 Mar 2022 08:46:54 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.90,184,1643641200"; 
   d="scan'208";a="113587385"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 16 Mar 2022 00:46:54 +0900
Received: from localhost.localdomain (unknown [10.226.92.209])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 1CD684002C3E;
        Wed, 16 Mar 2022 00:46:51 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/4] Add GPIO,ETHERNET and SDHI Clock/Reset entries for RZ/G2UL
Date:   Tue, 15 Mar 2022 15:46:45 +0000
Message-Id: <20220315154649.22343-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This patch series aims to add GPIO, ETHERNET and SDHI Clock/Reset
entries to RZ/G2UL Clk driver.

This patch series depend upon [1]
[1] https://lore.kernel.org/linux-renesas-soc/20220315142644.17660-6-biju.das.jz@bp.renesas.com/T/#u

Biju Das (4):
  clk: renesas: r9a07g043: Add GPIO clock and reset entries
  clk: renesas: r9a07g043: Add ethernet clock sources
  clk: renesas: r9a07g043: Add GbEthernet clock/reset
  clk: renesas: r9a07g043: Add SDHI clock and reset entries

 drivers/clk/renesas/r9a07g043-cpg.c | 63 +++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

-- 
2.17.1

