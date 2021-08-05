Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09061C4338F
	for <linux-clk@archiver.kernel.org>; Thu,  5 Aug 2021 22:24:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D53D36113B
	for <linux-clk@archiver.kernel.org>; Thu,  5 Aug 2021 22:24:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238146AbhHEWY3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 5 Aug 2021 18:24:29 -0400
Received: from relay07.th.seeweb.it ([5.144.164.168]:58219 "EHLO
        relay07.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238659AbhHEWY3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 5 Aug 2021 18:24:29 -0400
Received: from localhost.localdomain (83.6.167.155.neoplus.adsl.tpnet.pl [83.6.167.155])
        by m-r2.th.seeweb.it (Postfix) with ESMTPA id BDC213F367;
        Fri,  6 Aug 2021 00:24:07 +0200 (CEST)
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
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: clock: qcom: rpmcc: Document MDM9607 compatible
Date:   Fri,  6 Aug 2021 00:23:59 +0200
Message-Id: <20210805222400.39027-1-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add the dt-binding for the RPM Clock Controller on the MDM9607 SoC.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 Documentation/devicetree/bindings/clock/qcom,rpmcc.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt b/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
index 6cf5a7ec2b4c..d31d98437d11 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
@@ -10,6 +10,7 @@ Required properties :
 - compatible : shall contain only one of the following. The generic
                compatible "qcom,rpmcc" should be also included.
 
+			"qcom,rpmcc-mdm9607", "qcom,rpmcc"
 			"qcom,rpmcc-msm8660", "qcom,rpmcc"
 			"qcom,rpmcc-apq8060", "qcom,rpmcc"
 			"qcom,rpmcc-msm8226", "qcom,rpmcc"
-- 
2.32.0

