Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 593D6CCA483
	for <linux-clk@archiver.kernel.org>; Fri, 24 Jun 2022 11:59:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230100AbiFXL7q (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 24 Jun 2022 07:59:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230520AbiFXL7p (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 24 Jun 2022 07:59:45 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0546E76698
        for <linux-clk@vger.kernel.org>; Fri, 24 Jun 2022 04:59:42 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id f39so4104252lfv.3
        for <linux-clk@vger.kernel.org>; Fri, 24 Jun 2022 04:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WifiVvyZtAR2ko3JP+VP7s2Sac2A/gN4u/xAeTXeaMw=;
        b=wlVglKYrgZrAvKJjmGCbSu/HRskm/F+NaTwQ3Gp+RNgV0wLPuqsQ7PP0wXAR457PLq
         Ui6Rhurz4pXGfZDdFIFusovm4rwmtjsrEc8p6deQ+xyardJN9SkwRSB5YnKlWGh+lK/H
         7PjdEPJyOyjXH/hsE5ALVHI65xsjAhVzjbH/6ztxiYMml2psKh+Uz42xYVNMjUGCuozB
         R5EbVxd3BGiq+hZd7nWtLX15sMfDOT4yvRejoD+FxoSNzCx1iyjdZQisiU+AUIa0H4/1
         jRDh2B0+SO83eVRdcmJ5ggNdgk62JjByfg+s5UMFOV8wFpgwDojcglu/5I0IMLMn4pW2
         L0Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WifiVvyZtAR2ko3JP+VP7s2Sac2A/gN4u/xAeTXeaMw=;
        b=QXU3SPEUepnxGJrodFXOj2yDpChlog3FmRyX1Tmo/r1iBT31pSL/xBbQd/FsJOS8mR
         gCDYfNIukVOApB66e9C5Tw+hFEG9MUVO1nnp9urdDh6EHMcd0UElz4JpmQ3TS0oqfMFy
         IjkJpnmdd/DKZoBM8UmzoKRH3Ti5SfHHzhx9sHAVTvy+yrndIMqkbCrbQbu5E6dqFMkx
         kyRKTFaglqE3pQ2DkmRvbrcP3AfyWmxbJkxu7rv3HAra4zEhtUZrubo9FKWY5XANkfrb
         VLjHhDOv58OPTTsx5bVaPWyNS+A/aOSZhgZdUZ3yr0c1LEwceliS2uGblhOkPTOaytOS
         M5hg==
X-Gm-Message-State: AJIora+3V0hrjoaigcJZM0OIShJO9jnq8TU0NAOd4Yj8VPv2VKjRTWe8
        1OtB4Vs3aVL1mi/9WHB654eXTI51rJPAxA==
X-Google-Smtp-Source: AGRyM1updTHUqWz+9wHIelEj6dA15WFrLNPp0rFYLDsjWWb1rrYtHN5+4h06NCxbLvy42pPVDEgrNg==
X-Received: by 2002:a19:771d:0:b0:47f:95ef:1d66 with SMTP id s29-20020a19771d000000b0047f95ef1d66mr8715093lfc.590.1656071980346;
        Fri, 24 Jun 2022 04:59:40 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id w10-20020a2e9bca000000b0025a65ed7aa4sm262345ljj.51.2022.06.24.04.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jun 2022 04:59:40 -0700 (PDT)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v8 2/7] arm64: dts: qcom: sm8450: Add description of camera clock controller
Date:   Fri, 24 Jun 2022 14:59:17 +0300
Message-Id: <20220624115917.2524868-3-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220624115917.2524868-1-vladimir.zapolskiy@linaro.org>
References: <20220624115917.2524868-1-vladimir.zapolskiy@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add description of QCOM SM8450 camera clock controller.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
Changes from v7 to v8:
* rebased on top of v5.19-rc2,
* minor improvement to the commit message.

Changes from v6 to v7:
* rebased on top of v5.19-rc1.

Changes from v5 to v6:
* rebased on top of linux-next.

Changes from v3 to v5:
* none.

Changes from v2 to v3:
* account a renamed header file.

Changes from v1 to v2:
* disabled camcc device tree node by default.

 arch/arm64/boot/dts/qcom/sm8450.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 7d08fad76371..fad813a21df5 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -6,6 +6,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/qcom,gcc-sm8450.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
+#include <dt-bindings/clock/qcom,sm8450-camcc.h>
 #include <dt-bindings/dma/qcom-gpi.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
@@ -2288,6 +2289,25 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
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

