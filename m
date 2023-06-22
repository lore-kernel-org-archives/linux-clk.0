Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 078AFEB64D8
	for <linux-clk@archiver.kernel.org>; Thu, 22 Jun 2023 11:58:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230476AbjFVL5y (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 22 Jun 2023 07:57:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230446AbjFVL5w (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 22 Jun 2023 07:57:52 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB9F8199D
        for <linux-clk@vger.kernel.org>; Thu, 22 Jun 2023 04:57:51 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4f954d7309fso692371e87.1
        for <linux-clk@vger.kernel.org>; Thu, 22 Jun 2023 04:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687435070; x=1690027070;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eOFjCTMIWVV57v3lgExuuj9IKwurSwMHmR2BddX7Xl0=;
        b=zdL+qDXUcDjdC0PSF6r7Rsicvd/Fc/8yvM/7vxhrWzOV/ymDBW61CL2naugt+DwzJ0
         +9u44BaEzuvcjcVLZaz2cN4ThVQGSSsPGBD2K06vD6PVBg1RWRTHgTvx/AfZyiXcwe1g
         +gcj0xV5Sqv8tq12mArpSqXTWzrczfyaN42xqdkHeRf4tdFgiQK9Ua/B+OgN13CzoW2N
         /5WXoHtfN+TzJ6tv4ETQKjLJY5+Tup7SCmQs6W7M3dh9vgHY4xw2GiTaMW+mL8D1hubO
         oGe1ttmA8wsKknixyQL9r/ws9y2JtLkrc3PkB8tSa2mSereG/KXiE51YUHT2kFkn0DZh
         qCXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687435070; x=1690027070;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eOFjCTMIWVV57v3lgExuuj9IKwurSwMHmR2BddX7Xl0=;
        b=OrxjiUyocmNHMI10p6grflRw5oDia5UrP/uhp9dcx/KvIKhbAcNJ30zeRZTI4uhe2r
         ojI41M836Q/M2BoYaS8AhNZVa5xjRKtocy5UaU6cj+6D+uxfO8PAVOx+t2VAdp87EVlc
         Y3xtaPAI68/qEEpMQcKS78PRT+G6p1Fbwl4Ic+rL37hgTJ0wpUsa2117bhN4svN4TMOt
         2oFWJNmKOVYIDvjQUdasIwGr7xK4Rffwpxui3mwEW+Yw6BL/tAkwdW2QkCfaFYoJ0rne
         3qPndKymjzAlIbEMhrF9Kn7Qitu4wh8EMsVriQYiv/n4yxIvKKBStj8kEx6hvanSohJd
         NQdA==
X-Gm-Message-State: AC+VfDzMguxBRhFIPU/mp2rjt0kACV/z2OyDJYCflZX/XJvQwkdKmdS0
        S2fsbtzQqz5ASpg6n2BEmJfroL2Wy7szeE8uFMU=
X-Google-Smtp-Source: ACHHUZ47V7HYoR3vRiQZsvQ4bX5v4tgYPUECWWaiyng942itPTwfssDUTlh8Jlm+7FzRebxpjU87Rg==
X-Received: by 2002:a05:6512:454:b0:4f8:565f:8ec7 with SMTP id y20-20020a056512045400b004f8565f8ec7mr6250699lfk.27.1687435069750;
        Thu, 22 Jun 2023 04:57:49 -0700 (PDT)
Received: from [192.168.1.101] (abyl165.neoplus.adsl.tpnet.pl. [83.9.31.165])
        by smtp.gmail.com with ESMTPSA id eq21-20020a056512489500b004f4c3feb9fbsm1099235lfb.61.2023.06.22.04.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 04:57:49 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Thu, 22 Jun 2023 13:57:41 +0200
Subject: [PATCH 1/9] dt-bindings: clk: qcom,gcc-msm8998: Add missing
 GPU/MMSS GPLL0 legs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230622-topic-8998clk-v1-1-5b7a0d6e98b1@linaro.org>
References: <20230622-topic-8998clk-v1-0-5b7a0d6e98b1@linaro.org>
In-Reply-To: <20230622-topic-8998clk-v1-0-5b7a0d6e98b1@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jeffrey Hugo <quic_jhugo@quicinc.com>,
        Taniya Das <tdas@codeaurora.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687435067; l=894;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=F8sCo+8Xd5XxI+0cPZIVX8PD/zdBEi1oKdosoXzGPrA=;
 b=A04xy8EGlHpSd10ms85yXgvIRB3fkqXy2CskjHYT7oJEcGjyDh3UOhwLi28idwcWGR5jAsHCa
 6mNhZkxGrU+CerQACv/uqDtp1BYXsaK6ozrjnN0/9idcqx71HY2n+iI
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

GPLL0 has two separate outputs to both GPUSS and MMSS: one that's
2-divided and one that runs at the same rate as the GPLL0 itself.

Add the missing ones to the binding.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 include/dt-bindings/clock/qcom,gcc-msm8998.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/dt-bindings/clock/qcom,gcc-msm8998.h b/include/dt-bindings/clock/qcom,gcc-msm8998.h
index 1badb4f9c58f..b5456a64d421 100644
--- a/include/dt-bindings/clock/qcom,gcc-msm8998.h
+++ b/include/dt-bindings/clock/qcom,gcc-msm8998.h
@@ -190,6 +190,9 @@
 #define AGGRE2_SNOC_NORTH_AXI					181
 #define SSC_XO							182
 #define SSC_CNOC_AHBS_CLK					183
+#define GCC_MMSS_GPLL0_DIV_CLK					184
+#define GCC_GPU_GPLL0_DIV_CLK					185
+#define GCC_GPU_GPLL0_CLK					186
 
 #define PCIE_0_GDSC						0
 #define UFS_GDSC						1

-- 
2.41.0

