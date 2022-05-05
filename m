Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C34EC4321E
	for <linux-clk@archiver.kernel.org>; Thu,  5 May 2022 12:12:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359793AbiEEMQD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 5 May 2022 08:16:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359797AbiEEMQA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 5 May 2022 08:16:00 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 492706419
        for <linux-clk@vger.kernel.org>; Thu,  5 May 2022 05:12:21 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id p10so7106916lfa.12
        for <linux-clk@vger.kernel.org>; Thu, 05 May 2022 05:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wMFP9xbXKU9qCjb09rvKtkY9jzXqPLU9lN1rg4XJqsQ=;
        b=S/pUMf30RYMFaQtoD/1K2Y68O18XUwe9DaO1CArZIaAqINB1D/hsUlD29w4dhdQvsA
         5gpIAAeSk1tXZ1DmvlGhb0UJ2YYbp35jIOEWvKPhuivbNmOHpJ1j0lrbnpc7ZSMvT6Wj
         pBz9krEOB5k0MeuVQRJdY3UcU6eKWkyHvFchQ3Dik6OIhkXbsCcKFzf+cuKrIlOO4w3U
         0lX9NOKRdg+DPwObzVpcwf8fN03F3//KaWQNRcj7tDnAQUYDJCz9KfHliJweC4x8IcTD
         aTQn2lI//DTcxsECpig5cmdcsruAGToOxbNlLqgHw00juW6AZf8K+cJuhHdcxwRPHy8o
         O+Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wMFP9xbXKU9qCjb09rvKtkY9jzXqPLU9lN1rg4XJqsQ=;
        b=BZgnLbmb3IPKu2NU3fHl3ZMAn3skOwZIeLhM9sCSgctA5tqaCdVpt0ACS3OnTFvWnR
         YtonZD4rcX15lch4evDI1vNVuj48DK0EFs1TrH2W+5RFfh1sqdQ5sY0uRhnCE2+t8WCa
         rVoDhvjTwR9zGOEtGprXWvR66uDfki0i4WZLy+J7dOLFDiu9BxKq/5zkwk9B7Xgto55E
         TcxsJn3wiLl/AjnQqqbhWmTpEhf5BvbZ+Vayp1AeWsgV9pDVdzU+uYd+Eh3ljlvP2YPO
         JcwdXAn4rmiQtbwG3D/h0scKHufi15bR2D59VxFlwcE7FkTuPRFA7Jy7UvzBgvRUV6X/
         KV/Q==
X-Gm-Message-State: AOAM533ccEj5+65pHyEVtiKo1TZGmfMOK3jks7htkjSN5BzIVwVvclx4
        CHSyI120gvUuF6DX/U+2sm9EEg==
X-Google-Smtp-Source: ABdhPJxr0eQ/85GsrmsA9E2JLKS//xdW7Kxhu2fvHgtWeHURbQSMaXKS5eV7+I/JT3mgKA3/s1N9QA==
X-Received: by 2002:a05:6512:301:b0:471:ecd0:ea24 with SMTP id t1-20020a056512030100b00471ecd0ea24mr17415641lfp.71.1651752739638;
        Thu, 05 May 2022 05:12:19 -0700 (PDT)
Received: from localhost.localdomain (mobile-access-5672eb-224.dhcp.inet.fi. [86.114.235.224])
        by smtp.gmail.com with ESMTPSA id g20-20020a056512119400b0047255d211fesm187454lfr.301.2022.05.05.05.12.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 May 2022 05:12:19 -0700 (PDT)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v3 2/7] arm64: dts: qcom: sm8450: Add description of camera clock controller
Date:   Thu,  5 May 2022 15:12:13 +0300
Message-Id: <20220505121213.4121802-3-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220505121213.4121802-1-vladimir.zapolskiy@linaro.org>
References: <20220505121213.4121802-1-vladimir.zapolskiy@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The change adds description of QCOm SM8450 camera clock controller.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
Changes from v2 to v3:
* account a renamed header file.

Changes from v1 to v2:
* disabled camcc device tree node by default

 arch/arm64/boot/dts/qcom/sm8450.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 934e29b9e153..dc819f2f7651 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -6,6 +6,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/qcom,gcc-sm8450.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
+#include <dt-bindings/clock/qcom,sm8450-camcc.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
@@ -1011,6 +1012,25 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
 			};
 		};
 
+		camcc: clock-controller@ade0000 {
+			compatible = "qcom,sm8450-camcc";
+			reg = <0 0x0ade0000 0 0x20000>;
+			status = "disabled";
+			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK_A>,
+				 <&sleep_clk>;
+			clock-names = "iface",
+				      "bi_tcxo",
+				      "bi_tcxo_ao",
+				      "sleep_clk";
+			power-domains = <&rpmhpd SM8450_MMCX>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sm8450-pdc", "qcom,pdc";
 			reg = <0 0x0b220000 0 0x30000>, <0 0x174000f0 0 0x64>;
-- 
2.33.0

