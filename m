Return-Path: <SRS0=W/YM=DX=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F018C43457
	for <linux-clk@archiver.kernel.org>; Fri, 16 Oct 2020 12:17:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BF0FD208E4
	for <linux-clk@archiver.kernel.org>; Fri, 16 Oct 2020 12:17:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407326AbgJPMRU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 16 Oct 2020 08:17:20 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:52101 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2405588AbgJPMRU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 16 Oct 2020 08:17:20 -0400
X-IronPort-AV: E=Sophos;i="5.77,382,1596466800"; 
   d="scan'208";a="59986358"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 16 Oct 2020 21:17:18 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 42FC643871A2;
        Fri, 16 Oct 2020 21:17:16 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/4] Renesas RZ/G2x enable RPC clocks
Date:   Fri, 16 Oct 2020 13:17:05 +0100
Message-Id: <20201016121709.8447-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi All,

This patch series enables RPC clocks on RZ/G2x SoC's.

This series applies on top of [1].

[1] https://git.kernel.org/pub/scm/linux/kernel/git/geert/
    renesas-drivers.git/log/?h=renesas-clk-for-v5.11

Cheers,
Prabhakar

Biju Das (2):
  clk: renesas: r8a774a1: Add RPC clocks
  clk: renesas: r8a774b1: Add RPC clocks

Lad Prabhakar (2):
  clk: renesas: rcar-gen3: Add support to pass custom RPCSRC div table
  clk: renesas: r8a774c0: Add RPC clocks

 drivers/clk/renesas/r8a774a1-cpg-mssr.c |  8 ++++++++
 drivers/clk/renesas/r8a774b1-cpg-mssr.c |  8 ++++++++
 drivers/clk/renesas/r8a774c0-cpg-mssr.c | 14 ++++++++++++++
 drivers/clk/renesas/rcar-gen3-cpg.c     |  2 ++
 drivers/clk/renesas/renesas-cpg-mssr.h  |  6 ++++++
 5 files changed, 38 insertions(+)

-- 
2.17.1

