Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41F2CC54EE9
	for <linux-clk@archiver.kernel.org>; Wed, 21 Sep 2022 00:45:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230240AbiIUApI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 20 Sep 2022 20:45:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230329AbiIUApG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 20 Sep 2022 20:45:06 -0400
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it [5.144.164.167])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C643474DE1
        for <linux-clk@vger.kernel.org>; Tue, 20 Sep 2022 17:45:05 -0700 (PDT)
Received: from localhost.localdomain (95.49.29.188.neoplus.adsl.tpnet.pl [95.49.29.188])
        by m-r2.th.seeweb.it (Postfix) with ESMTPA id 6A2DB3F62C;
        Wed, 21 Sep 2022 02:45:03 +0200 (CEST)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     ~postmarketos/upstreaming@lists.sr.ht
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] dt-bindings: clock: qcom,rpmcc: Add compatible for SM6375
Date:   Wed, 21 Sep 2022 02:44:56 +0200
Message-Id: <20220921004458.151842-1-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add a compatible for RPMCC on SM6375.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
Changes since v1:
- changed the compatible to match the style used in the file

 Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml
index 9bf209f1ad57..2a95bf8664f9 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml
@@ -44,6 +44,7 @@ properties:
           - qcom,rpmcc-sdm660
           - qcom,rpmcc-sm6115
           - qcom,rpmcc-sm6125
+          - qcom,rpmcc-sm6375
       - const: qcom,rpmcc
 
   '#clock-cells':
-- 
2.37.3

