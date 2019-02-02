Return-Path: <SRS0=iRVG=QJ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 882A8C282D7
	for <linux-clk@archiver.kernel.org>; Sat,  2 Feb 2019 15:26:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 562A020869
	for <linux-clk@archiver.kernel.org>; Sat,  2 Feb 2019 15:26:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=codeaurora.org header.i=@codeaurora.org header.b="ij6Rnvt6";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=codeaurora.org header.i=@codeaurora.org header.b="PBttGTyT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727868AbfBBP0u (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 2 Feb 2019 10:26:50 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:37568 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727800AbfBBP0u (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 2 Feb 2019 10:26:50 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 19F0E6081B; Sat,  2 Feb 2019 15:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1549121209;
        bh=x7NTODBuzGoy2jysNjsWZvGcF8vLieNIUroTCRcRvMg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ij6Rnvt6xGdkY0f4WE2nRJHsA84WVmwFvtdVkkzYMOq6UJ1eZHCBgBouRH+dYVgo1
         JNfsgc9jKzwKSQiFj8kwGYAjWK1XnLWqf0ZLseDW15N9exTt6JRavU1YfNbU3EvnC1
         qH4dzXt0KUmVnwqBNgukaW571YZMv/uDnqjHmWdQ=
Received: from govinds-linux.qualcomm.com (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: govinds@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 40491608FF;
        Sat,  2 Feb 2019 15:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1549121208;
        bh=x7NTODBuzGoy2jysNjsWZvGcF8vLieNIUroTCRcRvMg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=PBttGTyTeBp/uOfhCQVR6TT+aSutZfbIWjIYosE6AUnfxw7L4B3DkU0iqF31xQr4Y
         sy15/5TSwBV89RU3lUx59yAdDA/Ak4nQJT6YRh0U+mTqQHeM0yP+7r3xKMmKx3Apsh
         tYPtNghqc4saZyWrEGrAiJua9SIxZcPXhieMbISY=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 40491608FF
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=govinds@codeaurora.org
From:   Govind Singh <govinds@codeaurora.org>
To:     bjorn.andersson@linaro.org, linux-remoteproc@vger.kernel.org,
        sboyd@kernel.org
Cc:     linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        andy.gross@linaro.org, david.brown@linaro.org,
        linux-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Govind Singh <govinds@codeaurora.org>
Subject: [PATCH v4 3/8] dt-bindings: clock: qcom: Introduce QCOM WCSS Q6DSP clock bindings
Date:   Sat,  2 Feb 2019 20:56:21 +0530
Message-Id: <20190202152626.1006-4-govinds@codeaurora.org>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190202152626.1006-1-govinds@codeaurora.org>
References: <20190202152626.1006-1-govinds@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add device tree bindings for WiFi QDSP subsystem clock controls
found in OCS404 soc.

Signed-off-by: Govind Singh <govinds@codeaurora.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/clock/qcom,wcsscc.txt | 26 +++++++++++++++++++
 include/dt-bindings/clock/qcom,wcss-qcs404.h  | 25 ++++++++++++++++++
 2 files changed, 51 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,wcsscc.txt
 create mode 100644 include/dt-bindings/clock/qcom,wcss-qcs404.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,wcsscc.txt b/Documentation/devicetree/bindings/clock/qcom,wcsscc.txt
new file mode 100644
index 000000000000..e9e222e1022f
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,wcsscc.txt
@@ -0,0 +1,26 @@
+Qualcomm WCSS Clock Controller Binding
+-----------------------------------------------
+
+Required properties :
+- compatible		: shall contain "qcom,qcs404-wcsscc"
+- #clock-cells		: from common clock binding, shall contain 1
+- reg			: shall contain base register address and size,
+			  in the order
+			Index 0 maps to WCSS_Q6SSTOP clocks register region
+			Index 1 maps to WCSS_TCSR register region
+			Index 2 maps to WCSS_QDSP6SS register region
+
+Optional properties :
+- reg-names	: register names of WCSS domain
+		 "wcss_q6sstop", "wcnss_tcsr", "wcss_qdsp6ss".
+
+Example:
+The below node has to be defined in the cases where the WCSS peripheral loader
+would bring the subsystem out of reset.
+
+	clock_wcsscc: clock-controller@7500000 {
+		compatible = "qcom,qcs404-wcsscc";
+		reg = <0x7500000 0x4e000>, <0x7550000 0x8012>, <0x7400000 0x104>;
+		reg-names = "wcss_q6sstop", "wcnss_tcsr", "wcss_qdsp6ss";
+		#clock-cells = <1>;
+	};
diff --git a/include/dt-bindings/clock/qcom,wcss-qcs404.h b/include/dt-bindings/clock/qcom,wcss-qcs404.h
new file mode 100644
index 000000000000..df2d6b696136
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,wcss-qcs404.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2018, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_CLK_WCSS_QCS404_H
+#define _DT_BINDINGS_CLK_WCSS_QCS404_H
+
+#define WCSS_AHBFABRIC_CBCR_CLK			0
+#define WCSS_AHBS_CBCR_CLK			1
+#define WCSS_TCM_CBCR_CLK			2
+#define WCSS_AHBM_CBCR_CLK			3
+#define WCSS_AXIM_CBCR_CLK			4
+#define WCSS_BCR_CBCR_CLK			5
+#define WCSS_LCC_CBCR_CLK			6
+#define WCSS_QDSP6SS_XO_CBCR_CLK		7
+#define WCSS_QDSP6SS_SLEEP_CBCR_CLK		8
+#define WCSS_QDSP6SS_GFMMUX_CLK			9
+
+#define Q6SSTOP_QDSP6SS_RESET			0
+#define Q6SSTOP_QDSP6SS_CORE_RESET		1
+#define Q6SSTOP_QDSP6SS_BUS_RESET		2
+#define Q6SSTOP_BCR_RESET			3
+#define Q6SSTOP_CORE_ARCH_RESET			4
+#endif
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

