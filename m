Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C992C07E95
	for <linux-clk@archiver.kernel.org>; Tue, 13 Jul 2021 14:46:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E75CB6128C
	for <linux-clk@archiver.kernel.org>; Tue, 13 Jul 2021 14:46:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236882AbhGMOtW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 13 Jul 2021 10:49:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:58600 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236883AbhGMOtW (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 13 Jul 2021 10:49:22 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 695D961289;
        Tue, 13 Jul 2021 14:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626187592;
        bh=/oei90Ltg62kh8uWBdh1e3F5iY/fUBosgEXNrPGV8eM=;
        h=From:To:Cc:Subject:Date:From;
        b=DLjkEgMVuzJNNkwwONJ4zssNmeFtCQzlZR1aDCtwiayFNLOVQlv4G59X8y6w7nR9K
         64QurgCEOprICLkPTQHqiMeaOQynMPpK7I6bDWZjDQLh4kCFcUuEM6gSR2489JRUki
         +HcL/Z19Nf2mFpRNWsULJnSBy/MPzIFh6rvgkh5uILOkEGyr375ZKJdA233cFXs4ku
         WOzi1XhMeWbBZRohTuMwiNm5cMDLDNzP/dXLWp04XdyHKhRTGtP58QSuUpzQenSyGO
         cfsmy+E11ZwbZ0B+EcadWFRVWVBGEnLy7EMu7A4JIWxPfhIb/b5n761VbWjBTRMFAK
         //LTIAHa706iw==
From:   Dinh Nguyen <dinguyen@kernel.org>
To:     linux-clk@vger.kernel.org
Cc:     dinguyen@kernel.org, sboyd@kernel.org, mturquette@baylibre.com,
        stable@vger.kernel.org, Kris Chaplin <kris.chaplin@intel.com>
Subject: [PATCH 1/3] clk: socfpga: agilex: fix the parents of the psi_ref_clk
Date:   Tue, 13 Jul 2021 09:46:19 -0500
Message-Id: <20210713144621.605140-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The psi_ref_clk comes from the C2 node of the main_pll and periph_pll,
not the C3.

Fixes: 80c6b7a0894f ("clk: socfpga: agilex: add clock driver for the Agilex platform")
Cc: stable@vger.kernel.org
Signed-off-by: Kris Chaplin <kris.chaplin@intel.com>
Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
---
 drivers/clk/socfpga/clk-agilex.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/socfpga/clk-agilex.c b/drivers/clk/socfpga/clk-agilex.c
index 1cb21ea79c64..9dffe9ba0e74 100644
--- a/drivers/clk/socfpga/clk-agilex.c
+++ b/drivers/clk/socfpga/clk-agilex.c
@@ -107,10 +107,10 @@ static const struct clk_parent_data gpio_db_free_mux[] = {
 };
 
 static const struct clk_parent_data psi_ref_free_mux[] = {
-	{ .fw_name = "main_pll_c3",
-	  .name = "main_pll_c3", },
-	{ .fw_name = "peri_pll_c3",
-	  .name = "peri_pll_c3", },
+	{ .fw_name = "main_pll_c2",
+	  .name = "main_pll_c2", },
+	{ .fw_name = "peri_pll_c2",
+	  .name = "peri_pll_c2", },
 	{ .fw_name = "osc1",
 	  .name = "osc1", },
 	{ .fw_name = "cb-intosc-hs-div2-clk",
-- 
2.25.1

