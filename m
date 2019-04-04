Return-Path: <SRS0=Ee6+=SG=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BA73C4360F
	for <linux-clk@archiver.kernel.org>; Thu,  4 Apr 2019 08:12:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6C0342075E
	for <linux-clk@archiver.kernel.org>; Thu,  4 Apr 2019 08:12:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ZHhZsnLr"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727314AbfDDIMW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 4 Apr 2019 04:12:22 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:35304 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727321AbfDDIMV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 4 Apr 2019 04:12:21 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x348CJ6r105729;
        Thu, 4 Apr 2019 03:12:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1554365539;
        bh=zIf/X6VrPJCu25i6tJISEyLUL/53b+r8hYLAt8o0Gd4=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=ZHhZsnLru7MxVVMKxVPNp2fRTjqKei6On40D0gV+S5ZWYIFU7QDcBnkuX5/nYN9I3
         9DLaFxedxaG6ZzT2kSv1Qib1RySVsMRhDZ6apgxQbDdztiCg9uzxKLUIRf+niotmeD
         LsAXcUV+3r3mP2TTk2q3KzkxAShTx2lB2HE9d5LE=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x348CIfV004647
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 4 Apr 2019 03:12:19 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 4 Apr
 2019 03:12:12 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 4 Apr 2019 03:12:12 -0500
Received: from gomoku.home (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x348C8G8093305;
        Thu, 4 Apr 2019 03:12:11 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-clk@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <sboyd@kernel.org>, <mturquette@baylibre.com>
CC:     <tony@atomide.com>
Subject: [PATCH 1/6] clk: ti: export the omap2_clk_is_hw_omap call
Date:   Thu, 4 Apr 2019 11:11:02 +0300
Message-ID: <1554365467-1325-2-git-send-email-t-kristo@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1554365467-1325-1-git-send-email-t-kristo@ti.com>
References: <1554365467-1325-1-git-send-email-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

There is one instance outside the TI clock driver that needs the info
whether a clock is an OMAP HW clock or not. Thus, move the function
declaration into the public header.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 drivers/clk/ti/clock.h | 1 -
 include/linux/clk/ti.h | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/ti/clock.h b/drivers/clk/ti/clock.h
index 1c0fac5..4223a39 100644
--- a/drivers/clk/ti/clock.h
+++ b/drivers/clk/ti/clock.h
@@ -303,7 +303,6 @@ long omap4_dpll_regm4xen_round_rate(struct clk_hw *hw,
 int omap4_dpll_regm4xen_determine_rate(struct clk_hw *hw,
 				       struct clk_rate_request *req);
 int omap2_clk_for_each(int (*fn)(struct clk_hw_omap *hw));
-bool omap2_clk_is_hw_omap(struct clk_hw *hw);
 
 extern struct ti_clk_ll_ops *ti_clk_ll_ops;
 
diff --git a/include/linux/clk/ti.h b/include/linux/clk/ti.h
index 78872ef..2821f7c 100644
--- a/include/linux/clk/ti.h
+++ b/include/linux/clk/ti.h
@@ -243,6 +243,7 @@ struct ti_clk_ll_ops {
 
 #define to_clk_hw_omap(_hw) container_of(_hw, struct clk_hw_omap, hw)
 
+bool omap2_clk_is_hw_omap(struct clk_hw *hw);
 int omap2_clk_disable_autoidle_all(void);
 int omap2_clk_enable_autoidle_all(void);
 int omap2_clk_allow_idle(struct clk *clk);
-- 
1.9.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
