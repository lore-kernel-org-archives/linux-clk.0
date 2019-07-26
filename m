Return-Path: <SRS0=bWzc=VX=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84480C76190
	for <linux-clk@archiver.kernel.org>; Fri, 26 Jul 2019 09:23:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5BA80229F9
	for <linux-clk@archiver.kernel.org>; Fri, 26 Jul 2019 09:23:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=codeaurora.org header.i=@codeaurora.org header.b="PtFpLf97";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=codeaurora.org header.i=@codeaurora.org header.b="OvF23CSZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726065AbfGZJXr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 26 Jul 2019 05:23:47 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:58096 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726262AbfGZJXr (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 26 Jul 2019 05:23:47 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 1E0E660F3D; Fri, 26 Jul 2019 09:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1564133026;
        bh=WsI4ADTLK4wNAq3g+x+F6cxYoOuExQt8Fl+FZb0Qbts=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=PtFpLf97zSmg1iEeN2VRYp8PBhUhcI4q7ksXEWxun03qKN8NR07eOjvSu1OU62tbe
         bRJkxThSwxZl7nHO57NnqAgRdaqLKuFTx7C1mrbvLWZX6p5BdKUrGRAGfM+snvsqWx
         i1jhusocQyUZetqlCPVaCn728oISYLOKxySo+OP0=
Received: from govinds-linux.qualcomm.com (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: govinds@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D41CC6053D;
        Fri, 26 Jul 2019 09:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1564133025;
        bh=WsI4ADTLK4wNAq3g+x+F6cxYoOuExQt8Fl+FZb0Qbts=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=OvF23CSZK3cyNW/xl3tfK+fnVgE/7tql2JsyqFVc8tDYuRd0L1YlFFEqfikD3bGkT
         dD/2D5tFds7yAGW/I76szTLJATQOVYYNxkWrUJX8mDx3DEWnHJBlY1zEuE4ezjAiE+
         sTewFL/cxEU4Ki9r8XRYg3FQCiMhGPvWH/GRz4aQ=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D41CC6053D
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=govinds@codeaurora.org
From:   Govind Singh <govinds@codeaurora.org>
To:     bjorn.andersson@linaro.org, linux-remoteproc@vger.kernel.org,
        sboyd@kernel.org, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     andy.gross@linaro.org, linux-soc@vger.kernel.org,
        devicetree@vger.kernel.org, Govind Singh <govinds@codeaurora.org>
Subject: [PATCH v5 2/7] dt-bindings: clock: qcom: Add QCOM Q6SSTOP clock controller bindings
Date:   Fri, 26 Jul 2019 14:53:27 +0530
Message-Id: <20190726092332.25202-3-govinds@codeaurora.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190726092332.25202-1-govinds@codeaurora.org>
References: <20190726092332.25202-1-govinds@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add devicetree binding for the Q6SSTOP clock controller found in QCS404.

Signed-off-by: Govind Singh <govinds@codeaurora.org>
---
 .../bindings/clock/qcom,q6sstopcc.txt         | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100755 Documentation/devicetree/bindings/clock/qcom,q6sstopcc.txt

diff --git a/Documentation/devicetree/bindings/clock/qcom,q6sstopcc.txt b/Documentation/devicetree/bindings/clock/qcom,q6sstopcc.txt
new file mode 100755
index 000000000000..157bb52f9dc4
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,q6sstopcc.txt
@@ -0,0 +1,26 @@
+Qualcomm Q6SSTOP Clock Controller Binding
+-----------------------------------------------
+
+Required properties :
+- compatible		: shall contain "qcom,qcs404-q6sstopcc"
+- #clock-cells		: from common clock binding, shall contain 1
+- reg			: shall contain base register address and size,
+			  in the order
+			Index 0 maps to Q6SSTOP clocks register region
+			Index 1 maps to Q6SSTOP_TCSR register region
+
+Optional properties :
+- reg-names	: register names of WCSS domain
+		 "q6sstop_cc", "q6sstop_tcsr".
+
+Example:
+The below node has to be defined in the cases where the WCSS peripheral loader
+would bring the subsystem out of reset.
+
+	q6sstopcc: clock-controller@7500000 {
+		compatible = "qcom,qcs404-q6sstopcc";
+		reg = <0x7500000 0x4e000>, <0x7550000 0x10000>;
+		reg-names = "q6sstop_cc", "q6sstop_tcsr";
+		clocks = <&gcc GCC_WCSS_Q6_AHB_CLK>;
+		#clock-cells = <1>;
+	};
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

