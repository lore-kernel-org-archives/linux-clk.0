Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CECE9C77B72
	for <linux-clk@archiver.kernel.org>; Tue, 28 Mar 2023 19:36:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229750AbjC1Tgy (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 28 Mar 2023 15:36:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbjC1Tgu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 28 Mar 2023 15:36:50 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA0C83AAB
        for <linux-clk@vger.kernel.org>; Tue, 28 Mar 2023 12:36:47 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id n10-20020a05600c4f8a00b003ee93d2c914so9784356wmq.2
        for <linux-clk@vger.kernel.org>; Tue, 28 Mar 2023 12:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1680032207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qPfw21v8gtigUsolrO+BT5/gzWDhSW7RBoQgHH2kESM=;
        b=kF/rxL6HVsDj9bfhViunjiZMJgAqenp9lJbX12wrq8Yc/fgJ8g49GZ0kyXOiZDhPAW
         RtiT3XhxPkHG6rKkRXIwSJ3OY4i8zohFaDdlohQd4v3swYbIXpN3Dvwi3NNDnpp8P2aQ
         LSdx8+DaFgSdbPPR7BaFVnf33vELH1KN+IzrN5/H2t/WVyWzu+rG70GR845QfAjZPvpd
         WrsoHv9vgSPYIjuNbGGW/ZoQ8k1J3/8/uAqsbsxJlpDB9/1qinc+McchbRalyADDZ4S6
         BQufyZmAInEnsTn+e4DVKB7OYQ8OlDd93qMvtDa4T5atUlBNK3Imc0zj8Cd9L+mOuGuz
         cgRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680032207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qPfw21v8gtigUsolrO+BT5/gzWDhSW7RBoQgHH2kESM=;
        b=hR0nVqvfNKOnqS3i1PbNN9zn8aoOfC9sHoIWMfEERUu8OXdtzKYmTiAhaDh05sHGzF
         +A0P1XMMO77Ie0unac+ow5Xk4pCBGCWOliRXwaWh+9OXQVVt/ZCJm5OAEQbtOWYs2kMt
         XxnJz16VjuewQQk4w2kF9oEaREp6PMziHrbZ9vFWMaGwaSiuk9ZYBirtiknBeMijNoje
         DiPdqVn+LAtmWkKZwQ+Nw3XUX2ACC6Zx5qfrhOJyU+8SiwveZwEc/vdubuxxL5f0Im2J
         hr0skY5A2BKiV2KMwnGD2J/KM5NMsQxvlX7YPbDOKB18K3rz0JnRUfdMCb3R6j4/ZFKq
         K4IQ==
X-Gm-Message-State: AO0yUKV41Kty6fbtgQBs4erv9BUCeVdn/t28eFfnfhHB7zHr3xRSGNZN
        xsclYGyUFzDPgqnQyZNEOolHzQ==
X-Google-Smtp-Source: AK7set85YATpUqwBvEqs8LLDDBhARuvoL81CvF03dXRaHzkTq7Iz9KPPOE7V+3XqtJXXaSOETffEmA==
X-Received: by 2002:a7b:c392:0:b0:3ed:5d41:f998 with SMTP id s18-20020a7bc392000000b003ed5d41f998mr13708339wmj.15.1680032207394;
        Tue, 28 Mar 2023 12:36:47 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:7b39:552d:b2f1:d7e8])
        by smtp.gmail.com with ESMTPSA id g23-20020a7bc4d7000000b003eb5ce1b734sm18060544wmk.7.2023.03.28.12.36.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 12:36:46 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 6/7] arm64: dts: qcom: sa8775p: add the GPU clock controller node
Date:   Tue, 28 Mar 2023 21:36:31 +0200
Message-Id: <20230328193632.226095-7-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230328193632.226095-1-brgl@bgdev.pl>
References: <20230328193632.226095-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add the GPUCC node for sa8775p platforms.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index 9ab630c7d81b..4c45ad1cc7ff 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -591,6 +591,18 @@ tcsr_mutex: hwlock@1f40000 {
 			#hwlock-cells = <1>;
 		};
 
+		gpucc: clock-controller@3d90000 {
+			compatible = "qcom,sa8775p-gpucc";
+			reg = <0x0 0x03d90000 0x0 0xa000>;
+			clocks = <&gcc GCC_GPU_CFG_AHB_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>,
+				 <&gcc GCC_GPU_GPLL0_CLK_SRC>,
+				 <&gcc GCC_GPU_GPLL0_DIV_CLK_SRC>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sa8775p-pdc", "qcom,pdc";
 			reg = <0x0 0x0b220000 0x0 0x30000>,
-- 
2.37.2

