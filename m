Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A527C77B7E
	for <linux-clk@archiver.kernel.org>; Mon, 24 Apr 2023 12:14:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231801AbjDXMOQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 24 Apr 2023 08:14:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229659AbjDXMOM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 24 Apr 2023 08:14:12 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CED54211
        for <linux-clk@vger.kernel.org>; Mon, 24 Apr 2023 05:14:09 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4efe8991b8aso2317932e87.0
        for <linux-clk@vger.kernel.org>; Mon, 24 Apr 2023 05:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=8devices.com; s=8devices; t=1682338447; x=1684930447;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cSg+Sr4Izv6SuaT8Bc0GsU3O/zi4zb4SC3eF1z+OThY=;
        b=DnyhHHIEm7sOXD8G9rdXFjq+JJGE0aolitslG+kUVa5NShlUFkU/gQb74Na0IBX0T/
         +vyjyltyk4uLFEPmQBVEQBbc8n4Jp53+hpkP9c+5197U2HDW1wHvl623oLJDOUDWAEIs
         O8ZNxzwVmB9VWKisLIAKF9+Y0LEFm5DR0QtzlIRIDm5lDOlib8OJd/DwA1lhzhtOrLcc
         FJbkhhR1dUHCQ0fxNQpJEUjBmOe0AIPIRDTf/v7t0tT4Pw9Omhsgb7013aSs8ki/d230
         Ng3PdOOadNeA8QUZojqMiMqnFDwwrQh3p7YOwNrlMR7Xd4GJ8+T7My7GIH/JDGkoifqM
         4P9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682338447; x=1684930447;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cSg+Sr4Izv6SuaT8Bc0GsU3O/zi4zb4SC3eF1z+OThY=;
        b=TJly6MRmUB4BthX5dvfVPF1gzDE5LDLPnHVWGOHJ5j+Eouj0Fwx3Y1iNpLfefxrY/s
         3Fc6LvJAyPjuGj1+Cu9xAsJT5TMszB+ckuCIHF2u4Zrst7y0ovhgcflvU0cUeBbnj1Dq
         OjwOlxYkstDAZoC9zXIbtwLBguVR9Zobwb7WQROlnuYSZ49v3upYnfNXzXZQPlGGQSc5
         bGGGLNzFDlG75/HEyo1HCv7EchgE90pL0+Whvx6MZlfK5dD5iqDfpWnqqn4c6c9UonhE
         HtnHUQk7ZtUi4kSRgGjnY4shIufywqTIQ28IFZtiWKC9WHiQpjVQwo9xP0VPcv/6qV+4
         lYAA==
X-Gm-Message-State: AAQBX9emYcaLFiSnUzL9KzrIoSyGFuLzsi6XFKP4M/P3NNnqtKcIv19D
        4VqY9Zn36iLjvZJtH823s2jE/g==
X-Google-Smtp-Source: AKy350aqa3hL84PCEAOSmwTnpLJXRUDhws2ye0MyTd3kcxq8Q2zZlZqvrmn88+r0T9u3JCEatIzbiA==
X-Received: by 2002:a2e:a3d6:0:b0:2aa:44ae:45a with SMTP id w22-20020a2ea3d6000000b002aa44ae045amr2102991lje.13.1682338447334;
        Mon, 24 Apr 2023 05:14:07 -0700 (PDT)
Received: from mantas-MS-7994.8devices.com ([84.15.37.222])
        by smtp.gmail.com with ESMTPSA id x23-20020a2e7c17000000b002a5f554d263sm1732382ljc.46.2023.04.24.05.14.06
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 24 Apr 2023 05:14:07 -0700 (PDT)
From:   Mantas Pucka <mantas@8devices.com>
To:     Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     Abhishek Sahu <absahu@codeaurora.org>,
        Anusha Canchi Ramachandra Rao <anusharao@codeaurora.org>,
        Sricharan R <sricharan@codeaurora.org>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, Mantas Pucka <mantas@8devices.com>
Subject: [PATCH 3/3] arm64: dts: qcom: ipq6018: add SDHCI node
Date:   Mon, 24 Apr 2023 15:13:32 +0300
Message-Id: <1682338412-15420-3-git-send-email-mantas@8devices.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1682338412-15420-1-git-send-email-mantas@8devices.com>
References: <1682338412-15420-1-git-send-email-mantas@8devices.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

IPQ6018 has one SD/eMMC controller, add node for it.

Signed-off-by: Mantas Pucka <mantas@8devices.com>
---
 arch/arm64/boot/dts/qcom/ipq6018.dtsi | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
index 9ff4e9d45065..b129b23d68b1 100644
--- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
@@ -414,6 +414,29 @@
 			};
 		};
 
+		sdhc_1: mmc@7804000 {
+			compatible = "qcom,ipq6018-sdhci", "qcom,sdhci-msm-v5";
+			reg = <0x0 0x07804000 0x0 0x1000>,
+			      <0x0 0x07805000 0x0 0x1000>,
+			      <0x0 0x07808000 0x0 0x2000>;
+			reg-names = "hc", "cqhci", "ice";
+
+			interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hc_irq", "pwr_irq";
+
+			clocks = <&gcc GCC_SDCC1_AHB_CLK>,
+				 <&gcc GCC_SDCC1_APPS_CLK>,
+				 <&xo>,
+				 <&gcc GCC_SDCC1_ICE_CORE_CLK>;
+			clock-names = "iface", "core", "xo", "ice";
+
+			resets = <&gcc GCC_SDCC1_BCR>;
+			supports-cqe;
+			bus-width = <8>;
+			status = "disabled";
+		};
+
 		blsp_dma: dma-controller@7884000 {
 			compatible = "qcom,bam-v1.7.0";
 			reg = <0x0 0x07884000 0x0 0x2b000>;
-- 
2.7.4

