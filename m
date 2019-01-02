Return-Path: <SRS0=vVV6=PK=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1886EC43387
	for <linux-clk@archiver.kernel.org>; Wed,  2 Jan 2019 14:59:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D5CFF218FF
	for <linux-clk@archiver.kernel.org>; Wed,  2 Jan 2019 14:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1546441191;
	bh=EuszS8KBOJ304Cnia9J6Vs+/UHV0QCxGUcTe6yeso/M=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=Q5/eD6aY52B+yCLycajClctBQNp8OiNHcRuGMEJUS/j0dOtiMDYZNw9MHrKGS593v
	 q55mreDx6kXi1DFaXJ2CLDhNEIfa0AcDmyWSYl99pai8NtOiym824JYWGSl/K4/klW
	 mSgd9bZAUEBSjI0n1zqxzlYTf7qVXLwqpj7eT450=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729462AbfABO7v (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 2 Jan 2019 09:59:51 -0500
Received: from mail.kernel.org ([198.145.29.99]:54856 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729358AbfABO7v (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 2 Jan 2019 09:59:51 -0500
Received: from localhost.localdomain (cpe-70-114-128-244.austin.res.rr.com [70.114.128.244])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BAE3A218E2;
        Wed,  2 Jan 2019 14:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1546441190;
        bh=EuszS8KBOJ304Cnia9J6Vs+/UHV0QCxGUcTe6yeso/M=;
        h=From:To:Cc:Subject:Date:From;
        b=b3aAcjBFlrmZBH6z7ZbwMQUeRqDoryo8a+Q46+wtLJwx36BassH2TsNui0rAji4yi
         FCBcuf4LT44ArRBvrlLd+kNZgXy/qebUonAkON1XCDvKeGqYTFp1emTjyTjCGRMRp3
         TfE4GgbXViybF03mNKKNY60RTuzDH9M0CFg3GVlI=
From:   Dinh Nguyen <dinguyen@kernel.org>
To:     linux-clk@vger.kernel.org
Cc:     dinguyen@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        linux-stable@vger.kernel.org
Subject: [PATCH RESEND 1/2] clk: socfpga: stratix10: fix naming convention for the fixed-clocks
Date:   Wed,  2 Jan 2019 08:59:31 -0600
Message-Id: <20190102145932.26423-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The fixed clocks in the DTS file have a hyphen, but the clock driver has
the fixed clocks using underbar. Thus the clock driver cannot detect the
other fixed clocks correctly. Change the fixed clock names to a hyphen.

Fixes: 07afb8db7340 ("clk: socfpga: stratix10: add clock driver for
Stratix10 platform")
Cc: linux-stable@vger.kernel.org
Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
---
 drivers/clk/socfpga/clk-s10.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/socfpga/clk-s10.c b/drivers/clk/socfpga/clk-s10.c
index 5b238fc314ac..8281dfbf38c2 100644
--- a/drivers/clk/socfpga/clk-s10.c
+++ b/drivers/clk/socfpga/clk-s10.c
@@ -12,17 +12,17 @@
 
 #include "stratix10-clk.h"
 
-static const char * const pll_mux[] = { "osc1", "cb_intosc_hs_div2_clk",
-					"f2s_free_clk",};
+static const char * const pll_mux[] = { "osc1", "cb-intosc-hs-div2-clk",
+					"f2s-free-clk",};
 static const char * const cntr_mux[] = { "main_pll", "periph_pll",
-					 "osc1", "cb_intosc_hs_div2_clk",
-					 "f2s_free_clk"};
-static const char * const boot_mux[] = { "osc1", "cb_intosc_hs_div2_clk",};
+					 "osc1", "cb-intosc-hs-div2-clk",
+					 "f2s-free-clk"};
+static const char * const boot_mux[] = { "osc1", "cb-intosc-hs-div2-clk",};
 
 static const char * const noc_free_mux[] = {"main_noc_base_clk",
 					    "peri_noc_base_clk",
-					    "osc1", "cb_intosc_hs_div2_clk",
-					    "f2s_free_clk"};
+					    "osc1", "cb-intosc-hs-div2-clk",
+					    "f2s-free-clk"};
 
 static const char * const emaca_free_mux[] = {"peri_emaca_clk", "boot_clk"};
 static const char * const emacb_free_mux[] = {"peri_emacb_clk", "boot_clk"};
@@ -33,14 +33,14 @@ static const char * const s2f_usr1_free_mux[] = {"peri_s2f_usr1_clk", "boot_clk"
 static const char * const psi_ref_free_mux[] = {"peri_psi_ref_clk", "boot_clk"};
 static const char * const mpu_mux[] = { "mpu_free_clk", "boot_clk",};
 
-static const char * const s2f_usr0_mux[] = {"f2s_free_clk", "boot_clk"};
+static const char * const s2f_usr0_mux[] = {"f2s-free-clk", "boot_clk"};
 static const char * const emac_mux[] = {"emaca_free_clk", "emacb_free_clk"};
 static const char * const noc_mux[] = {"noc_free_clk", "boot_clk"};
 
 static const char * const mpu_free_mux[] = {"main_mpu_base_clk",
 					    "peri_mpu_base_clk",
-					    "osc1", "cb_intosc_hs_div2_clk",
-					    "f2s_free_clk"};
+					    "osc1", "cb-intosc-hs-div2-clk",
+					    "f2s-free-clk"};
 
 /* clocks in AO (always on) controller */
 static const struct stratix10_pll_clock s10_pll_clks[] = {
-- 
2.20.0

