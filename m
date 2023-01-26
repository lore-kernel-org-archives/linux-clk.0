Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B3FAC61D97
	for <linux-clk@archiver.kernel.org>; Thu, 26 Jan 2023 23:04:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233381AbjAZXD6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 26 Jan 2023 18:03:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233363AbjAZXDw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 26 Jan 2023 18:03:52 -0500
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com [IPv6:2607:f8b0:4864:20::d35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B1ED61859
        for <linux-clk@vger.kernel.org>; Thu, 26 Jan 2023 15:03:45 -0800 (PST)
Received: by mail-io1-xd35.google.com with SMTP id e204so1204080iof.1
        for <linux-clk@vger.kernel.org>; Thu, 26 Jan 2023 15:03:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QXnOHOh5QfaalI7LSXB28OMKjzgZCCU/t1AphNsWkmU=;
        b=dvEKsQU/LwU8I5TvPnNA4/w/fSwdXqRmIHCf1lIY5usyAnONTT58PMQCB3ifzkmP3R
         fi8sQn/nQ5Y5OP7RyluH+vC+uCESbnVsg50lvkuSRPPAzCqOXcGtPjjyyTIP2hOXpbpj
         sQj1r3jV7owKnyHcVw69WbldPQbGdOjlbv0LjAHC1UG0JfAs4b3EiL7Y4W1Q35OCRUQH
         sJU4w4A1jeXBV81lNSgxCSxkrZ0NetYvR4Zzv7ut/CbFXOR0hxHrXm4tzfviSv63gaLW
         9fNu3jnI9aOB7J7uIWkoAp06UmTuScvpB4L3h45QPJS70zm0aVCCugzl/COjEDmPahi8
         pCtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QXnOHOh5QfaalI7LSXB28OMKjzgZCCU/t1AphNsWkmU=;
        b=L4OZXtPThJdrr0BBo/HZzDgPv5cmAhYUUNQUBr9eK+Jdao8Rjtb5dxDN1ArQi0M5QD
         ixZDJITyF6O2nizxfsuHoGokLZ4aynL7A20Xo/cvfzoZ5Lohk9H8zVd03hyd9yFxmWus
         X5HSFsYxaOuIZSrYQNshuPMUyEeXfvR71N5pht1WVqpYRyPBGi/6BRmDHYK0VISQQIt5
         +gilb4hRxGG/MdLsJwKbHrZxjfi4SyPZOQji39zSW7GxxbF2eVeD8azjq8BVsKx5PQYr
         //2NpjW6iMTHEYm373s31Bppvl+pZVs6Qa3xIaibH3qUJzUugCQW3Gglo6z9sO6MSvQW
         5OMg==
X-Gm-Message-State: AO0yUKWVvEZ1LsZjl1DNs+M2ke+6abfFMTlTzHuN4GlJjJUSzQQy14OP
        PLxDvtkP5TQvt0zNiIiOYdYw0Q==
X-Google-Smtp-Source: AK7set+MzHTZGoUtc4NYmN9ISFzRwN+Fg/fAOc8m3YcGzKZszaAHAj3SgihizV4/BI5an4rIk3JZoQ==
X-Received: by 2002:a05:6602:2aca:b0:704:9e64:971 with SMTP id m10-20020a0566022aca00b007049e640971mr2846658iov.20.1674774225225;
        Thu, 26 Jan 2023 15:03:45 -0800 (PST)
Received: from eriador.lumag.spb.ru ([194.204.33.9])
        by smtp.gmail.com with ESMTPSA id l4-20020a6bd104000000b006f8b7d869a0sm670924iob.1.2023.01.26.15.03.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 15:03:44 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jassi Brar <jassisinghbrar@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 5/7] dt-bindings: mailbox: qcom: add #clock-cells to msm8996 example
Date:   Fri, 27 Jan 2023 01:03:17 +0200
Message-Id: <20230126230319.3977109-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230126230319.3977109-1-dmitry.baryshkov@linaro.org>
References: <20230126230319.3977109-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add the #clock-cells property to the MSM8996 example, as the APCS block
is going to provide the `sys_apcs_aux' clock to the consumers.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
index 7d8de7a16984..1633aa82fc84 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
@@ -166,6 +166,7 @@ examples:
         reg = <0x9820000 0x1000>;
 
         #mbox-cells = <1>;
+        #clock-cells = <0>;
     };
 
     rpm-glink {
-- 
2.39.0

