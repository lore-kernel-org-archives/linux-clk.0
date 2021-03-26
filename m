Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F426C433F4
	for <linux-clk@archiver.kernel.org>; Fri, 26 Mar 2021 14:59:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2744061A27
	for <linux-clk@archiver.kernel.org>; Fri, 26 Mar 2021 14:59:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230242AbhCZO7H (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 26 Mar 2021 10:59:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230225AbhCZO6z (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 26 Mar 2021 10:58:55 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61A96C0613B2
        for <linux-clk@vger.kernel.org>; Fri, 26 Mar 2021 07:58:55 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id u4so7721066ljo.6
        for <linux-clk@vger.kernel.org>; Fri, 26 Mar 2021 07:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snejp.pl; s=gmail;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=74ExyrGQ2FrMHb3FbC5tSKScDQ67EMx6FU4HJ+L5E00=;
        b=LdF6rehR3g42XXaOynyISZkO5iu/QV+iuJsSk0LMVFhbea28iAIqqHJXpYRNk63Czr
         ozIguXy0tiyGh9TDJ/ViqQSY4T5f2sI8bacGqunWnfdD65jV2UQKEwwziDdsEEGcFqRl
         G3SaScmhs15eNsPog0sOEdTK2cMzqSMPO8ViLs2j6UmKkjNQOoaj291FTKMo1KmDTF9a
         T93enEWsnsswJqiB39y48cqkRPyYCAeRtODh0v41EGRoO4Eap0Ag/vSgyafiNVkAlwUZ
         mBrUtxRVSWKJlsdIvBv3Ei5HP3TFc+PxUUe+CKiOMiYI0GjchIFq0USLvF5ClrgK4ctW
         +RpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=74ExyrGQ2FrMHb3FbC5tSKScDQ67EMx6FU4HJ+L5E00=;
        b=UowNsxGOU3493Z2YRQRDS0AIdEeZrF8zC2OXbLD/wPkXPJd9Qsukvm2ZWF7gYE5I4I
         /Y0LLgxaRaZfeg96Sla8MjSTVa9KxMqa5okWk8XTAiCo+lcPQsHbVwPeIqjshJ9ApNN7
         AAeS0wPXy03g/l/uvMOcPBMH8m+RS22eXZZFhIUc6DyYev4gG2hpOdsoO8j2VVbWMNDc
         5oZDTBdXYYbB/zPxscXHZXuxduRfBkRdhb9yCIZ8ChRsXJTQZZQlMEAVcKdnpKr/Fee/
         fmtqhuZh79phRWH2fdnVkoWcalcSMpBcS9sKGcsVYBgOdCree+Zf0lRS/pKrU3jqyj43
         H/3A==
X-Gm-Message-State: AOAM531m5c7pAVMWarrsWUXdjFGqc2s45BZ8NYV06/q7CIORPaLWx+MG
        rJ5rlRlQr6+vnYmrL1a9oIjB7g==
X-Google-Smtp-Source: ABdhPJz6rK13/EGBp6dWa2QzseHC+W24RMCZO5kUB+Vxzz/D5a8m4pmlqZ21/8Sy5DRyTtOsJ4ds1w==
X-Received: by 2002:a2e:8591:: with SMTP id b17mr9093307lji.230.1616770733943;
        Fri, 26 Mar 2021 07:58:53 -0700 (PDT)
Received: from PackardBell ([82.160.139.10])
        by smtp.googlemail.com with ESMTPSA id k2sm893382lfm.174.2021.03.26.07.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 07:58:53 -0700 (PDT)
Received: from localhost (PackardBell [local])
        by PackardBell (OpenSMTPD) with ESMTPA id b605a23b;
        Fri, 26 Mar 2021 14:58:48 +0000 (UTC)
From:   Bartosz Dudziak <bartosz.dudziak@snejp.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     Bartosz Dudziak <bartosz.dudziak@snejp.pl>
Subject: [PATCH 5/5] arm: dts: qcom: Add initial DTS file for Samsung Galaxy S III Neo phone
Date:   Fri, 26 Mar 2021 15:58:16 +0100
Message-Id: <20210326145816.9758-6-bartosz.dudziak@snejp.pl>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210326145816.9758-1-bartosz.dudziak@snejp.pl>
References: <20210326145816.9758-1-bartosz.dudziak@snejp.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This DTS has support for the Samsung Galaxy S III Neo (codenamed s3ve3g)
phone. Initial version have just a working serial console.

Signed-off-by: Bartosz Dudziak <bartosz.dudziak@snejp.pl>
---
 arch/arm/boot/dts/Makefile                    |  1 +
 .../boot/dts/qcom-msm8226-samsung-s3ve3g.dts  | 25 +++++++++++++++++++
 2 files changed, 26 insertions(+)
 create mode 100644 arch/arm/boot/dts/qcom-msm8226-samsung-s3ve3g.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 8e5d4ab4e7..080ff37fdb 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -920,6 +920,7 @@ dtb-$(CONFIG_ARCH_QCOM) += \
 	qcom-ipq4019-ap.dk07.1-c2.dtb \
 	qcom-ipq8064-ap148.dtb \
 	qcom-ipq8064-rb3011.dtb \
+	qcom-msm8226-samsung-s3ve3g.dtb \
 	qcom-msm8660-surf.dtb \
 	qcom-msm8960-cdp.dtb \
 	qcom-msm8974-fairphone-fp2.dtb \
diff --git a/arch/arm/boot/dts/qcom-msm8226-samsung-s3ve3g.dts b/arch/arm/boot/dts/qcom-msm8226-samsung-s3ve3g.dts
new file mode 100644
index 0000000000..4790077962
--- /dev/null
+++ b/arch/arm/boot/dts/qcom-msm8226-samsung-s3ve3g.dts
@@ -0,0 +1,25 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2020, The Linux Foundation. All rights reserved.
+ */
+
+#include "qcom-msm8226.dtsi"
+
+/ {
+	model = "Samsung Galaxy S III Neo";
+	compatible = "samsung,s3ve3g", "qcom,msm8226";
+
+	aliases {
+		serial0 = &blsp1_uart3;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+&soc {
+	serial@f991f000 {
+		status = "ok";
+	};
+};
-- 
2.25.1

