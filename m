Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8EC7EB64DC
	for <linux-clk@archiver.kernel.org>; Tue, 20 Jun 2023 18:55:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230174AbjFTSzK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 20 Jun 2023 14:55:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230208AbjFTSzH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 20 Jun 2023 14:55:07 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AEAD1709
        for <linux-clk@vger.kernel.org>; Tue, 20 Jun 2023 11:55:04 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4f86e6e4038so3367448e87.0
        for <linux-clk@vger.kernel.org>; Tue, 20 Jun 2023 11:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687287303; x=1689879303;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xwVfz2bEaJCer+jeAEjthcK+T4pqpqU1JsGzvN+M+jU=;
        b=gTjnEw7Nd2XBtFSuVSzB3YEI44k71DXWoxEejiYzHTTMZkSV7oSEzTUVncMiqt6s5j
         D994qsUg7R4z68ZycqRRMYtk7EGWQR4WZWxRGOLDNSHhkzSvElQONRGWy2aR3Hy/3q1f
         ZoXr8xPfaU1pTMZCQ6mvTq9wDQQtvwGIP3IbxWN38Zv5XOP3WHWKR2/FloLVqJrV3shY
         8Y9WqRcpfr7dOdI/DnKd3+oj9OMpMOWnuC0XTyzdvlkqFMWXbHfAPhIvZNSyrL0tiPow
         YyHh6BtI7oZXFObLXPN8QXUa5pjoH+E6MetmhwuBOQjj5O+FEe6h/ye6D1XipPzI8KcB
         pO2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687287303; x=1689879303;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xwVfz2bEaJCer+jeAEjthcK+T4pqpqU1JsGzvN+M+jU=;
        b=WkDHCucUmA48CY6v87eL39jOFzjZoZBGv9M3cnzF/43e43TEnP4pAltAfrqpMl5iz/
         D2kMaYkbdwc9tVHxKwYEUjPgbQEjMJVnuuqJWYMCu7H30omyEmdgMLVRe/8qk35KsavR
         Wr2ySQI3fyv4w0crGj/LAilQo1mxWswvHHfa0XoxXElPQf8fbsoptFe/gV2rVy1lEvv/
         4B5ZJYGnhBZA5E6uQRxka5745c01dj05nFNd/0JTPbPl164J8aD2L/rGNGTX0zFYSHBm
         msld23vwr30HAMS5KOgJKbf305Z56wZT+z0+Vpb2ROEvESG/KiKS0txErNN5oGGH8zTr
         1nDA==
X-Gm-Message-State: AC+VfDzCxR1uFSarcMqx5xZUg+wg3jjtun5YcrvA5rIDLpqA5cDoe59r
        DWnwcbXaesTniAQtbsioR2V6mQ==
X-Google-Smtp-Source: ACHHUZ5BIwH1hl1qgEejGBa4wEZU9T8FPhSnCLOnEDOVAKiZEzGrwXlDJNcqolVjs/D6KGrm2nSFvw==
X-Received: by 2002:ac2:4e0a:0:b0:4f6:56ca:36fc with SMTP id e10-20020ac24e0a000000b004f656ca36fcmr6774364lfr.6.1687287302737;
        Tue, 20 Jun 2023 11:55:02 -0700 (PDT)
Received: from [192.168.1.101] (abxj193.neoplus.adsl.tpnet.pl. [83.9.3.193])
        by smtp.gmail.com with ESMTPSA id v1-20020ac25921000000b004f867f8d157sm463899lfi.124.2023.06.20.11.55.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 11:55:02 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Tue, 20 Jun 2023 20:54:59 +0200
Subject: [PATCH 2/3] dt-bindings: clock: qcom,gcc-sc8280xp: Add missing
 GDSCs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230620-topic-sc8280_gccgdsc-v1-2-0fd91a942bda@linaro.org>
References: <20230620-topic-sc8280_gccgdsc-v1-0-0fd91a942bda@linaro.org>
In-Reply-To: <20230620-topic-sc8280_gccgdsc-v1-0-0fd91a942bda@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687287298; l=1221;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=b3fOscs1Mn/FZl6XBM8E/StqOKB/3kR+0hvtGTWE+Sc=;
 b=rNBqt6XmLf0P7ecxaLthk40wXEGKyTzaMwyMBAMhvtphgvrZ7hu6snLFeHJ99EMu726CTI6k0
 3FgLI+QykNZCH3l5T7GwuSNgrdyjZ8qAsHUzpHkalPCHeOSinLp/ziq
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

There are 10 more GDSCs that we've not been caring about, and by extension
(and perhaps even more importantly), not putting to sleep. Add them.

Fixes: a66a82f2a55e ("dt-bindings: clock: Add Qualcomm SC8280XP GCC bindings")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 include/dt-bindings/clock/qcom,gcc-sc8280xp.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/dt-bindings/clock/qcom,gcc-sc8280xp.h b/include/dt-bindings/clock/qcom,gcc-sc8280xp.h
index 721105ea4fad..845491591784 100644
--- a/include/dt-bindings/clock/qcom,gcc-sc8280xp.h
+++ b/include/dt-bindings/clock/qcom,gcc-sc8280xp.h
@@ -494,5 +494,15 @@
 #define USB30_SEC_GDSC					11
 #define EMAC_0_GDSC					12
 #define EMAC_1_GDSC					13
+#define USB4_1_GDSC					14
+#define USB4_GDSC					15
+#define HLOS1_VOTE_MMNOC_MMU_TBU_HF0_GDSC		16
+#define HLOS1_VOTE_MMNOC_MMU_TBU_HF1_GDSC		17
+#define HLOS1_VOTE_MMNOC_MMU_TBU_SF0_GDSC		18
+#define HLOS1_VOTE_MMNOC_MMU_TBU_SF1_GDSC		19
+#define HLOS1_VOTE_TURING_MMU_TBU0_GDSC			20
+#define HLOS1_VOTE_TURING_MMU_TBU1_GDSC			21
+#define HLOS1_VOTE_TURING_MMU_TBU2_GDSC			22
+#define HLOS1_VOTE_TURING_MMU_TBU3_GDSC			23
 
 #endif

-- 
2.41.0

