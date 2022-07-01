Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4879ECCA480
	for <linux-clk@archiver.kernel.org>; Fri,  1 Jul 2022 06:26:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234776AbiGAG0x (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 1 Jul 2022 02:26:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234802AbiGAG0w (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 1 Jul 2022 02:26:52 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 365944551B
        for <linux-clk@vger.kernel.org>; Thu, 30 Jun 2022 23:26:51 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id bx13so1449303ljb.1
        for <linux-clk@vger.kernel.org>; Thu, 30 Jun 2022 23:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8cvn4OI0YG23eBzT25QIL10M0drau64R5BF4I+eueZ8=;
        b=IVRSFW2bwDcxAvPzl0Y9tKTZOwAwBG/SiOmsrTwNMpa3TUdRr7f8QxkZXWG4eFqVD+
         y79n1nP7BB8qFUUqmC+wk64rOX6mavRT/Gyrum7aE7e0WMl6xjT/llcG4EQKJui4Rffl
         qmzCu6URNMVjSWvjsZfi6FpjXV4hDh8R6dsVTmHSkhepFWFGtakazPZTXLRgcRe/Ouuc
         7iph2FT4XA+q0MgjmcEVnMqearb4v8BS9irsqdvswt5fFTSXqHj6awC3/ls+h+j/MOxS
         vvjHWJYbwP5cKg2Ko2C5KFfrMaOr8MTLCtPSBrIuRsoZnpg3LSWo4C483fKnJIk1XBM5
         +4MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8cvn4OI0YG23eBzT25QIL10M0drau64R5BF4I+eueZ8=;
        b=cytXZOtFKMg1FyuTo0KaJE0/H3R0nki98HhGAVoF2nFtGnlZC3fh7XZhyvH+g6OT81
         bJYJC+1WQZIzg2PCS48uDC0bjNmA1Y6O6t+ZeUpod4l8vN+dDkhIVFTxpnvFldFeQq5o
         S8Bngu9cFHGl9PnhEPhunRh/ZaAYUB5G2iEhJU3DkfQfwoOZlRtzzkdnZko+VAkpF/H4
         TIxjZIkeBl5EenyenAh3vmGu4CU8NpdPmCL0lVtd4ETv62D/cg0GURyOYOLJLS+igC+S
         szEmcWJWEuJmlIAV4gTa/sjI/kxJes1YiNebsM1EiOV8K6/XKCXR2H3HuaYXQ58pkzJB
         fOHA==
X-Gm-Message-State: AJIora+nJZ+cDjF2m/+nnn3mZEpbbC48mjAXpTGgG0OlCZH2JO1A7GuX
        D/U3g2xm7rOdEuLqn+/4qk58Yg==
X-Google-Smtp-Source: AGRyM1uk0uvRkD2Sh3lsXaWFyQwKvZTKywf3CIAzDF5XV/pwfV80xy9qWvRaGMYSQHmP5q3+aiI9fg==
X-Received: by 2002:a2e:8910:0:b0:25a:7eda:e4df with SMTP id d16-20020a2e8910000000b0025a7edae4dfmr7267800lji.316.1656656809442;
        Thu, 30 Jun 2022 23:26:49 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id s14-20020a19770e000000b0047faefd9f24sm3476581lfc.207.2022.06.30.23.26.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 23:26:49 -0700 (PDT)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v10 2/7] arm64: dts: qcom: sm8450: Add description of camera clock controller
Date:   Fri,  1 Jul 2022 09:26:22 +0300
Message-Id: <20220701062622.2757831-3-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220701062622.2757831-1-vladimir.zapolskiy@linaro.org>
References: <20220701062622.2757831-1-vladimir.zapolskiy@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The change adds description of Qualcomm SM8450 camera clock controller.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
Changes	from v9 to v10:
* fixed a commit message per a review comment from Vinod.

Changes from v8 to v9:
* removed a clock-names property,
* placed a status property as the last one in the list of properties

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

 arch/arm64/boot/dts/qcom/sm8450.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index b06c7d748232..de83df1c73c5 100644
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
@@ -2301,6 +2302,21 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
 			};
 		};
 
+		camcc: clock-controller@ade0000 {
+			compatible = "qcom,sm8450-camcc";
+			reg = <0 0x0ade0000 0 0x20000>;
+			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK_A>,
+				 <&sleep_clk>;
+			power-domains = <&rpmhpd SM8450_MMCX>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+			status = "disabled";
+		};
+
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sm8450-pdc", "qcom,pdc";
 			reg = <0 0x0b220000 0 0x30000>, <0 0x174000f0 0 0x64>;
-- 
2.33.0

