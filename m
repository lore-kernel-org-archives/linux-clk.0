Return-Path: <SRS0=SShM=OY=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75712C43613
	for <linux-clk@archiver.kernel.org>; Sat, 15 Dec 2018 10:36:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3C1B02084D
	for <linux-clk@archiver.kernel.org>; Sat, 15 Dec 2018 10:36:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=codeaurora.org header.i=@codeaurora.org header.b="E4jij8lc";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=codeaurora.org header.i=@codeaurora.org header.b="Yimfaiz7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730153AbeLOKgV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 15 Dec 2018 05:36:21 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:45286 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729671AbeLOKgU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 15 Dec 2018 05:36:20 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 073C660735; Sat, 15 Dec 2018 10:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1544870180;
        bh=/QhzS77dYadj0s2Bzf7Y3c7i6sct8rAWIG5Sb2aNCok=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=E4jij8lcu8eUAIp5NB2+LF0t404rL/HYN2zp3237B0hyYJdfWfzJQaP7JDVv1oA30
         YVSy8OacT7Kgflpq7u5+UbOQqkrUu6FkyTy+siQzSsw1Uar8xueKSgjPd0EfrFHr0z
         MdVuHFvjJ6IQgpWeNERCu/k+YckjRepLgXvJoRFk=
Received: from govinds-linux.qualcomm.com (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: govinds@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 808CB60735;
        Sat, 15 Dec 2018 10:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1544870179;
        bh=/QhzS77dYadj0s2Bzf7Y3c7i6sct8rAWIG5Sb2aNCok=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Yimfaiz7tjzNO7/Zt3GUwRN7iZEVkzz3TydD9xL/rBMwsqguREGkTjQLogRmmMlCr
         y2C+4X6kl6s6Kl0pa0V0TWbxU9zDqahPvbwCON1GTj9+ZSUbxeicw7V3Fwpx2cD8Uj
         //A5JPNDCVL+NcvSjCggHN8IojwXHe6rBrdRDV9s=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 808CB60735
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
Subject: [PATCH v3 3/7] dt-bindings: clock: qcom: Add QCOM WCSS GCC clock bindings
Date:   Sat, 15 Dec 2018 16:05:53 +0530
Message-Id: <20181215103557.2748-4-govinds@codeaurora.org>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181215103557.2748-1-govinds@codeaurora.org>
References: <20181215103557.2748-1-govinds@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add device tree bindings for WiFi QDSP gcc clock controls found in
QCS404 soc.

Signed-off-by: Govind Singh <govinds@codeaurora.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 include/dt-bindings/clock/qcom,gcc-qcs404.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/dt-bindings/clock/qcom,gcc-qcs404.h b/include/dt-bindings/clock/qcom,gcc-qcs404.h
index 00ab0d77b38a..8f800adda225 100644
--- a/include/dt-bindings/clock/qcom,gcc-qcs404.h
+++ b/include/dt-bindings/clock/qcom,gcc-qcs404.h
@@ -146,6 +146,8 @@
 #define GCC_MDP_TBU_CLK					138
 #define GCC_QDSS_DAP_CLK				139
 #define GCC_DCC_XO_CLK					140
+#define GCC_WCSS_Q6_AHB_CBCR_CLK			141
+#define GCC_WCSS_Q6_AXIM_CBCR_CLK			142
 
 #define GCC_GENI_IR_BCR					0
 #define GCC_USB_HS_BCR					1
@@ -168,5 +170,6 @@
 #define GCC_PCIE_0_CORE_STICKY_ARES			18
 #define GCC_PCIE_0_SLEEP_ARES				19
 #define GCC_PCIE_0_PIPE_ARES				20
+#define GCC_WDSP_RESTART				21
 
 #endif
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

