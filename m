Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBF3CC48BDF
	for <linux-clk@archiver.kernel.org>; Fri, 18 Jun 2021 11:14:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B04D6613F0
	for <linux-clk@archiver.kernel.org>; Fri, 18 Jun 2021 11:14:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233957AbhFRLQx (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 18 Jun 2021 07:16:53 -0400
Received: from relay05.th.seeweb.it ([5.144.164.166]:60621 "EHLO
        relay05.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233552AbhFRLQv (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 18 Jun 2021 07:16:51 -0400
Received: from localhost.localdomain (83.6.168.10.neoplus.adsl.tpnet.pl [83.6.168.10])
        by m-r2.th.seeweb.it (Postfix) with ESMTPA id D1C463EB9B;
        Fri, 18 Jun 2021 13:14:38 +0200 (CEST)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     ~postmarketos/upstreaming@lists.sr.ht
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/3] dt-bindings: clock: Add support for MSM8992/4 MMCC
Date:   Fri, 18 Jun 2021 13:14:32 +0200
Message-Id: <20210618111435.595689-1-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Document the multimedia clock controller found on MSM8992/4.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 Documentation/devicetree/bindings/clock/qcom,mmcc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml b/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
index 8b0b1c56f354..68fdc3d4982a 100644
--- a/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
@@ -22,6 +22,8 @@ properties:
       - qcom,mmcc-msm8660
       - qcom,mmcc-msm8960
       - qcom,mmcc-msm8974
+      - qcom,mmcc-msm8992
+      - qcom,mmcc-msm8994
       - qcom,mmcc-msm8996
       - qcom,mmcc-msm8998
       - qcom,mmcc-sdm630
-- 
2.32.0

