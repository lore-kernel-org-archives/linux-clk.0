Return-Path: <SRS0=o1vG=5O=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E72BC2D0E9
	for <linux-clk@archiver.kernel.org>; Sun, 29 Mar 2020 12:40:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 760A82074A
	for <linux-clk@archiver.kernel.org>; Sun, 29 Mar 2020 12:40:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mMSWC9Wl"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727903AbgC2Mk6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 29 Mar 2020 08:40:58 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:33553 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728071AbgC2Mk6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 29 Mar 2020 08:40:58 -0400
Received: by mail-wm1-f65.google.com with SMTP id z14so999842wmf.0
        for <linux-clk@vger.kernel.org>; Sun, 29 Mar 2020 05:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BLEzhWnENW++58uso7jnvRVrHNKFwzmkO1EG1qT43zs=;
        b=mMSWC9Wl9gUG+hbmlN5DVGMIndzlmisEGP+2um//QsuR8BdwTikJj2ywCs6Jk+pzPm
         cGjLiZgcCY4X7xh8LGBSJB+tgJsWsMq2hmQuT0odIKgoIWRZYcUFihPWLneiOf5KVmv0
         mb6xSUe9lqnSXDaG7DMZ8y7QmqzrYKwWNoqVIhH13ZEAP0655nF0rvtODVmXxHHfsjb1
         yPgFX5XG5ANpKZcm++Kq+awDy5mqcEZp5XDdMSOFI+xYV63D+OSxRRlEamcaWuIfJQJt
         OCbiePSxj/tRFKi+MSLJMDTkPsW73GCHWeXu1JmwhBY/PZreXnIAAKFuwtFND1wBXyqg
         ueYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BLEzhWnENW++58uso7jnvRVrHNKFwzmkO1EG1qT43zs=;
        b=bWfZu4pul2+Zp4KKrTJciKrrnhAjwgysvptZm5yk/yp+C3+WIJ11jTdrgSJJLZmJ9v
         uHAZtIWKTbd6KcpVEVTAklJ3AgLcCLh/BK338hxVIDYMaVhhSppTssW2JliaHZRMb/jq
         O1P/uLIZTUSVhMIIYIpA9jLsUwAUun+B2CE2hOcSAr5+BOqt0K0OkhPpKRdhtbM18W5m
         5rRXA4HV21immjOA+TOSSNyukj5PyQr1cl7wjq0dWrjRdx1Jhd488o5YrN+NQcBBXxbd
         JVlSuSpwskR5pe7K3I/I99z7wBa7eSKJgucFTKQITSELqEuwgjGrSaROgSfxa3ng0l/R
         qZ9g==
X-Gm-Message-State: ANhLgQ0n482Gjr+9fl+iXONEpWEULbpLCro7m6b5Ta6j8YyLA/gnnwM4
        5mKYedS7BsJKJabWZ1C+OLIrHQ==
X-Google-Smtp-Source: ADFU+vsSH7nX5RJGeKH4uszUUBsFQyrhViiojJ7BQqr/IBInT+u4UUHRELdYpCG/bbMH/oqUvGTHHA==
X-Received: by 2002:a05:600c:234f:: with SMTP id 15mr8060396wmq.24.1585485655829;
        Sun, 29 Mar 2020 05:40:55 -0700 (PDT)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id w66sm16859162wma.38.2020.03.29.05.40.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2020 05:40:55 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH] clk: qcom: msm8916: Fix the address location of pll->config_reg
Date:   Sun, 29 Mar 2020 13:41:16 +0100
Message-Id: <20200329124116.4185447-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

During the process of debugging a processor derived from the msm8916 which
we found the new processor was not starting one of its PLLs.

After tracing the addresses and writes that downstream was doing and
comparing to upstream it became obvious that we were writing to a different
register location than downstream when trying to configure the PLL.

This error is also present in upstream msm8916.

As an example clk-pll.c::clk_pll_recalc_rate wants to write to
pll->config_reg updating the bit-field POST_DIV_RATIO. That bit-field is
defined in PLL_USER_CTL not in PLL_CONFIG_CTL. Taking the BIMC PLL as an
example

lm80-p0436-13_c_qc_snapdragon_410_processor_hrd.pdf

0x01823010 GCC_BIMC_PLL_USER_CTL
0x01823014 GCC_BIMC_PLL_CONFIG_CTL

This pattern is repeated for gpll0, gpll1, gpll2 and bimc_pll.

This error is likely not apparent since the bootloader will already have
initialized these PLLs.

This patch corrects the location of config_reg from PLL_CONFIG_CTL to
PLL_USER_CTL for all relevant PLLs on msm8916.

Fixes commit 3966fab8b6ab ("clk: qcom: Add MSM8916 Global Clock Controller support")

Cc: Georgi Djakov <georgi.djakov@linaro.org>
Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/clk/qcom/gcc-msm8916.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/gcc-msm8916.c b/drivers/clk/qcom/gcc-msm8916.c
index 4e329a7baf2b..17e4a5a2a9fd 100644
--- a/drivers/clk/qcom/gcc-msm8916.c
+++ b/drivers/clk/qcom/gcc-msm8916.c
@@ -260,7 +260,7 @@ static struct clk_pll gpll0 = {
 	.l_reg = 0x21004,
 	.m_reg = 0x21008,
 	.n_reg = 0x2100c,
-	.config_reg = 0x21014,
+	.config_reg = 0x21010,
 	.mode_reg = 0x21000,
 	.status_reg = 0x2101c,
 	.status_bit = 17,
@@ -287,7 +287,7 @@ static struct clk_pll gpll1 = {
 	.l_reg = 0x20004,
 	.m_reg = 0x20008,
 	.n_reg = 0x2000c,
-	.config_reg = 0x20014,
+	.config_reg = 0x20010,
 	.mode_reg = 0x20000,
 	.status_reg = 0x2001c,
 	.status_bit = 17,
@@ -314,7 +314,7 @@ static struct clk_pll gpll2 = {
 	.l_reg = 0x4a004,
 	.m_reg = 0x4a008,
 	.n_reg = 0x4a00c,
-	.config_reg = 0x4a014,
+	.config_reg = 0x4a010,
 	.mode_reg = 0x4a000,
 	.status_reg = 0x4a01c,
 	.status_bit = 17,
@@ -341,7 +341,7 @@ static struct clk_pll bimc_pll = {
 	.l_reg = 0x23004,
 	.m_reg = 0x23008,
 	.n_reg = 0x2300c,
-	.config_reg = 0x23014,
+	.config_reg = 0x23010,
 	.mode_reg = 0x23000,
 	.status_reg = 0x2301c,
 	.status_bit = 17,
-- 
2.25.1

