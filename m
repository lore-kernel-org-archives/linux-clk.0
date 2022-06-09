Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99E36C43334
	for <linux-clk@archiver.kernel.org>; Thu,  9 Jun 2022 09:29:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233025AbiFIJ36 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 9 Jun 2022 05:29:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233039AbiFIJ3z (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 9 Jun 2022 05:29:55 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83B61267179
        for <linux-clk@vger.kernel.org>; Thu,  9 Jun 2022 02:29:54 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id n28so30396547edb.9
        for <linux-clk@vger.kernel.org>; Thu, 09 Jun 2022 02:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=JeSI4uQxR2QJYLMBJ1DqLjl1fY9poS8Q+KM6xI9FOz4=;
        b=f0Ck0il7HMPwkoG6M1COIc/Igd98jl1VfQkKdJy4S/qTGJhIxDuXVvtJo9nEZazlSX
         uwVhHnSmPw6cr9j0zHGdhRmujf10aBH6FMCKl5wkykfv/xQg5bTB7Snaj8HnpXcTFSkT
         eKnMB9BxkbOb4jngECD7mXncmSblVDcmMIQOyEKglg+8VC6DfBt/3srtqWSBFbIatgG1
         FPQMznt8deXN8b1yGhpdbrumdayW3OZ86yZbkXu6yc2joRbFgqQtS+E3R8cn+9nPK5A+
         NEjSZJgHMAxc9NGtyxhSLI7dyDNoARgORFQUgRCRJikDEqFJneKlyjegmvTDrAIo2tDU
         uecA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JeSI4uQxR2QJYLMBJ1DqLjl1fY9poS8Q+KM6xI9FOz4=;
        b=JnSQre6CSjWLc5wrTpk4fbwElWxIhz1YTS73VDOq518PqDdEWq0rKChTOQ0zS10d2y
         QTKaP9nNDOnkKgxcS33vfTjY1NyjTtL9LZ4dDC2CJcX1b58iP32CKLPToPfhCnyV4Fl/
         ukMTBCxYXvfb6b9TLie+q80H/g56hKZhpB+RR8tjLrdMZwAxNrDJ2Txq9FHwrZBQt3uh
         xP47l//L0BRd7/EcN6VzADcGocSpuK3ZNoB7eHsgvVCEMrKwtuw/8+wAtX4VJfkKjemZ
         OvOnN1jmcrlrLCkNzyr1e3CkpttzehWETcI5EAdBaChRjd2B5gaETfAUMqOqkxgVD5Gk
         QBwA==
X-Gm-Message-State: AOAM531eTHtMUBwYnjO0FdMbSlrhGAjb4K1SxllTYAlrbrsFV/f9kUx/
        cDlQYu5lG5foeFg/xz7sBpp5/Q==
X-Google-Smtp-Source: ABdhPJyMQf7bVUF7T8t94AiIgb/4gHLlxihQ+nlVbUR0Oa2i2+oloZZh8upehaCbMBPUSYbOtks4hg==
X-Received: by 2002:a05:6402:1d4a:b0:42e:93de:17f4 with SMTP id dz10-20020a0564021d4a00b0042e93de17f4mr35910158edb.8.1654766993011;
        Thu, 09 Jun 2022 02:29:53 -0700 (PDT)
Received: from prec5560.. ([176.74.57.19])
        by smtp.gmail.com with ESMTPSA id l9-20020a50cbc9000000b0042ab87ea713sm8653417edi.22.2022.06.09.02.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 02:29:52 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzk+dt@kernel.org, robert.foss@linaro.org, jonathan@marek.ca,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: [PATCH v5 6/6] arm64: dts: qcom: sm8350: Add DISPCC node
Date:   Thu,  9 Jun 2022 11:29:40 +0200
Message-Id: <20220609092940.304740-7-robert.foss@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220609092940.304740-1-robert.foss@linaro.org>
References: <20220609092940.304740-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add the dispcc clock-controller DT node for sm8350.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

Changes since v2
 - Remove interconnect include - Bjorn

Changes since v3
 - Switch from .fw_name to .index


 arch/arm64/boot/dts/qcom/sm8350.dtsi | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 52428b6df64e..df0f3dd38f0f 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/clock/qcom,dispcc-sm8350.h>
 #include <dt-bindings/clock/qcom,gcc-sm8350.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/dma/qcom-gpi.h>
@@ -2525,6 +2526,30 @@ usb_2_dwc3: usb@a800000 {
 			};
 		};
 
+		dispcc: clock-controller@af00000 {
+			compatible = "qcom,sm8350-dispcc";
+			reg = <0 0x0af00000 0 0x10000>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+
+			power-domains = <&rpmhpd SM8350_MMCX>;
+			power-domain-names = "mmcx";
+		};
+
 		adsp: remoteproc@17300000 {
 			compatible = "qcom,sm8350-adsp-pas";
 			reg = <0 0x17300000 0 0x100>;
-- 
2.34.1

