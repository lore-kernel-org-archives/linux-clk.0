Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C18EBC001B0
	for <linux-clk@archiver.kernel.org>; Sun, 16 Jul 2023 15:44:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229450AbjGPPov (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 16 Jul 2023 11:44:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbjGPPou (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 16 Jul 2023 11:44:50 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 52153E5E;
        Sun, 16 Jul 2023 08:44:49 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.01,210,1684767600"; 
   d="scan'208";a="172935288"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 17 Jul 2023 00:44:48 +0900
Received: from localhost.localdomain (unknown [10.226.92.32])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id A86C040062C4;
        Mon, 17 Jul 2023 00:44:45 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Marek Vasut <marex@denx.de>,
        Alex Helms <alexander.helms.jy@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 0/2] Use i2c_get_match_data()
Date:   Sun, 16 Jul 2023 16:44:40 +0100
Message-Id: <20230716154442.93908-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Use i2c_get_match_data() to get match data for I2C, ACPI and
DT-based matching instead of device_get_match_data() the one for
ACPI/DT-based matching.

This patch series is only compile tested.

Biju Das (2):
  clk: vc5: Use i2c_get_match_data() instead of device_get_match_data()
  clk: vc7: Use i2c_get_match_data() instead of device_get_match_data()

 drivers/clk/clk-versaclock5.c | 4 +++-
 drivers/clk/clk-versaclock7.c | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

-- 
2.25.1

