Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31900C7618E
	for <linux-clk@archiver.kernel.org>; Thu, 16 Mar 2023 11:48:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230006AbjCPLsR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 16 Mar 2023 07:48:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230199AbjCPLsP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 16 Mar 2023 07:48:15 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F128B2563
        for <linux-clk@vger.kernel.org>; Thu, 16 Mar 2023 04:48:13 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id f18so1975617lfa.3
        for <linux-clk@vger.kernel.org>; Thu, 16 Mar 2023 04:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678967291;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mTZh2YGOKCD6ObCcKdxtN9WVXxV2EOgpOmxavrmWfT0=;
        b=zXe1vnI6M/xM41XSqvsnHBqtU+qvIuErQs9OBY9HFblT1K5NSW8wDQx9wXomvwKz8s
         GuQ8lqsC7EYEbC+J3bP1nyldIObtulzKHvTa84QK/sUUU8439kchpcdc2JoaEJSIruuM
         hHcLKTYJUAHf+jNwxgbPoYPnZRZW4qn0EYcvV1k3GdpShUMOX3IL+uQRT2+PrOWmCgBN
         Iqghp1CjJfbw07WtgUt9KQjqQb5kI7QQRnNkXv8R/AQhT+H+fXzufDtnoV5bfQnXpRIO
         mQiU5VIDUhFU4MxOPh1cMU1gCXpV301ABxLiJShoYQavUlYB5r5BApHil8TLLMArkz6L
         JeSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678967291;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mTZh2YGOKCD6ObCcKdxtN9WVXxV2EOgpOmxavrmWfT0=;
        b=tNS0DOCJUUcgrEKvyHxSMZspaCdA26pOwAwsHrpV/7d9epptRiSJCoiT3TpHM/1Nw9
         UtloZjoaYRwHSzmIE+P+Cc5AXwRNuPHpUx6aMqDfRbpUfT1x1a374OyIezVFaAeTGkFX
         siELHqQUoH5z4gUs3Cjvks6+Xk4kelCGzfBSzTlrpSpwo6s3Dq3SfGIHmqrd3vZiw879
         mIIEFr5Dr5i6SjPiVVWn09zaUZdXbUm8mwUL+Qwh9jyuy2HtUcsaVJ3LxWsvCDkAA2Mz
         IBr3v61eis0jFHmQb48hj/NlK2xldwfPz71e5xeM0Fopr5wEpP0+dMMNLQa/rHBK1mz/
         lSjA==
X-Gm-Message-State: AO0yUKXol2M4dhrcgKpzl51PkZLMOurrteE4VeTMkW58p4fDhVYXW04y
        jXd3PN9bDDCyl7t2xJrmaX4SWg==
X-Google-Smtp-Source: AK7set/dfPMrO+INaTGjLTo9Hn0MVYP5+g25TBUty0eN7zLTMKTrEKR4h0PYC90Dog4PmpGHesM0Ow==
X-Received: by 2002:a05:6512:390a:b0:4cb:d3:3b99 with SMTP id a10-20020a056512390a00b004cb00d33b99mr2753855lfu.36.1678967291271;
        Thu, 16 Mar 2023 04:48:11 -0700 (PDT)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id a14-20020a056512390e00b004d5a720e689sm1198443lfu.126.2023.03.16.04.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 04:48:11 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Thu, 16 Mar 2023 12:48:05 +0100
Subject: [PATCH 2/2] clk: qcom: dispcc-qcm2290: Add MDSS_CORE reset
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230316-topic-qcm_dispcc_reset-v1-2-dd3708853014@linaro.org>
References: <20230316-topic-qcm_dispcc_reset-v1-0-dd3708853014@linaro.org>
In-Reply-To: <20230316-topic-qcm_dispcc_reset-v1-0-dd3708853014@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678967287; l=1246;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=Onphm3eGwIsdqNCztm3twTm8oxjqL4WoJkseLjfhVRI=;
 b=KefS+jK5dQq+akWaS7mbsJFrPC4cM5qjQ7cFDJJZf+ymqIQZ04xzm2i9pN++v6JNl8t2M4hQ7dhz
 cQj23S0dC0Sf1q+AKAyy+9JMy7ke7zQ07yoAsEUrw9q9cNPKJ3F3
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add the MDSS_CORE reset which can be asserted to reset the state of
the entire MDSS.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/dispcc-qcm2290.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/clk/qcom/dispcc-qcm2290.c b/drivers/clk/qcom/dispcc-qcm2290.c
index 2ebd9a02b895..cbb5f1ec6a54 100644
--- a/drivers/clk/qcom/dispcc-qcm2290.c
+++ b/drivers/clk/qcom/dispcc-qcm2290.c
@@ -20,6 +20,7 @@
 #include "clk-regmap-divider.h"
 #include "common.h"
 #include "gdsc.h"
+#include "reset.h"
 
 enum {
 	P_BI_TCXO,
@@ -445,6 +446,10 @@ static struct clk_branch disp_cc_sleep_clk = {
 	},
 };
 
+static const struct qcom_reset_map disp_cc_qcm2290_resets[] = {
+	[DISP_CC_MDSS_CORE_BCR] = { 0x2000 },
+};
+
 static struct gdsc mdss_gdsc = {
 	.gdscr = 0x3000,
 	.pd = {
@@ -494,6 +499,8 @@ static const struct qcom_cc_desc disp_cc_qcm2290_desc = {
 	.num_clks = ARRAY_SIZE(disp_cc_qcm2290_clocks),
 	.gdscs = disp_cc_qcm2290_gdscs,
 	.num_gdscs = ARRAY_SIZE(disp_cc_qcm2290_gdscs),
+	.resets = disp_cc_qcm2290_resets,
+	.num_resets = ARRAY_SIZE(disp_cc_qcm2290_resets),
 };
 
 static const struct of_device_id disp_cc_qcm2290_match_table[] = {

-- 
2.39.2

