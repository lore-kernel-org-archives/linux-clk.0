Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08192C11F66
	for <linux-clk@archiver.kernel.org>; Thu,  8 Jul 2021 01:06:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E196361C4E
	for <linux-clk@archiver.kernel.org>; Thu,  8 Jul 2021 01:06:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230029AbhGHBJg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 7 Jul 2021 21:09:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230106AbhGHBJf (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 7 Jul 2021 21:09:35 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D86E0C06175F
        for <linux-clk@vger.kernel.org>; Wed,  7 Jul 2021 18:06:53 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id a8so5263966wrp.5
        for <linux-clk@vger.kernel.org>; Wed, 07 Jul 2021 18:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=L18azrwFyoptGIEYIWz4nD01VfhinXc3JMH8ke/EdqU=;
        b=zSlPWvWxFWwStd4svDYpSPO9zLKhhIY5gWm22oVhQLDexG7e2eDmlQa2OWAJPlcUO3
         Ym8U3mixkQVLfYIUPj8YO8yhx9wEc6OvaEEKFF/eGQZj5id4H7/yJ9ZUpZsmpePKYH9w
         tax5mgo3+mLWYy6dInoslXduTgWFX1J3RgLsV2C3Jw5IgK8wV4s+mbXovaSiGc1GKl8E
         /4vq4/Goo8WjfGf9B4StmqcOkPT7taoYKeqeoEjsBOs6wYRaUyK367IIt0fJSUOmnGKe
         RKB9G3eyF0D7K/Qh3r4nkaum4uovIicNGL/98jZDoSsEzYbzUC9SujdVxmqpRFhE5F5z
         S2ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=L18azrwFyoptGIEYIWz4nD01VfhinXc3JMH8ke/EdqU=;
        b=EWJ8TwThfUSBw+PqCbi4gDkwd8Bn3dxMtqiSNwbpjcYAv+Xu7NQTCYZFd8ldLBCiev
         gzTOrM4Q+d7h1s2RKb61LAyo87F2tppKbFsV6sHmG+JJZigKUg1NroOackzKVcWq2GdN
         NKnbxAYU13nGv+/Zp8UrlrS6/CWR9zL386PzqDtoyeuJWq7oA1P6XAZM4u9gRfwqyHPQ
         V82EpbaLcgsGTOafihGAILQQGqFLbJecPARv5iAH0CywQx5ljdmxuBxgr28nBQn4C6iJ
         A/frKMZJshQqR0mi+JLlQXh4WK4SXvlGUINhvx6VCz8aSXRrtzhqpSi/1QUlFW30O+h/
         ecSw==
X-Gm-Message-State: AOAM5309q5b0DvqeTqWPJTCjUyzZ0Wsd+kLnVvXHAEXUstpQRlcfpn5k
        K3GdHkUr/P+J8+Oq5dQe7AE4Vw==
X-Google-Smtp-Source: ABdhPJzg50KqYsEHqX3lE3nbmxnrv+KURkb3on0jHu8a+ew9DdZx8yJ6m/SWiyxWjjXbpBAyOUr6iA==
X-Received: by 2002:adf:f346:: with SMTP id e6mr13838777wrp.28.1625706412517;
        Wed, 07 Jul 2021 18:06:52 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id g3sm537368wrv.64.2021.07.07.18.06.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jul 2021 18:06:52 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Cc:     dmitry.baryshkov@linaro.org, jonathan@marek.ca,
        robert.foss@linaro.org, bryan.odonoghue@linaro.org
Subject: [PATCH 2/2] arm64: dts: qcom: sm8250: Add camcc DT node
Date:   Thu,  8 Jul 2021 02:08:39 +0100
Message-Id: <20210708010839.692242-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210708010839.692242-1-bryan.odonoghue@linaro.org>
References: <20210708010839.692242-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add the camcc DT node for the Camera Clock Controller on sm8250.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 4c0de12aaba6..7ac6ae50779c 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -18,6 +18,7 @@
 #include <dt-bindings/sound/qcom,q6afe.h>
 #include <dt-bindings/thermal/thermal.h>
 #include <dt-bindings/clock/qcom,videocc-sm8250.h>
+#include <dt-bindings/clock/qcom,camcc-sm8250.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -2369,6 +2370,19 @@ videocc: clock-controller@abf0000 {
 			#power-domain-cells = <1>;
 		};
 
+		clock_camcc: clock-controller@ad00000 {
+			compatible = "qcom,sm8250-camcc";
+			reg = <0 0x0ad00000 0 0x10000>;
+			clocks = <&gcc GCC_VIDEO_AHB_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK_A>;
+			clock-names = "iface", "bi_tcxo", "bi_tcxo_ao";
+			mmcx-supply = <&mmcx_reg>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		mdss: mdss@ae00000 {
 			compatible = "qcom,sdm845-mdss";
 			reg = <0 0x0ae00000 0 0x1000>;
-- 
2.30.1

