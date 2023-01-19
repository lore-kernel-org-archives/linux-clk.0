Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64535C004D4
	for <linux-clk@archiver.kernel.org>; Thu, 19 Jan 2023 13:00:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230269AbjASNAq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 19 Jan 2023 08:00:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230221AbjASNAj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 19 Jan 2023 08:00:39 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCE536469F
        for <linux-clk@vger.kernel.org>; Thu, 19 Jan 2023 05:00:33 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id d4-20020a05600c3ac400b003db1de2aef0so1210465wms.2
        for <linux-clk@vger.kernel.org>; Thu, 19 Jan 2023 05:00:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5iAatbMm50roXpPwJZoEAAqSTHxKtI+AETl8/m024c0=;
        b=WbZqGFOoZiOMxpFxHhCKw3j3d/vKrQIrHyP3xgYdIXxNoxugJGVY/MHZD7wlAEdia7
         Yo9AfX8dGT6lHOrOkIGaMEueXoMM73SFQDputJXfgI+NRZwrRC/sOOEiQNm+QL4eylXy
         0/snQVqSM0FPb7G9fDt6C0AjLal74lN28sQajowhHBQzlphGMwPsc9unQR21ICaJ5p0L
         caPVu2NMG5auwm33HDezJuyMFwyp+MaQ98hkVwFyKVg5a3pKkLH6LsiDXC7RUJ4H8gP5
         vR7of402OZVJh203N66pW4QBGs+YXZFueacOnO9AKWlQL7gc4EkgLqSBsfiKlAVZs9+E
         Qadw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5iAatbMm50roXpPwJZoEAAqSTHxKtI+AETl8/m024c0=;
        b=DOXhdpHW851XHKOwK6wn53sCcziztuYdadcYylNfEUcj2GwNkmlYNj+z6a8Cp+iYin
         tn31pJO6GcBOWByNjpFJ8b8C8MYWDu9IXjC73d2qPEry429QRerrt3hzK5QV6CBwBaHT
         XDhO2uIHVxSyS1LzRlu5QcglPvwLZYHKsV15NkAYHZLRHQXbWW7uVhaGdlgdJKxKqAIe
         NTNjN8HqQTP3hLJhyFvSTXthv2/GUFEjgQH8sMGneFnx1EsDIWo8EGjut2l4ePaCfRxs
         Lxg0Y6215YRRTic1aYK/39yEIW3+sZ59T2lbWrYX/U/5NKceIztfEqphL+Rf/yAOHzOx
         flUQ==
X-Gm-Message-State: AFqh2kp9NkbT7jhy8Atjr80imgXW2PXjxWJ5aXa9JBdiJbGeTGdoaa5l
        7xwHbEVrm8tdIPEEPYzysOeGoA==
X-Google-Smtp-Source: AMrXdXuhYv3zCBTXGGIkujjhqRrT2fRieE6U681od4zQ+xjM9g3Til1CcJMygyxEC8URaHm9fOjo+g==
X-Received: by 2002:a7b:cbcb:0:b0:3db:2ad:e330 with SMTP id n11-20020a7bcbcb000000b003db02ade330mr10159304wmi.5.1674133232206;
        Thu, 19 Jan 2023 05:00:32 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id w1-20020a1cf601000000b003daf681d05dsm4823808wmc.26.2023.01.19.05.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 05:00:31 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Ilia Lin <ilia.lin@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] dt-bindings: clock: qcom,sm8450-camcc: constrain required-opps
Date:   Thu, 19 Jan 2023 14:00:27 +0100
Message-Id: <20230119130028.106817-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Be specific how many required-opps are allowed.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

This change is independent, although logically is connected with my
dtschema pull:
https://github.com/devicetree-org/dt-schema/pull/95
---
 Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
index a52a83fe2831..87ae74166807 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
@@ -32,6 +32,7 @@ properties:
       A phandle and PM domain specifier for the MMCX power domain.
 
   required-opps:
+    maxItems: 1
     description:
       A phandle to an OPP node describing required MMCX performance point.
 
-- 
2.34.1

