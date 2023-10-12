Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A9B9CDB47E
	for <linux-clk@archiver.kernel.org>; Thu, 12 Oct 2023 11:31:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378288AbjJLLbM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 12 Oct 2023 07:31:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347180AbjJLLbL (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 12 Oct 2023 07:31:11 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 473519D
        for <linux-clk@vger.kernel.org>; Thu, 12 Oct 2023 04:31:07 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-323ef9a8b59so801108f8f.3
        for <linux-clk@vger.kernel.org>; Thu, 12 Oct 2023 04:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697110265; x=1697715065; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=82Kqf0UBYM8c+UzHOY9T7/SD0aaAr6GxwSoS4++hAHg=;
        b=bpG3HF7wO2yeeA3xaVNNGjILmaeujbC4hpkjd/YPdboa4RnIF4zaMqDxb5nnZU0EKn
         BskR6tqCCizR2MWaPo6WUcohFLA3pPpdn8vxIvSDsiyiDn50iuZRyE9xMxSWPiEuGjVU
         /RMsK6geCnOGCE4z2jTENthhXtVirDCf28lx+HvwcZHBp67ylZMsprnQHTvatClOjiPC
         gCUqBooxX7XpJTfO0gj7T0CMFuHCYPgm3rqm2T6AI9yBr2PhiedB3PBD+gJcvlVzfWDL
         sJIkgtkzRDANvSupkxxo5egPQdv/Y+86ZZ1/06FUYcrdgKrIKKecciyMwADiiXJx0Vfj
         yeBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697110265; x=1697715065;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=82Kqf0UBYM8c+UzHOY9T7/SD0aaAr6GxwSoS4++hAHg=;
        b=W0xXgF6Go4d2J76D00YQH+OkwhyBijhU9pWmEexzZK7ywZ/N4/yGiDQwjw2Y8Mg57g
         GnCnax4HYApAjB0l6o4yPTswpoobGijVqmlhik2O3aL1lPEJYF0yQlrZ5LqHJPRQqUe8
         dJZzi1ltiRrwxZ3AWKEPf/lCtmzyzmklSVyNM/pG4plrGsjS4nJIRVsE5TWSD82y+D44
         poB1OghDSX4xHwR2RMdJxwcxYo8xDs3RIqJGNqTSJGAwYBjTRfB/VAbYMmUeW7h3r6vO
         vSXN9ZZLZH8fgSmgc8uUBYZrTRjgB0V/mUlTXQUZMfjkQXvEm/DRbdUhox3PcJ0zuZxD
         CUDQ==
X-Gm-Message-State: AOJu0YzS/4LA2Sk9Kn9rPmUacwqrRruyG6NEtfKtjQw6yoy4Q+u8bMoV
        z1wjtRNA2Z2f3Sj6QZauJDueFg==
X-Google-Smtp-Source: AGHT+IHdiO2gaVfOKAtP8BKlYveVx8f24wMW+fnbvPbvHY8RXPkNA0QnfaBmFCNBIfn+BybDkHvcKA==
X-Received: by 2002:adf:f1c6:0:b0:324:1521:3a6e with SMTP id z6-20020adff1c6000000b0032415213a6emr20587033wro.24.1697110265731;
        Thu, 12 Oct 2023 04:31:05 -0700 (PDT)
Received: from x13s-linux.nxsw.local ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id l14-20020a5d480e000000b0031c5e9c2ed7sm18244891wrq.92.2023.10.12.04.31.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Oct 2023 04:31:04 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     andersson@kernel.org, agross@kernel.org, konrad.dybcio@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        dmitry.baryshkov@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        jonathan@marek.ca, quic_tdas@quicinc.com,
        vladimir.zapolskiy@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        bryan.odonoghue@linaro.org
Subject: [PATCH v4 1/4] arm64: dts: qcom: sc8280xp: Add in CAMCC for sc8280xp
Date:   Thu, 12 Oct 2023 12:30:57 +0100
Message-Id: <20231012113100.3656480-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231012113100.3656480-1-bryan.odonoghue@linaro.org>
References: <20231012113100.3656480-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add in CAMCC for sc8280xp. The sc8280xp Camera Clock Controller looks
similar to most of the sdmX, smX and now scX controllers.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Suggested-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index cad59af7ccef..fafea0f34fd9 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -8,6 +8,7 @@
 #include <dt-bindings/clock/qcom,gcc-sc8280xp.h>
 #include <dt-bindings/clock/qcom,gpucc-sc8280xp.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
+#include <dt-bindings/clock/qcom,sc8280xp-camcc.h>
 #include <dt-bindings/clock/qcom,sc8280xp-lpasscc.h>
 #include <dt-bindings/interconnect/qcom,osm-l3.h>
 #include <dt-bindings/interconnect/qcom,sc8280xp.h>
@@ -3450,6 +3451,20 @@ usb_1_role_switch: endpoint {
 			};
 		};
 
+		camcc: clock-controller@ad00000 {
+			compatible = "qcom,sc8280xp-camcc";
+			reg = <0 0x0ad00000 0 0x20000>;
+			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK_A>,
+				 <&sleep_clk>;
+			power-domains = <&rpmhpd SC8280XP_MMCX>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		mdss0: display-subsystem@ae00000 {
 			compatible = "qcom,sc8280xp-mdss";
 			reg = <0 0x0ae00000 0 0x1000>;
-- 
2.40.1

