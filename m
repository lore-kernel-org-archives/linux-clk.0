Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3D68C43219
	for <linux-clk@archiver.kernel.org>; Mon, 28 Feb 2022 12:03:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236136AbiB1ME1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 28 Feb 2022 07:04:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236102AbiB1MEY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 28 Feb 2022 07:04:24 -0500
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7BED33343
        for <linux-clk@vger.kernel.org>; Mon, 28 Feb 2022 04:03:42 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id v22so17067962ljh.7
        for <linux-clk@vger.kernel.org>; Mon, 28 Feb 2022 04:03:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vMx1zrdqzaxXvIBHY8/KE2H7fWu3A+MnNVm30JFgEjE=;
        b=YCr/eRDE3P6FOQtVGYqVndsko0gU9Am5Q3sGZxhp8sWd1nJlitnIGwcqiixtsxODLL
         JhV/8onyOomECBVrQqXZs9Iko16CReh/1Rl6gHQlmgCMynqrn/J5G/2y81POgfsMSq4x
         e3msD53fpszBL1QKp8lnabvyP90qWo3WhLUAE20luknWnYfRMhcApTjessFlmBunfqD1
         zmuv2z0BtqEywK4ADz7ShJEkJKsLr4m0Mgb/rZm+eDrXGs9WIZP+843KEc2BkiUwe7Ym
         kQCMua8n8d7APkeh9cStXMICMoeIsn+RFzBfWFYR1Vuuo3hI+pVSySLcVdFON5b/WfL6
         gO0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vMx1zrdqzaxXvIBHY8/KE2H7fWu3A+MnNVm30JFgEjE=;
        b=FbjPm3mZ5gO8XCq36hBrl6FYmUbGANflfKUyjd93E10rvdROQP3DXAoOsSQZ9+ZPKI
         T3T38bNNjDLJi8uKOHiD1KUMvrWjw50LkLW2RJxDmTiV7oZLcq3M6wKzx2vG5QqWnXCP
         xbtpE2kS6aIUVa3Yt6uAHQsxlVM5wRtSCJuBzrc8N+XTkB7AhEB3p55OhlovPzkuJFsh
         d/rT+ym3SPYgk00eAMOU43T4RzQPbBmY6oa8opE+XpZXHYuZkia0hcVPfBz/VcDGygoI
         bv2w9bX1Wkiu4c5w9bOv1keGHkrazVwg7FhzBhBpjN8odiN/Fq1Nxl+Vg8tYLIeWdThe
         zebg==
X-Gm-Message-State: AOAM532Y042r4hi8uB0kynR7E64Gg9al+5Czr7FG4BrGMdsHnqBfMMlt
        21Uziwv8BGFEyuM4Hr1TlbCYsDDGMJZXlLIE
X-Google-Smtp-Source: ABdhPJy7xH3Qzv57w99oy70eiKV543CHzYZpxQlunKJ6PQWaKMdMdbBPIAKjTxzjnDwTLs/s3GO9ag==
X-Received: by 2002:a2e:6818:0:b0:235:3ae:c2c8 with SMTP id c24-20020a2e6818000000b0023503aec2c8mr13807607lja.252.1646049821019;
        Mon, 28 Feb 2022 04:03:41 -0800 (PST)
Received: from localhost.localdomain (88-113-46-102.elisa-laajakaista.fi. [88.113.46.102])
        by smtp.gmail.com with ESMTPSA id k11-20020a2e920b000000b002463777bbb9sm1284531ljg.24.2022.02.28.04.03.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 04:03:40 -0800 (PST)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 5/8] clk: qcom: Fix sorting of SDX_GCC_65 in Makefile and Kconfig
Date:   Mon, 28 Feb 2022 14:03:39 +0200
Message-Id: <20220228120339.997100-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220228120258.997027-1-vladimir.zapolskiy@linaro.org>
References: <20220228120258.997027-1-vladimir.zapolskiy@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Marijn Suijten <marijn.suijten@somainline.org>

In order to keep at least the list of `CONFIG_SM_` drivers sorted
alphabetically, SDX_GCC_65 should have been moved one line up.  This in
turn makes it easier and cleaner to add the followup SM_DISPCC_6125
driver in the right place, right before SM_DISPCC_8250.

Fixes: d79afa201328 ("clk: qcom: Add SDX65 GCC support")
Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/clk/qcom/Kconfig  | 14 +++++++-------
 drivers/clk/qcom/Makefile |  2 +-
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index f5b54bfc992f..161b257da9ca 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -574,13 +574,6 @@ config SDX_GCC_55
 	  Say Y if you want to use peripheral devices such as UART,
 	  SPI, I2C, USB, SD/UFS, PCIe etc.
 
-config SM_CAMCC_8250
-	tristate "SM8250 Camera Clock Controller"
-	select SM_GCC_8250
-	help
-	  Support for the camera clock controller on SM8250 devices.
-	  Say Y if you want to support camera devices and camera functionality.
-
 config SDX_GCC_65
 	tristate "SDX65 Global Clock Controller"
 	select QCOM_GDSC
@@ -589,6 +582,13 @@ config SDX_GCC_65
 	  Say Y if you want to use peripheral devices such as UART,
 	  SPI, I2C, USB, SD/UFS, PCIe etc.
 
+config SM_CAMCC_8250
+	tristate "SM8250 Camera Clock Controller"
+	select SM_GCC_8250
+	help
+	  Support for the camera clock controller on SM8250 devices.
+	  Say Y if you want to support camera devices and camera functionality.
+
 config SM_DISPCC_8250
 	tristate "SM8150 and SM8250 Display Clock Controller"
 	depends on SM_GCC_8150 || SM_GCC_8250
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index d96d6793fc7d..3e4eb843b8d2 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -84,8 +84,8 @@ obj-$(CONFIG_SDM_GPUCC_845) += gpucc-sdm845.o
 obj-$(CONFIG_SDM_LPASSCC_845) += lpasscc-sdm845.o
 obj-$(CONFIG_SDM_VIDEOCC_845) += videocc-sdm845.o
 obj-$(CONFIG_SDX_GCC_55) += gcc-sdx55.o
-obj-$(CONFIG_SM_CAMCC_8250) += camcc-sm8250.o
 obj-$(CONFIG_SDX_GCC_65) += gcc-sdx65.o
+obj-$(CONFIG_SM_CAMCC_8250) += camcc-sm8250.o
 obj-$(CONFIG_SM_DISPCC_8250) += dispcc-sm8250.o
 obj-$(CONFIG_SM_GCC_6115) += gcc-sm6115.o
 obj-$(CONFIG_SM_GCC_6125) += gcc-sm6125.o
-- 
2.33.0

