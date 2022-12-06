Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 965EEC3A5A7
	for <linux-clk@archiver.kernel.org>; Tue,  6 Dec 2022 22:45:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229747AbiLFWp2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 6 Dec 2022 17:45:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229606AbiLFWp0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 6 Dec 2022 17:45:26 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 690B43D93A
        for <linux-clk@vger.kernel.org>; Tue,  6 Dec 2022 14:45:25 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id ud5so9905885ejc.4
        for <linux-clk@vger.kernel.org>; Tue, 06 Dec 2022 14:45:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BhLdyy64MSy62j2GfoCPYL31V7FQmGy5yzQrHHdIKxE=;
        b=lBCtzop+VuZ9f6LSyyivGJMqa8KDNk+ji9bA8rYkiZsHB/+VvNsTmwf+fseEHJiuJi
         8s8UfGgS3bAJszzAhgVuw4H/cNGWPtsWE/jPwXfw/P6K96NLyCzJMUfR2Qts7Z7pHPbi
         tkzYW/2hpCxZSENbgSo+pKA1bRE2hZZID4U6j9NIoxGoyS3DpzqUhOuhcS+pKgLvj2lz
         Qq1rzz4JV//2chB8xWVB7PAoVcOLtuRq38h+VUhdnIlwi3ZT08d/M5M2YRyYiuds127P
         3sbtsZF8Z6tVedtOho4nGpwkSh79dINhO8OvmQz+TDIFsXDM1vgcAqT2bg5a0yRF6R8d
         MdkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BhLdyy64MSy62j2GfoCPYL31V7FQmGy5yzQrHHdIKxE=;
        b=ThpsXhvJPgsW4n+vnD1X+9eSelntBJCAmxNqjr4pgNwXqrasewzAxnaPoVjNR13EU3
         ga/cwihIDEMPKgDPSLULTATaPyv1/nwTeBI8Xo49WM5AuwR948cwZYrthZ2pOYM8xx78
         cXaotnaDz+tMO1xqimPCKNwgXLKu4o9/2+iJL/Caeycj9/cfMfLL3e2QNEuDGk9SECbr
         vZlJWkDjFqVAVM58HDJwRt50eDvUDlu9/EL4jm/VELXV/ahBMK9cNt6r5Ovh1UDYLuAJ
         gohaoiNKp5TseX5N20L6Yopvo1F64XbESjEJbAYtKg5LJR30BIv57es/9nEXdV745XnN
         XPMQ==
X-Gm-Message-State: ANoB5pkmGE+HMkhG4cbmDTPhwA5rhbl17BGMNuH1ZA/Xy0pmTt+a+sbJ
        NSUsqDZHtt+Sl3Cv/O65j4xM2A==
X-Google-Smtp-Source: AA0mqf72yfQaac16mZ0Vy/ogmNR4xkLn4B8Ye3iT8mLzNcYWe68fQew6OiiN0BbgRjfLPTHW/8GUnA==
X-Received: by 2002:a17:906:34da:b0:7c0:f2cf:23fd with SMTP id h26-20020a17090634da00b007c0f2cf23fdmr9518304ejb.709.1670366723975;
        Tue, 06 Dec 2022 14:45:23 -0800 (PST)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id r17-20020a1709061bb100b007c0985aa6b0sm7820772ejg.191.2022.12.06.14.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Dec 2022 14:45:23 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v6 3/5] dt-bindings: clock: Add RPMHCC for SM8550
Date:   Wed,  7 Dec 2022 00:45:13 +0200
Message-Id: <20221206224515.1495457-4-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221206224515.1495457-1-abel.vesa@linaro.org>
References: <20221206224515.1495457-1-abel.vesa@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add bindings and update documentation for clock rpmh driver on SM8550.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index fccb91e78e49..b405da7700be 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -31,6 +31,7 @@ properties:
       - qcom,sm8250-rpmh-clk
       - qcom,sm8350-rpmh-clk
       - qcom,sm8450-rpmh-clk
+      - qcom,sm8550-rpmh-clk
 
   clocks:
     maxItems: 1
-- 
2.34.1

