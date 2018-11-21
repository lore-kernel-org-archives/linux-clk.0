Return-Path: <SRS0=GqaR=OA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BCB4C04EBC
	for <linux-clk@archiver.kernel.org>; Wed, 21 Nov 2018 12:05:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 642772147D
	for <linux-clk@archiver.kernel.org>; Wed, 21 Nov 2018 12:05:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="hF1mHiPR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 642772147D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=partner.samsung.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730160AbeKUWjf (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 21 Nov 2018 17:39:35 -0500
Received: from mailout2.w1.samsung.com ([210.118.77.12]:59552 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730158AbeKUWjd (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 21 Nov 2018 17:39:33 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20181121120524euoutp026d68c9e51d581df07b99409902a36cf7~pIi04rfa82265922659euoutp02G
        for <linux-clk@vger.kernel.org>; Wed, 21 Nov 2018 12:05:24 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20181121120524euoutp026d68c9e51d581df07b99409902a36cf7~pIi04rfa82265922659euoutp02G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1542801925;
        bh=ZY2Iuoas7jj4oYHKVudDzZH+CETEZUbA3NmgyctNE6w=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=hF1mHiPRkOTQUudEbZnhzIpSggOgC/atB/Px7w3WDld9zeN8SM/Ky7vsKOosASfY9
         ES4BLLcJOxWwPvO14gU1X7H1AHCuPRHViz7QrqlZtq/EZ5M303CL/mThT005eXfqJU
         L1KHeF2iZ38aFwXxDQkgcobq4BKlFlnq6qQ2iiHI=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20181121120523eucas1p28e773bcdcb65fa37fd46830c23f44800~pIiz_bEmW2634226342eucas1p26;
        Wed, 21 Nov 2018 12:05:23 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 1A.8B.04441.30A45FB5; Wed, 21
        Nov 2018 12:05:23 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20181121120523eucas1p1e69848a515c713315499e6e21f099cc2~pIizKt2ys2577425774eucas1p1k;
        Wed, 21 Nov 2018 12:05:23 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20181121120523eusmtrp1e2895983289a2b6541a45edea5813fc2~pIizJH9Jv1333913339eusmtrp1L;
        Wed, 21 Nov 2018 12:05:23 +0000 (GMT)
X-AuditID: cbfec7f2-5c9ff70000001159-58-5bf54a03f631
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 6A.F2.04128.30A45FB5; Wed, 21
        Nov 2018 12:05:23 +0000 (GMT)
Received: from AMDC3218.DIGITAL.local (unknown [106.120.51.18]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20181121120522eusmtip2d9b14f31053986dbad2b21e1df47149e~pIiyo2tqi1640016400eusmtip2O;
        Wed, 21 Nov 2018 12:05:22 +0000 (GMT)
From:   Kamil Konieczny <k.konieczny@partner.samsung.com>
To:     k.konieczny@partner.samsung.com, linux-samsung-soc@vger.kernel.org
Cc:     linux-clk@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>,
        devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Kukjin Kim <kgene@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 1/4] clk: samsung: exynos5433: fix name typos
Date:   Wed, 21 Nov 2018 13:05:06 +0100
Message-Id: <20181121120509.18892-2-k.konieczny@partner.samsung.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181121120509.18892-1-k.konieczny@partner.samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02SbUhTYRTHfXZ3t7vh9G5KHlSKpmUZakLhhcxKNIYI9aUPtQ858+KsTWVz
        vtSXke/zvUWpM43Q0uFczpdMTchXQvGNhkpUUmllVjinFWXm9Rb57XfO/384//PwEJikDfcm
        kpLTaE2yQiXlCbmdwz/Gg7CYNfnh7G+BVGulFadmnO9xqm5wHKdK+zYRVfb2E0ZNTDzkUyvF
        r3CqcqKPQ1kGX/KphpkpDpX7ZJBPDSzn4yddZc21zUhmMxfyZE+/9HJkpe1mJFu17T6LXxCG
        J9CqpHRaExIRJ1Tal/tRaqs4s7hnkqdHpe4GRBBAHoGq5ycMSEhIyEYEsw19XAMSbBVOBBvF
        AlZYRfB1uBZjBGbA0lqAscIDBPXWGj5bbE3YLU4e4+KRYfDm0RiHYU/yNJQaTTzGhJF5GCyY
        DNuCB3kcpudGMSYHl9wHNytCGRSRUVAyFMku2wP67jY+wwIyGixG+3Y6ESmGZ1Xvthnb8mR3
        mP6G6+bDaI0/y1GQ27CBWPaApZF2Psu+MGos5rKcAT0di9v5gcxBcMd4j8MKx2BgZApn8mDk
        QbB2h7DtUzB0q4TPvpwbzH4WsxHc4EbnbYxti6AgT8K6g6B2cwxn2QcMmy04a5HBdE50Odpb
        veOW6h23VP9fexdhZuRF67TqRFobmkxnBGsVaq0uOTH4Uorahra+0ujvEUcXWpuO70ckgaSu
        ojgPp1yCK9K1Wep+BAQm9RSdD1+TS0QJiqyrtCblokanorX9yIfgSr1E11zm5RIyUZFGX6Hp
        VFrzT+UQAm898jMuND7OOYpS4XWRwC/MzItZzRcH23RqulDd5FD6H3IvfxFgOqf/qB8f+9D7
        K3Y9zL3MUXffydVEpHZ1NPmuLy1miR01VWq7Cc+ptEZ6iq0r8/GX93/nKFVFLiGdJWdiZ6cm
        D0zWV5QEq1DLHE/np8SMrT8TrlsDMnd5TUi5WqUiNBDTaBV/AP4FIhxGAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrCIsWRmVeSWpSXmKPExsVy+t/xe7rMXl+jDRYtYLHYOGM9q8X1L89Z
        LeYfOcdq0bfvP6NF/+PXzBbnz29gt/jYc4/VYsb5fUwWa4/cZbdYev0ik0Xr3iPsFofftLM6
        8HismbeG0WPTqk42j4Pv9jB59G1ZxejxeZNcAGuUnk1RfmlJqkJGfnGJrVK0oYWRnqGlhZ6R
        iaWeobF5rJWRqZK+nU1Kak5mWWqRvl2CXsbVN4cYCzYKVvTsvsDWwNjH38XIySEhYCKxdmMH
        cxcjF4eQwFJGiVn9u5khEtISjadXM0HYwhJ/rnWxQRR9YpSY9vE7G0iCTcBc4tH2M2BFIgIe
        EjMmLmYFKWIW6GOW+HzwPDtIQljAVuLSzdNAUzk4WARUJaZMNAQxeQVcJHqPOkHMl5do2LUZ
        rJpTwFVi7eSrLCAlQiAll3hBwrwCghInZz5hAbGZgcqbt85mnsAoMAtJahaS1AJGplWMIqml
        xbnpucVGesWJucWleel6yfm5mxiBMbTt2M8tOxi73gUfYhTgYFTi4U0Q/hItxJpYVlyZe4hR
        goNZSYQ30uZrtBBvSmJlVWpRfnxRaU5q8SFGU6APJjJLiSbnA+M7ryTe0NTQ3MLS0NzY3NjM
        Qkmc97xBZZSQQHpiSWp2ampBahFMHxMHp1QDoxtf4uar/XGH/C5n7Nh//uTxsleJH56KHzdd
        s+LSbsMExRd6DGGsmz+wTfp3Lmjlv7+cF54syTqpfOBHzJ5dKxZoXkxusbh15nvv+211XW2G
        Oi/WzTdL+S0Wq3HLeduth4l8l+4tOH57piHP/DqnUlaz886l/HvfzvFxWzPX/FSZmfuebz/T
        /zxUYinOSDTUYi4qTgQAZA4Je7cCAAA=
X-CMS-MailID: 20181121120523eucas1p1e69848a515c713315499e6e21f099cc2
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20181121120523eucas1p1e69848a515c713315499e6e21f099cc2
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20181121120523eucas1p1e69848a515c713315499e6e21f099cc2
References: <20181121120509.18892-1-k.konieczny@partner.samsung.com>
        <CGME20181121120523eucas1p1e69848a515c713315499e6e21f099cc2@eucas1p1.samsung.com>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Fix typo in imem sssx name and typo 200 switched with 266.

Signed-off-by: Kamil Konieczny <k.konieczny@partner.samsung.com>
---
 drivers/clk/samsung/clk-exynos5433.c   | 6 +++---
 include/dt-bindings/clock/exynos5433.h | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos5433.c b/drivers/clk/samsung/clk-exynos5433.c
index 751e2c4fb65b..24c3360db65b 100644
--- a/drivers/clk/samsung/clk-exynos5433.c
+++ b/drivers/clk/samsung/clk-exynos5433.c
@@ -559,7 +559,7 @@ static const struct samsung_gate_clock top_gate_clks[] __initconst = {
 	/* ENABLE_ACLK_TOP */
 	GATE(CLK_ACLK_G3D_400, "aclk_g3d_400", "div_aclk_g3d_400",
 			ENABLE_ACLK_TOP, 30, CLK_IS_CRITICAL, 0),
-	GATE(CLK_ACLK_IMEM_SSX_266, "aclk_imem_ssx_266",
+	GATE(CLK_ACLK_IMEM_SSSX_266, "aclk_imem_sssx_266",
 			"div_aclk_imem_sssx_266", ENABLE_ACLK_TOP,
 			29, CLK_IGNORE_UNUSED, 0),
 	GATE(CLK_ACLK_BUS0_400, "aclk_bus0_400", "div_aclk_bus0_400",
@@ -568,10 +568,10 @@ static const struct samsung_gate_clock top_gate_clks[] __initconst = {
 	GATE(CLK_ACLK_BUS1_400, "aclk_bus1_400", "div_aclk_bus1_400",
 			ENABLE_ACLK_TOP, 25,
 			CLK_IS_CRITICAL | CLK_SET_RATE_PARENT, 0),
-	GATE(CLK_ACLK_IMEM_200, "aclk_imem_200", "div_aclk_imem_266",
+	GATE(CLK_ACLK_IMEM_200, "aclk_imem_200", "div_aclk_imem_200",
 			ENABLE_ACLK_TOP, 24,
 			CLK_IS_CRITICAL | CLK_SET_RATE_PARENT, 0),
-	GATE(CLK_ACLK_IMEM_266, "aclk_imem_266", "div_aclk_imem_200",
+	GATE(CLK_ACLK_IMEM_266, "aclk_imem_266", "div_aclk_imem_266",
 			ENABLE_ACLK_TOP, 23,
 			CLK_IGNORE_UNUSED | CLK_SET_RATE_PARENT, 0),
 	GATE(CLK_ACLK_PERIC_66, "aclk_peric_66", "div_aclk_peric_66_b",
diff --git a/include/dt-bindings/clock/exynos5433.h b/include/dt-bindings/clock/exynos5433.h
index 98bd85ce1e45..87bb2b017143 100644
--- a/include/dt-bindings/clock/exynos5433.h
+++ b/include/dt-bindings/clock/exynos5433.h
@@ -156,7 +156,7 @@
 #define CLK_ACLK_G2D_266		220
 #define CLK_ACLK_G2D_400		221
 #define CLK_ACLK_G3D_400		222
-#define CLK_ACLK_IMEM_SSX_266		223
+#define CLK_ACLK_IMEM_SSSX_266		223
 #define CLK_ACLK_BUS0_400		224
 #define CLK_ACLK_BUS1_400		225
 #define CLK_ACLK_IMEM_200		226
-- 
2.19.1

