Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50C57C433EF
	for <linux-clk@archiver.kernel.org>; Mon, 25 Apr 2022 09:53:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236134AbiDYJ4k (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 25 Apr 2022 05:56:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240263AbiDYJ4V (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 25 Apr 2022 05:56:21 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0FCE8403D8;
        Mon, 25 Apr 2022 02:52:50 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.90,287,1643641200"; 
   d="scan'208";a="117911424"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 25 Apr 2022 18:52:49 +0900
Received: from localhost.localdomain (unknown [10.226.93.95])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 7B4034218186;
        Mon, 25 Apr 2022 18:52:46 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/6] Add RZ/G2UL CLK and Reset entries for I2C,SSI,USB,CANFD,OSTM and WDT
Date:   Mon, 25 Apr 2022 10:52:38 +0100
Message-Id: <20220425095244.156720-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This patch series aims to add CLK and Reset entries for I2C,SSI,USB,CANFD,
OSTM and WDT found on RZ/G2UL SoC to RZ/G2L CPG driver.

Biju Das (6):
  clk: renesas: r9a07g043: Add I2C clocks/resets
  clk: renesas: r9a07g043: Add SSIF-2 clock and reset entries
  clk: renesas: r9a07g043: Add USB clocks/resets
  clk: renesas: r9a07g043: Add clock and reset entries for CANFD
  clk: renesas: r9a07g043: Add OSTM clock and reset entries
  clk: renesas: r9a07g043: Add WDT clock and reset entries

 drivers/clk/renesas/r9a07g043-cpg.c | 68 +++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

-- 
2.25.1

