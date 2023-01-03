Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08899C46467
	for <linux-clk@archiver.kernel.org>; Tue,  3 Jan 2023 13:54:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233490AbjACNyI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 3 Jan 2023 08:54:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237570AbjACNyF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 3 Jan 2023 08:54:05 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4A39FF2
        for <linux-clk@vger.kernel.org>; Tue,  3 Jan 2023 05:54:04 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id i17-20020a05600c355100b003d99434b1cfso12967844wmq.1
        for <linux-clk@vger.kernel.org>; Tue, 03 Jan 2023 05:54:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YqUXVyDWNBIKG7fq6jtfID+cRMA87e0au/QBlVmdbFQ=;
        b=Tqqa84Usptr2kMT87l5zsP8JwIurD8cFGR799+yVooEmMhlecjPk+fLOpC0eDgy5/B
         RFhrINA7XGYD4l3TyOr8lAZjhmp+MsC6rVTtRFThgOpLdAorFxSNU5a9hSolRrhO3izB
         ubGQ/ePAlm2INKSK2s7OdoDFBCiuvuszl28WE4MRRpQmYOMJGywJAWwIFeChEFxx2nZh
         reNCToXRG5ndgXXbPTHaRWjjkvMjWuQ+TzGB8vyEtlchxmZgPNL0zNzvS/DrEnPkANnN
         FsDjnwRdH/PxHPd7RcyZ09+FG1Js8u+5wt+gVL0gcIi59JDSc7CMZl6Hgz397pCnBgqX
         PqAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YqUXVyDWNBIKG7fq6jtfID+cRMA87e0au/QBlVmdbFQ=;
        b=xzoF4HWKQBd4RFza1+ydtZm1Rznk3j01sjBziXHuoz86jd14h0YjmunGThzOEZLfTw
         ssQZ3VNp7uNwq+jvNZwfrbzn6NlE28knMjBYi8hKdRYGkvcnfueTUb8ihUnQkGbTBwA1
         fl5FTL/SCE9fgWju18HWv5PEAFLycPzk6U86GaP2Le0dpPZf/UXPknRWtMNCAPP9lUxS
         LRH8xK/xfYIwHNxdqpMwaPP9yT3cen01kEVlJZhZBqaWCbKl7q1IsHlibUWlJ5hat7TV
         mGx0KW8myZVUVv2DJFy9e4X7EzB14jHcU46tDGpg932ZVDPcpV8qOVksH2IMDp5uCpWF
         syUg==
X-Gm-Message-State: AFqh2koaRKaUzzwXZcKM5AX0dMWQ7prys0fW8F68ZDJpbKIKTwijdIlL
        5zvw6474H0yKx5jnEVLoH6TanQ==
X-Google-Smtp-Source: AMrXdXvTiQeoAedkmSRfsgdNwZqX2BU116W2m83xr/cF5xaSGfpW8/vXKmlXJHUwc1qOll0hO4c4yg==
X-Received: by 2002:a05:600c:358f:b0:3d1:cdf7:debf with SMTP id p15-20020a05600c358f00b003d1cdf7debfmr32184711wmq.26.1672754043466;
        Tue, 03 Jan 2023 05:54:03 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ay39-20020a05600c1e2700b003cfa80443a0sm42138195wmb.35.2023.01.03.05.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 05:54:03 -0800 (PST)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Tue, 03 Jan 2023 14:53:59 +0100
Subject: [PATCH 2/3] clk: qcom: clk-alpha-pll: define alias of LUCID OLE reset
 ops to EVO reset ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230103-topic-sm8550-upstream-dispcc-v1-2-81bfcc26b2dc@linaro.org>
References: <20230103-topic-sm8550-upstream-dispcc-v1-0-81bfcc26b2dc@linaro.org>
In-Reply-To: <20230103-topic-sm8550-upstream-dispcc-v1-0-81bfcc26b2dc@linaro.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.11.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add an alias of LUCID OLE reset ops to EVO reset ops similar
to other aliases.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/clk/qcom/clk-alpha-pll.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
index 2bdae362c827..c67cfda27ecb 100644
--- a/drivers/clk/qcom/clk-alpha-pll.h
+++ b/drivers/clk/qcom/clk-alpha-pll.h
@@ -162,6 +162,7 @@ extern const struct clk_ops clk_alpha_pll_zonda_ops;
 
 extern const struct clk_ops clk_alpha_pll_lucid_evo_ops;
 extern const struct clk_ops clk_alpha_pll_reset_lucid_evo_ops;
+#define clk_alpha_pll_reset_lucid_ole_ops clk_alpha_pll_reset_lucid_evo_ops
 extern const struct clk_ops clk_alpha_pll_fixed_lucid_evo_ops;
 #define clk_alpha_pll_fixed_lucid_ole_ops clk_alpha_pll_fixed_lucid_evo_ops
 extern const struct clk_ops clk_alpha_pll_postdiv_lucid_evo_ops;

-- 
2.34.1
