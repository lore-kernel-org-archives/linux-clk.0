Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F5B8C001B0
	for <linux-clk@archiver.kernel.org>; Fri,  7 Jul 2023 07:59:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232506AbjGGH7l (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 7 Jul 2023 03:59:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229692AbjGGH7k (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 7 Jul 2023 03:59:40 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FC69E70
        for <linux-clk@vger.kernel.org>; Fri,  7 Jul 2023 00:59:38 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1b89cfb4571so10542665ad.3
        for <linux-clk@vger.kernel.org>; Fri, 07 Jul 2023 00:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688716778; x=1691308778;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1cyFcCo0AIyHrkKebNzzbMpmXnBhNWrpNFTAuGFxeZk=;
        b=pBFTiIaUtf/RWLtnlfEgMlrQg7hqonr8cLMJRuDq3pxQxH3t3R+zQNtyYxq5ADvQla
         /s15FnswtpohBS7cH1uXyX0C5SRMGyTcIdOgao1saYFa+eW1yA5ic+IteYoHu7JYFh0S
         WDNeHuwFpYYLiRWeQrKqgzJX8GlaNtvA2kYaWcRuNHt0NesSZ0Ytap5EZZUp3786K2kz
         GuOY2bX6MvUeto3IX1P8UjiXaY3LuvjSCrRRwjQgxJgepjqctPlFtpJxcs2DcSHCLpdY
         FBiTb6n83l1I58hEzGSTmxA+Wl8gtu2orKBf7i4cfQu7vfOCMgYeoDC54w7j1kW9EEPh
         lwlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688716778; x=1691308778;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1cyFcCo0AIyHrkKebNzzbMpmXnBhNWrpNFTAuGFxeZk=;
        b=PT0zVLjRez+9LsDC40+3VYfYikxuxh8VwKMriwOzhLWlivU1VOhOC7SfPRA6FUg+Hl
         IhiPXY05JksU3WoccobD15JQOJ4y7fxj32PlFmu6VM6AruSI09aWYOwnmBLG9kDiWomg
         SQu5rxpUmhDCcACCgl/dS47sCmMNQSXI4xu/fwAzh+gKboz3xRCa09amvTWGO9b4RkQs
         UnuBC16mzoopNCkFMaCNt+3YmF6QLAOeeW8CEZEp9Ig80ERdN6Z5BOwHNT1eAlpmvikt
         LWcaPAjT+4xrCerZgoiGGB6SqqDTySj8RBkiy9s6bROf7AoLyVKtTti4+uMUyIRm+63o
         wm9g==
X-Gm-Message-State: ABy/qLbnhQ/c6shZN2mDXJjMmnOhXEvjhVVYrdqMbpnyMdu8YLAL+/Ad
        XZxSXlxvJl+pGarvdnyL+kzr
X-Google-Smtp-Source: APBJJlFLh04FpGQHsgqPpET6FSYphccKa+HKAmDFVCxp9XZGJEK9WPDG8svSExGUGYH8Q22HnEzFpQ==
X-Received: by 2002:a17:902:e5cf:b0:1b8:aee8:a21c with SMTP id u15-20020a170902e5cf00b001b8aee8a21cmr5299245plf.31.1688716778006;
        Fri, 07 Jul 2023 00:59:38 -0700 (PDT)
Received: from localhost.localdomain ([117.216.120.82])
        by smtp.gmail.com with ESMTPSA id e15-20020a17090301cf00b001b8c3c7b102sm2585255plh.127.2023.07.07.00.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 00:59:37 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org
Cc:     konrad.dybcio@linaro.org, johan+linaro@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3] clk: qcom: gcc-sc8280xp: Allow PCIe GDSCs to enter retention state
Date:   Fri,  7 Jul 2023 13:29:26 +0530
Message-Id: <20230707075926.11726-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

With the minimal system suspend support in place for the PCIe driver that
keeps the interconnect path voted, the ALWAYS_ON flag can now be dropped.

Also, the pwrsts PWRSTS_RET_ON flag should be used to allow the GDSCs to
enter the retention state when the parent domain get's turned off during
system suspend.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---

This patch depends on: https://lore.kernel.org/linux-arm-msm/20230620-topic-sc8280_gccgdsc-v2-0-562c1428c10d@linaro.org/

Changes in v3:

* Fixed the erroneous PWRSTS_RET_ON assignment
* Rebased on top of Konrad's series

Changes in v2:

* Changed the patch from simple revert to changing the ALWAYS_ON flag to
  PWRSTS_RET_ON.

 drivers/clk/qcom/gcc-sc8280xp.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sc8280xp.c b/drivers/clk/qcom/gcc-sc8280xp.c
index 57bbd609151c..39c46b7ee09a 100644
--- a/drivers/clk/qcom/gcc-sc8280xp.c
+++ b/drivers/clk/qcom/gcc-sc8280xp.c
@@ -6785,8 +6785,8 @@ static struct gdsc pcie_2a_gdsc = {
 	.pd = {
 		.name = "pcie_2a_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
-	.flags = VOTABLE | RETAIN_FF_ENABLE | ALWAYS_ON,
+	.pwrsts = PWRSTS_RET_ON,
+	.flags = VOTABLE | RETAIN_FF_ENABLE,
 };
 
 static struct gdsc pcie_2b_gdsc = {
@@ -6796,8 +6796,8 @@ static struct gdsc pcie_2b_gdsc = {
 	.pd = {
 		.name = "pcie_2b_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
-	.flags = VOTABLE | RETAIN_FF_ENABLE | ALWAYS_ON,
+	.pwrsts = PWRSTS_RET_ON,
+	.flags = VOTABLE | RETAIN_FF_ENABLE,
 };
 
 static struct gdsc pcie_3a_gdsc = {
@@ -6807,8 +6807,8 @@ static struct gdsc pcie_3a_gdsc = {
 	.pd = {
 		.name = "pcie_3a_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
-	.flags = VOTABLE | RETAIN_FF_ENABLE | ALWAYS_ON,
+	.pwrsts = PWRSTS_RET_ON,
+	.flags = VOTABLE | RETAIN_FF_ENABLE,
 };
 
 static struct gdsc pcie_3b_gdsc = {
@@ -6818,8 +6818,8 @@ static struct gdsc pcie_3b_gdsc = {
 	.pd = {
 		.name = "pcie_3b_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
-	.flags = VOTABLE | RETAIN_FF_ENABLE | ALWAYS_ON,
+	.pwrsts = PWRSTS_RET_ON,
+	.flags = VOTABLE | RETAIN_FF_ENABLE,
 };
 
 static struct gdsc pcie_4_gdsc = {
@@ -6829,8 +6829,8 @@ static struct gdsc pcie_4_gdsc = {
 	.pd = {
 		.name = "pcie_4_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
-	.flags = VOTABLE | RETAIN_FF_ENABLE | ALWAYS_ON,
+	.pwrsts = PWRSTS_RET_ON,
+	.flags = VOTABLE | RETAIN_FF_ENABLE,
 };
 
 static struct gdsc ufs_card_gdsc = {
-- 
2.25.1

