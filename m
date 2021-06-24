Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5FDDC48BDF
	for <linux-clk@archiver.kernel.org>; Thu, 24 Jun 2021 08:47:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9684E613E3
	for <linux-clk@archiver.kernel.org>; Thu, 24 Jun 2021 08:47:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229573AbhFXIuI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 24 Jun 2021 04:50:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbhFXIuI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 24 Jun 2021 04:50:08 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9284C06175F
        for <linux-clk@vger.kernel.org>; Thu, 24 Jun 2021 01:47:49 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id t3so7375059edc.7
        for <linux-clk@vger.kernel.org>; Thu, 24 Jun 2021 01:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=deviqon.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3beJCK47iYcCQoPpTeNCafKWJMPyjBWHMs2C9W8/fyY=;
        b=tLd/qzhMHVLKc+9KmNB81Fu7KJ2HXQJrg9oX23hvl1usJCk9a3rf20uhOoutD8mwrG
         7mXS4ME3/sJ7CpVanjyQd8CZ6e8kaCbiidDi6TpJ3+wScAiVXrF06jxRk7eqWX8atzSn
         Qu5fNZs8l8GkqBBK81H0PJmcqK7Ram+TeXnd5zVER28SOVgm38YORaA0Piu6dqDwRtCz
         71C0+GIw5+yUkbFBhdgw27QOaOzoyBsXWg329u/kqLQmgm2ZvDnRqyKdDdpkUm1hRlEN
         nPNqCTyhADIeMDlRAAYw0j/LtrR53kca+0YXLLIbwHuOOkZ6TBdwlbZgRF4eZy6MHGQG
         Jtow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3beJCK47iYcCQoPpTeNCafKWJMPyjBWHMs2C9W8/fyY=;
        b=LY1MhQGpSdoOm+yp6FdegslmWfqnr6DSw5IgZKR8cg9rC0g6Gjn0eCIXiDrW7TKFDf
         oqp8YKHpzfnCzc528gs/+xNLv9tpaQHyZZm9xJDv0tfto944x7lD7fxmec/JiwJbBPYq
         FDZPYFqHfs4Qd8/oSw9HIFPFi5+JKWRjvnhQAdRr4cqtHty4twaNJ8qc7WqJVhGjebmE
         3Ohh1+R5KzCNWKbNgXdeiFRKwDcB/pwHh9DFDB5MlVaH6vOqwXnr+17qURGjFl2chmxT
         6/HkkheXAEew2jTv9Ozc9b1FTSn/gPN3DALdRnWSbtJARiEfbvzGmTAWRTxadvAInZnd
         yY0g==
X-Gm-Message-State: AOAM533S+MIYlDcoh4PrxCXw8/jbvTDGr5b4cDiuN/02WmFj9TfuWWrJ
        FDm4E/IdqrpTkbD1UY2DmTaZJyeDXhnuouFh
X-Google-Smtp-Source: ABdhPJzFUyIQeIv0Hj7mjfxoBxRanCL1jf/TWrJO9oCt2Rky48z9Hu7axK1WWB0nTyh327UMJkpbcQ==
X-Received: by 2002:a05:6402:781:: with SMTP id d1mr5749413edy.32.1624524468124;
        Thu, 24 Jun 2021 01:47:48 -0700 (PDT)
Received: from neptune.. ([5.2.193.191])
        by smtp.gmail.com with ESMTPSA id hz11sm883612ejc.125.2021.06.24.01.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jun 2021 01:47:47 -0700 (PDT)
From:   Alexandru Ardelean <aardelean@deviqon.com>
To:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
Cc:     pdeschrijver@nvidia.com, pgaikwad@nvidia.com,
        mturquette@baylibre.com, sboyd@kernel.org,
        thierry.reding@gmail.com, jonathanh@nvidia.com,
        Alexandru Ardelean <aardelean@deviqon.com>
Subject: [PATCH] clk: tegra: clk-tegra124-dfll-fcpu: don't use devm functions for regulator
Date:   Thu, 24 Jun 2021 11:47:37 +0300
Message-Id: <20210624084737.42336-1-aardelean@deviqon.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The purpose of the device-managed functions is to bind the life-time of an
object to that of a parent device object.

This is not the case for the 'vdd-cpu' regulator in this driver. A
reference is obtained via devm_regulator_get() and immediately released
with devm_regulator_put().

In this case, the usage of devm_ functions is slightly excessive, as the
un-managed versions of these functions is a little cleaner (and slightly
more economical in terms of allocation).

This change converts the devm_regulator_{get,put}() to
regulator_{get,put}() in the get_alignment_from_regulator() function of
this driver.

Signed-off-by: Alexandru Ardelean <aardelean@deviqon.com>
---
 drivers/clk/tegra/clk-tegra124-dfll-fcpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c b/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
index 2ac2679d696d..5e339ad0a97c 100644
--- a/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
+++ b/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
@@ -537,7 +537,7 @@ static void get_alignment_from_dt(struct device *dev,
 static int get_alignment_from_regulator(struct device *dev,
 					 struct rail_alignment *align)
 {
-	struct regulator *reg = devm_regulator_get(dev, "vdd-cpu");
+	struct regulator *reg = regulator_get(dev, "vdd-cpu");
 
 	if (IS_ERR(reg))
 		return PTR_ERR(reg);
@@ -545,7 +545,7 @@ static int get_alignment_from_regulator(struct device *dev,
 	align->offset_uv = regulator_list_voltage(reg, 0);
 	align->step_uv = regulator_get_linear_step(reg);
 
-	devm_regulator_put(reg);
+	regulator_put(reg);
 
 	return 0;
 }
-- 
2.31.1

