Return-Path: <SRS0=vj01=NQ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D8EAC0044C
	for <linux-clk@archiver.kernel.org>; Mon,  5 Nov 2018 19:41:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 57A4C20700
	for <linux-clk@archiver.kernel.org>; Mon,  5 Nov 2018 19:41:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="W5m5qrPk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 57A4C20700
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727329AbeKFFBa (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 6 Nov 2018 00:01:30 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:41135 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727104AbeKFFB3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 6 Nov 2018 00:01:29 -0500
Received: by mail-pl1-f193.google.com with SMTP id p16-v6so4945931plr.8
        for <linux-clk@vger.kernel.org>; Mon, 05 Nov 2018 11:40:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pI4ewn1BUBrFTZdP+TA4ALs6WsZqiCDZlYVV3iIyouE=;
        b=W5m5qrPkZBM7mHCTotExiHVHYzcjbzGlU1m5bsknmmvk1PycxDnNBH9HltrkKRpZvr
         rv0SwK1bTyKm5+0XmFe1TFpL/mCX6YTDPb275Xo+EnKQcqqb/uEV9CVavKSI62L8uEa6
         ljvoAWHZffB1pgRubqMtPg16VefU0A9fFgNks=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pI4ewn1BUBrFTZdP+TA4ALs6WsZqiCDZlYVV3iIyouE=;
        b=uNWmx9sW7QuVH4E3VLMCbWM75XPDwHO9Z9Gj5qzXRFRXpFHu4H9S2LsKkD/WhibGRh
         yVxbADFb6hS1RYd4x/gsS+ljI4jSs5HErZ1A3s1IIgVkbGkMimoTK2uTpC4lQKhNCajt
         F4LNGjnDZiY9BPEOmjJhODq2fs5LjOrTIckHAi7jQuLuauzwZOojWahBjlQiyszkMiFI
         +E2ozxbBCeN92W01peEkntmF4nvKK+QeZ0NtI7UC6k3i7C6JfNrqk+krQ0ayQeFMCiWS
         vsK6uboQmWI8hEP7yr0ewy19BCRS+/vOrhVFBdbxWuxeqLGWJKOSxuwdv4hifVbMRkTg
         Lq6Q==
X-Gm-Message-State: AGRZ1gLBP8L/4nr65E5jrxlj+g2i9dsbF7UpZ6EX0IpMpvTAJqeklJmR
        iz5d1Tv5V2xx5CSd95QAZC+Q6A==
X-Google-Smtp-Source: AJdET5dvfmxpvMGilEltcFOPlcH0Qv3unRzZ403TM4A9L+K83cS/i5JDjZ1pwRtquq645t56cpYVfw==
X-Received: by 2002:a17:902:6b82:: with SMTP id p2-v6mr23601265plk.50.1541446816339;
        Mon, 05 Nov 2018 11:40:16 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:1:fed3:9637:a13a:6c15])
        by smtp.gmail.com with ESMTPSA id q25sm700728pgb.2.2018.11.05.11.40.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Nov 2018 11:40:15 -0800 (PST)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Taniya Das <tdas@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH 2/2] clk: qcom: Support 'protected-clocks' property
Date:   Mon,  5 Nov 2018 11:40:11 -0800
Message-Id: <20181105194011.43770-3-swboyd@chromium.org>
X-Mailer: git-send-email 2.19.1.930.g4563a0d9d0-goog
In-Reply-To: <20181105194011.43770-1-swboyd@chromium.org>
References: <20181105194011.43770-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Certain firmware configurations "protect" clks and cause the entire
system to reboot when a non-secure OS such as Linux tries to read or
write protected clk registers. But other firmware configurations allow
reading or writing the same registers, and they may actually require
that the OS use the otherwise locked down clks. Support the
'protected-clocks' property by never registering these protected clks
with the common clk framework. This way, when firmware is protecting
these clks we won't have the chance to ever read or write these
registers and take down the entire system.

Cc: Taniya Das <tdas@codeaurora.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/clk/qcom/common.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
index db9b2471ac40..0a48ed56833b 100644
--- a/drivers/clk/qcom/common.c
+++ b/drivers/clk/qcom/common.c
@@ -191,6 +191,22 @@ int qcom_cc_register_sleep_clk(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(qcom_cc_register_sleep_clk);
 
+/* Drop 'protected-clocks' from the list of clocks to register */
+static void qcom_cc_drop_protected(struct device *dev, struct qcom_cc *cc)
+{
+	struct device_node *np = dev->of_node;
+	struct property *prop;
+	const __be32 *p;
+	u32 i;
+
+	of_property_for_each_u32(np, "protected-clocks", prop, p, i) {
+		if (i >= cc->num_rclks)
+			continue;
+
+		cc->rclks[i] = NULL;
+	}
+}
+
 static struct clk_hw *qcom_cc_clk_hw_get(struct of_phandle_args *clkspec,
 					 void *data)
 {
@@ -251,6 +267,8 @@ int qcom_cc_really_probe(struct platform_device *pdev,
 	cc->rclks = rclks;
 	cc->num_rclks = num_clks;
 
+	qcom_cc_drop_protected(dev, cc);
+
 	for (i = 0; i < num_clks; i++) {
 		if (!rclks[i])
 			continue;
-- 
Sent by a computer through tubes

