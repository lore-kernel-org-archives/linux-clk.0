Return-Path: <SRS0=lMr4=DA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EDCCC4741F
	for <linux-clk@archiver.kernel.org>; Wed, 23 Sep 2020 16:08:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4D1C82223E
	for <linux-clk@archiver.kernel.org>; Wed, 23 Sep 2020 16:08:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=marek-ca.20150623.gappssmtp.com header.i=@marek-ca.20150623.gappssmtp.com header.b="NJPaSSQa"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726783AbgIWQIQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 23 Sep 2020 12:08:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726746AbgIWQIP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 23 Sep 2020 12:08:15 -0400
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com [IPv6:2607:f8b0:4864:20::f42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F4E2C0613D6
        for <linux-clk@vger.kernel.org>; Wed, 23 Sep 2020 09:08:15 -0700 (PDT)
Received: by mail-qv1-xf42.google.com with SMTP id j3so242353qvi.7
        for <linux-clk@vger.kernel.org>; Wed, 23 Sep 2020 09:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=siNpN4JV7cwepJUeButrmGkXwgZ3uItysyqPhO+pNxM=;
        b=NJPaSSQa+aNx3rzKZYPt6wKLEqljgM8OAZ20SKsxQFGWgAFNgiLETr/snBxBXi9EoN
         UT1pVaiYsoWz1+rqkJj7e3gFBe6xj2CNRXETeC3Vb7z+Q1ADVolv4xuNiW+TN5hkpnB6
         wiXn57M6sfC+o5zF+qwJW1GAeQuwc1ja7iFgGQnZS1F9iOJhAJRfbrjk+VMXN8Q0ACSg
         /knlLFmlFprdevRN9LP/Ooz3UgPVx8jX+c+x49XQvwbxJHu1ucXOVLBxTwnWr8C0yS36
         5DTT4eq2xSbpkcx4LpyLcXICVZS2ow51RC2I5JRrMZ0+I0mqFmswqMst+mflUUnvIMgP
         7KOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=siNpN4JV7cwepJUeButrmGkXwgZ3uItysyqPhO+pNxM=;
        b=j6PK1hRD97PA7LQbepU84Hno7vO45HUiMGZphJXW99dlDgqgqouAxx+Q8yssu0XiJB
         2qhRrcl59wmtt+wLhqhyBXSI04nrUi+OGvwf7+BCoCAmehgKQnXvz5exaIKwpQHUnnFc
         2ayiEf5gL1JKcOgcmqIX7LhGnF4n5xsLcljg+df63c0I0lHqSW8mOMHkcZ8eUVsJXc/1
         POk9oHjA3WUK6nwBtu+WOfi8DXl2PsgZgSEBY48whUnC7wjFiREpBepEN3oC01M0DShf
         4O1E8aTXhOOvnkWbx8RR5115G79+BZXjEgzjEF2XkA33YtpwDx8Ew0kIWVx612Fhx+Mi
         6D4g==
X-Gm-Message-State: AOAM531GoJEnfbYjHfZaUZMs+AYJvi22uaxZmdLmJgQP7y640/VOzrjl
        z223xi9tlpbZjQ+5BSI2RihH5Q==
X-Google-Smtp-Source: ABdhPJwSBFFz2sj75C3DZ9VY+StGyddr7faJdvsy2Oe9X8gb7DjOf/o/YiGdKt1urUKi95NqBcquYg==
X-Received: by 2002:a0c:f783:: with SMTP id s3mr711401qvn.57.1600877294206;
        Wed, 23 Sep 2020 09:08:14 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id 145sm279159qkf.18.2020.09.23.09.08.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2020 09:08:13 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     Rob Herring <robh@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 2/5] dt-bindings: clock: add SM8150 QCOM video clock bindings
Date:   Wed, 23 Sep 2020 12:06:28 -0400
Message-Id: <20200923160635.28370-3-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200923160635.28370-1-jonathan@marek.ca>
References: <20200923160635.28370-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add device tree bindings for video clock controller for SM8150 SoCs.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/clock/qcom,videocc.yaml          |  4 ++-
 .../dt-bindings/clock/qcom,videocc-sm8150.h   | 25 +++++++++++++++++++
 2 files changed, 28 insertions(+), 1 deletion(-)
 create mode 100644 include/dt-bindings/clock/qcom,videocc-sm8150.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
index 874be03c33f5..bb1c1a841b68 100644
--- a/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
@@ -11,17 +11,19 @@ maintainers:
 
 description: |
   Qualcomm video clock control module which supports the clocks, resets and
-  power domains on SDM845/SC7180.
+  power domains on SDM845/SC7180/SM8150.
 
   See also:
     dt-bindings/clock/qcom,videocc-sc7180.h
     dt-bindings/clock/qcom,videocc-sdm845.h
+    dt-bindings/clock/qcom,videocc-sm8150.h
 
 properties:
   compatible:
     enum:
       - qcom,sc7180-videocc
       - qcom,sdm845-videocc
+      - qcom,sm8150-videocc
 
   clocks:
     items:
diff --git a/include/dt-bindings/clock/qcom,videocc-sm8150.h b/include/dt-bindings/clock/qcom,videocc-sm8150.h
new file mode 100644
index 000000000000..e24ee840cfdb
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,videocc-sm8150.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2017-2020, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_VIDEO_CC_SM8150_H
+#define _DT_BINDINGS_CLK_QCOM_VIDEO_CC_SM8150_H
+
+/* VIDEO_CC clocks */
+#define VIDEO_CC_IRIS_AHB_CLK		0
+#define VIDEO_CC_IRIS_CLK_SRC		1
+#define VIDEO_CC_MVS0_CORE_CLK		2
+#define VIDEO_CC_MVS1_CORE_CLK		3
+#define VIDEO_CC_MVSC_CORE_CLK		4
+#define VIDEO_CC_PLL0			5
+
+/* VIDEO_CC Resets */
+#define VIDEO_CC_MVSC_CORE_CLK_BCR	0
+
+/* VIDEO_CC GDSCRs */
+#define VENUS_GDSC			0
+#define VCODEC0_GDSC			1
+#define VCODEC1_GDSC			2
+
+#endif
-- 
2.26.1

