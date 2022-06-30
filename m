Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 189C3CCA485
	for <linux-clk@archiver.kernel.org>; Thu, 30 Jun 2022 08:19:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232695AbiF3ITb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 30 Jun 2022 04:19:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233060AbiF3ITJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 30 Jun 2022 04:19:09 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD64562D8
        for <linux-clk@vger.kernel.org>; Thu, 30 Jun 2022 01:17:52 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id n15so22054008ljg.8
        for <linux-clk@vger.kernel.org>; Thu, 30 Jun 2022 01:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7/Movm5xen2iEkwTgrvIPhJRE4iq2d4oy78OyTyLFgE=;
        b=hQxufYN09nA7vBrZAZxHHUf34VOjdG94Nr7Ao6mHwWvIPrKfLqf0IcG4Aonu0sYTBu
         dg53KU2/08QqsiD5pUSQUvLUgY6uJh7UgsaoNjfhPgsG4H1Z/Nrqm+fvXzQq3tAGeqv2
         qCMRG3o88jsl7gWFjh6ka+OKNDoyOGZejs4Z1mhNcEJ6QoHcpPAHOOC3rXYJ6o09jCsj
         8oGIdDmOQtJ+DxnObKoulTyqmRBWWQGMRxRrJOpbypggg7qIwBThQB2Z3d4yQzKSilML
         +kxfgVcfAR9LgtmyI4xD65wrT50sbnrVd2GQENRgfFnCBR+WnUa6z4BE+VK7MJ5ymDh4
         wr0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7/Movm5xen2iEkwTgrvIPhJRE4iq2d4oy78OyTyLFgE=;
        b=FBdp3BPaFp5GYmmB00qlKXeAxLju79bkkIiKjWjIahdn18G4XlZL/E7wp2rDKcLXl3
         tguzf9EZvbEOKUjUHiu7HuNzg3E52sBOnq+jxx9mTmz2D1LoiGXETQBzv93mEhihlWPu
         rU+TrR2QHF2bDnAtVr1LjROR5OghsvrQt7Dd7f5JeG+bkuOK3prT7HGn49TgBsNck6hC
         yMdk46l/obkqoNjSrRGvtHFQYa3qdHBPJlOEQWoQT3n8HFL9fPgQgI7AG+QC0yhhChnb
         cSlmo5kiqjfFb33MG3b6CBf73F+0Tf9eqLPQELGkoXea6NLcWomY6ICeNA39DpbcnVl9
         PRfA==
X-Gm-Message-State: AJIora8b1kUg8m7mjiI+C/+L0pKv9XiRH2W0yoQeQZRFh9kfU3HxVKyc
        J4riWVO3tpMHYnFYyrcYkw0bdQ==
X-Google-Smtp-Source: AGRyM1tmglZmtE3gFOaFgbWW34WUupRKgOvRaaB1VfEJjaLAp1B/6hiB/6nG/x5BHXLFqIYtzO7Y/Q==
X-Received: by 2002:a2e:a90d:0:b0:25a:7edb:4034 with SMTP id j13-20020a2ea90d000000b0025a7edb4034mr4126816ljq.129.1656577071195;
        Thu, 30 Jun 2022 01:17:51 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id p18-20020a2eb992000000b0025bda317bdcsm913623ljp.88.2022.06.30.01.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 01:17:50 -0700 (PDT)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v9 2/7] arm64: dts: qcom: sm8450: Add description of camera clock controller
Date:   Thu, 30 Jun 2022 11:17:42 +0300
Message-Id: <20220630081742.2554006-3-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220630081742.2554006-1-vladimir.zapolskiy@linaro.org>
References: <20220630081742.2554006-1-vladimir.zapolskiy@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The change adds description of QCOm SM8450 camera clock controller.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
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

