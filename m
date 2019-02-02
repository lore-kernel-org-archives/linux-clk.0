Return-Path: <SRS0=iRVG=QJ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AAEBC282D7
	for <linux-clk@archiver.kernel.org>; Sat,  2 Feb 2019 15:26:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4AFA721479
	for <linux-clk@archiver.kernel.org>; Sat,  2 Feb 2019 15:26:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=codeaurora.org header.i=@codeaurora.org header.b="QmJUZJMH";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=codeaurora.org header.i=@codeaurora.org header.b="XZhDTaCT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727713AbfBBP0m (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 2 Feb 2019 10:26:42 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:37248 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726617AbfBBP0m (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 2 Feb 2019 10:26:42 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 7C568608FC; Sat,  2 Feb 2019 15:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1549121201;
        bh=8ajMUjXMMoMGx+pe01WuAoCo3RJEumZ6zTN/M48bOvA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=QmJUZJMH0nVbinwT6aVD/PixYfZp3m0TDieMj0ACk0jNpM4obiYDxqVkZ50XVEQs1
         jlbf9GIOuJl4QiQRnVw5le4I1YZmxU0k6QKQ9iFliV4r8DH6DtjKZCluYSftzwwZNT
         rsbDFxaStvsXgu7VT9xP/Spq2eDKfInGTU76q2SA=
Received: from govinds-linux.qualcomm.com (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: govinds@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 988CA6085C;
        Sat,  2 Feb 2019 15:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1549121200;
        bh=8ajMUjXMMoMGx+pe01WuAoCo3RJEumZ6zTN/M48bOvA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=XZhDTaCTLa6TBV791Vbjol4xoW1sio3vTYw8+A98a6r10K8TqR+mEGbTXtv9pTnuB
         jBYnNv+j2301awA403FGzsx0g4Z2StAvQo7sOx3eRBSSpooV7nwiMcfS54ndBQxlEU
         9n5AH9/5qEpRo3QkNvWiOt22aNnCp6Aei49o7Od0=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 988CA6085C
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=govinds@codeaurora.org
From:   Govind Singh <govinds@codeaurora.org>
To:     bjorn.andersson@linaro.org, linux-remoteproc@vger.kernel.org,
        sboyd@kernel.org
Cc:     linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        andy.gross@linaro.org, david.brown@linaro.org,
        linux-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Govind Singh <govinds@codeaurora.org>
Subject: [PATCH v4 1/8] dt-bindings: clock: qcom: Add QCOM WCSS GCC clock bindings
Date:   Sat,  2 Feb 2019 20:56:19 +0530
Message-Id: <20190202152626.1006-2-govinds@codeaurora.org>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190202152626.1006-1-govinds@codeaurora.org>
References: <20190202152626.1006-1-govinds@codeaurora.org>
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
index 00ab0d77b38a..f5dfc1890870 100644
--- a/include/dt-bindings/clock/qcom,gcc-qcs404.h
+++ b/include/dt-bindings/clock/qcom,gcc-qcs404.h
@@ -146,6 +146,8 @@
 #define GCC_MDP_TBU_CLK					138
 #define GCC_QDSS_DAP_CLK				139
 #define GCC_DCC_XO_CLK					140
+#define GCC_WCSS_Q6_AHB_CLK				141
+#define GCC_WCSS_Q6_AXIM_CLK				142
 
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

