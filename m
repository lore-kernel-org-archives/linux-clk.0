Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B376C63797
	for <linux-clk@archiver.kernel.org>; Thu,  5 Jan 2023 13:42:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233094AbjAENmS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 5 Jan 2023 08:42:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232369AbjAENlq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 5 Jan 2023 08:41:46 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29B6532E95
        for <linux-clk@vger.kernel.org>; Thu,  5 Jan 2023 05:41:44 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id bu8so6022893lfb.4
        for <linux-clk@vger.kernel.org>; Thu, 05 Jan 2023 05:41:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kKkWqN5cimdLBNmps+85gop0wy/2yT2a83j/RNY11uo=;
        b=jrcYs+tOCxNZRvvhpNG2OPoHZ2GOUWgp3IgaRM0dMlGzdFN3RqkZcy60u0s8yrV+cc
         8C17j2SukFEZVlXfvDHIfEcsm+Pfe1Q26gzOITk3e6MCn+8lcJC3yTQW2vKIx/w7YEiw
         Daxbnu2exBSDIQ/c0rssgT2Rs31jQZ0JgVzscXjWc7pJKlC+4Ad4NfeaeHKOm+WusCw2
         kuvGinLQhz/2yzSxK2SMfWWqKR82vwe3HJ9ps4VxBrzWSbwI7IWBN19hAM0LJDTuqvDX
         yMO8tLr4+CHZYa45oATA8eAo4++5rWtiJnhYeOEt0tXTbunpuSX52IXqjhWq/XcPuRAV
         A4dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kKkWqN5cimdLBNmps+85gop0wy/2yT2a83j/RNY11uo=;
        b=ngGreNAruQuRgTSdakMTyakcCbctH/c/aKrRBA2uIjGuklp7Cxy5XKzgDSKl2z3sTY
         0qfe2Jwr8FOjoETb6v0Zqk6E1mGjNPTJq97GYRmiLlK5Zsd+GWbFVuG/iBCQnljfHghq
         QD9d0gqke5FJrnb0etwsvXKAFYRIq4ET1l4KGnRXwqtgfWP5Ha9T1PC5tZ2G4R1JaX8C
         75wNIetS8RWZYceIid13TwwkRU5YgIKxX0E6yK3BQzmvL5wDxmuicTyKSMF8jOYpgMc4
         QRv1jfIKAqlB9PDygCM1i7CX/b6seTxoXJtpakf2ZtQblJ89b7Q9zRfCDD/GDTAAdKW7
         xn2Q==
X-Gm-Message-State: AFqh2ko4O6jTBPaLmd0+HnWquPA4iZkFT2R7VMLUCqNkSpPYyULVq/KY
        x56NPWRQ5eknwDUdFHC98Uzzvg==
X-Google-Smtp-Source: AMrXdXsQuQyQqff2t3pFvSjqnltFwC5lR3TRbkt4U0zZ7cFSUuO8CkXnYraDehtDV4fa/68moHarvg==
X-Received: by 2002:a05:6512:1383:b0:4b6:ed8b:4f11 with SMTP id p3-20020a056512138300b004b6ed8b4f11mr17475458lfa.53.1672926103730;
        Thu, 05 Jan 2023 05:41:43 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id bq25-20020a056512151900b004b592043413sm5461315lfb.12.2023.01.05.05.41.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jan 2023 05:41:43 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v2 12/12] ARM: dts: qcom: apq8084: add clocks and clock-names to gcc device
Date:   Thu,  5 Jan 2023 15:41:33 +0200
Message-Id: <20230105134133.1550618-13-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230105134133.1550618-1-dmitry.baryshkov@linaro.org>
References: <20230105134133.1550618-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add clocks and clock-names nodes to the gcc device to bind clocks using
the DT links.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8084.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-apq8084.dtsi b/arch/arm/boot/dts/qcom-apq8084.dtsi
index 4b0d2b4f4b6a..4d01f0f2292e 100644
--- a/arch/arm/boot/dts/qcom-apq8084.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8084.dtsi
@@ -388,6 +388,24 @@ gcc: clock-controller@fc400000 {
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
 			reg = <0xfc400000 0x4000>;
+			clocks = <&xo_board>,
+				 <&sleep_clk>,
+				 <0>, /* ufs */
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>, /* sata */
+				 <0>,
+				 <0>; /* pcie */
+			clock-names = "xo",
+				      "sleep_clk",
+				      "ufs_rx_symbol_0_clk_src",
+				      "ufs_rx_symbol_1_clk_src",
+				      "ufs_tx_symbol_0_clk_src",
+				      "ufs_tx_symbol_1_clk_src",
+				      "sata_asic0_clk",
+				      "sata_rx_clk",
+				      "pcie_pipe";
 		};
 
 		tcsr_mutex: hwlock@fd484000 {
-- 
2.39.0

