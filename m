Return-Path: <SRS0=VWtO=PX=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3F34C43387
	for <linux-clk@archiver.kernel.org>; Tue, 15 Jan 2019 09:15:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AF3B520645
	for <linux-clk@archiver.kernel.org>; Tue, 15 Jan 2019 09:15:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="t5MGrblB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728582AbfAOJPj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 15 Jan 2019 04:15:39 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:40890 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725929AbfAOJPj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 15 Jan 2019 04:15:39 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x0F9FW27015989;
        Tue, 15 Jan 2019 03:15:32 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1547543732;
        bh=AUjqUXTUv6t7jIPtmRhlTHS2oJ7GrPvxwSKt3tsz4oI=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=t5MGrblBo4oZYYKF44/Ag32i+B/f4kwRMuY/uhJww/sbqyCjMgc6wV4Mqr1CEyGTi
         wCkqc2F9cCVdQVF7ia5bpifp63RRN4jq4WafPtCMpRPysMb38dRIvs9IhpG6NKFZQy
         ybPWDOCDrZIu31oK2Kb4f+jLGTrqEfMMf177iNBg=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x0F9FWWK007623
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 15 Jan 2019 03:15:32 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10; Tue, 15
 Jan 2019 03:15:31 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_0,
 cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend Transport;
 Tue, 15 Jan 2019 03:15:31 -0600
Received: from gomoku.home (ileax41-snat.itg.ti.com [10.172.224.153])
        by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id x0F9FNLi016112;
        Tue, 15 Jan 2019 03:15:30 -0600
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-clk@vger.kernel.org>, <sboyd@kernel.org>,
        <mturquette@baylibre.com>
CC:     <linux-omap@vger.kernel.org>, <tony@atomide.com>
Subject: [PATCH 2/4] clk: ti: add new API for checking if a provided clock is an OMAP clock
Date:   Tue, 15 Jan 2019 11:15:13 +0200
Message-ID: <1547543715-16467-3-git-send-email-t-kristo@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1547543715-16467-1-git-send-email-t-kristo@ti.com>
References: <1547543715-16467-1-git-send-email-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

omap2_clk_is_hw_omap can now be used to verify if the provided clk_hw
is an omap HW clock or not. This is done to replace the usage of CLK_IS_BASIC
flag within the TI clock drivers.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 drivers/clk/ti/clk.c   | 18 ++++++++++++++++++
 drivers/clk/ti/clock.h |  1 +
 2 files changed, 19 insertions(+)

diff --git a/drivers/clk/ti/clk.c b/drivers/clk/ti/clk.c
index 8172843..05f9d1a 100644
--- a/drivers/clk/ti/clk.c
+++ b/drivers/clk/ti/clk.c
@@ -559,3 +559,22 @@ int omap2_clk_for_each(int (*fn)(struct clk_hw_omap *hw))
 
 	return ret;
 }
+
+/**
+ * omap2_clk_is_hw_omap - check if the provided clk_hw is OMAP clock
+ * @hw: clk_hw to check if it is an omap clock or not
+ *
+ * Checks if the provided clk_hw is OMAP clock or not. Returns true if
+ * it is, false otherwise.
+ */
+bool omap2_clk_is_hw_omap(struct clk_hw *hw)
+{
+	struct clk_hw_omap *oclk;
+
+	list_for_each_entry(oclk, &clk_hw_omap_clocks, node) {
+		if (&oclk->hw == hw)
+			return true;
+	}
+
+	return false;
+}
diff --git a/drivers/clk/ti/clock.h b/drivers/clk/ti/clock.h
index e5b8af3..034ff6a 100644
--- a/drivers/clk/ti/clock.h
+++ b/drivers/clk/ti/clock.h
@@ -302,6 +302,7 @@ long omap4_dpll_regm4xen_round_rate(struct clk_hw *hw,
 int omap4_dpll_regm4xen_determine_rate(struct clk_hw *hw,
 				       struct clk_rate_request *req);
 int omap2_clk_for_each(int (*fn)(struct clk_hw_omap *hw));
+bool omap2_clk_is_hw_omap(struct clk_hw *hw);
 
 extern struct ti_clk_ll_ops *ti_clk_ll_ops;
 
-- 
1.9.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
