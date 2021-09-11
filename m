Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FC88C41535
	for <linux-clk@archiver.kernel.org>; Sat, 11 Sep 2021 12:14:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 64EF4611F2
	for <linux-clk@archiver.kernel.org>; Sat, 11 Sep 2021 12:14:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235770AbhIKMPS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 11 Sep 2021 08:15:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235817AbhIKMPP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 11 Sep 2021 08:15:15 -0400
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it [IPv6:2001:4b7a:2000:18::169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4621BC061574
        for <linux-clk@vger.kernel.org>; Sat, 11 Sep 2021 05:14:02 -0700 (PDT)
Received: from Marijn-Arch-PC.localdomain (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 4D2973F432;
        Sat, 11 Sep 2021 14:14:00 +0200 (CEST)
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 6/8] dt-bindings: clocks: qcom,gcc-msm8998: Reflect actually referenced clks
Date:   Sat, 11 Sep 2021 14:13:38 +0200
Message-Id: <20210911121340.261920-7-marijn.suijten@somainline.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210911121340.261920-1-marijn.suijten@somainline.org>
References: <20210911121340.261920-1-marijn.suijten@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Some of these clocks are not referenced by the driver at all whereas
aud_ref_clk and core_bi_pll_test_se are but were missing from the
bindings.  These clocks are optional (and not currently provided
anywhere) while "xo" and "sleep_clk" are mandatory.

Note that none of these clocks were used beforehand as the driver
referenced them by their global name.

Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
---
 .../bindings/clock/qcom,gcc-msm8998.yaml      | 26 ++++++-------------
 1 file changed, 8 insertions(+), 18 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8998.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8998.yaml
index a0bb713929b0..8151c0a05649 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8998.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8998.yaml
@@ -25,21 +25,17 @@ properties:
     items:
       - description: Board XO source
       - description: Sleep clock source
-      - description: USB 3.0 phy pipe clock
-      - description: UFS phy rx symbol clock for pipe 0
-      - description: UFS phy rx symbol clock for pipe 1
-      - description: UFS phy tx symbol clock
-      - description: PCIE phy pipe clock
+      - description: Audio reference clock (Optional clock)
+      - description: PLL test clock source (Optional clock)
+    minItems: 2
 
   clock-names:
     items:
       - const: xo
       - const: sleep_clk
-      - const: usb3_pipe
-      - const: ufs_rx_symbol0
-      - const: ufs_rx_symbol1
-      - const: ufs_tx_symbol0
-      - const: pcie0_pipe
+      - const: aud_ref_clk # Optional clock
+      - const: core_bi_pll_test_se # Optional clock
+    minItems: 2
 
   '#clock-cells':
     const: 1
@@ -80,16 +76,10 @@ examples:
       clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
                <&sleep>,
                <0>,
-               <0>,
-               <0>,
-               <0>,
                <0>;
       clock-names = "xo",
                     "sleep_clk",
-                    "usb3_pipe",
-                    "ufs_rx_symbol0",
-                    "ufs_rx_symbol1",
-                    "ufs_tx_symbol0",
-                    "pcie0_pipe";
+                    "aud_ref_clk",
+                    "core_bi_pll_test_se";
     };
 ...
-- 
2.33.0

