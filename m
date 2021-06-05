Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95F10C47082
	for <linux-clk@archiver.kernel.org>; Sat,  5 Jun 2021 10:40:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 784766135D
	for <linux-clk@archiver.kernel.org>; Sat,  5 Jun 2021 10:40:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230153AbhFEKmq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 5 Jun 2021 06:42:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229981AbhFEKmq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 5 Jun 2021 06:42:46 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25E3FC061767
        for <linux-clk@vger.kernel.org>; Sat,  5 Jun 2021 03:40:58 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id g18so12060955edq.8
        for <linux-clk@vger.kernel.org>; Sat, 05 Jun 2021 03:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snejp.pl; s=gmail;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hj3/Nk+tqYRB1c5ojPz5XgdR7/8/e5iUg8MA/Htec1o=;
        b=ZyCuiia6imOYMBfDloSPJqp1YVwUtFj4UtM+6NJnEYdt9nB7GuzJzRtP391xT9A7AG
         kki7mUZ/mb7g0esRxTYp7ZH/iG0KyHISO3cD7uGlxYIT28+vRcVmZ5yUaSKnQlyglTJQ
         Lt8pJi2bVKJGhBjUIagF1fL20VfYm8GdVRDSZy6AsPY26eYs3PqExwEVwRDu+Tbsyner
         OGpQfrfRwBWrBuMkJcIF22HRKd0Hnmzd5YvGeMaH11wnaixT0T0YDg+tZzW0g/Ip4h+k
         8nDrPDBxld2cKHLTT7jgH1+eZdNNj1vkRbVYsh85sh36dG3IDN4Zbg/hae0bbMTiOrpB
         +a8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hj3/Nk+tqYRB1c5ojPz5XgdR7/8/e5iUg8MA/Htec1o=;
        b=evjoRYhpm0ako/ByAm0gF/ofB8tn9rIzqEqde8GGEpPC2cNnZl7/b6dKoC4qGsPEYt
         MnHzOgeTC7hucQLiX3J+HkPpM9vrRmmt9z7uXn2jyDl9V1oiztTH8FEPPNdrVWppGNyk
         mkkspOh2F9WL7FDBigosv1p+T6vH/mZ5b3pxdmrKAORVSAL1+GZ+u2dIMoZgh3zJKKTn
         Quk6HnMxllWxAcb7Xkl4ge4aKs5rIoC8Ud/GpPOMEtGcd0CsDtbkLZL+HTmsiRWkVr2x
         rsvxcqhF1PY9QExUo+58mzQ7BAYqAYx+RJv+5cymyNGfoYg772HpKhJJZNfHBOe6puPq
         ndVQ==
X-Gm-Message-State: AOAM532UjyRZQWElTROlP18fbac2Ca/JBL/WA5/IZ9X91Nzq1bhMVNSv
        dACH2uB4ppJg/ApkPrpo2hCAwQ==
X-Google-Smtp-Source: ABdhPJyE6j2DVkqFkGJfEn2XqF01kE5lQ5IRImg8mwauc2KXepuf/4gtvnDwnX7MeMrDSLt6OE9JYA==
X-Received: by 2002:a05:6402:848:: with SMTP id b8mr9714418edz.159.1622889656790;
        Sat, 05 Jun 2021 03:40:56 -0700 (PDT)
Received: from PackardBell (192038129059.mbb.telenor.dk. [192.38.129.59])
        by smtp.googlemail.com with ESMTPSA id gx28sm3991353ejc.107.2021.06.05.03.40.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jun 2021 03:40:56 -0700 (PDT)
Received: from localhost (PackardBell [local])
        by PackardBell (OpenSMTPD) with ESMTPA id 315d7738;
        Sat, 5 Jun 2021 10:40:53 +0000 (UTC)
From:   Bartosz Dudziak <bartosz.dudziak@snejp.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Bartosz Dudziak <bartosz.dudziak@snejp.pl>
Subject: [PATCH v2] clk: qcom: smd-rpmcc: Add support for MSM8226 rpm clocks
Date:   Sat,  5 Jun 2021 12:40:40 +0200
Message-Id: <20210605104040.12960-1-bartosz.dudziak@snejp.pl>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add compatible for rpm smd clocks, PMIC and bus clocks which are required
on MSM8226 for clients to vote on.

Signed-off-by: Bartosz Dudziak <bartosz.dudziak@snejp.pl>
---
 drivers/clk/qcom/clk-smd-rpm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index 295fc08edd..8bced53b49 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -914,6 +914,7 @@ static const struct rpm_smd_clk_desc rpm_clk_sdm660 = {
 };
 
 static const struct of_device_id rpm_smd_clk_match_table[] = {
+	{ .compatible = "qcom,rpmcc-msm8226", .data = &rpm_clk_msm8974 },
 	{ .compatible = "qcom,rpmcc-msm8916", .data = &rpm_clk_msm8916 },
 	{ .compatible = "qcom,rpmcc-msm8936", .data = &rpm_clk_msm8936 },
 	{ .compatible = "qcom,rpmcc-msm8974", .data = &rpm_clk_msm8974 },
-- 
2.25.1

