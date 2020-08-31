Return-Path: <SRS0=AQ30=CJ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2036FC433E2
	for <linux-clk@archiver.kernel.org>; Mon, 31 Aug 2020 20:27:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EE5E720866
	for <linux-clk@archiver.kernel.org>; Mon, 31 Aug 2020 20:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1598905627;
	bh=FKJUUFfiBzy/Fwi69G8URDaFuUpGpknlj3fS1KLKh5I=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=r27m86Q2lPi+/1WjF4+oiaTkor2uIS6DUF60icRSaOH+ZyIX7RKjIatewyaP73rgW
	 Y4bKJbmXXjvh30d111zRKMA2OTbwIcpwmGsOWoL99hx+sVRlHY4Jz9CViZVxcky3Wo
	 462q2KTRe7PT2JmkQ0X6c9lJ8eJf8NsGwdzRt77Q=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728210AbgHaU1G (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 31 Aug 2020 16:27:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:48610 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726928AbgHaU1G (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 31 Aug 2020 16:27:06 -0400
Received: from localhost.localdomain (cpe-70-114-140-30.austin.res.rr.com [70.114.140.30])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6A46B20866;
        Mon, 31 Aug 2020 20:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598905625;
        bh=FKJUUFfiBzy/Fwi69G8URDaFuUpGpknlj3fS1KLKh5I=;
        h=From:To:Cc:Subject:Date:From;
        b=DqZDfLZnJFMuqWgC3G+cxDunjabb4mI08TsqC3yckrv5rEwIzwxALOkx6B4AKzK0O
         Jz9v1GnqdMponduEwqrFAl4n3WfdZtsRm8MmHV+/WROwRQscsVauCSFcsNp/7BdznN
         ZTzUboSNixe7HWcJedPlM5x/hBRzN92RszRr5D68=
From:   Dinh Nguyen <dinguyen@kernel.org>
To:     sboyd@kernel.org
Cc:     dinguyen@kernel.org, mturquette@baylibre.com,
        linux-clk@vger.kernel.org, stable@vger.kernel.org
Subject: [PATCH] clk: socfpga: stratix10: fix the divider for the emac_ptp_free_clk
Date:   Mon, 31 Aug 2020 15:26:57 -0500
Message-Id: <20200831202657.8224-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The fixed divider the emac_ptp_free_clk should be 2, not 4.

Fixes: 07afb8db7340 ("clk: socfpga: stratix10: add clock driver for
Stratix10 platform")
Cc: stable@vger.kernel.org
Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
---
 drivers/clk/socfpga/clk-s10.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/socfpga/clk-s10.c b/drivers/clk/socfpga/clk-s10.c
index c1dfc9b34e4e..661a8e9bfb9b 100644
--- a/drivers/clk/socfpga/clk-s10.c
+++ b/drivers/clk/socfpga/clk-s10.c
@@ -209,7 +209,7 @@ static const struct stratix10_perip_cnt_clock s10_main_perip_cnt_clks[] = {
 	{ STRATIX10_EMAC_B_FREE_CLK, "emacb_free_clk", NULL, emacb_free_mux, ARRAY_SIZE(emacb_free_mux),
 	  0, 0, 2, 0xB0, 1},
 	{ STRATIX10_EMAC_PTP_FREE_CLK, "emac_ptp_free_clk", NULL, emac_ptp_free_mux,
-	  ARRAY_SIZE(emac_ptp_free_mux), 0, 0, 4, 0xB0, 2},
+	  ARRAY_SIZE(emac_ptp_free_mux), 0, 0, 2, 0xB0, 2},
 	{ STRATIX10_GPIO_DB_FREE_CLK, "gpio_db_free_clk", NULL, gpio_db_free_mux,
 	  ARRAY_SIZE(gpio_db_free_mux), 0, 0, 0, 0xB0, 3},
 	{ STRATIX10_SDMMC_FREE_CLK, "sdmmc_free_clk", NULL, sdmmc_free_mux,
-- 
2.17.1

