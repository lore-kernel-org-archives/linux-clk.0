Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2C72C64EC5
	for <linux-clk@archiver.kernel.org>; Mon,  6 Feb 2023 00:27:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229651AbjBFA1o (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 5 Feb 2023 19:27:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229609AbjBFA1n (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 5 Feb 2023 19:27:43 -0500
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4B311814C
        for <linux-clk@vger.kernel.org>; Sun,  5 Feb 2023 16:27:41 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id bk15so29824715ejb.9
        for <linux-clk@vger.kernel.org>; Sun, 05 Feb 2023 16:27:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mxwl3YRJUzbo8fSMHrnnIcR0IoUl4vPzxhW6soDvfYM=;
        b=EtQO3ETKKzrszdKEBCvl7TDxS4kKt5KC3WXkraTcLGASLOwicOZPhNlO9g6Dbq1loQ
         XV4p9OUhA+8cnpOAQz4AC+jVG81+f8urUmuH9b3KCniDKVuTJQlxcqHQrLezPt+Cv2vO
         qOy7cZBUz+nWDvMpFt79PDx+PnFkQpd+GEc4IqIFY+DHadQzgM45lzmILLm35U/DJ7ox
         vvxr04pOaJpHw2VTq8PaJFuWIWQlrFksI0EUSXjRRqH3JMr0fEB44lP8izrbOP0ar35q
         v80bCNVFOwJDG0n+pjQRBetIsXBG7hpZ4jqRI7FxHZBTAwJY2g7AZno8dCsikkS7RQXV
         nIlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mxwl3YRJUzbo8fSMHrnnIcR0IoUl4vPzxhW6soDvfYM=;
        b=R88TI2LdevwLz1aNQXTPhOdSa7l8uXJ+0J4/AtgUmARg3jfuu+rhwv+999S6Kq7BnA
         bdXr/WW3DFAf15N45fOf2oqRiem/KufPDkLOb1SuRGpmwxvJWC13zMn6/J810jc8lMik
         HYZY3M5yqosfVcVnQJoVEGS1eDJzZX9xw/ORmyqoHZJR5/Qw2e1+/LMo+mxqRCnBpyn9
         x9MJVLtSXdwQqT8ApTCtDb2h6u0p44igQEVimB4mMbFHTrS8X2+Kqz8URTAziZnIkcph
         5GBO9ND+e01CwrbxqhAkgymYsYgJPo2Kbh/Msp1pMpRMYIQQ/VDIM9SL2RslxYJBDS3G
         zP1w==
X-Gm-Message-State: AO0yUKWD/4vYPz8YoWIqmilJz2MZIBlPxRQlFPdlkYnpV0XuYpUjHnu4
        IomWDoYutRTbTYUDgKswattcIw==
X-Google-Smtp-Source: AK7set+zZzZViVlOwY074bvEYuR8c/UQyKMnUHw0qTUrcp4N5Bm3WxnhQ93/LPHqHVWCzqeLDdjnmA==
X-Received: by 2002:a17:907:362:b0:839:74cf:7c4f with SMTP id rs2-20020a170907036200b0083974cf7c4fmr18474553ejb.8.1675643261327;
        Sun, 05 Feb 2023 16:27:41 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id y18-20020a1709063a9200b00878b89075adsm4716085ejd.51.2023.02.05.16.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Feb 2023 16:27:40 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, freedreno@lists.freedesktop.org,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org
Subject: [PATCH 2/8] arm64: dts: qcom: sm8450: add RPMH_REGULATOR_LEVEL_LOW_SVS_L1
Date:   Mon,  6 Feb 2023 02:27:29 +0200
Message-Id: <20230206002735.2736935-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230206002735.2736935-1-dmitry.baryshkov@linaro.org>
References: <20230206002735.2736935-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add another power saving state used on SM8350.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 include/dt-bindings/power/qcom-rpmpd.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/power/qcom-rpmpd.h b/include/dt-bindings/power/qcom-rpmpd.h
index 4a30d10e6b7d..1bf8e87ecd7e 100644
--- a/include/dt-bindings/power/qcom-rpmpd.h
+++ b/include/dt-bindings/power/qcom-rpmpd.h
@@ -211,6 +211,7 @@
 #define RPMH_REGULATOR_LEVEL_MIN_SVS	48
 #define RPMH_REGULATOR_LEVEL_LOW_SVS_D1	56
 #define RPMH_REGULATOR_LEVEL_LOW_SVS	64
+#define RPMH_REGULATOR_LEVEL_LOW_SVS_L1	80
 #define RPMH_REGULATOR_LEVEL_SVS	128
 #define RPMH_REGULATOR_LEVEL_SVS_L0	144
 #define RPMH_REGULATOR_LEVEL_SVS_L1	192
-- 
2.39.1

