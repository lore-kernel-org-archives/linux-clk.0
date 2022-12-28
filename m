Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8151DC4167B
	for <linux-clk@archiver.kernel.org>; Wed, 28 Dec 2022 18:52:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233144AbiL1Swu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 28 Dec 2022 13:52:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233266AbiL1Swr (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 28 Dec 2022 13:52:47 -0500
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1023014D33
        for <linux-clk@vger.kernel.org>; Wed, 28 Dec 2022 10:52:46 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id e13so14728191ljn.0
        for <linux-clk@vger.kernel.org>; Wed, 28 Dec 2022 10:52:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xhFDc1hg+Eb9tEQftxzX0BdtZxOOhzNp27cW9co6hFs=;
        b=nSJDr/NpSXdbqjRrnAl3kAaM39YIdBbqoty8jnR10wztBSHfiIgTPrl0KtW6jOGGFc
         l7cnggSn94PT5+Z86poBh8W7P+c/7R4TMR7anjO44SvZXfkxKjNPGsrcXDr/ULfa6ss1
         ieGyeTSguQ/C0TZxB875nRrUOcGUpTuU08DGST2xfcbaGhWhAhoaG/JPAmoZ5Bzz1UTc
         3DHpUzzY8Ghs2i7NfIhZlQvnYj9OK8Sm7php/FRbXjdjZ2ZSUGcO8/7eLfFayERDDu5f
         uI3SY91N/YNSTHxy4MTcLVqqvwHIUVrM5JP3T1wTMbEu8mo+syo5uNai6PmnFJPRA3MT
         qx+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xhFDc1hg+Eb9tEQftxzX0BdtZxOOhzNp27cW9co6hFs=;
        b=ylUiYS7lB9fnRCWM6PheYS3AN7ypoowhbirGac7FcpVRyAZXriszeTwkQ96wRUDR3Q
         HuReArI7xxYlXQeI2v1432rEU0nLEEyzJZm8+wG7b/AOTYJF+/4OMmG/tbfqftIGH6TR
         X/ZnxizfGQKAu41ypjWeLr0jQ5hw4z2FnOy0Gw+5qWVe9L6q06FrkWYvMlNOofOf6SRE
         JJ8AYEZs5GTzoc3G6e/MH2Rx4J/q+jhOWRDqbV+nAl2/yiyaJmU6uJTKU9UtFze2nUtv
         u5o6ffbW91wDJ5P4WvHzpPqmkNMt0JE8qQyGiDRgDdsQCEIs1+VkRw2IhqnGqj2rlOO1
         V03w==
X-Gm-Message-State: AFqh2kqfYtZUEqg96doGDVLSa3MiFC8HeKxMoqI7NfysXQK/HqmcRBLE
        TCy74toAU6M54QJMc90TQnQwzVkuP7/Hbv6IuiM=
X-Google-Smtp-Source: AMrXdXviI+DWKchELH2hrpNTVuKm/QYC+AEQVMeD0/y87/nJHKWZ8P4FBiCrpCFjDyVGq0Vbf3Ah1w==
X-Received: by 2002:a2e:9052:0:b0:27f:9493:76ab with SMTP id n18-20020a2e9052000000b0027f949376abmr7134543ljg.7.1672253565638;
        Wed, 28 Dec 2022 10:52:45 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id s7-20020a2e83c7000000b00279d206a43bsm2031893ljh.34.2022.12.28.10.52.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 10:52:43 -0800 (PST)
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
Subject: [PATCH v2 06/16] dt-bindings: clock: qcom: gcc-sm8350: drop test clock
Date:   Wed, 28 Dec 2022 20:52:27 +0200
Message-Id: <20221228185237.3111988-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221228185237.3111988-1-dmitry.baryshkov@linaro.org>
References: <20221228185237.3111988-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The test clock apparently it's not used by anyone upstream. Remove it.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 include/dt-bindings/clock/qcom,gcc-sm8350.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/dt-bindings/clock/qcom,gcc-sm8350.h b/include/dt-bindings/clock/qcom,gcc-sm8350.h
index f6be3da5f781..529c1b8b0417 100644
--- a/include/dt-bindings/clock/qcom,gcc-sm8350.h
+++ b/include/dt-bindings/clock/qcom,gcc-sm8350.h
@@ -8,7 +8,6 @@
 #define _DT_BINDINGS_CLK_QCOM_GCC_SM8350_H
 
 /* GCC HW clocks */
-#define CORE_BI_PLL_TEST_SE					0
 #define PCIE_0_PIPE_CLK						1
 #define PCIE_1_PIPE_CLK						2
 #define UFS_CARD_RX_SYMBOL_0_CLK				3
-- 
2.39.0

