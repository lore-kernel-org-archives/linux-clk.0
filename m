Return-Path: <SRS0=r8+F=4H=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46928C3404D
	for <linux-clk@archiver.kernel.org>; Wed, 19 Feb 2020 10:04:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1E35821D56
	for <linux-clk@archiver.kernel.org>; Wed, 19 Feb 2020 10:04:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M9kfasFw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726450AbgBSKEA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 19 Feb 2020 05:04:00 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:42795 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726491AbgBSKEA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 19 Feb 2020 05:04:00 -0500
Received: by mail-lf1-f66.google.com with SMTP id y19so16939178lfl.9
        for <linux-clk@vger.kernel.org>; Wed, 19 Feb 2020 02:03:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ALoqKh4KGkm0WihSTPj2PM76XlFoNn+X7MPKYic/P4k=;
        b=M9kfasFwDQXFal31pCaQsB2/+xUQRdqpv/W+4nppEnolHNzOdDqmRKl/xj9h/9JcgE
         sSnMB02B8VG40waAB1YbE2lRK5hu5c8cg36XD1l2fVe+M/jSQm7dabVCN5QoJXMPiPC8
         WQ9ovI6hubxpl4fMEgIE58C3keuzSeAe6+dDaX67lGDWsgfGqy/30vO5OiTO5ZpoWGuY
         LOwyr3ny5Q09mJ3QXIopIiNSIhSiAxhktR6SQtN1IKPOdGq2HWj7DqTeWLDSuEjcNuVA
         vbJMjl3xKj0NhiXDoOXUymBO3ZHWEBzEI5IgfwYfJI4WJ2s9Abc1aVVdOjtyK8erkebZ
         Lzgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ALoqKh4KGkm0WihSTPj2PM76XlFoNn+X7MPKYic/P4k=;
        b=OSTvOYSR3mfeDacmK5PSI5e+TXxXb0JrKTZGeFqLpqbrt49ey5ngY9UBJ/8iYJF86E
         bLN/VPjO5Eto6XK2Yy2BfSAMVbIiybhk20L3JncDthS6Z7aS0V6jrZYyHkz7s3mGWRTk
         tcnwYdDaVg+lq6tv2pVLRa16DMdpROBm/hi+gXNrgBmeOqZBZOT9UdyG5CQIeMbnQYlv
         CfLjoA1/YRm7cnK2YfkfEv+zlt6RgwonjYjy0kVfIJqqy+WY/9AOwMapEinYDlgeD+zr
         Xgrd8vwl9u6PPr0bn4YVMD83z4XY/Mv8TCpQkfX+U3Dpf51zoRHrtp2dUw7/DRWPdU78
         TOag==
X-Gm-Message-State: APjAAAWBDmNjR73Yj7tuYitf7XXiJSv6qn4Y3V5xEdzjQQFxqXGy+iV2
        TolDl1VCzxHeUrIHW/lt27ybQg==
X-Google-Smtp-Source: APXvYqy3RkdSSpYYO4PiyhX1Kg7Rd+SxoeRI/+TzQXfE7GZQuVe53aPjwk9RsnxaS17FWS2Pflv+pQ==
X-Received: by 2002:a19:c82:: with SMTP id 124mr12835899lfm.152.1582106638733;
        Wed, 19 Feb 2020 02:03:58 -0800 (PST)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id n1sm918913lfq.16.2020.02.19.02.03.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2020 02:03:58 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>
Cc:     linux-clk@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 2/3 v2] clk: versatile: Export icst_clk_setup()
Date:   Wed, 19 Feb 2020 11:03:45 +0100
Message-Id: <20200219100346.78227-2-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200219100346.78227-1-linus.walleij@linaro.org>
References: <20200219100346.78227-1-linus.walleij@linaro.org>
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

