Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2750C433E0
	for <linux-clk@archiver.kernel.org>; Thu,  4 Mar 2021 22:13:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 727AE64FF4
	for <linux-clk@archiver.kernel.org>; Thu,  4 Mar 2021 22:13:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231687AbhCDWMz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 4 Mar 2021 17:12:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230449AbhCDWMy (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 4 Mar 2021 17:12:54 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3B3CC061763
        for <linux-clk@vger.kernel.org>; Thu,  4 Mar 2021 14:12:52 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id e19so1596406ejt.3
        for <linux-clk@vger.kernel.org>; Thu, 04 Mar 2021 14:12:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IxSjyHvfhJ/CRzXpd7kM65mxSitdSKejDB4yVJ8QdLI=;
        b=SGDVknug8AsUYWYZSGdHKwErk1ohZtG+21USh8vDWbvcM6aFt8ZKYPoHP34FY7/Or4
         RqoAtJe0dwn1Bch/dFzWvOCOo/dEqgcOjFOFMzAB0e2Vh5Kw37/tNktSN79n3iIUqm/j
         jWI2HYdntIV9Dpa68IH6OENLdI+eeMvCb2PM0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IxSjyHvfhJ/CRzXpd7kM65mxSitdSKejDB4yVJ8QdLI=;
        b=DlKC2qq+kUpYla1xUi3ANWNIyF0UJztXJ1/Gj9DdzYxSMOMoBybQAfDp7H7v29PlTA
         v1aJT0+hq0Zp53NpmLOeuXk/A9su+9Jw1WXbul1d+PXy8+PdhvO1gDdhOxjHQtjaepnx
         KuRWr34gXhcqKxSY7dq9b7zvM6opLzKhI/nDGlKtbrEerkzIzACySk91fyoNUi47tpq+
         5l3rR5rSLuJ00yLlrkcNot3wLZsRTBPletlWXYcRIoEe7kM1hKhiiFrAkeMwuwwhLAfR
         van1Y3T0vq86CU6plk8yUsquGLuIYu1SOlGb4Wd8P3MC3VZEzGbNlBWSV0b9ZLP6Ic/8
         UVlQ==
X-Gm-Message-State: AOAM531NFsAQqL1tori+9Fnd6n+4kozR1/Fppei9x3+vuBoFZvwHsgqP
        Yr4A1vP7Fl2ri7hpl6X6kfs7Dw==
X-Google-Smtp-Source: ABdhPJwVN0AcFGjBUTQ8VzGydpnWSzRyWvOOXLUP2ekeX/od+/cEZvBhl2UzMVMC2N0PmxVQKV+mMg==
X-Received: by 2002:a17:906:3acc:: with SMTP id z12mr6648419ejd.494.1614895971264;
        Thu, 04 Mar 2021 14:12:51 -0800 (PST)
Received: from prevas-ravi.prevas.se ([80.208.71.141])
        by smtp.gmail.com with ESMTPSA id q22sm362099ejy.5.2021.03.04.14.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Mar 2021 14:12:50 -0800 (PST)
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
To:     Arnd Bergmann <arnd@arndb.de>, Guenter Roeck <linux@roeck-us.net>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-watchdog@vger.kernel.org,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: [PATCH v2 1/3] clk: add devm_clk_prepare_enable() helper
Date:   Thu,  4 Mar 2021 23:12:45 +0100
Message-Id: <20210304221247.488173-2-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210304221247.488173-1-linux@rasmusvillemoes.dk>
References: <20210226141411.2517368-1-linux@rasmusvillemoes.dk>
 <20210304221247.488173-1-linux@rasmusvillemoes.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add a managed wrapper for clk_prepare_enable().

Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 .../driver-api/driver-model/devres.rst        |  1 +
 drivers/clk/clk-devres.c                      | 29 +++++++++++++++++++
 include/linux/clk.h                           | 13 +++++++++
 3 files changed, 43 insertions(+)

diff --git a/Documentation/driver-api/driver-model/devres.rst b/Documentation/driver-api/driver-model/devres.rst
index cd8b6e657b94..8ee2557f9ad7 100644
--- a/Documentation/driver-api/driver-model/devres.rst
+++ b/Documentation/driver-api/driver-model/devres.rst
@@ -253,6 +253,7 @@ CLOCK
   devm_clk_hw_register()
   devm_of_clk_add_hw_provider()
   devm_clk_hw_register_clkdev()
+  devm_clk_prepare_enable()
 
 DMA
   dmaenginem_async_device_register()
diff --git a/drivers/clk/clk-devres.c b/drivers/clk/clk-devres.c
index be160764911b..d5bfa8cd7347 100644
--- a/drivers/clk/clk-devres.c
+++ b/drivers/clk/clk-devres.c
@@ -156,3 +156,32 @@ struct clk *devm_get_clk_from_child(struct device *dev,
 	return clk;
 }
 EXPORT_SYMBOL(devm_get_clk_from_child);
+
+static void devm_clk_disable_unprepare(struct device *dev, void *res)
+{
+	clk_disable_unprepare(*(struct clk **)res);
+}
+
+int devm_clk_prepare_enable(struct device *dev, struct clk *clk)
+{
+	struct clk **ptr;
+	int ret;
+
+	if (!clk)
+		return 0;
+
+	ptr = devres_alloc(devm_clk_disable_unprepare, sizeof(*ptr), GFP_KERNEL);
+	if (!ptr)
+		return -ENOMEM;
+
+	ret = clk_prepare_enable(clk);
+	if (!ret) {
+		*ptr = clk;
+		devres_add(dev, ptr);
+	} else {
+		devres_free(ptr);
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL(devm_clk_prepare_enable);
diff --git a/include/linux/clk.h b/include/linux/clk.h
index 266e8de3cb51..04d135520480 100644
--- a/include/linux/clk.h
+++ b/include/linux/clk.h
@@ -485,6 +485,19 @@ struct clk *devm_clk_get_optional(struct device *dev, const char *id);
  */
 struct clk *devm_get_clk_from_child(struct device *dev,
 				    struct device_node *np, const char *con_id);
+/**
+ * devm_clk_prepare_enable - prepare and enable a clock source
+ * @dev: device for clock "consumer"
+ * @clk: clock source
+ *
+ * This function calls clk_prepare_enable() on @clk, and ensures the
+ * clock will automatically be disabled and unprepared when the device
+ * is unbound from the bus.
+ *
+ * Must not be called from within atomic context.
+ */
+int devm_clk_prepare_enable(struct device *dev, struct clk *clk);
+
 /**
  * clk_rate_exclusive_get - get exclusivity over the rate control of a
  *                          producer
-- 
2.29.2

