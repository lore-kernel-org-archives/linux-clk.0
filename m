Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F32E5C7EE23
	for <linux-clk@archiver.kernel.org>; Thu, 18 May 2023 11:40:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231415AbjERLkz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 18 May 2023 07:40:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230255AbjERLkv (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 18 May 2023 07:40:51 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CB28213F
        for <linux-clk@vger.kernel.org>; Thu, 18 May 2023 04:40:25 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-30781184e78so767971f8f.0
        for <linux-clk@vger.kernel.org>; Thu, 18 May 2023 04:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684409998; x=1687001998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Frmz6BUTi78qNKAnyUDI2sB3xiLlUUZ/RRfE43Q8FQ=;
        b=U9NIAkhVvca0066Yr4djQhpo9mqifAnkmKHo59xN7p73oSprjOddei8gVDX7VPy6uI
         hH/3uHvoBwTLr0rhZ7EFG3R1bZZakNQxL4t7doVa3eavQ7d/c011pxox65vYCOBOIB1n
         JzpBKWgiXeG1loBrTy4r7ODkSyxhzxlOUpllYVruO7WKTvNgZLz6GY/1YO7XvJkQ4Gy3
         iugZRGsSSL6vdfZhORce41I4+XUjx0gToqBQxR52GmTDWiql/DdPtBcdKxv1bI5+MX1f
         wt2eDGhGR678wkQsBz+ZBdGRhUDpygdTAu9bhhPnLewabSCxicdCuin9C9jE7EmhgKL/
         fY3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684409998; x=1687001998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Frmz6BUTi78qNKAnyUDI2sB3xiLlUUZ/RRfE43Q8FQ=;
        b=FDM39hTGrx+hG1QRzeInPT4j+z22x897Ah6gA4bPki1pa6AZKE+gPRGk6D9p86I3C1
         RfKjyTxz4rxT1ZF7PHB+BB09rEp176h2rMBGotgHSbyRneOcPJJgivtipFXu5uKpVVZL
         MZkch+yqhBn0Lgy2bLd3AJpYWvP9rpopnpvCZBIcIidL2fSKTP2e+va6wbLPbyMDbckW
         5Bp/zRUmp5h+U4PzsXsB2+h89vIVXukSCbpQnsbPHBJMQRGIQhJtCWFNELiJbUUjFtWu
         rpLD2zGh23XJI3LLkkCTchNHejSWZD86Smh5/0++/G6q/Ro0jHHV/htKQGJVbyOF713O
         DYRA==
X-Gm-Message-State: AC+VfDxKwX+rf/zPVZ7RmA4SJoQXgXlBc2M1XGp/MR3J6vs4QmW5YjIA
        DnVSAYtU2Vc0CXU7agdNEoGjKg==
X-Google-Smtp-Source: ACHHUZ7/GKfftwYr59QGYkOR9Uj8PP4ipOIj0pnQA907QBhpiaV2sC/IDRdQHFOaxIPwBegiMM8TXA==
X-Received: by 2002:a5d:51c5:0:b0:307:7959:6461 with SMTP id n5-20020a5d51c5000000b0030779596461mr1191839wrv.31.1684409998195;
        Thu, 18 May 2023 04:39:58 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id f14-20020a5d568e000000b003047d5b8817sm1897135wrv.80.2023.05.18.04.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 04:39:57 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     johan+linaro@kernel.org, agross@kernel.org,
        konrad.dybcio@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 5/5] arm64: dts: qcom: sc8280xp: add resets for soundwire controllers
Date:   Thu, 18 May 2023 12:38:00 +0100
Message-Id: <20230518113800.339158-6-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230518113800.339158-1-srinivas.kandagatla@linaro.org>
References: <20230518113800.339158-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Soundwire controllers on sc8280xp needs an explicit reset, this
patch adds support for this.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index d2a2224d138a..a2d0f8abe23d 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -6,6 +6,7 @@
 
 #include <dt-bindings/clock/qcom,dispcc-sc8280xp.h>
 #include <dt-bindings/clock/qcom,gcc-sc8280xp.h>
+#include <dt-bindings/clock/qcom,lpasscc-sc8280xp.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/interconnect/qcom,osm-l3.h>
 #include <dt-bindings/interconnect/qcom,sc8280xp.h>
@@ -2548,6 +2549,8 @@ rxmacro: rxmacro@3200000 {
 		swr1: soundwire-controller@3210000 {
 			compatible = "qcom,soundwire-v1.6.0";
 			reg = <0 0x03210000 0 0x2000>;
+			resets = <&lpass_audiocc LPASS_AUDIO_SWR_RX_CGCR>;
+			reset-names = "swr_audio_cgcr";
 			interrupts = <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&rxmacro>;
 			clock-names = "iface";
@@ -2647,6 +2650,13 @@ swr0: soundwire-controller@3250000 {
 			status = "disabled";
 		};
 
+		lpass_audiocc: clock-controller@3300000 {
+			compatible = "qcom,sc8280xp-lpassaudiocc";
+			reg = <0 0x032a9000 0 0x1000>;
+			#reset-cells = <1>;
+			#clock-cells = <1>;
+		};
+
 		swr2: soundwire-controller@3330000 {
 			compatible = "qcom,soundwire-v1.6.0";
 			reg = <0 0x03330000 0 0x2000>;
@@ -2654,6 +2664,8 @@ swr2: soundwire-controller@3330000 {
 				     <GIC_SPI 520 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "core", "wakeup";
 
+			resets = <&lpasscc LPASS_AUDIO_SWR_TX_CGCR>;
+			reset-names = "swr_audio_cgcr";
 			clocks = <&txmacro>;
 			clock-names = "iface";
 			label = "TX";
@@ -2849,6 +2861,13 @@ data-pins {
 			};
 		};
 
+		lpasscc: clock-controller@33e0000 {
+			compatible = "qcom,sc8280xp-lpasscc";
+			reg = <0 0x033e0000 0 0x21000>;
+			#reset-cells = <1>;
+			#clock-cells = <1>;
+		};
+
 		usb_0_qmpphy: phy@88eb000 {
 			compatible = "qcom,sc8280xp-qmp-usb43dp-phy";
 			reg = <0 0x088eb000 0 0x4000>;
-- 
2.25.1

