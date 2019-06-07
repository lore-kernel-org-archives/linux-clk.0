Return-Path: <SRS0=Ii/d=UG=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,T_DKIMWL_WL_HIGH,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6405C2BCA1
	for <linux-clk@archiver.kernel.org>; Fri,  7 Jun 2019 15:12:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BAB952089E
	for <linux-clk@archiver.kernel.org>; Fri,  7 Jun 2019 15:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1559920378;
	bh=PYE7F0VVjdf0vn+IZNw1mdkAtynuZLWLMkQ4OG1xVHM=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=jaFd8Nd4x0AGMCkKo7vg5VzTtl9KHBtb1Ug7SmgmEtexjdBAnheG53k1vkNx+ZV2i
	 045BAdPGw3rtoArmFUtsUSMDtUJP/uOBaTDoasqJLR7/1kTmgiH+Ef3z09xxiRM/6f
	 CwI+fihg7nm+yJnGFkRPxmBqxU3cpO9XCWGkqxy8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729342AbfFGPM6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 7 Jun 2019 11:12:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:53150 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729173AbfFGPM6 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 7 Jun 2019 11:12:58 -0400
Received: from localhost.localdomain (cpe-70-114-128-244.austin.res.rr.com [70.114.128.244])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4E9E72089E;
        Fri,  7 Jun 2019 15:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559920377;
        bh=PYE7F0VVjdf0vn+IZNw1mdkAtynuZLWLMkQ4OG1xVHM=;
        h=From:To:Cc:Subject:Date:From;
        b=GCu5nhiQHWhVnddGDLLHNh3mQALfm432JmbJzsGfUqdMScXWnhNciawmGYUWbNXlN
         DImU8IicdD2NyxGAnC9EB6/0lCxBhmhb6MU0xAWLKMbI0A0R4sGQkJOTxlc2Z6JbuJ
         RQGBuG0oscXyAz7na8T1oSn1To9R/bqOGIxFkfzA=
From:   Dinh Nguyen <dinguyen@kernel.org>
To:     linux-clk@vger.kernel.org
Cc:     dinguyen@kernel.org, mturquette@baylibre.com,
        stable@vger.kernel.org
Subject: [PATCH] clk: socfpga: stratix10: fix divider entry for the emac clocks
Date:   Fri,  7 Jun 2019 10:12:46 -0500
Message-Id: <20190607151246.8700-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The fixed dividers for the emac clocks should be 2 not 4.

Cc: stable@vger.kernel.org
Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
---
 drivers/clk/socfpga/clk-s10.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/socfpga/clk-s10.c b/drivers/clk/socfpga/clk-s10.c
index 8281dfbf38c2..5bed36e12951 100644
--- a/drivers/clk/socfpga/clk-s10.c
+++ b/drivers/clk/socfpga/clk-s10.c
@@ -103,9 +103,9 @@ static const struct stratix10_perip_cnt_clock s10_main_perip_cnt_clks[] = {
 	{ STRATIX10_NOC_CLK, "noc_clk", NULL, noc_mux, ARRAY_SIZE(noc_mux),
 	  0, 0, 0, 0x3C, 1},
 	{ STRATIX10_EMAC_A_FREE_CLK, "emaca_free_clk", NULL, emaca_free_mux, ARRAY_SIZE(emaca_free_mux),
-	  0, 0, 4, 0xB0, 0},
+	  0, 0, 2, 0xB0, 0},
 	{ STRATIX10_EMAC_B_FREE_CLK, "emacb_free_clk", NULL, emacb_free_mux, ARRAY_SIZE(emacb_free_mux),
-	  0, 0, 4, 0xB0, 1},
+	  0, 0, 2, 0xB0, 1},
 	{ STRATIX10_EMAC_PTP_FREE_CLK, "emac_ptp_free_clk", NULL, emac_ptp_free_mux,
 	  ARRAY_SIZE(emac_ptp_free_mux), 0, 0, 4, 0xB0, 2},
 	{ STRATIX10_GPIO_DB_FREE_CLK, "gpio_db_free_clk", NULL, gpio_db_free_mux,
-- 
2.20.0

