Return-Path: <SRS0=r8+F=4H=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 445C4C34050
	for <linux-clk@archiver.kernel.org>; Wed, 19 Feb 2020 10:05:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1AE0621D56
	for <linux-clk@archiver.kernel.org>; Wed, 19 Feb 2020 10:05:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="z47iOBio"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726609AbgBSKFv (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 19 Feb 2020 05:05:51 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:43073 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726598AbgBSKFv (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 19 Feb 2020 05:05:51 -0500
Received: by mail-lf1-f67.google.com with SMTP id 9so16924530lfq.10
        for <linux-clk@vger.kernel.org>; Wed, 19 Feb 2020 02:05:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ALoqKh4KGkm0WihSTPj2PM76XlFoNn+X7MPKYic/P4k=;
        b=z47iOBioEu99AFJC+kobhMUKi42a3OCyEJH7QZSQbE+G4aOQn+l3XyYRD7JiHwtbF/
         81eGDznxnlF191wcIXhLiuvnE1bjG1jSULb750c8skBtb3TWdAflEE5fYEMwlEj09RM/
         ywXX2rHRQixdwjhzR8yTXIy+XgGr+zgVvioHUtZi88B4mXqM1XUJJNFnq5ZIASl7qPUY
         tuCfd3EHkXaSnK1ESEU19oksk5csw4Mu/5hrJWL7fF2tqupmm/RZ9irIxjhlAa9tvrCt
         0Gxw58ETBb0/qUONikV7Qu+X1ivRmLUhX7Qp17KKJuoaRrKAe6HDEWPCNf0lmODBZYgK
         CWFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ALoqKh4KGkm0WihSTPj2PM76XlFoNn+X7MPKYic/P4k=;
        b=epRjqbxtMOR62xiXMOV2kqUoW91Onq/9Zv9V5+ic/aKbA6272GF3AoJVfv0rG077Vp
         s0oOuiZlkiU1ZfOGjWsxSthLk7Feze3C01DLli0tTAAsFtekIZnt/21bqnRUgrN2EkLK
         HMjJPnj357CxHRNOAg9mBYEoIBBRzB3wAQP4KtJnjyR9XZcyBcizENfoF/pJkNap+r4q
         3cvV3ycg/cjFdtoO2e45LLC7BD47BpZT7ZiZHgJBnIyTF4ncgWFn5MxR6Fg/4EXTLYLs
         j5CKlXMKoti6y+umHQoF0sKni/2gZE4aIbqdhLxlgLXTyfma+qQur7VOT5EpieSS7Rrj
         QAZQ==
X-Gm-Message-State: APjAAAXwehIXsye7zHdIf5M3ujWGG4ROsQ1nJXWKlkKXq0Zcr5JTeKmb
        PaTPx2LB8uS1vRiJX6yMFgY43A==
X-Google-Smtp-Source: APXvYqym8ooCqGGGkdg3gwkzgMu3SMmeTZPxMVxEJiMs8adLUKBCPGceqg0HKZ+UAJgc8rw0nWBPPQ==
X-Received: by 2002:ac2:5596:: with SMTP id v22mr12997397lfg.200.1582106749787;
        Wed, 19 Feb 2020 02:05:49 -0800 (PST)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id r2sm1079982lff.63.2020.02.19.02.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2020 02:05:49 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 2/3 v2] clk: versatile: Export icst_clk_setup()
Date:   Wed, 19 Feb 2020 11:05:42 +0100
Message-Id: <20200219100543.78424-2-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200219100543.78424-1-linus.walleij@linaro.org>
References: <20200219100543.78424-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Export this clock setup method so we can register the
IM-PD1 clocks with common code in the next step.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- New patch to reuse the machinery for properly probing
  device tree clocks using clk_hw etc.
---
 drivers/clk/versatile/clk-icst.c | 25 +++++++------------------
 drivers/clk/versatile/clk-icst.h | 21 +++++++++++++++++++++
 2 files changed, 28 insertions(+), 18 deletions(-)

diff --git a/drivers/clk/versatile/clk-icst.c b/drivers/clk/versatile/clk-icst.c
index fe686f77787f..692be2fd9261 100644
--- a/drivers/clk/versatile/clk-icst.c
+++ b/drivers/clk/versatile/clk-icst.c
@@ -33,18 +33,6 @@
 
 #define INTEGRATOR_AP_PCI_25_33_MHZ BIT(8)
 
-/**
- * enum icst_control_type - the type of ICST control register
- */
-enum icst_control_type {
-	ICST_VERSATILE, /* The standard type, all control bits available */
-	ICST_INTEGRATOR_AP_CM, /* Only 8 bits of VDW available */
-	ICST_INTEGRATOR_AP_SYS, /* Only 8 bits of VDW available */
-	ICST_INTEGRATOR_AP_PCI, /* Odd bit pattern storage */
-	ICST_INTEGRATOR_CP_CM_CORE, /* Only 8 bits of VDW and 3 bits of OD */
-	ICST_INTEGRATOR_CP_CM_MEM, /* Only 8 bits of VDW and 3 bits of OD */
-};
-
 /**
  * struct clk_icst - ICST VCO clock wrapper
  * @hw: corresponding clock hardware entry
@@ -344,12 +332,12 @@ static const struct clk_ops icst_ops = {
 	.set_rate = icst_set_rate,
 };
 
-static struct clk *icst_clk_setup(struct device *dev,
-				  const struct clk_icst_desc *desc,
-				  const char *name,
-				  const char *parent_name,
-				  struct regmap *map,
-				  enum icst_control_type ctype)
+struct clk *icst_clk_setup(struct device *dev,
+			   const struct clk_icst_desc *desc,
+			   const char *name,
+			   const char *parent_name,
+			   struct regmap *map,
+			   enum icst_control_type ctype)
 {
 	struct clk *clk;
 	struct clk_icst *icst;
@@ -386,6 +374,7 @@ static struct clk *icst_clk_setup(struct device *dev,
 
 	return clk;
 }
+EXPORT_SYMBOL_GPL(icst_clk_setup);
 
 struct clk *icst_clk_register(struct device *dev,
 			const struct clk_icst_desc *desc,
diff --git a/drivers/clk/versatile/clk-icst.h b/drivers/clk/versatile/clk-icst.h
index e36ca1a20e90..1206f008c11a 100644
--- a/drivers/clk/versatile/clk-icst.h
+++ b/drivers/clk/versatile/clk-icst.h
@@ -1,4 +1,18 @@
 /* SPDX-License-Identifier: GPL-2.0 */
+struct regmap;
+
+/**
+ * enum icst_control_type - the type of ICST control register
+ */
+enum icst_control_type {
+	ICST_VERSATILE, /* The standard type, all control bits available */
+	ICST_INTEGRATOR_AP_CM, /* Only 8 bits of VDW available */
+	ICST_INTEGRATOR_AP_SYS, /* Only 8 bits of VDW available */
+	ICST_INTEGRATOR_AP_PCI, /* Odd bit pattern storage */
+	ICST_INTEGRATOR_CP_CM_CORE, /* Only 8 bits of VDW and 3 bits of OD */
+	ICST_INTEGRATOR_CP_CM_MEM, /* Only 8 bits of VDW and 3 bits of OD */
+};
+
 /**
  * struct clk_icst_desc - descriptor for the ICST VCO
  * @params: ICST parameters
@@ -17,3 +31,10 @@ struct clk *icst_clk_register(struct device *dev,
 			      const char *name,
 			      const char *parent_name,
 			      void __iomem *base);
+
+struct clk *icst_clk_setup(struct device *dev,
+			   const struct clk_icst_desc *desc,
+			   const char *name,
+			   const char *parent_name,
+			   struct regmap *map,
+			   enum icst_control_type ctype);
-- 
2.24.1

