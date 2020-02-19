Return-Path: <SRS0=r8+F=4H=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A564C3404D
	for <linux-clk@archiver.kernel.org>; Wed, 19 Feb 2020 10:33:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 642AD2464E
	for <linux-clk@archiver.kernel.org>; Wed, 19 Feb 2020 10:33:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lEzMMlzx"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726484AbgBSKdj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 19 Feb 2020 05:33:39 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:36180 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726497AbgBSKdj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 19 Feb 2020 05:33:39 -0500
Received: by mail-lj1-f194.google.com with SMTP id r19so26479005ljg.3
        for <linux-clk@vger.kernel.org>; Wed, 19 Feb 2020 02:33:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yWN1/8zdqCAh6wYlV98mAlIc90+SV1UozXJpnJxgLoU=;
        b=lEzMMlzxF5kfINQgTQWhhSDt3DuP6DJMxp55m/SlPt4EECPtPifmP8mSn5ZNvT2jWZ
         jjYQIeyS2q+8AIYw8DFu9xBE52cmkXgLczvHVat5rA5A4kUmZ6LWo08qnB5jJ1vzimCN
         4cAI4gAEkOTcgNymRrNadncPVqksERZdoDjFwoc6eJ6UiN+nhj6+i2MxdaQSXbutlZS7
         QKPcT3K6miNeTaB9mwEL/H24IgHED8m5Cg439sZHpMr/uWeaZvHDyP0HshQ0vyoZ6Ou3
         eniP1m6dHyraowA5k2AIyabB5nW/DVI4X6XZNpQrgvfA63+yxm6RtrIUAo/z7GQUpu+K
         t5Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yWN1/8zdqCAh6wYlV98mAlIc90+SV1UozXJpnJxgLoU=;
        b=moV55ftg3nflkpQtA0uezPUX1nlmvMtmjvZQkGYlE9Ch+Ge20EIjju+6zmq9hucEnK
         Su0njyGrB2r8CBnzyz9fkF1bGyBZHC2p4PQZqXXdZzdUM8Im0c0h8zK0WxBlYDcvmf7F
         UqSCKdzsTCKJ3OUJ3S+sHkxSR6iK7TBPOjr1GlaUFgXChHYr6EkzO+ttCCpoN3W31mWn
         peuv3suL8V0kFS7X+HHLbcO0ZAp4xkOOZI1S2dhyvIzIUQKzRfacHqNhO/5IexEXtTpH
         nn2NNYks1vgLjCCPllHhWf96wRhdipIf8uWqEG+C0lAO9JL3piDFIVsnnOkibM1utmPK
         //rg==
X-Gm-Message-State: APjAAAX3EkazfjaDrEgX1TxYOZW8Ob1cZ9wOQgfeIsvO/eHnxlxgLSPU
        sE3Ru/i/6bmiTGBT9BmWVSBnSeT/468=
X-Google-Smtp-Source: APXvYqzBjultTmGLhxHV6sDPEWbuavNvEmAwkHG6LGc7rqGQv+H/T8f5clRMupsYZS00c8YhSY/MaA==
X-Received: by 2002:a2e:8745:: with SMTP id q5mr15797665ljj.208.1582108416856;
        Wed, 19 Feb 2020 02:33:36 -0800 (PST)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id k12sm1003316lfc.33.2020.02.19.02.33.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2020 02:33:36 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 2/3 v3] clk: versatile: Export icst_clk_setup()
Date:   Wed, 19 Feb 2020 11:33:25 +0100
Message-Id: <20200219103326.81120-2-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200219103326.81120-1-linus.walleij@linaro.org>
References: <20200219103326.81120-1-linus.walleij@linaro.org>
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
ChangeLog v2->v3:
- Resend with the rest
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

