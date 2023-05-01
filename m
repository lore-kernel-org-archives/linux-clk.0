Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AA56C7EE45
	for <linux-clk@archiver.kernel.org>; Mon,  1 May 2023 20:34:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232993AbjEAUeQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 1 May 2023 16:34:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233006AbjEAUeO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 1 May 2023 16:34:14 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9487C30EB
        for <linux-clk@vger.kernel.org>; Mon,  1 May 2023 13:34:12 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2a8ba5f1d6bso27826661fa.2
        for <linux-clk@vger.kernel.org>; Mon, 01 May 2023 13:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682973251; x=1685565251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dtq6J1T5SaETo4KYX1pWYkqM6uP87lVD5G2k3rD0guM=;
        b=ZtpZX+g+sXtKqgT7v0f/T4X047b+bGVdWfUZR+qKsCV31ZSWIesjMBKZB0eyUnVwCp
         Cpoy1RQMVPkUsoleA+esh/KsLGvBhm9Djf6MKF8G+7OUj48ZW4GG7569f2GNxli9Bjuv
         m41YAFADRdmRHkvS07nijLRquQo+EWSPOPSV7vmMDbu/cH3rVuVdHR8PZjmd92PkNkE9
         vd2UuEpigtop/VZAxc/O2kX3Kvefe5RJ5HpdP7NxhCf2ZsZG631Zmro4lDM4jaxEHBpT
         JJrjZuZ4E1y4roQ4p8gwqT7GuFEl9DJwC80ViKDJGxetKF93P7Zu7xp57zTU3Cfz+xJd
         Fjmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682973251; x=1685565251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dtq6J1T5SaETo4KYX1pWYkqM6uP87lVD5G2k3rD0guM=;
        b=R2sl4GeoljE069AXXO1xe4J3i93PUzcvumQxDPaV1z+8gaznrY6VDdHb45w2zRSBj3
         erhiLo6RJho+hfNwc6SE56MluzPz+t0ktSXVq7rPAba+sQOu0v6AFj2pRuy/3Bt5dcnV
         5Aml9w376IkdBUZJpS/wfDNfR5LmJXuhENhmEyQRyDDKQIRfybmuV50sNkKurwUPsBLI
         1RKTuDpcfWwFDYegp9R3wEU28WPJT+7ua37868MeMi7Mp8FKEMvX3mraSsFUP0IVgZDd
         QvpcUfQE7bOAb80vUd57XZ9gYx/L1S91L8nBYhkPsQwYX16SNINo9y6zeImhtM6nhxaa
         9pnA==
X-Gm-Message-State: AC+VfDyyCNILYgE0bhtLtY+e/3XL4JpZ843lW8aXXd3G7g09BnKWl31K
        Jri/9kSJJbHaR2Mc7iyGCtqf2g==
X-Google-Smtp-Source: ACHHUZ6E7e/wTUNfAQwgw2IAiZMuYdpixqKVql55gkgnkWOKV8+7DtHKYx0NXu38Qb9EBfU/iklPfQ==
X-Received: by 2002:a2e:8543:0:b0:2a8:a65a:7313 with SMTP id u3-20020a2e8543000000b002a8a65a7313mr3817363ljj.31.1682973250850;
        Mon, 01 May 2023 13:34:10 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::ab2])
        by smtp.gmail.com with ESMTPSA id f27-20020ac251bb000000b004eb018fac57sm4885909lfk.191.2023.05.01.13.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 13:34:10 -0700 (PDT)
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
Subject: [PATCH 10/10] ARM: dts: qcom-mdm9615: specify gcc clocks
Date:   Mon,  1 May 2023 23:34:01 +0300
Message-Id: <20230501203401.41393-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230501203401.41393-1-dmitry.baryshkov@linaro.org>
References: <20230501203401.41393-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Fully specify the clocks used by the GCC on the mdm9615 platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-mdm9615.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-mdm9615.dtsi b/arch/arm/boot/dts/qcom-mdm9615.dtsi
index 556abe90cf5b..e81e5e3196d9 100644
--- a/arch/arm/boot/dts/qcom-mdm9615.dtsi
+++ b/arch/arm/boot/dts/qcom-mdm9615.dtsi
@@ -10,6 +10,7 @@
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/qcom,gcc-mdm9615.h>
+#include <dt-bindings/clock/qcom,lcc-msm8960.h>
 #include <dt-bindings/reset/qcom,gcc-mdm9615.h>
 #include <dt-bindings/mfd/qcom-rpm.h>
 #include <dt-bindings/soc/qcom,gsbi.h>
@@ -106,6 +107,10 @@ gcc: clock-controller@900000 {
 			#power-domain-cells = <1>;
 			#reset-cells = <1>;
 			reg = <0x900000 0x4000>;
+			clocks = <&cxo_board>,
+				 <&lcc PLL4>;
+			clock-names = "cxo",
+				      "pll4";
 		};
 
 		lcc: clock-controller@28000000 {
-- 
2.39.2

