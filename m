Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06DA3C41535
	for <linux-clk@archiver.kernel.org>; Tue, 15 Feb 2022 20:16:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243436AbiBOURF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 15 Feb 2022 15:17:05 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:37322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244060AbiBOURE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 15 Feb 2022 15:17:04 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64DFEEBACA
        for <linux-clk@vger.kernel.org>; Tue, 15 Feb 2022 12:15:46 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id b38so125790ljr.12
        for <linux-clk@vger.kernel.org>; Tue, 15 Feb 2022 12:15:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=T2+DDOdrcGPnlAZTACHXV/AJiHKfc3Ic3cTglmWdDWE=;
        b=ydYV9zG2iFm+pJ4khvAGMrd/aSo++Tqsib0wOG+sW86UpRfWodrilh1PlbjFliOlzu
         lKbyE3MXUU8N8BxxvnEvAJ7c7fnVY7haE5YfrIOJY0BlCk4XSwv+77o0TRbbqRF1eYq5
         3r35IydfamM/GoTe292eZyB8KBjp/80bGRNu/pDs2kogMiMAzsG0Dc3eOWZtWPWXXzaC
         nxK8XUDHe6CFr/VzuzvSXtOqePVtesjaNXB1gG7CCND+FImywbJ1D9iHfI5dmFeAaLGk
         awK6Rn//QzTY4Zw7KafFf9GwnqmAg1phpspfLnB1fxBB9SjPtwgOG9Jdx+VybSDzJgJj
         JfmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=T2+DDOdrcGPnlAZTACHXV/AJiHKfc3Ic3cTglmWdDWE=;
        b=tFwlnL0l3QmlEET3jQeXbTcZYbRrYdz4iJ6gn+zT0BIhLG5DSAGube6n1h4Ks6UD0X
         6uw2BpbofNjJyWuxmD8AYPhFLPZsyK2L2Sx3NUgjWsuErAYg+Wa1BtnIiQ90D7lyp5wO
         m0dRi7T6R/5q51iwyQ7EzrZnVHxdjWAbK3pa3CD6kLLZW/l2lqnU8oipf3lxLn4MZRvM
         odIt0M5okPQGrCIm+XVPOiV8ZQr8PL4dTu25Sy85Q7EuckFOyN7+PQXcAUvUVSYwdmcB
         4Ia1G8cQJWvzNN1toM8LPLomOnvc4b4dCUXPCcU+uqM4xuZZxpjmEak2CzXC8cTWPX0s
         IVGQ==
X-Gm-Message-State: AOAM530PW3SQ21VOPYALNCOtuPkRDr3sT/ksqhRPVO2N1x15u/wXd6vv
        YJ8diIEkp7sUKHD0oX9eWhG+QA==
X-Google-Smtp-Source: ABdhPJypqsFAyrOnR8xEC6MM8SQuEZzuDqR+1Zeo2EqZaF8sNUubmMsB0CZsfn8bft97IXkDDE+gEg==
X-Received: by 2002:a2e:bf16:: with SMTP id c22mr537905ljr.416.1644956144764;
        Tue, 15 Feb 2022 12:15:44 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id k16sm4548419ljg.111.2022.02.15.12.15.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Feb 2022 12:15:44 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 5/5] arm64: dts: qcom: msm8996: convert xo_board to RPM_SMD_BB_CLK1
Date:   Tue, 15 Feb 2022 23:15:39 +0300
Message-Id: <20220215201539.3970459-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215201539.3970459-1-dmitry.baryshkov@linaro.org>
References: <20220215201539.3970459-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Convert all device tree xo_board users to the RPM_SMD_BB_CLK1 clock.
Note, that xo_board can not be removed (yet), as clk-smd-rpm uses
xo_board internally as the parent for all the clocks.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 7a46f0f67cbb..598dbaab1d1c 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -889,7 +889,7 @@ dsi0_phy: dsi-phy@994400 {
 				#clock-cells = <1>;
 				#phy-cells = <0>;
 
-				clocks = <&mmcc MDSS_AHB_CLK>, <&xo_board>;
+				clocks = <&mmcc MDSS_AHB_CLK>, <&rpmcc RPM_SMD_BB_CLK1>;
 				clock-names = "iface", "ref";
 				status = "disabled";
 			};
@@ -2595,7 +2595,7 @@ kryocc: clock-controller@6400000 {
 			reg = <0x06400000 0x90000>;
 
 			clock-names = "xo";
-			clocks = <&xo_board>;
+			clocks = <&rpmcc RPM_SMD_BB_CLK1>;
 
 			#clock-cells = <1>;
 		};
@@ -2706,7 +2706,7 @@ sdhc1: sdhci@7464900 {
 			clock-names = "iface", "core", "xo";
 			clocks = <&gcc GCC_SDCC1_AHB_CLK>,
 				<&gcc GCC_SDCC1_APPS_CLK>,
-				<&xo_board>;
+				<&rpmcc RPM_SMD_BB_CLK1>;
 
 			pinctrl-names = "default", "sleep";
 			pinctrl-0 = <&sdc1_state_on>;
@@ -2729,7 +2729,7 @@ sdhc2: sdhci@74a4900 {
 			clock-names = "iface", "core", "xo";
 			clocks = <&gcc GCC_SDCC2_AHB_CLK>,
 				<&gcc GCC_SDCC2_APPS_CLK>,
-				<&xo_board>;
+				<&rpmcc RPM_SMD_BB_CLK1>;
 
 			pinctrl-names = "default", "sleep";
 			pinctrl-0 = <&sdc2_state_on>;
@@ -3030,7 +3030,7 @@ adsp_pil: remoteproc@9300000 {
 			interrupt-names = "wdog", "fatal", "ready",
 					  "handover", "stop-ack";
 
-			clocks = <&xo_board>;
+			clocks = <&rpmcc RPM_SMD_BB_CLK1>;
 			clock-names = "xo";
 
 			memory-region = <&adsp_region>;
-- 
2.34.1

