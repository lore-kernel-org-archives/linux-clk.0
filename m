Return-Path: <SRS0=iRVG=QJ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A40E3C282DA
	for <linux-clk@archiver.kernel.org>; Sat,  2 Feb 2019 15:27:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 72D6F20869
	for <linux-clk@archiver.kernel.org>; Sat,  2 Feb 2019 15:27:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=codeaurora.org header.i=@codeaurora.org header.b="Vz/p0hSW";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=codeaurora.org header.i=@codeaurora.org header.b="hOyRl8Pg"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727784AbfBBP1C (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 2 Feb 2019 10:27:02 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:38058 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726617AbfBBP1B (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 2 Feb 2019 10:27:01 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id F34FC609D4; Sat,  2 Feb 2019 15:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1549121220;
        bh=cA15SqoH7QT9hqQ90IbW5kJ1qa0bUy+SVkKlnqk6ZTk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Vz/p0hSWULTuempa1S+PHfOCOkeHm6oA7aMcdpBQ3GEAFo1nh+XZ510NaVt4byeiG
         MpF8UJSEl8P6HXz4v5QxGRe8YaipnE9QPgPzEj4tm8S2Ec1atHdlozvreK0l5A1x8t
         MByX3YnL/8MC8iFcpR0CVsVnHbK8IiFS4f87Xf74=
Received: from govinds-linux.qualcomm.com (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: govinds@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5FE5F609D1;
        Sat,  2 Feb 2019 15:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1549121219;
        bh=cA15SqoH7QT9hqQ90IbW5kJ1qa0bUy+SVkKlnqk6ZTk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=hOyRl8PgjPpCUD1VXJD1QtMkEMNKx3MyITLjVDLAYltPzx0BiWA7sFnCEcXDG7DvN
         L02NpR3+dd7rWh4FsSwHuLm9wlKJDqgp3bJDaFx4EcSkqo0Zfg7Ur9E1uS/Se5E+qo
         Qyc+yim5+S3UQ7gPehGx3k0kQg4DQkjVzFUa4r6w=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5FE5F609D1
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=govinds@codeaurora.org
From:   Govind Singh <govinds@codeaurora.org>
To:     bjorn.andersson@linaro.org, linux-remoteproc@vger.kernel.org,
        sboyd@kernel.org
Cc:     linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        andy.gross@linaro.org, david.brown@linaro.org,
        linux-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Govind Singh <govinds@codeaurora.org>
Subject: [PATCH v4 6/8] dt-binding: remoteproc: Add QTI WCSS PIL bindings
Date:   Sat,  2 Feb 2019 20:56:24 +0530
Message-Id: <20190202152626.1006-7-govinds@codeaurora.org>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190202152626.1006-1-govinds@codeaurora.org>
References: <20190202152626.1006-1-govinds@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add devicetree bindings for WCSS non pas remoteproc.

Signed-off-by: Govind Singh <govinds@codeaurora.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../bindings/remoteproc/qcom,q6v5.txt         | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
index 9ff5b0309417..1fe8e9f72204 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
@@ -13,6 +13,7 @@ on the Qualcomm Hexagon core.
 		    "qcom,msm8974-mss-pil"
 		    "qcom,msm8996-mss-pil"
 		    "qcom,sdm845-mss-pil"
+		    "qcom,qcs404-wcss-pil"
 
 - reg:
 	Usage: required
@@ -153,3 +154,63 @@ Hexagon, as it is found on MSM8974 boards.
 			memory-region = <&mpss_region>;
 		};
 	};
+
+	remoteproc-wcss {
+		compatible = "qcom,qcs404-wcss-pil";
+		reg = <0x07400000 0x00104>;
+		reg-names = "qdsp6";
+
+		interrupts-extended = <&intc GIC_SPI 153 IRQ_TYPE_EDGE_RISING>,
+				      <&wcss_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+				      <&wcss_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+				      <&wcss_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+				      <&wcss_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "wdog", "fatal", "ready",
+				  "handover", "stop-ack";
+
+		clocks = <&xo_board>,
+			 <&gcc GCC_WCSS_Q6_AHB_CBCR_CLK>,
+			 <&gcc GCC_WCSS_Q6_AXIM_CBCR_CLK>,
+
+			 <&clock_wcsscc WCSS_AHBFABRIC_CBCR_CLK>,
+			 <&clock_wcsscc WCSS_LCC_CBCR_CLK>,
+			 <&clock_wcsscc WCSS_AHBS_CBCR_CLK>,
+			 <&clock_wcsscc WCSS_TCM_CBCR_CLK>,
+			 <&clock_wcsscc WCSS_AHBM_CBCR_CLK>,
+			 <&clock_wcsscc WCSS_AXIM_CBCR_CLK>,
+			 <&clock_wcsscc WCSS_QDSP6SS_XO_CBCR_CLK>,
+			 <&clock_wcsscc WCSS_QDSP6SS_SLEEP_CBCR_CLK>,
+			 <&clock_wcsscc WCSS_QDSP6SS_GFMMUX_CLK>,
+			 <&clock_wcsscc WCSS_BCR_CBCR_CLK>;
+
+		clock-names = "xo", "gcc_abhs_cbcr", "gcc_axim_cbcr",
+			      "wcss_ahbfabric_cbcr", "wcnss_csr_cbcr",
+			      "wcnss_ahbs_cbcr", "wcnss_tcm_slave_cbcr",
+			      "wcnss_abhm_cbcr", "wcnss_axim_cbcr",
+			      "wcnss_qdsp6ss_xo_cbcr", "wcnss_sleep_cbcr",
+			      "wcnss_core_gfm", "wcss_bcr_cbcr";
+		resets = <&gcc GCC_WDSP_RESTART>,
+			 <&clock_wcsscc Q6SSTOP_QDSP6SS_RESET>,
+			 <&clock_wcsscc Q6SSTOP_QDSP6SS_CORE_RESET>,
+			 <&clock_wcsscc Q6SSTOP_QDSP6SS_BUS_RESET>,
+			 <&clock_wcsscc Q6SSTOP_BCR_RESET>;
+		reset-names = "wcss_reset", "wcss_q6_reset",
+			      "wcss_q6_core_reset", "wcss_q6_bus_reset",
+			      "wcss_q6_bcr_reset";
+
+		memory-region = <&wlan_fw_mem>;
+
+		qcom,smem-states = <&wcss_smp2p_out 0>;
+		qcom,smem-state-names = "stop";
+		qcom,halt-regs = <&tcsr_wlan_q6 0x18000>;
+		glink-edge {
+			interrupts = <GIC_SPI 156 IRQ_TYPE_EDGE_RISING>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			qcom,remote-pid = <1>;
+			mboxes = <&apcs_glb 16>;
+
+			label = "wcss";
+			};
+		};
+
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

