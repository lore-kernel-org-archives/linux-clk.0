Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E45D7C433EF
	for <linux-clk@archiver.kernel.org>; Tue, 14 Sep 2021 14:32:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CB710610A2
	for <linux-clk@archiver.kernel.org>; Tue, 14 Sep 2021 14:32:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233680AbhINOdZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 14 Sep 2021 10:33:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:56436 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233617AbhINOdW (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 14 Sep 2021 10:33:22 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id F0C546108B;
        Tue, 14 Sep 2021 14:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631629925;
        bh=j7QeoAqx7O6PKFQgLdyp0XSXkR/C1vAIhHAkHveesOg=;
        h=From:To:Cc:Subject:Date:From;
        b=eHmVDzT3HY9niIE/rjQ5y0Ufh99rmJCTUmOdJtF7A+bQ3dKmxrNwTQwt1bS0wVhH8
         GSVIlhASHlRxspSN3K3wmTebvXRtnES2rI533+6ZlkG2zIblDhrF7VMF7o4KbBp9tw
         9shmvLn6MHBrGcVsT2JTwwqhtWWs7aUr9S7u39df7Tv7wlfBxedmIfJVL2HYnsgsAJ
         MhVn0Y/Rl3xluk0PrC9Pkh81J7A15fDFKMW7ZN/TSCYEaRj5Jw28J/hZzV2fK8LVoB
         xbEXb/QYIpzpxWUpB2CYbAZkb5xZN2rWF2Lw0tCUw+lQBQ67HfXjQjpXPVRHM5HdIh
         gHJvfqWPibhow==
From:   Dinh Nguyen <dinguyen@kernel.org>
To:     sboyd@kernel.org
Cc:     dinguyen@kernel.org, mturquette@baylibre.com,
        linux-clk@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: [PATCH] clk: socfpga: agilex: remove unused s2f_usr0_clk define
Date:   Tue, 14 Sep 2021 09:32:01 -0500
Message-Id: <20210914143201.1062947-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Remove unused s2f_usr0_clk define.

Fixes: 80c6b7a0894f ("clk: socfpga: agilex: add clock driver for the
Agilex platform")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
---
 drivers/clk/socfpga/clk-agilex.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/clk/socfpga/clk-agilex.c b/drivers/clk/socfpga/clk-agilex.c
index b4d300fbbc66..bf8cd928c228 100644
--- a/drivers/clk/socfpga/clk-agilex.c
+++ b/drivers/clk/socfpga/clk-agilex.c
@@ -165,13 +165,6 @@ static const struct clk_parent_data mpu_mux[] = {
 	  .name = "boot_clk", },
 };
 
-static const struct clk_parent_data s2f_usr0_mux[] = {
-	{ .fw_name = "f2s-free-clk",
-	  .name = "f2s-free-clk", },
-	{ .fw_name = "boot_clk",
-	  .name = "boot_clk", },
-};
-
 static const struct clk_parent_data emac_mux[] = {
 	{ .fw_name = "emaca_free_clk",
 	  .name = "emaca_free_clk", },
-- 
2.25.1

