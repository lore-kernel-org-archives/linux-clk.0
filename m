Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76001C001DD
	for <linux-clk@archiver.kernel.org>; Sun, 25 Jun 2023 20:26:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230159AbjFYU0C (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 25 Jun 2023 16:26:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230175AbjFYUZ7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 25 Jun 2023 16:25:59 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FCBEE64
        for <linux-clk@vger.kernel.org>; Sun, 25 Jun 2023 13:25:56 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4f8775126d3so3176368e87.1
        for <linux-clk@vger.kernel.org>; Sun, 25 Jun 2023 13:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687724754; x=1690316754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=39CekJt2bg+dTnou8ZXeVeRak2YiAVNMpxW8X6GTBtU=;
        b=pZePDbwLmTp5CLqETeMXeQZ8LeNEEJAsCxNROc/8NWe5DHz5jrO7Z92KfK//jBW3a/
         TjgDvOCcJhph+mMXV0l/PBl9bFZey+1nUlCQCQT92KAOvsabPfWkqO3hi6E4/+fhBVM0
         5M4TJC4hcA3Kr0TWaTWicZ6Tt5KCsJin005WvtdqLkGk6hctZRG0nuyJBiLKHy4E2M0A
         lxx61jJ7guior9/wseqgDaVHmmG00Ynx+qNT3BBAOg0ONKAhKVIOmS3dzgQF8tb6KjAB
         JP2Ey1OKM0hqzBeDKG5RU8hmaBCbE5TCwvsOAhrE0mlyItf6fBSpd+lC+G9wCjWPwmdP
         Wk+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687724754; x=1690316754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=39CekJt2bg+dTnou8ZXeVeRak2YiAVNMpxW8X6GTBtU=;
        b=Gp5V9l5iub5/LTc3ggFXHW1/Ny6fF9b3Q5VU+dvOJw8dMBLMGD+f/ic8pfdolOFl82
         Zfsv1rGYstVP5sG19iFrBz43S/FeItouqCjkRss0DRkMOP3RN10ca1GIOc58YLat5Vci
         G0k+WgPqrAsFZ3yTcCVNUwnl159Po3A2uOPn/ude2UDXHMgC7BikhWRS8BFEI48bz6zp
         EOtgp1s+QjsOc5/IKJbjQOe9jFhbt6Z/uSZYaTCO9eBIZ4U59OPiE3sR8ChpdY1l/onM
         Cm5rJGizReEfiy9qrtXPFNSC6Bp4Bn7zZWaGF3Nbe3nADhCF14BdyPgPGJZ1vTtKRwcz
         N8Cw==
X-Gm-Message-State: AC+VfDyh6KBNFol89p1ohYCuCer7tz7jEDRPjUyQdfi0Gf2p2r6euCkN
        RvoeGgmcBTD9euCh3fWP5SaIng==
X-Google-Smtp-Source: ACHHUZ4eAaXE156DRPniC1J54MyG1vDnEpIan5OGQXdQv/iBAIM+CPW+jig6lpFAADo8yZAUq0tkeQ==
X-Received: by 2002:a05:6512:3c88:b0:4f9:6a7b:b8de with SMTP id h8-20020a0565123c8800b004f96a7bb8demr6876714lfv.3.1687724754516;
        Sun, 25 Jun 2023 13:25:54 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id m21-20020a195215000000b004f8427f8716sm787537lfb.262.2023.06.25.13.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jun 2023 13:25:54 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Ilia Lin <ilia.lin@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Georgi Djakov <djakov@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        Christian Marangi <ansuelsmth@gmail.com>,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH v2 06/26] interconnect: icc-clk: add support for scaling using OPP
Date:   Sun, 25 Jun 2023 23:25:27 +0300
Message-Id: <20230625202547.174647-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230625202547.174647-1-dmitry.baryshkov@linaro.org>
References: <20230625202547.174647-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Sometimes it might be required to scale the clock using the OPP
framework (e.g. to scale regulators following the required clock rate).
Extend the interconnec-clk framework to handle OPP case in addition to
scaling the clock.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/interconnect/icc-clk.c   | 13 +++++++++++--
 include/linux/interconnect-clk.h |  1 +
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/interconnect/icc-clk.c b/drivers/interconnect/icc-clk.c
index 4d43ebff4257..c7962acdcee7 100644
--- a/drivers/interconnect/icc-clk.c
+++ b/drivers/interconnect/icc-clk.c
@@ -7,10 +7,13 @@
 #include <linux/device.h>
 #include <linux/interconnect-clk.h>
 #include <linux/interconnect-provider.h>
+#include <linux/pm_opp.h>
 
 struct icc_clk_node {
+	struct device *dev;
 	struct clk *clk;
 	bool enabled;
+	bool opp;
 };
 
 struct icc_clk_provider {
@@ -25,12 +28,16 @@ struct icc_clk_provider {
 static int icc_clk_set(struct icc_node *src, struct icc_node *dst)
 {
 	struct icc_clk_node *qn = src->data;
+	unsigned long rate = icc_units_to_bps(src->peak_bw);
 	int ret;
 
 	if (!qn || !qn->clk)
 		return 0;
 
-	if (!src->peak_bw) {
+	if (qn->opp)
+		return dev_pm_opp_set_rate(qn->dev, rate);
+
+	if (!rate) {
 		if (qn->enabled)
 			clk_disable_unprepare(qn->clk);
 		qn->enabled = false;
@@ -45,7 +52,7 @@ static int icc_clk_set(struct icc_node *src, struct icc_node *dst)
 		qn->enabled = true;
 	}
 
-	return clk_set_rate(qn->clk, icc_units_to_bps(src->peak_bw));
+	return clk_set_rate(qn->clk, rate);
 }
 
 static int icc_clk_get_bw(struct icc_node *node, u32 *avg, u32 *peak)
@@ -106,7 +113,9 @@ struct icc_provider *icc_clk_register(struct device *dev,
 	icc_provider_init(provider);
 
 	for (i = 0, j = 0; i < num_clocks; i++) {
+		qp->clocks[i].dev = dev;
 		qp->clocks[i].clk = data[i].clk;
+		qp->clocks[i].opp = data[i].opp;
 
 		node = icc_node_create(first_id + j);
 		if (IS_ERR(node)) {
diff --git a/include/linux/interconnect-clk.h b/include/linux/interconnect-clk.h
index 0cd80112bea5..c695e5099901 100644
--- a/include/linux/interconnect-clk.h
+++ b/include/linux/interconnect-clk.h
@@ -11,6 +11,7 @@ struct device;
 struct icc_clk_data {
 	struct clk *clk;
 	const char *name;
+	bool opp;
 };
 
 struct icc_provider *icc_clk_register(struct device *dev,
-- 
2.39.2

