Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADDCBC04FE3
	for <linux-clk@archiver.kernel.org>; Thu, 22 Jul 2021 21:10:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 91A3C60EBE
	for <linux-clk@archiver.kernel.org>; Thu, 22 Jul 2021 21:10:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231815AbhGVU3o (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 22 Jul 2021 16:29:44 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:63516 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231728AbhGVU3n (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 22 Jul 2021 16:29:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1626988218; x=1658524218;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=X4PdMYX/ugSdG6GejQ+DhzfKGmUBYMauIFwvJsZaDBU=;
  b=n6XUGWbxxQN7QVRNObSACCRFFCjH0ipkfqRQRvh0vVL0xR9RYGdza3NY
   3rzSxEVYSpEpM3QtvaXCPSHfg4FSkl1K5lSHa0Lz1nYyDibsMSkbX57Zj
   ZSeIVOOofGcmIzdkj2Ai2exbF/4m1Qi0pegQh85dsMJvGtmHbcBA/wXtW
   Y=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 22 Jul 2021 14:10:18 -0700
X-QCInternal: smtphost
Received: from nasanexm03e.na.qualcomm.com ([10.85.0.48])
  by ironmsg04-sd.qualcomm.com with ESMTP/TLS/AES256-SHA; 22 Jul 2021 14:10:17 -0700
Received: from vamslank1-linux.qualcomm.com (10.80.80.8) by
 nasanexm03e.na.qualcomm.com (10.85.0.48) with Microsoft SMTP Server (TLS) id
 15.0.1497.23; Thu, 22 Jul 2021 14:10:17 -0700
From:   <quic_vamslank@quicinc.com>
To:     <agross@kernel.org>, <bjorn.andersson@linaro.org>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <robh+dt@kernel.org>, <tglx@linutronix.de>, <maz@kernel.org>
CC:     <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        "Vamsi krishna Lanka" <quic_vamslank@quicinc.com>,
        Mark Brown <broonie@kernel.org>,
        "Jonathan Cameron" <Jonathan.Cameron@huawei.com>,
        Kozlowski <krzk@kernel.org>, "Vinod Koul" <vkoul@kernel.org>
Subject: [PATCH v2 6/6] dt-bindings: clock: Introduce pdc bindings for SDX65
Date:   Thu, 22 Jul 2021 14:09:43 -0700
Message-ID: <c9ac6fa07e81cb79c1eb8f2760a040eb0c72f0a6.1626986805.git.quic_vamslank@quicinc.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1626986805.git.quic_vamslank@quicinc.com>
References: <cover.1626986805.git.quic_vamslank@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanexm03e.na.qualcomm.com (10.85.0.48)
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Vamsi krishna Lanka <quic_vamslank@quicinc.com>

Add compatible for SDX65 pdc.

To: Rob Herring <robh+dt@kernel.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Vamsi Krishna Lanka <quic_vamslank@quicinc.com>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 .../devicetree/bindings/interrupt-controller/qcom,pdc.txt        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt
index e9afb48182c7..7bdbffb572dc 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt
@@ -22,6 +22,7 @@ Properties:
 		    - "qcom,sdm845-pdc": For SDM845
 		    - "qcom,sdm8250-pdc": For SM8250
 		    - "qcom,sdm8350-pdc": For SM8350
+		    - "qcom,sdx65-pdc": For SDX65
 
 - reg:
 	Usage: required
-- 
2.32.0

