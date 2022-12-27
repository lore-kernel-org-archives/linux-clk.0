Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB904C4332F
	for <linux-clk@archiver.kernel.org>; Tue, 27 Dec 2022 01:32:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230375AbiL0Bcc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 26 Dec 2022 20:32:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232371AbiL0Bca (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 26 Dec 2022 20:32:30 -0500
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C86B02BCA
        for <linux-clk@vger.kernel.org>; Mon, 26 Dec 2022 17:32:28 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id s25so12502187lji.2
        for <linux-clk@vger.kernel.org>; Mon, 26 Dec 2022 17:32:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1J+JLW+JOrxXoy4HXkqu5YJ4mlU978iZ0LW4LiFN3dM=;
        b=i2mBXemUB7BENkLv8GJbobhnUVlQmuP08CQ8PuFJLKOkBpVrIrxXc0KwMwPrcdkoXC
         wprmwlcLozYhibtBwlAx05MvzboJbTW23USWOpRVf/1SQ607Z3Gos7QolC1qW83KMFEA
         torArT6XxOq430vEaiJLXFhIcCpuOKkoeQ9jqdALN8R+C3gD08A9ZUwOxW6U2HcsyORP
         30sqGcNl+BMMzrR5LXUWk5BlbVMxLhSFI731QXH8wQONjVBaXE8Hk54KI1kYt0rRsfJ5
         DbxJW/IBRksYG4Ges37gNf8dnZ1ennm5VXpEZhoxqGB4vzpP+5Sx4Kv+i3ihGwoMrTRP
         34dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1J+JLW+JOrxXoy4HXkqu5YJ4mlU978iZ0LW4LiFN3dM=;
        b=PEWl5blowVgvn5VLHz+ems2WT9SuWNbNduPSoyx+FesZNCUYsc+HqN0BYinJ9MZk6Z
         SC6+MeujhY6ig73FkDn/lfFr8BOcWam1PusWoVHRG6YqWiCgGy5PjGIozWZpKnv9o42Z
         pbgN+fHIc0dofufAdzx8SiSKQM26/EQS6h6aQxwlMC6EvjntV0svb7xqsAWNjL3alpYp
         R2LbsP8yXDBZsbAhlKEYLy29M5jxrN8IwvOHT02t9tFkb7BI3zJvEPwFEphDw6P14LCF
         FVFQliLdTixKICBrJ+FC6VVUDdMW4Lj8a2QnYO1fq1/MTC4KRF4mzQx/ve8tTgyPbDoK
         7spA==
X-Gm-Message-State: AFqh2ko1IeHOsxEysrm/1c4nJvdcLrHmpuv9badS6oEdpbJfPy1hnAVX
        grXLHuWjuAObj0JCDSaNEqml5A==
X-Google-Smtp-Source: AMrXdXvizx5puQ1MceYv0WdD3Y/xFwj/iiK/sA5BbkJRedRnaGJimmFTdjLEDfJ2rT90wcChKngcQQ==
X-Received: by 2002:a2e:95d1:0:b0:278:eab6:7523 with SMTP id y17-20020a2e95d1000000b00278eab67523mr7683699ljh.37.1672104746989;
        Mon, 26 Dec 2022 17:32:26 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id v6-20020a2e87c6000000b0027fbb12aa53sm674752ljj.20.2022.12.26.17.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Dec 2022 17:32:26 -0800 (PST)
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
Subject: [RFC PATCH 01/12] dt-bindings: clock: qcom,gcc-apq8084: define clocks/clock-names
Date:   Tue, 27 Dec 2022 03:32:14 +0200
Message-Id: <20221227013225.2847382-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221227013225.2847382-1-dmitry.baryshkov@linaro.org>
References: <20221227013225.2847382-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Define clock/clock-names properties of the GCC device node to be used
on APQ8084 platform.

Note: the driver uses a single pcie_pipe clock, however most probably
there are two pipe clocks, one from each of PCIe QMP PHYs.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/clock/qcom,gcc-apq8084.yaml      | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-apq8084.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-apq8084.yaml
index 8ade176c24f4..02a856f14fbe 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-apq8084.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-apq8084.yaml
@@ -25,6 +25,30 @@ properties:
   compatible:
     const: qcom,gcc-apq8084
 
+  clocks:
+    items:
+      - description: XO source
+      - description: Sleep clock source
+      - description: UFS RX symbol 0 clock
+      - description: UFS RX symbol 1 clock
+      - description: UFS TX symbol 0 clock
+      - description: UFS TX symbol 1 clock
+      - description: SATA ASIC0 clock
+      - description: SATA RX clock
+      - description: PCIe PIPE clock
+
+  clock-names:
+    items:
+      - const: xo
+      - const: sleep_clk
+      - const: ufs_rx_symbol_0_clk_src
+      - const: ufs_rx_symbol_1_clk_src
+      - const: ufs_tx_symbol_0_clk_src
+      - const: ufs_tx_symbol_1_clk_src
+      - const: sata_asic0_clk
+      - const: sata_rx_clk
+      - const: pcie_pipe
+
 required:
   - compatible
 
@@ -38,5 +62,24 @@ examples:
         #clock-cells = <1>;
         #reset-cells = <1>;
         #power-domain-cells = <1>;
+
+        clocks = <&xo_board>,
+                 <&sleep_clk>,
+                 <&ufsphy 0>,
+                 <&ufsphy 1>,
+                 <&ufsphy 2>,
+                 <&ufsphy 3>,
+                 <&sata 0>,
+                 <&sata 1>,
+                 <&pcie_phy>;
+        clock-names = "xo",
+                      "sleep_clk",
+                      "ufs_rx_symbol_0_clk_src",
+                      "ufs_rx_symbol_1_clk_src",
+                      "ufs_tx_symbol_0_clk_src",
+                      "ufs_tx_symbol_1_clk_src",
+                      "sata_asic0_clk",
+                      "sata_rx_clk",
+                      "pcie_pipe";
     };
 ...
-- 
2.35.1

