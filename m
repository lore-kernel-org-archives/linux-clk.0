Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE1B1C433E6
	for <linux-clk@archiver.kernel.org>; Fri,  8 Jan 2021 11:34:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8B7AD239FD
	for <linux-clk@archiver.kernel.org>; Fri,  8 Jan 2021 11:34:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726078AbhAHLeH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 8 Jan 2021 06:34:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726593AbhAHLeG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 8 Jan 2021 06:34:06 -0500
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96C02C0612FF
        for <linux-clk@vger.kernel.org>; Fri,  8 Jan 2021 03:32:55 -0800 (PST)
Received: by mail-pf1-x430.google.com with SMTP id c12so6053577pfo.10
        for <linux-clk@vger.kernel.org>; Fri, 08 Jan 2021 03:32:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HFCn4DrN5tcytFqIGARwmeCierFc1Kb78mBSzO9W+eo=;
        b=b5bZ2NhkOjV7VellrHdmvW8UPCU1cxaZG8XswMDojv7DVRq7RuTaIazHWcVzuUOGNe
         4xsVcKd90dTRaLlV6wkeGs9lmhysuRKMK6D4oHC9DwgNVD3FaJ8gQFBN+wQwHZPFEE9P
         2cqmqxqeRWsp+5FqQXencD9HfxkTCn9Bd3i2on7FGFGJD8/M8JjWtRg7yP/bw5ArGeVL
         ksVymKZi+nLUPiU4qkK3z7k93Szgd8FsPvbVWOQ/PMZfACwLfqwNgxq3nezxo95Rfcaf
         peQlOpn6AOyLlLZSJwX/gFyC4JlVTMc8aTZMCWjYtLVl7YEb0yg3uJqzSY4e1gLdQfzp
         07Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HFCn4DrN5tcytFqIGARwmeCierFc1Kb78mBSzO9W+eo=;
        b=heIFTo4QF48/hUH/OCI4UBcioyypbYNKmbbX7o3lGXnuonySTuG7RMp0C9J+fW99D3
         1u7BXUUQWoHb1CFC+5hSyMsyYz1B9gJq9jZaLo05JYIxi12z141GmCOd1idjxEc0HwtK
         7FhcDziU+iZ0bcgO/NO+6omqCagnW089CohnqhqWa0n0Lb5KPhTG4i5sjCLSAOVVNLQ+
         2Lmpgpc2bmYBCFhcAjZp2TZJRA93yWCtg4PO7YJEMtxUspwjlevBxMkDRlxAgEBsluXM
         Ytl13CSniLRzhthEekD1qo2HZ2+XJvl1ljyMkLifJG0m7ZRwwwFL3gwboLc9L8oS+aWM
         2fHA==
X-Gm-Message-State: AOAM531b3skEzkJCJ4cMP/gUKM8xVwMvM7jwObuoJ2dSo6+lqvN7TNLb
        njBNqIlw5y2kPKhd8nT+YmP+
X-Google-Smtp-Source: ABdhPJwyt0lKR1eZ3+pay1gSvPHa300MNibDSeSAAHd4WmKUexHWuW37nVr3tNnBI3vHbxvd74LQDw==
X-Received: by 2002:a62:528c:0:b029:19e:4a39:d9ea with SMTP id g134-20020a62528c0000b029019e4a39d9eamr3424004pfb.20.1610105575033;
        Fri, 08 Jan 2021 03:32:55 -0800 (PST)
Received: from localhost.localdomain ([103.77.37.188])
        by smtp.gmail.com with ESMTPSA id i25sm9261573pgb.33.2021.01.08.03.32.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jan 2021 03:32:53 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        jassisinghbrar@gmail.com
Cc:     viresh.kumar@linaro.org, ulf.hansson@linaro.org,
        bjorn.andersson@linaro.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 2/5] mailbox: qcom: Add support for SDX55 APCS IPC
Date:   Fri,  8 Jan 2021 17:02:30 +0530
Message-Id: <20210108113233.75418-3-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210108113233.75418-1-manivannan.sadhasivam@linaro.org>
References: <20210108113233.75418-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

In SDX55, the IPC bits are located in the APCS GCC block. Also, this block
can provide clock functionality. Hence, add support for IPC with correct
offset and name of the clock provider.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/mailbox/qcom-apcs-ipc-mailbox.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
index 077e5c6a9ef7..1c205832a1cc 100644
--- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
+++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
@@ -61,11 +61,15 @@ static const struct qcom_apcs_ipc_data apps_shared_apcs_data = {
 	.offset = 12, .clk_name = NULL
 };
 
+static const struct qcom_apcs_ipc_data sdx55_apcs_data = {
+	.offset = 0x1008, .clk_name = "qcom-sdx55-acps-clk"
+};
+
 static const struct regmap_config apcs_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
 	.val_bits = 32,
-	.max_register = 0xFFC,
+	.max_register = 0x1008,
 	.fast_io = true,
 };
 
@@ -162,6 +166,7 @@ static const struct of_device_id qcom_apcs_ipc_of_match[] = {
 	{ .compatible = "qcom,sdm660-apcs-hmss-global", .data = &sdm660_apcs_data },
 	{ .compatible = "qcom,sdm845-apss-shared", .data = &apps_shared_apcs_data },
 	{ .compatible = "qcom,sm8150-apss-shared", .data = &apps_shared_apcs_data },
+	{ .compatible = "qcom,sdx55-apcs-gcc", .data = &sdx55_apcs_data },
 	{}
 };
 MODULE_DEVICE_TABLE(of, qcom_apcs_ipc_of_match);
-- 
2.25.1

