Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6595DC678D6
	for <linux-clk@archiver.kernel.org>; Mon,  9 Jan 2023 09:44:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234129AbjAIJoX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 9 Jan 2023 04:44:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234477AbjAIJoQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 9 Jan 2023 04:44:16 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45A5F105
        for <linux-clk@vger.kernel.org>; Mon,  9 Jan 2023 01:44:15 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id s9so7522405wru.13
        for <linux-clk@vger.kernel.org>; Mon, 09 Jan 2023 01:44:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MTJXmNvbTcT89bcSnjaUr7kokclVbE/uDnYILeaGTJs=;
        b=FrBnF3rWRk7bzbwUWmQMpOyScdM5qv/9A4MjtMCsSPe0Ppim5rppW6/fU1rqtRZeB4
         pI9pBgWO0YafRhWyWp0rijk8Ti8S+0Tp5dV4xglP0Jgdm91EoPF7tE+fs2par/9eFA++
         FR1Qf1vU0TIIHNLsdJ7y3ATumITrcjBWbXrO383oujAzC7ve09968aV+QizW5uDKAXNE
         wBGozIWjTkHz3PP4+CLeZ1RPoQWJfYxOHYpzTS2hO4w5lYa1TnFpLUfr7id9rFVGtd5N
         UJaDxfpt/dtitb5Vo5QbE2lML8rSmhJn+6/inKCF8dydRYrqQ7/WL5J5rmQQlb8x9Ei1
         neOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MTJXmNvbTcT89bcSnjaUr7kokclVbE/uDnYILeaGTJs=;
        b=n+hbwz14y/hVVH3UwHWc0a0WdWkH/Tpm5kktuXtjruuG2p09SScGKGJzzl3BAdsTtg
         wzQEMmsiYG9Z4IqgMD0eixt4kkr0TOxYJdNcHGhSouowwaux3p+tucCtvUBVOANkyOzF
         3HAiKGIM8IhsZDykgkdMdYZqfHKdC8faPLreePfwZjuK6bR8JW+9loWLkGaeQMb6vXAd
         W38o99l1S3kIUAX3uE/RcNbx8qk3ySSu6TMMFdaUmUWxVluOjaJOvAFpW4ycC+W5cRdH
         ULvZMpwBhzuI+7lDk2gw5UHkpi/hVIWrLvSk43VP9/AmNdrEatWKBwWjh+ouD0xOkmNK
         9nVA==
X-Gm-Message-State: AFqh2koZYky+yI1apD4v8kZb1XL/sHLv0Zl6DsFXSP7l3Vghko/bzXyl
        OExrjzXCRE1OBUyt/lnrY3leZw==
X-Google-Smtp-Source: AMrXdXtfo1Jxt/b7bOLVybmtxtbfEiF4LdN1IU+wKfRkYws4TSJAjIE/jFfpSiY9oCtFZlGuhLXFog==
X-Received: by 2002:a5d:488b:0:b0:242:5ae0:5b41 with SMTP id g11-20020a5d488b000000b002425ae05b41mr41463424wrq.33.1673257453873;
        Mon, 09 Jan 2023 01:44:13 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id f7-20020a5d6647000000b002bbeb700c38sm2965185wrw.91.2023.01.09.01.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 01:44:13 -0800 (PST)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Mon, 09 Jan 2023 10:43:29 +0100
Subject: [PATCH v2 2/3] clk: qcom: clk-alpha-pll: define alias of LUCID OLE
 reset ops to EVO reset ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230103-topic-sm8550-upstream-dispcc-v2-2-786ddd8785a2@linaro.org>
References: <20230103-topic-sm8550-upstream-dispcc-v2-0-786ddd8785a2@linaro.org>
In-Reply-To: <20230103-topic-sm8550-upstream-dispcc-v2-0-786ddd8785a2@linaro.org>
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
Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>
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
