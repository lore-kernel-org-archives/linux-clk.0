Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16BB4C6FA8D
	for <linux-clk@archiver.kernel.org>; Fri,  9 Sep 2022 10:51:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230158AbiIIKvt (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 9 Sep 2022 06:51:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230036AbiIIKvn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 9 Sep 2022 06:51:43 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A87A7138674
        for <linux-clk@vger.kernel.org>; Fri,  9 Sep 2022 03:51:41 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id k10so2023738lfm.4
        for <linux-clk@vger.kernel.org>; Fri, 09 Sep 2022 03:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=1L0o6NKnIV8PSSFa2/xbs05lMO9hcH96sS6kcxPnOdA=;
        b=CM7uCMcgcaeKthkDDiZiEqe+iYb/GkFNa1bl7Y3Sex5dwQOkEVJwK5SdKp+2z4DqHe
         5HlhlnI7abHrm/TFrl9lvs4V55XF0xzYHnS7uBhXKWybUrbI9oATng9ISmSLlsasO4w0
         MtNEjUxEeE4NstwLuY4Hlxx3l7OMDwmoHm8GEpyNg/aGphFPmqvOji17gU2piHsSr30S
         2b070rBRUfN0t0rcenTjxSEdVkBnWjoMsZSi+au6wKTBGldRypvQulLlw2baNeFBNPaX
         FJN5Pj7vXjnNx7wq5hPe7bWEsv3FzyvSGQWAnvgRtSxEMA1M3jI2IX/S5jkTVNIaUrsa
         92YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=1L0o6NKnIV8PSSFa2/xbs05lMO9hcH96sS6kcxPnOdA=;
        b=rvSM7PxdsGGCLr8Zvm9i0GMhNFMDwASP3kuLbV+VIADhPcU3Vi50aZZl9JNSbnGUmc
         YZhb/US0WJvOkg4GZpzgpJeq23/Pz83ANiimeu+rTl+TJDndTmMDtN99CWkAD8L1mqjw
         3DOPlCKSUF40O3GLgW+Amhqab0KMfQzi6B4PqjIOYurLEBBiiKyRK7oxeQAsM6+JuTA0
         1DQqOnjEes9Ip2dcnF8iland7D8BLio1Tgt+yEteM296LGzEn5Ll0TT605Hanl0GWRII
         TUAs0XZJL3y65pmsYwujcP+qeMwQ+MIIc1rHB3fCk6b8c3/NonDhxTZNBdC/4MqM7YFi
         8kmg==
X-Gm-Message-State: ACgBeo0CIxnWYikqvF/EMyLo39P9EkPsMXYKOJ8uhmtbFAH0pxi4wc6R
        PZhMRb51nmItSZDGyJ6C8u2n5g==
X-Google-Smtp-Source: AA6agR6HZMSkY/vcQvNbhKyTUVdQqJaSpu4hSrjnsI5wU2M4jaN5LwZ+qKLXdojP+zCLHVY80T3Y/w==
X-Received: by 2002:a05:6512:909:b0:48b:954c:8e23 with SMTP id e9-20020a056512090900b0048b954c8e23mr4724150lft.670.1662720699917;
        Fri, 09 Sep 2022 03:51:39 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u4-20020a05651220c400b004949903efdcsm25428lfr.287.2022.09.09.03.51.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 03:51:39 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 4/5] ARM: dts: qcom: msm8660: add pxo/cxo clocks to the GCC node
Date:   Fri,  9 Sep 2022 13:51:35 +0300
Message-Id: <20220909105136.3733919-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220909105136.3733919-1-dmitry.baryshkov@linaro.org>
References: <20220909105136.3733919-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add pxo/cxo clocks to the GCC device tree node.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-msm8660.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-msm8660.dtsi b/arch/arm/boot/dts/qcom-msm8660.dtsi
index 63a501c63cf8..153156f48421 100644
--- a/arch/arm/boot/dts/qcom-msm8660.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8660.dtsi
@@ -50,7 +50,7 @@ cpu-pmu {
 	};
 
 	clocks {
-		cxo_board {
+		cxo_board: cxo_board {
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
 			clock-frequency = <19200000>;
@@ -129,6 +129,8 @@ gcc: clock-controller@900000 {
 			#power-domain-cells = <1>;
 			#reset-cells = <1>;
 			reg = <0x900000 0x4000>;
+			clocks = <&pxo_board>, <&cxo_board>;
+			clock-names = "pxo", "cxo";
 		};
 
 		gsbi6: gsbi@16500000 {
-- 
2.35.1

