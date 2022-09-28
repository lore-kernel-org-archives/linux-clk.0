Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6C37C54EE9
	for <linux-clk@archiver.kernel.org>; Wed, 28 Sep 2022 15:00:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234705AbiI1PAp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 28 Sep 2022 11:00:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234643AbiI1PAT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 28 Sep 2022 11:00:19 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DF0A38A0C
        for <linux-clk@vger.kernel.org>; Wed, 28 Sep 2022 08:00:08 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id bu25so18901020lfb.3
        for <linux-clk@vger.kernel.org>; Wed, 28 Sep 2022 08:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=UcpWFZqwzt2iPUQPqE8ypJYgI9SteXXhQqUr61/Zf2k=;
        b=EPkX704LXYnO0oJVGzo2xpWyJXpQv40SbmJzXrqu7NMm/12Ah3IOPA0ulzrEpVGVwX
         oAPej9VOH2FrD6vAJ6PSrY2L0Osfzh2W+WMd05QzzQVhg+UCPsWDpE2HrBGtDGc2gqSL
         MnV88GSpFKRd0DvmUa+A0rC9YI0u+dNw/jzzG8iRGNFN39O2FX031ZjL1u/mh6p5fjc+
         /2733TO5jIcVAwhONGk9CrsFKi5eYzkUxh/vUDIemrQAh8dl/I6sxI/7lB83vqNqAVZ3
         Ni5t9sJyamhi11v3r1MQrnw2spEe15Rqwf8kCAHuuwfkiMzWtvFamcQjawaE1Ru/3Sgu
         pIvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=UcpWFZqwzt2iPUQPqE8ypJYgI9SteXXhQqUr61/Zf2k=;
        b=ZWUXlwTNAkJ4r/uCRhlrmGfQiz6pHaxO8gsjRq42jM/BOrj9rNHdB1TgZxhZNdRPn9
         UvbB60QCIqRAh7PYTnOe24eVOa8adRkIe9pgjKJs9JcQAJeu/wlfx5uwytGXJClUAEaF
         enpSZZNPXUdPvl6tyGlCk9k8xrHMrhcWlO4YSNwmaAf3q1J4UjoYYUselzAsSRuXCf/u
         btSyQFd2ahGzJ66L2aPk6pq3ReNa5Iw60I+lJ+9Ed155/e+7o8tauIXOmfBbFVUSVEDY
         QZS1Wb12SJU+7z0oPVKaGQkmeNE5r9BBVGRYv8+zMk6sSU5za2ntTjh3mAKCa2k9eDNq
         rblA==
X-Gm-Message-State: ACrzQf0Tim48RNyCbUiZ9rh76716vPJE5KeCUMll12+fdMQz0qSFF8To
        tZ/8x65FEMKIy+aDaD81n21w1g==
X-Google-Smtp-Source: AMsMyM7fP3m0ynNAHGGn5XPBEmJRAZ/tM1Qz4XFFKB2zBUc+VqbSxoNYUHlg1ky96pszg6F33zIzAA==
X-Received: by 2002:a05:6512:2250:b0:49b:817a:c318 with SMTP id i16-20020a056512225000b0049b817ac318mr14495322lfu.535.1664377206802;
        Wed, 28 Sep 2022 08:00:06 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id be36-20020a056512252400b00492c017de43sm494996lfb.127.2022.09.28.08.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 08:00:06 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 09/11] ARM: dts: qcom: msm8974: add second DSI host and PHY
Date:   Wed, 28 Sep 2022 17:59:56 +0300
Message-Id: <20220928145958.376288-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220928145958.376288-1-dmitry.baryshkov@linaro.org>
References: <20220928145958.376288-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add second DSI host and PHY available on the msm8974 platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-msm8974.dtsi | 78 +++++++++++++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index 7a9be0acf3f5..810a163ca14f 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -1541,6 +1541,13 @@ mdp5_intf1_out: endpoint {
 							remote-endpoint = <&dsi0_in>;
 						};
 					};
+
+					port@1 {
+						reg = <1>;
+						mdp5_intf2_out: endpoint {
+							remote-endpoint = <&dsi1_in>;
+						};
+					};
 				};
 			};
 
@@ -1614,6 +1621,77 @@ dsi0_phy: dsi-phy@fd922a00 {
 
 				status = "disabled";
 			};
+
+			dsi1: dsi@fd922e00 {
+				compatible = "qcom,mdss-dsi-ctrl";
+				reg = <0xfd922e00 0x1f8>;
+				reg-names = "dsi_ctrl";
+
+				interrupt-parent = <&mdss>;
+				interrupts = <4>;
+
+				assigned-clocks = <&mmcc BYTE1_CLK_SRC>, <&mmcc PCLK1_CLK_SRC>;
+				assigned-clock-parents = <&dsi1_phy 0>, <&dsi1_phy 1>;
+
+				clocks = <&mmcc MDSS_MDP_CLK>,
+					 <&mmcc MDSS_AHB_CLK>,
+					 <&mmcc MDSS_AXI_CLK>,
+					 <&mmcc MDSS_BYTE1_CLK>,
+					 <&mmcc MDSS_PCLK1_CLK>,
+					 <&mmcc MDSS_ESC1_CLK>,
+					 <&mmcc MMSS_MISC_AHB_CLK>;
+				clock-names = "mdp_core",
+					      "iface",
+					      "bus",
+					      "byte",
+					      "pixel",
+					      "core",
+					      "core_mmss";
+
+				phys = <&dsi1_phy>;
+				phy-names = "dsi-phy";
+
+				status = "disabled";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						dsi1_in: endpoint {
+							remote-endpoint = <&mdp5_intf2_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+						dsi1_out: endpoint {
+						};
+					};
+				};
+			};
+
+			dsi1_phy: dsi-phy@fd923000 {
+				compatible = "qcom,dsi-phy-28nm-hpm";
+				reg = <0xfd923000 0xd4>,
+				      <0xfd923100 0x280>,
+				      <0xfd923380 0x30>;
+				reg-names = "dsi_pll",
+					    "dsi_phy",
+					    "dsi_phy_regulator";
+
+				#clock-cells = <1>;
+				#phy-cells = <0>;
+
+				clocks = <&mmcc MDSS_AHB_CLK>, <&xo_board>;
+				clock-names = "iface", "ref";
+
+				status = "disabled";
+			};
 		};
 
 		gpu: adreno@fdb00000 {
-- 
2.35.1

