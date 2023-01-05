Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B11D1C54EBD
	for <linux-clk@archiver.kernel.org>; Thu,  5 Jan 2023 13:41:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232667AbjAENll (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 5 Jan 2023 08:41:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232676AbjAENli (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 5 Jan 2023 08:41:38 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F43132E95
        for <linux-clk@vger.kernel.org>; Thu,  5 Jan 2023 05:41:36 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id bp15so55054029lfb.13
        for <linux-clk@vger.kernel.org>; Thu, 05 Jan 2023 05:41:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mSujiAbquYvi81351VGo3QHTuOxLgyZj862ZjiWzNCs=;
        b=ZG4leSdK6N2UqAeYx/Ztpfs7tx9dPoBMU7dZmogVm3VSKa9xhVqEXrxaJlQDJ2BY4l
         ydGM9VlVPc3g71nnvxW2ngZXyXQd0rGvJTJJAS4XVehPYKjZ0U/ah7IY94ry527/tM9i
         0SKI/a3t23fFuqzRmPrdQ7uPPpxug0x948tyPACp/wwwYa0Hx8UVhvjl/gLszE/fsGOq
         uUktt6CtubFUE2rrkaZDqrwcAodS6rRtvZZyF3qXw3ZwCz9yECjDGYBXiu5G/eJ3jFVZ
         TFvZYdAk2yvhwbZlQRbsghDzoi105ZmEt1rym1F2eAagPTMG8hFPl4PNMq4gyqJKoaLL
         bP5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mSujiAbquYvi81351VGo3QHTuOxLgyZj862ZjiWzNCs=;
        b=qxsICX4uHrQa8PvRcXVVoLOYSGan5RfnsXSLp1Zu8SzRlij5KKBhWkY/cByLgHUFeT
         sxUlX/PqqAJGjpTsdBkDIvkrn0rH9F/8DzbxwGO/1ktPaf7CPCGntjoHkVs1I1A0jjOB
         RFNGoiS4wH1w9722P8m3LfbDvb2agaqixVY0nd3QkXjxTxXS8GxYt4h3rK+FvcFnSp3U
         xwZI8vw16VTblpmvuUAd+hvY0AB1HMvsIhpWGemqOfkiylC7mnf/I4W0NuVz/jB0PJQJ
         wB9mJghxfTmT5MQYWqs04vuWXAswtx70zedNhPYImzAw7pmgn9MBDua1Ngm8iaa410U2
         wOwg==
X-Gm-Message-State: AFqh2kq9XeTKQgmjLaEd29ms9pLKxIImVSTeeqHD+h89RHW3c8BoqyGA
        erZsb89kbRwajbUoOdVMNcfsqg==
X-Google-Smtp-Source: AMrXdXvQJNTd2uAqp9+ew9zzhyMkQ8W/RAuyXFKzerOc02qX+xgkriUfLTnWwxsmb/JXj3SmIG4drg==
X-Received: by 2002:a05:6512:ba5:b0:4c0:91d0:e7b7 with SMTP id b37-20020a0565120ba500b004c091d0e7b7mr24034873lfv.27.1672926094913;
        Thu, 05 Jan 2023 05:41:34 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id bq25-20020a056512151900b004b592043413sm5461315lfb.12.2023.01.05.05.41.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jan 2023 05:41:34 -0800 (PST)
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
Subject: [PATCH v2 01/12] dt-bindings: clock: qcom,gcc-apq8084: define clocks/clock-names
Date:   Thu,  5 Jan 2023 15:41:22 +0200
Message-Id: <20230105134133.1550618-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230105134133.1550618-1-dmitry.baryshkov@linaro.org>
References: <20230105134133.1550618-1-dmitry.baryshkov@linaro.org>
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
 .../bindings/clock/qcom,gcc-apq8084.yaml      | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-apq8084.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-apq8084.yaml
index 8ade176c24f4..732b6770b46e 100644
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
 
@@ -32,11 +56,35 @@ unevaluatedProperties: false
 
 examples:
   - |
+    /* UFS PHY on APQ8084 is not supported (yet), so these bindings just serve an example */
+    #define UFS_PHY_RX_SYMBOL_0 0
+    #define UFS_PHY_RX_SYMBOL_1 1
+    #define UFS_PHY_TX_SYMBOL_0 2
+    #define UFS_PHY_TX_SYMBOL_1 3
     clock-controller@fc400000 {
         compatible = "qcom,gcc-apq8084";
         reg = <0xfc400000 0x4000>;
         #clock-cells = <1>;
         #reset-cells = <1>;
         #power-domain-cells = <1>;
+
+        clocks = <&xo_board>,
+                 <&sleep_clk>,
+                 <&ufsphy UFS_PHY_RX_SYMBOL_0>,
+                 <&ufsphy UFS_PHY_RX_SYMBOL_1>,
+                 <&ufsphy UFS_PHY_TX_SYMBOL_0>,
+                 <&ufsphy UFS_PHY_TX_SYMBOL_1>,
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
2.39.0

