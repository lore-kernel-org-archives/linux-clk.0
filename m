Return-Path: <SRS0=/Rha=4C=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71541C35242
	for <linux-clk@archiver.kernel.org>; Fri, 14 Feb 2020 03:34:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3C861217F4
	for <linux-clk@archiver.kernel.org>; Fri, 14 Feb 2020 03:34:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f1IntwTH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728089AbgBNDen (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 13 Feb 2020 22:34:43 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:55360 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728052AbgBNDem (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 13 Feb 2020 22:34:42 -0500
Received: by mail-pj1-f68.google.com with SMTP id d5so3275090pjz.5
        for <linux-clk@vger.kernel.org>; Thu, 13 Feb 2020 19:34:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=6g5qTCrzQFZ3eAHmVApQv94R1DbpyCc1XXw3LcUa15Y=;
        b=f1IntwTHC7VZyI+zY4q/yOBy+KQdGMha4v1cqv8pLpPgml/BPg2XPrgDmdm4HTiRHh
         85YtsRWk1IVRAmVnIHL9Pvr1PZ/d6avCNuu5r5aPuJD4X4KjAvuBaZSQIAKI/MGDKK6W
         Exy0caGbef7j2SFeqsuRQ61bLzBmgSVXO4zD2Skfb5wcJ0siPQ5aiRQU7PoqdTCH/BLm
         k1DLM7002tzlv/dLQnDEEuu6Fu8C4TMuWcncSSyfcmvOHM4jAbH3L6Yw602cmoFcm/Hr
         3C3yW/Q5q+m042dxiS/Diktcz2i/ipplHBeC0uoutBTBERDFAnfRc0fvo+eI9XsJ+8FZ
         hMrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=6g5qTCrzQFZ3eAHmVApQv94R1DbpyCc1XXw3LcUa15Y=;
        b=P+tIAC0E+Zvhp9xMvWKJlGiNWkHdOKKc1AXdvGTMyLdw9R8BtGb0zG6N0upk6Qh0pm
         lWf/o1A4QL7Y8REVJzsMORqCMNA4WhFj/Ss7XZITNHrrgiRG2cT6US9xF8Zx6r6+T8F8
         C0MJNkZbTlp6K+HBVIGpUkc1wRjMnEHdIQHgw2IIXhDpQAB/9rpUQgLMmkCb6oJ/ZAnL
         Jr7V8WKsqiGYYEwtbg0gJ9DVNWoFhc6Xpx7ZoSkHUFF0CoDwIJ5c0uqy8rrmqlisgN5S
         a1yp9DC7bVkxdyU2qAiLAxMuFJvUnEah2Axom0ccoH9mO5eij2qt54f307w/qbCPxWAz
         M/rw==
X-Gm-Message-State: APjAAAUYzUAYeRj5SDWaPmdKHmh98LMxbUxWPCasIce3j8iLxAKOU7zF
        DdowVpGQ3/8qWTo2sertyh4=
X-Google-Smtp-Source: APXvYqzBwfz75bgRIbLvVitkuu/3R+QCx8h5dAkZWCHTZIwfT55ZqHKw3qxqNfRN+kp8lFGjITixEw==
X-Received: by 2002:a17:90a:7303:: with SMTP id m3mr997565pjk.62.1581651282189;
        Thu, 13 Feb 2020 19:34:42 -0800 (PST)
Received: from localhost ([43.224.245.179])
        by smtp.gmail.com with ESMTPSA id w6sm5065297pfq.99.2020.02.13.19.34.41
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 13 Feb 2020 19:34:41 -0800 (PST)
From:   qiwuchen55@gmail.com
To:     mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com
Cc:     kstewart@linuxfoundation.org, seiya.wang@mediatek.com,
        gregkh@linuxfoundation.org, tglx@linutronix.de,
        linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org,
        chenqiwu <chenqiwu@xiaomi.com>
Subject: [PATCH] clk: mediatek: clk-mt8173: fix potential memory leak
Date:   Fri, 14 Feb 2020 11:34:34 +0800
Message-Id: <1581651274-5933-1-git-send-email-qiwuchen55@gmail.com>
X-Mailer: git-send-email 1.9.1
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: chenqiwu <chenqiwu@xiaomi.com>

Free clk_data or iomem resources if init is not successful.

Signed-off-by: chenqiwu <chenqiwu@xiaomi.com>
---
 drivers/clk/mediatek/clk-mt8173.c | 43 +++++++++++++++++++++++++++++++--------
 1 file changed, 34 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8173.c b/drivers/clk/mediatek/clk-mt8173.c
index 537a7f4..eaf4e70 100644
--- a/drivers/clk/mediatek/clk-mt8173.c
+++ b/drivers/clk/mediatek/clk-mt8173.c
@@ -7,6 +7,7 @@
 #include <linux/clk.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
+#include <linux/slab.h>
 
 #include "clk-mtk.h"
 #include "clk-gate.h"
@@ -941,9 +942,13 @@ static void __init mtk_topckgen_init(struct device_node *node)
 			&mt8173_clk_lock, clk_data);
 
 	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
-	if (r)
+	if (r) {
 		pr_err("%s(): could not register clock provider: %d\n",
 			__func__, r);
+		kfree(clk_data);
+		clk_data = NULL;
+		iounmap(base);
+	}
 
 	mtk_clk_enable_critical();
 }
@@ -964,9 +969,11 @@ static void __init mtk_infrasys_init(struct device_node *node)
 				  clk_data);
 
 	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
-	if (r)
+	if (r) {
 		pr_err("%s(): could not register clock provider: %d\n",
 			__func__, r);
+		kfree(clk_data);
+	}
 
 	mtk_register_reset_controller(node, 2, 0x30);
 }
@@ -992,9 +999,12 @@ static void __init mtk_pericfg_init(struct device_node *node)
 			&mt8173_clk_lock, clk_data);
 
 	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
-	if (r)
+	if (r) {
 		pr_err("%s(): could not register clock provider: %d\n",
 			__func__, r);
+		kfree(clk_data);
+		iounmap(base);
+	}
 
 	mtk_register_reset_controller(node, 2, 0);
 }
@@ -1117,9 +1127,14 @@ static void __init mtk_apmixedsys_init(struct device_node *node)
 	clk_data->clks[CLK_APMIXED_HDMI_REF] = clk;
 
 	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
-	if (r)
+	if (r) {
 		pr_err("%s(): could not register clock provider: %d\n",
 			__func__, r);
+		clk_unregister_divider(clk);
+		kfree(clk_data);
+		clk_data = NULL;
+		iounmap(base);
+	}
 
 	mtk_clk_enable_critical();
 }
@@ -1138,9 +1153,11 @@ static void __init mtk_imgsys_init(struct device_node *node)
 
 	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
 
-	if (r)
+	if (r) {
 		pr_err("%s(): could not register clock provider: %d\n",
 			__func__, r);
+		kfree(clk_data);
+	}
 }
 CLK_OF_DECLARE(mtk_imgsys, "mediatek,mt8173-imgsys", mtk_imgsys_init);
 
@@ -1155,9 +1172,11 @@ static void __init mtk_mmsys_init(struct device_node *node)
 						clk_data);
 
 	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
-	if (r)
+	if (r) {
 		pr_err("%s(): could not register clock provider: %d\n",
 			__func__, r);
+		kfree(clk_data);
+	}
 }
 CLK_OF_DECLARE(mtk_mmsys, "mediatek,mt8173-mmsys", mtk_mmsys_init);
 
@@ -1172,9 +1191,11 @@ static void __init mtk_vdecsys_init(struct device_node *node)
 						clk_data);
 
 	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
-	if (r)
+	if (r) {
 		pr_err("%s(): could not register clock provider: %d\n",
 			__func__, r);
+		kfree(clk_data);
+	}
 }
 CLK_OF_DECLARE(mtk_vdecsys, "mediatek,mt8173-vdecsys", mtk_vdecsys_init);
 
@@ -1189,9 +1210,11 @@ static void __init mtk_vencsys_init(struct device_node *node)
 						clk_data);
 
 	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
-	if (r)
+	if (r) {
 		pr_err("%s(): could not register clock provider: %d\n",
 			__func__, r);
+		kfree(clk_data);
+	}
 }
 CLK_OF_DECLARE(mtk_vencsys, "mediatek,mt8173-vencsys", mtk_vencsys_init);
 
@@ -1206,8 +1229,10 @@ static void __init mtk_vencltsys_init(struct device_node *node)
 						clk_data);
 
 	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
-	if (r)
+	if (r) {
 		pr_err("%s(): could not register clock provider: %d\n",
 			__func__, r);
+		kfree(clk_data);
+	}
 }
 CLK_OF_DECLARE(mtk_vencltsys, "mediatek,mt8173-vencltsys", mtk_vencltsys_init);
-- 
1.9.1

