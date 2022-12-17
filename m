Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83EE1C63709
	for <linux-clk@archiver.kernel.org>; Sat, 17 Dec 2022 00:24:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230297AbiLQAYL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 16 Dec 2022 19:24:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229785AbiLQAXT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 16 Dec 2022 19:23:19 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 791E37E2AB
        for <linux-clk@vger.kernel.org>; Fri, 16 Dec 2022 16:17:44 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id b3so5922748lfv.2
        for <linux-clk@vger.kernel.org>; Fri, 16 Dec 2022 16:17:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Hsa31ymOeybHDD6Oy0urHW3AuIWlU3Je1yr2qvFGAY=;
        b=VgI3nLWS3nexAa4ub9/UR1Rq9pDey2EJDDSCbEaJGoAbQrscscKiVHeDBy4rN/8D45
         24b4WLE1T/MjA0CTpYkbcgZEcXETxTDNgaSzLeF+Tfm4Znlinn41mi5ut55njZCad/us
         +WXufuTh45XyAQXqrpDRadg7NEh/7ElZMbPbdGXwtW1kL/cDi2z0lAF9dXCoPl62enkD
         oSw8A0a/hcL2iCtukYBPNg4GiBKjn+BMmhGF4jlBMsqs/toBWH+s6qYvWhgOjdZy7sRX
         IXjEDpt3oMwNgwvweMokV7iXv7b0gOLtzCcfjfd3L2Y0BEyIylAUYk55EPCfqZStzrbZ
         lXgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Hsa31ymOeybHDD6Oy0urHW3AuIWlU3Je1yr2qvFGAY=;
        b=P8jiY8125weWg6QjVdrJpE/+A8FrO1r/x9kLYN9UT38NEclE7xaBFvj35idj1Inn42
         +Jv158bJrGHQXy3Y1i5c67LnCErcVBN1gWsuM7EAD0PKGQFQ2gsQtcJyBU/H+yoo03hs
         VkTM5J6X62jxl2fGAH+3FmXL26/Ue83oPsNA++5885gx+hwhQxifmKX4axxfBH7hXI+Q
         9kY+DG1Kk+vOL94GZwAj4/Yce135UIJ+DD+2dVP4MGmKjYIBiZ6jsMCd5hfksylI8FPb
         k2jgsxFW+GdAT5bT4Zd68otZCkoJTyFwmKf+weLGinThL/jNwItdAg3Qd9FoVDsmCg3T
         y0IQ==
X-Gm-Message-State: ANoB5pn0TfW0cKx6JnyzSynneEPnRfTqv9D1QDM6EN7fPV+rZjC/mVzW
        x9yivBX7AvfW5U+HspN0ot3L+w==
X-Google-Smtp-Source: AA0mqf5bsvN6t916su3JhYhq1Z8++hWXdyWEbPhMmOtVCvinfLd2TxCbGNZ6yrEJEBeEg+NIA3y/WQ==
X-Received: by 2002:a05:6512:acf:b0:4a4:68b7:dec0 with SMTP id n15-20020a0565120acf00b004a468b7dec0mr10439992lfu.28.1671236262850;
        Fri, 16 Dec 2022 16:17:42 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id c19-20020a056512325300b004b5adb59ed5sm341228lfr.297.2022.12.16.16.17.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Dec 2022 16:17:42 -0800 (PST)
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
Subject: [PATCH 14/15] arm64: dts: qcom: qcs404: add power-domains-cells to gcc node
Date:   Sat, 17 Dec 2022 02:17:29 +0200
Message-Id: <20221217001730.540502-15-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221217001730.540502-1-dmitry.baryshkov@linaro.org>
References: <20221217001730.540502-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

As gcc now provides two GDSCs, add #power-domain-cells property to the
gcc device node.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs404.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index ffc4b081bb62..b72542631337 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -729,6 +729,7 @@ gcc: clock-controller@1800000 {
 			reg = <0x01800000 0x80000>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
+			#power-domain-cells = <1>;
 
 			assigned-clocks = <&gcc GCC_APSS_AHB_CLK_SRC>;
 			assigned-clock-rates = <19200000>;
-- 
2.35.1

