Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 130F6C46467
	for <linux-clk@archiver.kernel.org>; Wed, 28 Dec 2022 18:52:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233128AbiL1Swx (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 28 Dec 2022 13:52:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233363AbiL1Sws (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 28 Dec 2022 13:52:48 -0500
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF91B164BC
        for <linux-clk@vger.kernel.org>; Wed, 28 Dec 2022 10:52:47 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id i19so4394935ljg.8
        for <linux-clk@vger.kernel.org>; Wed, 28 Dec 2022 10:52:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dPiUl4EdKWMJANife8srJ0scEoyX5E4VGNwbBAPuzVA=;
        b=TZV+uTSHiy7YF5VzIDQcLXz6R1cYwZ4v95WqQtTAizYgOWDgsY8dhMb9a+S44UTYVB
         lEvrS04EokPBh3R67FWk66XiDYBVjigF4QbQyTKLM9Qa7KMEzwjP5qO0KGqrjmasLv0F
         ESrbzUeTjnWtpnmM673WZGNoG/kIe/hzBADr6fno8j5iutTtfZ3aR/XJsXeXYAqmdezR
         qnsDhfkUuwz9gTIAJ+0+z63edP2QV1rOt5XrgnMTtNvJySJT6pYybItO00FTAXQ0cemn
         Ocad+7uOIrc7hbDOTXCTPmaEF+9ZQuyo2c0Cp06qxvaJjw79v3Z26EWTK2uvF1m44fhh
         GjOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dPiUl4EdKWMJANife8srJ0scEoyX5E4VGNwbBAPuzVA=;
        b=HWh/GLTGoN2Wm1tGU5C3zzRj42iK7RPYRHJi70EYq2EIJWYeVpURCilwbVRTztwwzi
         SP4LfMmDcTXNbPYhjBrKuPdnl6X1bUDG/AMdIfpHsjT1Cq++JTYGG/ayiOSlWaIRxnvc
         PQsB7r5SisQftZnUvk5WhXRUkx8mAKddhItZ3B2hkDcQf+thcnv7bzhc4TPwVm3Vdszl
         z9qJN40gAqOZ67Tsu3MhHZoSSbunNnZSU6NhBCitqudL6T/HqyWqZBQCMTdmk6uMLDQL
         85TVuxjxsmdsb99oDOCn9QyM4aCpgfxT+gcBkcNhjdsXCOcU11KyNRZeGCXW6Ovf4VaV
         mLXQ==
X-Gm-Message-State: AFqh2kqJTDDU1+JrTtAh/IQAd0St0ALXB7XS+y/RbjlcZb4+4suE6omL
        DMGXxZS8RB6uufo90xlVkYpCYA==
X-Google-Smtp-Source: AMrXdXtk6ND371WXwR5KhjifLVDAGPElPRICguomcgAPNkaK34kPPrgRovcAfOB3F4vpyQIl30iaSA==
X-Received: by 2002:a2e:3c08:0:b0:279:da98:df8a with SMTP id j8-20020a2e3c08000000b00279da98df8amr6972126lja.43.1672253566412;
        Wed, 28 Dec 2022 10:52:46 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id s7-20020a2e83c7000000b00279d206a43bsm2031893ljh.34.2022.12.28.10.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 10:52:45 -0800 (PST)
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
Subject: [PATCH v2 07/16] dt-bindings: clock: qcom: gcc-sm8450: drop test clock
Date:   Wed, 28 Dec 2022 20:52:28 +0200
Message-Id: <20221228185237.3111988-8-dmitry.baryshkov@linaro.org>
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
 include/dt-bindings/clock/qcom,gcc-sm8450.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/dt-bindings/clock/qcom,gcc-sm8450.h b/include/dt-bindings/clock/qcom,gcc-sm8450.h
index cf1469312c4c..9679410843a0 100644
--- a/include/dt-bindings/clock/qcom,gcc-sm8450.h
+++ b/include/dt-bindings/clock/qcom,gcc-sm8450.h
@@ -8,7 +8,6 @@
 #define _DT_BINDINGS_CLK_QCOM_GCC_SM8450_H
 
 /* GCC HW clocks */
-#define CORE_BI_PLL_TEST_SE					0
 #define PCIE_0_PIPE_CLK						1
 #define PCIE_1_PHY_AUX_CLK					2
 #define PCIE_1_PIPE_CLK						3
-- 
2.39.0

