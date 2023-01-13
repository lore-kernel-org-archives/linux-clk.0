Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D29F9C678D7
	for <linux-clk@archiver.kernel.org>; Fri, 13 Jan 2023 09:11:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240922AbjAMJLB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 13 Jan 2023 04:11:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241146AbjAMJKY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 13 Jan 2023 04:10:24 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A5B573E3C
        for <linux-clk@vger.kernel.org>; Fri, 13 Jan 2023 01:07:50 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id b3so32213319lfv.2
        for <linux-clk@vger.kernel.org>; Fri, 13 Jan 2023 01:07:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aw+Ll8gA8CDi1Y7f1Cqn7fscIlNjH9PUmDYuMqv7naQ=;
        b=NP+jd3HDsMkWOG9vZclmMojbPQ4Vmq6Zpc2ekluLj+tMha9VLxvLwA4c6jhi+by46N
         6EBuZXui4mIJuF5rAyur+sEYGq6T2ROyiret2vUcHDZrJ8FUw+nE6c9ZX95u6JX5Seo8
         hDoKvGkoLsBVXK/TS07noOBN5qw6qDNOPqidhhTP103tFiWRRVDKagTGuEfSvEJcUzsi
         pRjXGSfvW4OMoky7ogaeD7vK/UyxBsEomtMpbPc3wtafqkUYymIs2YNvB8XVeFYC+nV3
         K+Xomvzx/2mFtekEOhax5tBu3ggkSwjklWpWKHF+E1pMXmNyH9NwRzfqADy9UkMsYfUP
         3/fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aw+Ll8gA8CDi1Y7f1Cqn7fscIlNjH9PUmDYuMqv7naQ=;
        b=1kHyK4kVavJFMsQDGIWab9GCKSxh/65fhFAUV0qVCngB/7Il18zR3b+pFBQoPTqvyX
         Gvywiqr5gufwfrO+6NzAD/0C6+baKcEJ1NrtbUpjc2qLpzaPGLgmksQpext6F9NaLO9a
         yKze03/f/l4QKDxz8OuH63rJAz6izn0NfOdl32ZvPIj0deeDczHBDZbWWsO2W0zDD5wj
         /nG/2VkZdyJpLRqji3eufRGl5cPl7Cmp9bPDSpeNv+DkKQEB8MJRmcuVaWPlCmiiuONw
         +eiFBV30RLTGwY1Ke5iZoVShdiI+o0Ir7EgSjuWeTDSBH198ND8tHO1DN5edkV+HgTGH
         wFpw==
X-Gm-Message-State: AFqh2kqDD7Xjtx4nK5W0YO6fNk+bHIkQpbHKbl+IBJN3bWqcfEePzqY7
        9ORGJjEIQlX4i6MWe6TB79jHJGy4/Zb2iDEAnt0=
X-Google-Smtp-Source: AMrXdXselyV/UW7hbOvgzPFB9DfU664EPmewva7fCJNwkIwvUxBoxx1grYKqbnbK4lqJ9/huF8tK2Q==
X-Received: by 2002:a05:6512:1087:b0:4d1:331:f6df with SMTP id j7-20020a056512108700b004d10331f6dfmr611512lfg.64.1673600868856;
        Fri, 13 Jan 2023 01:07:48 -0800 (PST)
Received: from eriador.lumag.spb.ru ([194.204.33.9])
        by smtp.gmail.com with ESMTPSA id d4-20020a05651233c400b004947a12232bsm3735296lfg.275.2023.01.13.01.07.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 01:07:48 -0800 (PST)
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
Subject: [PATCH v2 1/4] dt-bindings: mailbox: qcom: correct the list of platforms using clocks
Date:   Fri, 13 Jan 2023 11:07:36 +0200
Message-Id: <20230113090739.45805-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230113090739.45805-1-dmitry.baryshkov@linaro.org>
References: <20230113090739.45805-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Only three platforms require `pll' and `aux' clocks: msm8916, msm8939
and qcs404. Correct the list of platforms in the corresponding clause.

Fixes: 0d17014e9189 ("dt-bindings: mailbox: Add binding for SDX55 APCS")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/mailbox/qcom,apcs-kpss-global.yaml          | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
index 943f9472ae10..b8a44ef0540f 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
@@ -71,15 +71,8 @@ allOf:
         compatible:
           enum:
             - qcom,msm8916-apcs-kpss-global
-            - qcom,msm8994-apcs-kpss-global
-            - qcom,msm8996-apcs-hmss-global
-            - qcom,msm8998-apcs-hmss-global
+            - qcom,msm8939-apcs-kpss-global
             - qcom,qcs404-apcs-apps-global
-            - qcom,sc7180-apss-shared
-            - qcom,sdm660-apcs-hmss-global
-            - qcom,sdm845-apss-shared
-            - qcom,sm6125-apcs-hmss-global
-            - qcom,sm8150-apss-shared
     then:
       properties:
         clocks:
-- 
2.39.0

