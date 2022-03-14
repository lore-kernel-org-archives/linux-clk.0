Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AA97C4332F
	for <linux-clk@archiver.kernel.org>; Mon, 14 Mar 2022 11:43:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239552AbiCNLpD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 14 Mar 2022 07:45:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240469AbiCNLn5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 14 Mar 2022 07:43:57 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A52E3FBCD
        for <linux-clk@vger.kernel.org>; Mon, 14 Mar 2022 04:42:17 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id g17so26570532lfh.2
        for <linux-clk@vger.kernel.org>; Mon, 14 Mar 2022 04:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IO2CUqTQmBTs0ed2xOKYcyLHxGgUHdJAK9+dzBl4tNg=;
        b=esC3f6rv/y3h6zKHk2vo5YGB67ofkLDfAqTasM0lsfZtLFjNiABXkmduURt0WldNHr
         Z0Ea6XQvNa6InxSeWc78edm9Jszd0HFXgU/wXiGT6WccEdv6n9Zsg/fqffhQ81GxbbWc
         gkyJP+zkBmBqi/ht51OU3gAgVTCS+WiDRoEAVF7IBEEwup5c6rc5ToAtzOVfjCTwDGw3
         ek/musPMkzUZfqFg/VuFO1kXTTW3Y8cCeQ99xmQgU1svfBkQZIaD0nHRbMaV4cY3pCM6
         2bh4LU/Qs3XXDWLbRmMDcxlbdu+mfNxnQY05OYPJamBtkprP7O5hknBEqXEYVMpbyhOM
         9j0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IO2CUqTQmBTs0ed2xOKYcyLHxGgUHdJAK9+dzBl4tNg=;
        b=7b7Xzrj6+TCaJ/oKvA60OB1M/BMGCP6llsd998BMniOXiGTEDCJjJL4G3020cDEXeE
         cTyYmbYxQThYiAXfeBdoodF80q4KONATogWSiDOWJ9BQDv2tY/AC2xt2ZUaKADfqtvrV
         gzmxNMaJDaUs/hkjxphUlD2MtZZj+h/sTx39TsbcBoIL2tsTaw5ZqLVT0St9yKR1o/kK
         2VZsiAvMUgdQqYFKT8SNz83Lh4EqA3RfMjCS20OFbfYwJhqg40jVgt1BmrSu2J6WE+f3
         qxkZzxJN18O41w2o3mrX5ml7sMU+TSyHzGi3HPzvotuAntkTrlZnZbFdSdd8FLEzBGqw
         hSFQ==
X-Gm-Message-State: AOAM532XzV5pAQuhpRTTMtFoZoTNofn6o+PyloBkGW3Vg6Tq9cmGxxjj
        yQsUfzoxCvQCm6Z+0S73qh4wAQ==
X-Google-Smtp-Source: ABdhPJxWiOdRlBsBXtKvybvT74EwATWcSCC75oC6YDQKPfyIseoIaevMnhC5XzQVNTxmwmA4+eMotw==
X-Received: by 2002:a05:6512:b25:b0:448:98bb:efae with SMTP id w37-20020a0565120b2500b0044898bbefaemr1858214lfu.151.1647258135872;
        Mon, 14 Mar 2022 04:42:15 -0700 (PDT)
Received: from localhost.localdomain (88-113-46-102.elisa-laajakaista.fi. [88.113.46.102])
        by smtp.gmail.com with ESMTPSA id l11-20020a2e834b000000b00246308690e2sm3893333ljh.85.2022.03.14.04.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Mar 2022 04:42:15 -0700 (PDT)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v2 2/7] arm64: dts: qcom: sm8450: Add description of camera clock controller
Date:   Mon, 14 Mar 2022 13:42:11 +0200
Message-Id: <20220314114211.1636574-3-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220314114211.1636574-1-vladimir.zapolskiy@linaro.org>
References: <20220314114211.1636574-1-vladimir.zapolskiy@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The change adds description of QCOm SM8450 camera clock controller.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
Changes from v1 to v2:
* disabled camcc device tree node by default

 arch/arm64/boot/dts/qcom/sm8450.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 10c25ad2d0c7..62e06874d1a8 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/clock/qcom,camcc-sm8450.h>
 #include <dt-bindings/clock/qcom,gcc-sm8450.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/gpio/gpio.h>
@@ -672,6 +673,25 @@ usb_1_ssphy: phy@88e9200 {
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

