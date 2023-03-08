Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 486FBC6FD19
	for <linux-clk@archiver.kernel.org>; Wed,  8 Mar 2023 23:38:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230134AbjCHXia (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 8 Mar 2023 18:38:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229919AbjCHXi1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 8 Mar 2023 18:38:27 -0500
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com [IPv6:2001:4860:4864:20::32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1B2E5849A
        for <linux-clk@vger.kernel.org>; Wed,  8 Mar 2023 15:38:25 -0800 (PST)
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-176eae36feaso547436fac.6
        for <linux-clk@vger.kernel.org>; Wed, 08 Mar 2023 15:38:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678318705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uJnVP86v80cE19P+pF4Y6ZPg1z52ptg2NHYCv/S3Tvs=;
        b=BuQWA5ZBBgtF0cM2MPdV6GoZdjhlbq7bInCPFh7dUmCH8qXz21Any7rCTd4RtTnZrZ
         +/FSoZ+ADeQEBPdIiiDNC5z3WszOLoATv05XbvlMg6YZHC87w/j5dSjE31s/WY7jFnNV
         UOGDkhxTHOJBlNec4dDO5kqngzyV18cq78OvekxCsdJFzpadxWgoW10QmTjmvJ6QtY3w
         yIfsWQXzihe60eNVRnU70ImysdTbjtGlihxLAuuZ58CSITGoDG0LUNEeqCA1+WMss9Ot
         cSMj3v6I3nkvco9lI3uYaPpUORJz7KHvjTCcwRXQ+BfO6SpDaS5rqPWerNCxG2aayIWy
         wJ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678318705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uJnVP86v80cE19P+pF4Y6ZPg1z52ptg2NHYCv/S3Tvs=;
        b=UaMKW89tyYbbx5s25eLp7AFjq2BNR2fK8t37Ko6dOWOVsC01cRY6IyjyCZ67tvIzTs
         4tOAl2KS/u4sKFMg15wx+8inU4VjncfkoK5p1WNoLnN27SkDIh8nTBPfMICkVUfgGcBg
         23QzqCLyOUyuRvs6FxhZt7GmAV3mvqveNgqHG9Mx3bSTXs4ZoS1UHMkeXJ+X52MevgxA
         pGmDxV46CsA38mzggqHoMfeJUDKF2/Fvq2iwXA7lc2/fUjS4jTynnSPAUCBPbbFxcS2r
         ru73HXapRVg/jOFCH+hpGM4gmUgEsgYxVcHpHZrGBjyu4k0xA2q4tQ+vxZfGajDXPiCs
         VJqg==
X-Gm-Message-State: AO0yUKX3rK8PtV/MQMKMRDuEaqmXEB5XHlKI5zhGRcoT16Z8Ul6wjQJ7
        Rd41NE35U50SdJIVoagLSaDPaQ==
X-Google-Smtp-Source: AK7set9ZbuWP9DuATT4yEuGAADPyzGBQZ4BihOLgSjpwiz9NxVFYJNvWYIGSR4vMf1RR4+WAwozzYg==
X-Received: by 2002:a05:6871:708:b0:176:2486:16fb with SMTP id f8-20020a056871070800b00176248616fbmr14787743oap.7.1678318705262;
        Wed, 08 Mar 2023 15:38:25 -0800 (PST)
Received: from localhost ([136.49.140.41])
        by smtp.gmail.com with ESMTPSA id dy39-20020a056870c7a700b001763897690csm6807207oab.1.2023.03.08.15.38.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 15:38:24 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/7] dt-bindings: clock: exynos850: Add power-domains property
Date:   Wed,  8 Mar 2023 17:38:16 -0600
Message-Id: <20230308233822.31180-2-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230308233822.31180-1-semen.protsenko@linaro.org>
References: <20230308233822.31180-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Document power-domains property in Exynos850 clock controller.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 .../devicetree/bindings/clock/samsung,exynos850-clock.yaml     | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml
index 8aa87b8c1b33..cc1e9173b272 100644
--- a/Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml
@@ -54,6 +54,9 @@ properties:
   "#clock-cells":
     const: 1
 
+  power-domains:
+    maxItems: 1
+
   reg:
     maxItems: 1
 
-- 
2.39.2

