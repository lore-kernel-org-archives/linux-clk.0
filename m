Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E31BC43381
	for <linux-clk@archiver.kernel.org>; Mon,  4 Jan 2021 08:13:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D9DB9207B7
	for <linux-clk@archiver.kernel.org>; Mon,  4 Jan 2021 08:13:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726021AbhADINB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 4 Jan 2021 03:13:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726176AbhADINA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 4 Jan 2021 03:13:00 -0500
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F5A6C0617A0
        for <linux-clk@vger.kernel.org>; Mon,  4 Jan 2021 00:11:48 -0800 (PST)
Received: by mail-pl1-x62a.google.com with SMTP id 4so14143257plk.5
        for <linux-clk@vger.kernel.org>; Mon, 04 Jan 2021 00:11:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6K/LbU0XVZ+HxnpwCy+UchOVctXMQ6ehwHVLCHIYOAk=;
        b=AJVyxZqPY8oCUIhavLRxLVaeY/nKST4WwvW9m0zupZ8MN/jpsbqN7h9xR3nLQPzpgQ
         0LqiqdHsG4QGyDgoSlR9UDHybEgUSqAHSiLDCDamcg9m9ftmt0JacydO3qoF9fqZSgCv
         +S9yXQIJO+I37jM3O8f9dBWxMcNKhT7UR4u7nNRkbqqP9JgSbgt+MQyohLGBzXgGqJv9
         wexF8LPSezG975+OhcEB2t/rNAuNv1HFJp5uYI7tMCAyG891Rn3RzZXuiROrzI1pRd2j
         vciTnTYcm9phQVnQekJn+Ub0YZv3cJ1ldD2i7d2x7rQ65JaKjMzYOC+Sf/6FKHIPXnzT
         CDKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6K/LbU0XVZ+HxnpwCy+UchOVctXMQ6ehwHVLCHIYOAk=;
        b=U2sqMUmUmTu5kvw8aDOczXVAQ9M2wOSPERpVEbxVpdIgtmln8xDLr4Z+FMvk5EFOXV
         ZsX78rbTkVyr52AdmJKg028RrgvmIeoKNoAEB81/Q7tYthhB1IaaAImuSkD1Q3WzgL/5
         cORM/gumte44eFs7wRL6Q/lfuU30Ysfw0VBxvhf4DY2v9N+PDIxzYl+88lqtrBiMhajd
         DSwvXtfZdgqa8po26NNSFTUeRRBDZk7DfY477hRv0fnP5Slb7soG+1jjrUICLeRGMBUp
         Nuwjh+ra4FhxNeRi1DvweBt2WUe7t1zE0tDuextbxgSF7VGWKvJTHLVzAEQU16d93sua
         fu1w==
X-Gm-Message-State: AOAM532vAU+hoeObic1iFMzUt5Ccc/4ZwsPyr73RDcj0o2Qai8R5pWDo
        Re2e3jM5AnPqs6REdq2WH1Kw
X-Google-Smtp-Source: ABdhPJzhYZtn8bzfciFcE8dO9hSHVBO+5cC563MR9QrELztidEms03zF5whuSnELFVkoJnVXW+fJUA==
X-Received: by 2002:a17:90b:1218:: with SMTP id gl24mr27686229pjb.130.1609747907702;
        Mon, 04 Jan 2021 00:11:47 -0800 (PST)
Received: from localhost.localdomain ([103.77.37.160])
        by smtp.gmail.com with ESMTPSA id n7sm55051339pfn.141.2021.01.04.00.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jan 2021 00:11:47 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        jassisinghbrar@gmail.com
Cc:     viresh.kumar@linaro.org, ulf.hansson@linaro.org,
        bjorn.andersson@linaro.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 2/5] mailbox: qcom: Add support for SDX55 APCS IPC
Date:   Mon,  4 Jan 2021 13:41:22 +0530
Message-Id: <20210104081125.147300-3-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210104081125.147300-1-manivannan.sadhasivam@linaro.org>
References: <20210104081125.147300-1-manivannan.sadhasivam@linaro.org>
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
 drivers/mailbox/qcom-apcs-ipc-mailbox.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
index 077e5c6a9ef7..b00556450335 100644
--- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
+++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
@@ -61,6 +61,10 @@ static const struct qcom_apcs_ipc_data apps_shared_apcs_data = {
 	.offset = 12, .clk_name = NULL
 };
 
+static const struct qcom_apcs_ipc_data sdx55_apcs_data = {
+	.offset = 0x1008, .clk_name = "qcom-sdx55-acps-clk"
+};
+
 static const struct regmap_config apcs_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
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

