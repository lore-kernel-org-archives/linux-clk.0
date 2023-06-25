Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18179C04A94
	for <linux-clk@archiver.kernel.org>; Sun, 25 Jun 2023 20:26:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230445AbjFYU0R (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 25 Jun 2023 16:26:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230399AbjFYU0Q (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 25 Jun 2023 16:26:16 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2129910C1
        for <linux-clk@vger.kernel.org>; Sun, 25 Jun 2023 13:26:08 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-4fb7589b187so206817e87.1
        for <linux-clk@vger.kernel.org>; Sun, 25 Jun 2023 13:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687724766; x=1690316766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P/gIGR5p88bRbqFIR3bdructdjZtrGeYMyqpAN9LK2o=;
        b=Hr4NYCYDh9Ejr8ZwKjAjGQdntwzW7Z5jEqehZ8+GoP0hJ1WR/H99CzIIfQzFh5EE1X
         pi7LGA9BnB2BcYfD8Tk+Kj52cXQqJ+6JlFP3zxnM9CnAx6igkE3g8PXzAWMSwVoWj/Rm
         PaYCHDMPuCFd+GVjtYN6cf0c/VFdlZ5MyFk6Kkm1JN99xUJ9soQ58ERxgQ2gcQIMcnay
         Bgfy88Udq/dO6VvhH8adShO/pURPQEzMjkZkxzkAPaMh7Jil2Xjbn9WovrNhtrW1Hftm
         3MrYozMF/eugpFeRQmjqAWtWq5XWiKwjx6rcdl2QoychMzqm3VNTUSRciA1rcEJahJ9O
         ibeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687724766; x=1690316766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P/gIGR5p88bRbqFIR3bdructdjZtrGeYMyqpAN9LK2o=;
        b=c1gHWOMxGWZwj+R/q71tVjwEYaPZWqdS/GVuTBPuOG9qauRosRHMw0s3G/Qa/KGxRR
         pigqNNfQHUMCMBZ/2XMpVTBpuGS9BIEp9RbkrC/9zBeABQq4md7+fhbXY/BAvLefJtyr
         k84Aw7GmrNhvJIxpydnR654/CDF6GpLO+yFl3XAr2j7tC/C8XEJAaOSzvHIj15J2GrkU
         KtDlN/cUZqYx/vEVpgSQv7mmnbzWTwpMk8//5tps0QGllEGIywOQ7F3GvSJmtHX1or8t
         fwIBrVdYDiIozqbD34GsSW20PsiznjGF3c7LIFLXjJz5NoAgppThtXtJiUAz7hycxp/1
         IrKw==
X-Gm-Message-State: AC+VfDx8sTepJdzF+hP3WZ7K3MvGl2Oqw5T4usbtIr5NjAo/THD8HSXx
        AhoYE3iY498mUl2oBvND7u8U9Q==
X-Google-Smtp-Source: ACHHUZ5jvaHJPeX1ZeYJTC+I5cSM+HJV3traT6tMQJ6ckNnZHG9OislZcpY+YLOCRm63ccgatJi0yw==
X-Received: by 2002:a19:ca5d:0:b0:4f8:5ade:44b5 with SMTP id h29-20020a19ca5d000000b004f85ade44b5mr13231254lfj.53.1687724766408;
        Sun, 25 Jun 2023 13:26:06 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id m21-20020a195215000000b004f8427f8716sm787537lfb.262.2023.06.25.13.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jun 2023 13:26:06 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Ilia Lin <ilia.lin@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Georgi Djakov <djakov@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        Christian Marangi <ansuelsmth@gmail.com>,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH v2 19/26] ARM: dts: qcom: apq8064: enable passive CPU cooling
Date:   Sun, 25 Jun 2023 23:25:40 +0300
Message-Id: <20230625202547.174647-20-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230625202547.174647-1-dmitry.baryshkov@linaro.org>
References: <20230625202547.174647-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Wire up CPUs and thermal trip points to save the SoC from overheating by
lowering the CPU frequency.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi | 29 ++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
index b97d88517805..f38e3394b422 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
@@ -11,6 +11,7 @@
 #include <dt-bindings/soc/qcom,krait-l2-cache.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/thermal/thermal.h>
 / {
 	#address-cells = <1>;
 	#size-cells = <1>;
@@ -701,6 +702,13 @@ cpu_crit0: trip1 {
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu_alert0>;
+					cooling-device = <&CPU0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		cpu1-thermal {
@@ -722,6 +730,13 @@ cpu_crit1: trip1 {
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu_alert1>;
+					cooling-device = <&CPU1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		cpu2-thermal {
@@ -743,6 +758,13 @@ cpu_crit2: trip1 {
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu_alert2>;
+					cooling-device = <&CPU2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		cpu3-thermal {
@@ -764,6 +786,13 @@ cpu_crit3: trip1 {
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu_alert3>;
+					cooling-device = <&CPU3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 	};
 
-- 
2.39.2

