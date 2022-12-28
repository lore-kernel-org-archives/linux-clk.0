Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCCC6C54EBC
	for <linux-clk@archiver.kernel.org>; Wed, 28 Dec 2022 18:52:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233127AbiL1Swt (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 28 Dec 2022 13:52:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231523AbiL1Swp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 28 Dec 2022 13:52:45 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B93615F11
        for <linux-clk@vger.kernel.org>; Wed, 28 Dec 2022 10:52:44 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id e13so14728052ljn.0
        for <linux-clk@vger.kernel.org>; Wed, 28 Dec 2022 10:52:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p38bywVFtTrj3kqH2Lz2Ph0NglRYNc7cYdrBsK3q/3U=;
        b=AmcNx/D90sbymus73k585cXbjg5zInvXk9Wc8fLQwnHCIlmfW5ZVS3WhPBA1awSyZT
         n3dYN3oD6H1IMTj18yip7RRUjsDXMkfT7d0obLPMjI/aFEQ2DVJqWpxcuNXhxGtHxotK
         k2bQbpk4WTAJrZL6rHdt/JahkP+8/LRZg9cpavXafkcAyNV3fGG8q1NSmm23C45AjaDU
         j0XfOtwDpEb8+IWK/c9Bz9IVq7BW0NZxKa4APYEciVUlAUoyGk/PDygvRNndhTDUuiC2
         UOaldFqqxXNdndl44Z+bg6W1Q7mAcaEiOQMc/FtNy2KvK2a72IaNN1cG5uejNgM7FqqP
         MSmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p38bywVFtTrj3kqH2Lz2Ph0NglRYNc7cYdrBsK3q/3U=;
        b=pczT9NruPTOmVRT0/EIALi2jtawlIQPi8mUoyjeFyNMYbo9XLgkm4Rz8HrAwQkFdVa
         WAFXzlhF596FFIHInDj8kCYVztE7Cgbma18TQeHIegK5Ujsl79hNgbRiJSOb965FfPoq
         achoNEsOY2wYnyEEYd/R0exGSKKBqwkDdjOiWwlAnIFfljLB2Gska3C+zDB1gAhEp/Dg
         lXP68PrJIb6nK59u13e5/yLkyKwe+e3t5nqWg9/mdM8nblRzLmhCqKn++9S/D+Yl7tnQ
         7abBNzS0Ye8nVHuNOlDZe6aJPjwJ8k7cNms6PgJ7EMduu6oJ3G/SbVLEHxfdJyonSvO6
         srgw==
X-Gm-Message-State: AFqh2krh959W6+BOS2ngY+PdD6xmFXYspHJJPcaNCwEAHWvEcbJNGZhd
        DxnUlTWHlm9YOIoabiQLikV7sg==
X-Google-Smtp-Source: AMrXdXtDF2TSK0lgQn6QSehRiJI0j28OxjVQDQkXR26yi2t9NjxQGDr2os+Z5QuD/0aupXENa1lnuQ==
X-Received: by 2002:a2e:908b:0:b0:27f:b8ba:176f with SMTP id l11-20020a2e908b000000b0027fb8ba176fmr4099442ljg.46.1672253562454;
        Wed, 28 Dec 2022 10:52:42 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id s7-20020a2e83c7000000b00279d206a43bsm2031893ljh.34.2022.12.28.10.52.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 10:52:41 -0800 (PST)
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
Subject: [PATCH v2 04/16] dt-bindings: clock: qcom,gcc-sm8350: drop core_bi_pll_test_se
Date:   Wed, 28 Dec 2022 20:52:25 +0200
Message-Id: <20221228185237.3111988-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221228185237.3111988-1-dmitry.baryshkov@linaro.org>
References: <20221228185237.3111988-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The test clock apparently it's not used by anyone upstream. Remove it.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/clock/qcom,gcc-sm8350.yaml | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8350.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8350.yaml
index 703d9e075247..b4fdde71ef18 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8350.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8350.yaml
@@ -23,7 +23,6 @@ properties:
     items:
       - description: Board XO source
       - description: Sleep clock source
-      - description: PLL test clock source (Optional clock)
       - description: PCIE 0 Pipe clock source (Optional clock)
       - description: PCIE 1 Pipe clock source (Optional clock)
       - description: UFS card Rx symbol 0 clock source (Optional clock)
@@ -40,7 +39,6 @@ properties:
     items:
       - const: bi_tcxo
       - const: sleep_clk
-      - const: core_bi_pll_test_se # Optional clock
       - const: pcie_0_pipe_clk # Optional clock
       - const: pcie_1_pipe_clk # Optional clock
       - const: ufs_card_rx_symbol_0_clk # Optional clock
-- 
2.39.0

