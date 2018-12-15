Return-Path: <SRS0=SShM=OY=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05C4BC43387
	for <linux-clk@archiver.kernel.org>; Sat, 15 Dec 2018 10:36:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CC3712084D
	for <linux-clk@archiver.kernel.org>; Sat, 15 Dec 2018 10:36:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=codeaurora.org header.i=@codeaurora.org header.b="D5D21gr5";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=codeaurora.org header.i=@codeaurora.org header.b="EX83z43S"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730087AbeLOKgN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 15 Dec 2018 05:36:13 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:45090 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729671AbeLOKgN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 15 Dec 2018 05:36:13 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 2C52B60779; Sat, 15 Dec 2018 10:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1544870171;
        bh=UwFxqpne7CZiVIGdTzUeEpvKDkYDpOXvqY0F7RHG/mY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=D5D21gr5761iv1kNurSJ8TNGU7fXlz2u0QTRt/oc2Vgz1HpCts7tYO6kAe4ov8FWH
         06UyE/IEfpnkxFqsteWhpSJhLhHe6YUztuWUNNXlhVoOTdWrzyZ3luE0KSXlm1kYWK
         iVNkNMd6Uq47OsVaK9Xvi+sscJle1gzWAOtE7+5g=
Received: from govinds-linux.qualcomm.com (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: govinds@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 94BA6602F5;
        Sat, 15 Dec 2018 10:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1544870170;
        bh=UwFxqpne7CZiVIGdTzUeEpvKDkYDpOXvqY0F7RHG/mY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=EX83z43SuPh97xGuXI9wa/n5GbzTHdH5kgU1jaxRz0H7aysATsC2a/fV2ebBszVbq
         YJJO6WdMnrFgM1la+BojrRZWgxw6O6kKAaQn/KKrCYuWVCma3rngUK13Oa6UnBPIn5
         fOnVfx8VsWh9h2n3QrQi2t57h/AD7eOt1MCkdlTk=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 94BA6602F5
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=govinds@codeaurora.org
From:   Govind Singh <govinds@codeaurora.org>
To:     bjorn.andersson@linaro.org, linux-remoteproc@vger.kernel.org,
        sboyd@kernel.org
Cc:     linux-clk@vger.kernel.org, sricharan@codeaurora.org,
        sibis@codeaurora.org, linux-arm-msm@vger.kernel.org,
        andy.gross@linaro.org, david.brown@linaro.org,
        linux-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Govind Singh <govinds@codeaurora.org>
Subject: [PATCH v3 1/7] dt-bindings: clock: qcom: Introduce QCOM WCSS Q6DSP clock bindings
Date:   Sat, 15 Dec 2018 16:05:51 +0530
Message-Id: <20181215103557.2748-2-govinds@codeaurora.org>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181215103557.2748-1-govinds@codeaurora.org>
References: <20181215103557.2748-1-govinds@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add device tree bindings for WiFi QDSP subsystem clock controls
found in OCS405 soc.

Signed-off-by: Govind Singh <govinds@codeaurora.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/clock/qcom,wcsscc.txt | 26 +++++++++++++++++++
 include/dt-bindings/clock/qcom,wcss-qcs404.h  | 24 +++++++++++++++++
 2 files changed, 50 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,wcsscc.txt
 create mode 100644 include/dt-bindings/clock/qcom,wcss-qcs404.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,wcsscc.txt b/Documentation/devicetree/bindings/clock/qcom,wcsscc.txt
new file mode 100644
index 000000000000..2b19ef0b5689
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,wcsscc.txt
@@ -0,0 +1,26 @@
+Qualcomm WCSS Clock Controller Binding
+-----------------------------------------------
+
+Required properties :
+- compatible		: shall contain "qcom,qcs404-wcsscc"
+- #clock-cells		: from common clock binding, shall contain 1.
+- reg			: shall contain base register address and size,
+			  in the order
+			Index-0 maps to WCSS_Q6SSTOP clocks register region
+			Index-1 maps to WCSS_TCSR register region
+			Index-2 maps to WCSS_QDSP6SS register region
+
+Optional properties :
+- reg-names	: register names of WCSS domain
+		 "wcss_q6sstop", "wcnss_tcsr", "wcss_qdsp6ss".
+
+Example:
+The below node has to be defined in the cases where the WCSS peripheral loader
+would bring the subsystem out of reset.
+
+	clock_wcsscc: qcom,wcsscc@7000000 {
+		compatible = "qcom,qcs404-wcsscc";
+		reg = <0x07500000 0x4e000>, <0x07550000 0x8012>, <0x07400000 0x104>;
+		reg-names = "wcss_q6sstop", "wcnss_tcsr", "wcss_qdsp6ss";
+		#clock-cells = <1>;
+	};
diff --git a/include/dt-bindings/clock/qcom,wcss-qcs404.h b/include/dt-bindings/clock/qcom,wcss-qcs404.h
new file mode 100644
index 000000000000..45dd6599db81
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,wcss-qcs404.h
@@ -0,0 +1,24 @@
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
+#endif
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

