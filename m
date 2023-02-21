Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F8F4C64ED6
	for <linux-clk@archiver.kernel.org>; Tue, 21 Feb 2023 18:00:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230023AbjBUSAe (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 21 Feb 2023 13:00:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230378AbjBUSAd (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 21 Feb 2023 13:00:33 -0500
X-Greylist: delayed 604 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 21 Feb 2023 10:00:30 PST
Received: from srv01.abscue.de (abscue.de [89.58.28.240])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 255522C675;
        Tue, 21 Feb 2023 10:00:29 -0800 (PST)
Received: from srv01.abscue.de (localhost [127.0.0.1])
        by spamfilter.srv.local (Postfix) with ESMTP id 63C591C0068;
        Tue, 21 Feb 2023 18:50:26 +0100 (CET)
Received: from fluffy-mammal.fritz.box (dslb-092-072-008-248.092.072.pools.vodafone-ip.de [92.72.8.248])
        by srv01.abscue.de (Postfix) with ESMTPSA id EFEED1C006E;
        Tue, 21 Feb 2023 18:50:25 +0100 (CET)
From:   =?UTF-8?q?Otto=20Pfl=C3=BCger?= <otto.pflueger@abscue.de>
To:     Bjorn Andersson <andersson@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        =?UTF-8?q?Otto=20Pfl=C3=BCger?= <otto.pflueger@abscue.de>
Subject: [PATCH 3/4] dt-bindings: clock: qcom,rpmcc: Add MSM8917
Date:   Tue, 21 Feb 2023 18:49:08 +0100
Message-Id: <20230221174909.164029-4-otto.pflueger@abscue.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230221174909.164029-1-otto.pflueger@abscue.de>
References: <20230221174909.164029-1-otto.pflueger@abscue.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Document the qcom,rpmcc-msm8917 compatible.

Signed-off-by: Otto Pflüger <otto.pflueger@abscue.de>
---
 Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml
index 2a95bf8664f9..3665dd30604a 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml
@@ -31,6 +31,7 @@ properties:
           - qcom,rpmcc-msm8660
           - qcom,rpmcc-msm8909
           - qcom,rpmcc-msm8916
+          - qcom,rpmcc-msm8917
           - qcom,rpmcc-msm8936
           - qcom,rpmcc-msm8953
           - qcom,rpmcc-msm8974
@@ -107,6 +108,7 @@ allOf:
               - qcom,rpmcc-mdm9607
               - qcom,rpmcc-msm8226
               - qcom,rpmcc-msm8916
+              - qcom,rpmcc-msm8917
               - qcom,rpmcc-msm8936
               - qcom,rpmcc-msm8953
               - qcom,rpmcc-msm8974
-- 
2.39.1
