Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E970C433F5
	for <linux-clk@archiver.kernel.org>; Wed,  2 Mar 2022 11:06:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241282AbiCBLGq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 2 Mar 2022 06:06:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241262AbiCBLGe (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 2 Mar 2022 06:06:34 -0500
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE48083019
        for <linux-clk@vger.kernel.org>; Wed,  2 Mar 2022 03:05:48 -0800 (PST)
Received: by mail-pl1-x62f.google.com with SMTP id s1so1236196plg.12
        for <linux-clk@vger.kernel.org>; Wed, 02 Mar 2022 03:05:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vmDFo76a8otWYPkle6/ziOHDKrQe2qvu7laZ0IuPxgk=;
        b=IzpfZk50nXuiVWgNMU72JSSGrmI9Qt1iKGALVQkGV8dBZJpTQUW0eOWvJ5Stmxgo93
         rdAZG/lvGUdWsKuepZ3mR7eQYZav1EoB4LjL0OyxAIRB04RI+uf5Qm/rMXYhJelVMmzA
         pBHGuT5c1wZ7QYFVvIaiVWX8utoBS9RgPkJPpPwkQCWJRNnktAN3PvHrjAuXsgyomg2/
         lCzI1yuS0s7RVQFcqUcntBVJGBy4QG4S7BitPN4HXwnDqcotd2f2s4Cf9Kna4J7DCU78
         JPlMAk6yEKY1TIUaq9KlVPXlz4v9qcOsprprhKG5DuFt8SfZkAoyOEjAc7XlHsc7VN0z
         +qbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vmDFo76a8otWYPkle6/ziOHDKrQe2qvu7laZ0IuPxgk=;
        b=DSuQqdJUo3VXtydZ7ZstLFNKvznd6HqubclubSA7rYTkZXoCaU6ECIP8bUWDKi+5XL
         EdJLSQimMNl9pGkRZRm+6h1q4AGWvyYhOW4AnxZvqe6WXJjRUIZJJlFqGEP4dB/DYpt5
         8zPJk3EdXF9EbfyfXkwXD/TwK77WtQwfVyCmhc68Fq5qysGckC2IR4pMNBOJLfLt/AMv
         s2UoJrC0XYTZxapsC1JWr51EL9HQ4drW4J3Vhi7Nh6fOspqArQQiGFLTGBv6KDExmFlM
         aWsj2PpIqGga0FC5avdKRofwLNGbIk2hkTR8La8qtpYblkhP2kUXTBDffmUmSUtdBUBT
         nNJQ==
X-Gm-Message-State: AOAM530fFSPue3Me60fkoTe6zzruYt3acEmGug+NaBD1g3wXQbUN/1Pw
        YKxCLGPXGpVbInEhz/uB/EIvcA==
X-Google-Smtp-Source: ABdhPJxoUZGbwWKrd44OrQlUtT7O1K8fuDhbVMyfeMvTHmOKBbYfk2J0LIulRhny4EvTsNQ1UAv1Wg==
X-Received: by 2002:a17:90a:4b45:b0:1be:da4b:a56a with SMTP id o5-20020a17090a4b4500b001beda4ba56amr8115077pjl.82.1646219148073;
        Wed, 02 Mar 2022 03:05:48 -0800 (PST)
Received: from localhost.localdomain ([171.50.175.145])
        by smtp.gmail.com with ESMTPSA id hk1-20020a17090b224100b001b8cff17f89sm5049186pjb.12.2022.03.02.03.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Mar 2022 03:05:47 -0800 (PST)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        agross@kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, sboyd@kernel.org, tdas@codeaurora.org,
        mturquette@baylibre.com, linux-clk@vger.kernel.org,
        robh+dt@kernel.org, Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v2 4/5] arm64: dts: qcom: sm8150: add ethernet node
Date:   Wed,  2 Mar 2022 16:35:07 +0530
Message-Id: <20220302110508.69053-5-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220302110508.69053-1-bhupesh.sharma@linaro.org>
References: <20220302110508.69053-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Vinod Koul <vkoul@kernel.org>

SM8150 SoC supports ethqos ethernet controller so add the node for it

Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
[bhsharma: Correct ethernet interrupt numbers and add power-domain]
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 6012322a5984..2ed231767535 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -915,6 +915,33 @@ gpi_dma0: dma-controller@800000 {
 			status = "disabled";
 		};
 
+		ethernet: ethernet@20000 {
+			compatible = "qcom,sm8150-ethqos";
+			reg = <0x0 0x00020000 0x0 0x10000>,
+			      <0x0 0x00036000 0x0 0x100>;
+			reg-names = "stmmaceth", "rgmii";
+			clock-names = "stmmaceth", "pclk", "ptp_ref", "rgmii";
+			clocks = <&gcc GCC_EMAC_AXI_CLK>,
+				<&gcc GCC_EMAC_SLV_AHB_CLK>,
+				<&gcc GCC_EMAC_PTP_CLK>,
+				<&gcc GCC_EMAC_RGMII_CLK>;
+			interrupts = <GIC_SPI 689 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 699 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq", "eth_lpi";
+
+			power-domains = <&gcc EMAC_GDSC>;
+			resets = <&gcc GCC_EMAC_BCR>;
+
+			iommus = <&apps_smmu 0x3C0 0x0>;
+
+			snps,tso;
+			rx-fifo-depth = <4096>;
+			tx-fifo-depth = <4096>;
+
+			status = "disabled";
+		};
+
+
 		qupv3_id_0: geniqup@8c0000 {
 			compatible = "qcom,geni-se-qup";
 			reg = <0x0 0x008c0000 0x0 0x6000>;
-- 
2.35.1

