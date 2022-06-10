Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51985C433EF
	for <linux-clk@archiver.kernel.org>; Fri, 10 Jun 2022 10:53:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348940AbiFJKw7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 10 Jun 2022 06:52:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348857AbiFJKwh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 10 Jun 2022 06:52:37 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B748330AB48
        for <linux-clk@vger.kernel.org>; Fri, 10 Jun 2022 03:49:18 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id c2so22779365lfk.0
        for <linux-clk@vger.kernel.org>; Fri, 10 Jun 2022 03:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ly9q5MzbrlbdcUikNhTk9UKh8YRo0399T7xAGlulhbs=;
        b=qQ7dEWA1Nh+nSZcyR89nEkvc3VNGEmyLrd10VuNZ0P3oS/K12+GTM793sUhmqJeRzE
         bZjP+KdBEUe5iYoN8tFSQItsE2B50Ew9oxjYIakbd4dF2e6fH8RGwa80HIganSQJ48rY
         KgTuRxakqCRFHztVDV42/bd5yA93a/Ga0yvrARP3uRkJAjLFeZyOOw/QQgWbEvjS0r4c
         hX5JAaIGGuAZmC/7s/nTHLJcVT23qbHaNWHzj9nhsNftLUBwelquQ9/iJ4D+UUp6ATXI
         bT+RffP7BW9sPudT/aBrGUV6/QDta9V5C9BmOq1C20cYEbINmXhBwUASwqbNX/W+CtXB
         XdnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ly9q5MzbrlbdcUikNhTk9UKh8YRo0399T7xAGlulhbs=;
        b=sU7hUutRUD7JME3+6D36ZGTO9DYHhIRn8C77fO5chZ+6qXIB8cCFLFiLW+sjpIdFUa
         cPpW6efXIT58eW3pnSGm3NF0NQQEdKUnVXN7yOYDaKeoGfjL5sKyvuuCaZA164ixALC5
         +UJN+U+fsL4kc1u4TzV7+ed9VsLpIdg4P9ztrkKXLg7EFopNAZqmeiK/UipEcVbtAeVz
         veHTRNintj6BTaNFakpHX7ajE+Rxesyro1AxnI3KknpYBvSN2VPmwewqKiARgJe3wNPo
         cGOCfXmm9rYBHOQv1EGOSHTYPy3Bn1UqOp+alsWAmTCiGAQ7W5I4Il1FisekQR52QrhP
         CAOA==
X-Gm-Message-State: AOAM530ihEdvPBgaP2Z4gahKx0bBea99NCW9eLXIyAGvZFh264CkMlSJ
        4hFqWmd1dl9QOCumX5dcxzhZrw==
X-Google-Smtp-Source: ABdhPJwzPEma/8t27CrbFO79u1PwunyeqedgBcWhAfU3hjkciEZneGBl7oHmPj1mFONxx3PRVXHlpw==
X-Received: by 2002:ac2:4d82:0:b0:47d:b3c8:9e80 with SMTP id g2-20020ac24d82000000b0047db3c89e80mr1132324lfe.623.1654858156959;
        Fri, 10 Jun 2022 03:49:16 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id h11-20020ac24d2b000000b00477a287438csm4683468lfk.2.2022.06.10.03.49.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jun 2022 03:49:16 -0700 (PDT)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v7 2/7] arm64: dts: qcom: sm8450: Add description of camera clock controller
Date:   Fri, 10 Jun 2022 13:49:11 +0300
Message-Id: <20220610104911.2296472-3-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220610104911.2296472-1-vladimir.zapolskiy@linaro.org>
References: <20220610104911.2296472-1-vladimir.zapolskiy@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The change adds description of QCOm SM8450 camera clock controller.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
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

