Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A91C3C4708B
	for <linux-clk@archiver.kernel.org>; Wed, 30 Nov 2022 11:29:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235185AbiK3L3u (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 30 Nov 2022 06:29:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230004AbiK3L3q (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 30 Nov 2022 06:29:46 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EDF810FFA
        for <linux-clk@vger.kernel.org>; Wed, 30 Nov 2022 03:29:25 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id bj12so40500634ejb.13
        for <linux-clk@vger.kernel.org>; Wed, 30 Nov 2022 03:29:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=quL6WPeERZYedqB/nklThp0WUV+KiBC4sy50mhyRH+A=;
        b=g4zwRW29WPpz2thZu61KxOT33kFiYPjdJn8O5qYNxPph6DuPgMkHYs+nZcWacaCU7f
         gTxy9hKOIGvnGy82GX93mzCGf1z9/2d4ExSz35UcU8LJPhcZfY9TPzS7Oj0FZModf2Fv
         DEs2Dg+vdjOooKqMblRPEQ0gx4xCeX2raSuGdnHaM4ojj/PB7wRFtHjbcKXTAfNGK6OF
         HaB3AJnXLs/im/ez+So+ShqbWZ1LSObv1r2+5C7tB8g5//SkfYrJ8nTsVDO5dyJ6jDd0
         EYCa9bfzgvZuNsTjJqjmfHTc+Izp27IF+JuO7pGOnEYXgFUHTK3PuYpuI+r5j16lxGVt
         xiWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=quL6WPeERZYedqB/nklThp0WUV+KiBC4sy50mhyRH+A=;
        b=P4kVZaBKDAg40NUsemX+y8pzLl6w+/l7IgM5qGNwAZ0zuFuZNCuLq5BD8bl7g2cbBk
         KEihTyfjdR/mpCBzfkoMEBJGzbXUYS42G8onKdyeNIslgDUZyCU96FHtl0B2wc7SwSiD
         IO6JXLRgzDmBREcKqIX/zWJx4pIrFax1JnlGZnvG10Pqr84CypuAIJQGpomcS8CxBIno
         qNhs4fIO8/nn5O85iEA7iRzhAq3D4TUywQa0R2YC3uf/4FAw2J5Em7CJECKZ2jvkaNrm
         93fQUNGMzNTc7UOfdjvc+oEvS9b31INXAim3ibo3zrN6Jut81aJbYG5Xi1TPAHYTt+P4
         Acrg==
X-Gm-Message-State: ANoB5pk5WdBa0dkzFE79iPsm/ZZRaEV+jbB1JyZfjx0mH5Xihsl1/0F9
        SNNRf3Oelf2PuJ/lQGp+FBEuTw==
X-Google-Smtp-Source: AA0mqf7z9P491em89qUagFeLR3nXWgGsebtZg2qlrn0Cni55JOX4TOd7qtW9BMO5z8C4xvnwCcNG4A==
X-Received: by 2002:a17:906:448d:b0:7ae:37aa:6bf with SMTP id y13-20020a170906448d00b007ae37aa06bfmr50974954ejo.481.1669807764892;
        Wed, 30 Nov 2022 03:29:24 -0800 (PST)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id x10-20020a1709060a4a00b007c073be0127sm521593ejf.202.2022.11.30.03.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 03:29:24 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 7/9] dt-bindings: clock: qcom,rpmh: Add CXO PAD clock IDs
Date:   Wed, 30 Nov 2022 13:28:50 +0200
Message-Id: <20221130112852.2977816-8-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221130112852.2977816-1-abel.vesa@linaro.org>
References: <20221130112852.2977816-1-abel.vesa@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The SM8550 has a new fixed divider as child clock of CXO
called CXO_PAD, so add IDs for it.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 include/dt-bindings/clock/qcom,rpmh.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/qcom,rpmh.h b/include/dt-bindings/clock/qcom,rpmh.h
index 0a7d1be0d124..f3e0288420ce 100644
--- a/include/dt-bindings/clock/qcom,rpmh.h
+++ b/include/dt-bindings/clock/qcom,rpmh.h
@@ -33,5 +33,7 @@
 #define RPMH_HWKM_CLK				24
 #define RPMH_QLINK_CLK				25
 #define RPMH_QLINK_CLK_A			26
+#define RPMH_CXO_PAD_CLK			27
+#define RPMH_CXO_PAD_CLK_A			28
 
 #endif
-- 
2.34.1

