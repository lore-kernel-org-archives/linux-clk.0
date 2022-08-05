Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81316C3F6B0
	for <linux-clk@archiver.kernel.org>; Fri,  5 Aug 2022 07:49:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234956AbiHEHtq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 5 Aug 2022 03:49:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240323AbiHEHtm (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 5 Aug 2022 03:49:42 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 799951018
        for <linux-clk@vger.kernel.org>; Fri,  5 Aug 2022 00:49:40 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id s5-20020a17090a13c500b001f4da9ffe5fso7522604pjf.5
        for <linux-clk@vger.kernel.org>; Fri, 05 Aug 2022 00:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OfJQ8R0mCATwfI9fDCSGJfum0HkydojZTInFEU0mh0s=;
        b=cg0d8WnsOC1iIPYdRWXIufJvvz0yE5RvdVFrp4iL6f5ZCwOYx69KYXVa78G8Bdl7gr
         +e4R28x2ri1DxIqRQwx7CnU83DUeSibBeNqItmp29GXANjTSoeigmt9v81sUmhRYahMd
         9zZfQNebmSQXCTdbazgvxFnSuhXWzJhwXnlE2PS6aQAbQ4QufKDOGFmeHXVu+ybHeYTX
         C70rMbUq6neZ+V8y8InCaEcKnhykI3dYE6ZeA68mN4ZmLRWXEvilKSCAy4Uh/GdslfhV
         DpGy3rFB5FNKbvL98m0a0yS4nCG/JgVjzTIE7Wt4WxnOOsPGwcGosug3Z+VIRI/2pFvs
         tmIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OfJQ8R0mCATwfI9fDCSGJfum0HkydojZTInFEU0mh0s=;
        b=ooTicO8tsHKko2ttoX1VMKUJf3tk8Cx7okjTcKYJ+EJ7vt8NNQ9nJuuhOFEsuRDdXk
         ZfO4o1+jbNIKDhM4pNwJM5evm2fZ8Gk7EmwsDnN03l7C/yNoKwhtwfa7CgLSc80jTlZs
         t/QzjFY5XjsY5oWy0OExDyluHUhr/kiBXyBZzg8qISyXdO6Q3SZlSeZx2S7PaQ1FVla0
         VoRZiy/sj3bWbEJoPpAA6OpsK0cWEj2neNpWNfcCUxC2Lah2BU8pSxQB3q3jQwi9X59y
         GC6Yqfq34umQpssWxQHquuM9kCDmZQbftZ8ds18mWBIANwgXDg9glaW5U7eI7Nn6BFeO
         04Wg==
X-Gm-Message-State: ACgBeo0scjaV5Z5rkoflphKPJXh01pCYWZWNsghyduXS+NDo+/h/8xyl
        5lPhfcxdRu4PKIPJHq+mXiCB6w==
X-Google-Smtp-Source: AA6agR4DtEbCApfwN8bj4IG/rcCrnLp0hlFCiYrmCNx3R2PtzojGHcqnDTsqNj53R6uQfCpHwfL++Q==
X-Received: by 2002:a17:90b:38cb:b0:1f5:2321:63cb with SMTP id nn11-20020a17090b38cb00b001f5232163cbmr15034139pjb.110.1659685779870;
        Fri, 05 Aug 2022 00:49:39 -0700 (PDT)
Received: from localhost.localdomain ([45.8.68.134])
        by smtp.gmail.com with ESMTPSA id z10-20020a1709027e8a00b0016ecda71e26sm2309372pla.39.2022.08.05.00.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Aug 2022 00:49:39 -0700 (PDT)
From:   Jun Nie <jun.nie@linaro.org>
To:     abel.vesa@linaro.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org
Cc:     agross@kernel.org, shawn.guo@linaro.org,
        bryan.odonoghue@linaro.org, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Jun Nie <jun.nie@linaro.org>
Subject: [PATCH 0/4] Support dynamic voltage frequency scaling inside clock controller
Date:   Fri,  5 Aug 2022 15:49:31 +0800
Message-Id: <20220805074935.1158098-1-jun.nie@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Support dynamic voltage frequency scaling inside clock controller with
changes in clock framework. And added msm8916 as the first SoC to
support this feature.

Jun Nie (4):
  clk: Aggregate power operation in clock controller
  soc: qcom: rpmpd: Add corner power-domains states
  arm64: dts: qcom: add power domain for clk controller
  clk: qcom: gcc-msm8916: Add power domain data

 arch/arm64/boot/dts/qcom/msm8916.dtsi  |  14 +-
 drivers/clk/clk.c                      | 212 ++++++++++++++++++++++++-
 drivers/clk/qcom/gcc-msm8916.c         | 182 +++++++++++++++++++++
 include/dt-bindings/power/qcom-rpmpd.h |   8 +
 include/linux/clk-provider.h           |  62 ++++++++
 5 files changed, 470 insertions(+), 8 deletions(-)

-- 
2.25.1

