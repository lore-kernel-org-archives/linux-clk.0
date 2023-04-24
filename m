Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18BC8C77B7E
	for <linux-clk@archiver.kernel.org>; Mon, 24 Apr 2023 12:14:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229603AbjDXMOC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 24 Apr 2023 08:14:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231786AbjDXMOA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 24 Apr 2023 08:14:00 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9B9F213A
        for <linux-clk@vger.kernel.org>; Mon, 24 Apr 2023 05:13:57 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2a8ba693f69so40963971fa.0
        for <linux-clk@vger.kernel.org>; Mon, 24 Apr 2023 05:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=8devices.com; s=8devices; t=1682338436; x=1684930436;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IQtohBky33MWUdeKOY9B0Jdzwvi92+shTR5B/pXImXU=;
        b=hTVanmBkAGPFQtISg9J3XJ+Tlq36EE9E8yJoC4vcotb1vZS68CHyPzfh7MQQ3KWvoY
         iK5E+RDuVKGBgDraT25L+lP6aRY9vY5TBAPhsDMMC5T/sC1GHjJkFsiQKZ13439Hj1c/
         xYsZUD4g6tqsXZc8K7+UatulGP6AAL6GuPw+/HQb5rXNLRGw/XflGuZhZoIrrV2cGmYl
         t2vD/lCz/2DJDSxV0mIGHUpLhappR9I0zILDu+GTu1RHnryQCdbJgr5+nYEqHYU1iJm2
         wfD1i+mIaW7SXYr5NwaXh0u/cMNmHi59PymlPUg3al20pUR48scVRwUajHgsO9E1V2M5
         Vjvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682338436; x=1684930436;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IQtohBky33MWUdeKOY9B0Jdzwvi92+shTR5B/pXImXU=;
        b=PUOISeB6HR8J1CnfgjfPlTd2fhRRJ3n1CJHGYzEvfXWfEJsvNq/aOearQZBxdodf9w
         xwi3trynbJfh2l8MtRGHTcADCVBzHkB8/z/zsObirVOkmKDJq3EtKbdLaC8FFWgM/kxN
         AtzyHzlggfrfod91/C7Yxh8K8nU7AAfohGVWpJqML3JSk3Jq0Byi0PfEkaWNtAKv66bv
         m7qrfVK+LUAqw42d16UUV4ykBipFEPtBs83VQD0GCe8zaR+Q7XAZ+ojJ4nN/EWRZY4WG
         4PAKX2C/j+brAbhv08jiG739QcvwkA01jq8Hi5q9PKWJiukyXdT8Wz0MBqWDX6TiFfCj
         ccxg==
X-Gm-Message-State: AAQBX9exUbOQZVpq8j3tIp0+TBqY2te9xZ6AxhVZaziMCzFpd0MZY4GB
        LvKRKidcXNwE1lOhVCLouWG2lw==
X-Google-Smtp-Source: AKy350akQ8EciT+C0V8pKYtfqBhPEaEv5XPr4eaKZrvmhqi0oiXoFstBdBYa998MK2ui6b6T+gGuMQ==
X-Received: by 2002:a2e:2e0e:0:b0:2a8:d13d:88fb with SMTP id u14-20020a2e2e0e000000b002a8d13d88fbmr2642480lju.11.1682338436147;
        Mon, 24 Apr 2023 05:13:56 -0700 (PDT)
Received: from mantas-MS-7994.8devices.com ([84.15.37.222])
        by smtp.gmail.com with ESMTPSA id x23-20020a2e7c17000000b002a5f554d263sm1732382ljc.46.2023.04.24.05.13.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 24 Apr 2023 05:13:55 -0700 (PDT)
From:   Mantas Pucka <mantas@8devices.com>
To:     Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     Abhishek Sahu <absahu@codeaurora.org>,
        Anusha Canchi Ramachandra Rao <anusharao@codeaurora.org>,
        Sricharan R <sricharan@codeaurora.org>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, Mantas Pucka <mantas@8devices.com>
Subject: [PATCH 1/3] clk: qcom: gcc-ipq6018: Use floor ops for sdcc clocks
Date:   Mon, 24 Apr 2023 15:13:30 +0300
Message-Id: <1682338412-15420-1-git-send-email-mantas@8devices.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

SDCC clocks must be rounded down to avoid overclocking the controller.

Fixes: d9db07f088af ("clk: qcom: Add ipq6018 Global Clock Controller support")

Signed-off-by: Mantas Pucka <mantas@8devices.com>
---
 drivers/clk/qcom/gcc-ipq6018.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-ipq6018.c b/drivers/clk/qcom/gcc-ipq6018.c
index 3f9c2f61a5d9..5c5d1b04ea7a 100644
--- a/drivers/clk/qcom/gcc-ipq6018.c
+++ b/drivers/clk/qcom/gcc-ipq6018.c
@@ -1654,7 +1654,7 @@ static struct clk_rcg2 sdcc1_apps_clk_src = {
 		.name = "sdcc1_apps_clk_src",
 		.parent_data = gcc_xo_gpll0_gpll2_gpll0_out_main_div2,
 		.num_parents = 4,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_floor_ops,
 	},
 };
 
-- 
2.7.4

