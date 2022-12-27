Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B081C4708E
	for <linux-clk@archiver.kernel.org>; Tue, 27 Dec 2022 01:32:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232371AbiL0Bcf (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 26 Dec 2022 20:32:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232596AbiL0Bcd (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 26 Dec 2022 20:32:33 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A7DF2BF0
        for <linux-clk@vger.kernel.org>; Mon, 26 Dec 2022 17:32:29 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id g14so12453823ljh.10
        for <linux-clk@vger.kernel.org>; Mon, 26 Dec 2022 17:32:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YJOYPI9sY8AluWjkq6c4DaJqB4tXH2+5vF/TwT1msQY=;
        b=M/MuIDp+n1Pto4mwxspbrtzpbJsjMmWEclY8CheXblnhEKcNKq5gHk+GbEocFHSwLu
         vWvR2sDyf2qHeSn2MRUojEiZqxj5TuOkIb9T5Td73m1V0rB9ToR8ANSets5VpfBCQ4rb
         g0G9haG4Pf6K1d45qtJDUKKJG3fzg3yFMRaBe7j82eoSldpGYb8cLGoKKcfa85ZFGX4H
         83IN5jgq2v4dk4JQsV6/EcTWoyXhhRnbJnHsv/z3Z2C41nrFhv4L6GgunmH7ti0uRLgf
         g5ivWEBqwAKrP5gdwMqX8SJjttDNcZb5vZ07u5taT/aI+QLkk/T9pYfemYNkK7UZDR1/
         Vo6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YJOYPI9sY8AluWjkq6c4DaJqB4tXH2+5vF/TwT1msQY=;
        b=AwNxnCR8nPmekI9kXScSEgH37WojpdPjRcn6zVuljiDugpfSW2xpWJslBOxsFDSkM1
         wEQmDC/R63HkqTGT338ppv1MLWIw7ZR4ZHhx9WnGjVXc85v2fjG+fYrZih3rOoAyn3HN
         7Xw00d3rNhH0qT59DcQREFIVKzEoXB3+8qbNheFZQqnEyOYQFaZ19obFNeSsFQc5eFBT
         wb0pfKF0CPc9kp1sDa8t/haXwe90uViSNKk/fN27PA9or4J3lLoRYK2qpT43hI1Bd8mc
         KBSxOQLM4ieRxMUDdQ/hn73qahV2KolB16oYM1g5Gyfbk8sdzUZUBI8pB6c1Lrfcfj0p
         D9zQ==
X-Gm-Message-State: AFqh2kpsnAMK8nRJOIMuNIL13lNEuhWz5czehPH63vinmxbByUswHQiE
        PgHOMj1x5KcOAN0ZsnkzsvwjhQ==
X-Google-Smtp-Source: AMrXdXveTRbTDMpQNsoLBz1GIsPO+vAxUj86g0ZRmribGqTJHQs+/BC4wp+bQFw+xti3AYR4L3IvhQ==
X-Received: by 2002:a05:651c:2381:b0:27b:4ab1:93ca with SMTP id bk1-20020a05651c238100b0027b4ab193camr6375028ljb.52.1672104747742;
        Mon, 26 Dec 2022 17:32:27 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id v6-20020a2e87c6000000b0027fbb12aa53sm674752ljj.20.2022.12.26.17.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Dec 2022 17:32:27 -0800 (PST)
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
Subject: [RFC PATCH 02/12] dt-bindings: clock: qcom,gcc-apq8084: add GCC_MMSS_GPLL0_CLK_SRC
Date:   Tue, 27 Dec 2022 03:32:15 +0200
Message-Id: <20221227013225.2847382-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221227013225.2847382-1-dmitry.baryshkov@linaro.org>
References: <20221227013225.2847382-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add GCC_MMSS_GPLL0_CLK_SRC, the branch clock gating gpll0 clock for the
multimedia subsystem.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 include/dt-bindings/clock/qcom,gcc-apq8084.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/qcom,gcc-apq8084.h b/include/dt-bindings/clock/qcom,gcc-apq8084.h
index 7f657cf8cc8a..a985248d6332 100644
--- a/include/dt-bindings/clock/qcom,gcc-apq8084.h
+++ b/include/dt-bindings/clock/qcom,gcc-apq8084.h
@@ -339,6 +339,7 @@
 #define GCC_PCIE_1_MSTR_AXI_CLK				330
 #define GCC_PCIE_1_PIPE_CLK				331
 #define GCC_PCIE_1_SLV_AXI_CLK				332
+#define GCC_MMSS_GPLL0_CLK_SRC				333
 
 /* gdscs */
 #define USB_HS_HSIC_GDSC				0
-- 
2.35.1

