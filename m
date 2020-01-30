Return-Path: <SRS0=on/j=3T=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9E3AC3524A
	for <linux-clk@archiver.kernel.org>; Thu, 30 Jan 2020 04:19:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 901B12083E
	for <linux-clk@archiver.kernel.org>; Thu, 30 Jan 2020 04:19:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="uQW4i3XV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727205AbgA3ETW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 29 Jan 2020 23:19:22 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:40535 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727234AbgA3ETW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 29 Jan 2020 23:19:22 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1580357961; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=tyq/127zfPNqIH8j695JEIXEG1tR0jphLm/c/sQjJA8=; b=uQW4i3XV5hdH9DrxV7mRZrU6516NB7QoVOUmwppqeDa3JD+OoUSfRFR9Cic6FDof87VPgKN0
 DzmOVT+90MHztR9hYcAuEM6V2tzbdXIBCcRLONqq2YuKJlox6g4el9lRz4s6pFfL4nF6ofiv
 XuM867gsgfrX2/LVoFEI4mXAgVY=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI4MzlhZiIsICJsaW51eC1jbGtAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e325945.7fd0e9070b90-smtp-out-n02;
 Thu, 30 Jan 2020 04:19:17 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 26606C43383; Thu, 30 Jan 2020 04:19:17 +0000 (UTC)
Received: from tdas-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 81EEFC4479C;
        Thu, 30 Jan 2020 04:19:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 81EEFC4479C
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=tdas@codeaurora.org
From:   Taniya Das <tdas@codeaurora.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Michael=20Turquette=20=C2=A0?= <mturquette@baylibre.com>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v3 2/3] dt-bindings: clock: Introduce QCOM Modem clock bindings
Date:   Thu, 30 Jan 2020 09:48:42 +0530
Message-Id: <1580357923-19783-3-git-send-email-tdas@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1580357923-19783-1-git-send-email-tdas@codeaurora.org>
References: <1580357923-19783-1-git-send-email-tdas@codeaurora.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add device tree bindings for modem clock controller for
Qualcomm Technology Inc's SC7180 SoCs.

Signed-off-by: Taniya Das <tdas@codeaurora.org>
---
 include/dt-bindings/clock/qcom,gcc-sc7180.h |  5 +++++
 include/dt-bindings/clock/qcom,mss-sc7180.h | 12 ++++++++++++
 2 files changed, 17 insertions(+)
 create mode 100644 include/dt-bindings/clock/qcom,mss-sc7180.h

diff --git a/include/dt-bindings/clock/qcom,gcc-sc7180.h b/include/dt-bindings/clock/qcom,gcc-sc7180.h
index e8029b2e..64909ec 100644
--- a/include/dt-bindings/clock/qcom,gcc-sc7180.h
+++ b/include/dt-bindings/clock/qcom,gcc-sc7180.h
@@ -132,6 +132,11 @@
 #define GCC_VIDEO_GPLL0_DIV_CLK_SRC				122
 #define GCC_VIDEO_THROTTLE_AXI_CLK				123
 #define GCC_VIDEO_XO_CLK					124
+#define GCC_MSS_CFG_AHB_CLK					125
+#define GCC_MSS_MFAB_AXIS_CLK					126
+#define GCC_MSS_NAV_AXI_CLK					127
+#define GCC_MSS_Q6_MEMNOC_AXI_CLK				128
+#define GCC_MSS_SNOC_AXI_CLK					129

 /* GCC resets */
 #define GCC_QUSB2PHY_PRIM_BCR					0
diff --git a/include/dt-bindings/clock/qcom,mss-sc7180.h b/include/dt-bindings/clock/qcom,mss-sc7180.h
new file mode 100644
index 0000000..8ad63ed
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,mss-sc7180.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2019, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_MSS_SC7180_H
+#define _DT_BINDINGS_CLK_QCOM_MSS_SC7180_H
+
+#define MSS_AXI_CRYPTO_CLK	0
+#define MSS_AXI_NAV_CLK		1
+
+#endif
--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.
