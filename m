Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B1CBC678D4
	for <linux-clk@archiver.kernel.org>; Tue,  7 Mar 2023 12:32:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230222AbjCGMcJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 7 Mar 2023 07:32:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230153AbjCGMcH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 7 Mar 2023 07:32:07 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88382769EE
        for <linux-clk@vger.kernel.org>; Tue,  7 Mar 2023 04:32:04 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id m6so16845009lfq.5
        for <linux-clk@vger.kernel.org>; Tue, 07 Mar 2023 04:32:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678192323;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aPs2AsYZOYaw55T4/U7uB6HluDp2jLmqFur5Lgl7Udk=;
        b=lK7Eu/N/ysN2wh72dor8CsgesQs98RJOZna5u/ukEz1oLX8YRdNbNDRGc4jcyEMRKM
         4TfTARbnX6WoV0YH69UfNrmSwElbwyZrSqKbNwZ1V8MwedHXNeMdGIm7h/QQlLz9fV9l
         yTawG25BE1AjrcycBPi60mgp838z4VmStZpC1dR/+9lWjJ/p85l2lyDpIoTiQ0oHSmXu
         vIOuWX9mg+iiMBUN7N5fVDcfBLFMFbUM42f7sSzXxa11YrsSoLrT+Jj5Rnr7HnUr/+5R
         qdtk4y8K/I63delBF3PAs61PurOwHiYTHMW/BkVRn108GPWOeH4eh5XB+R7SMVDSu1Mk
         Nf7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678192323;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aPs2AsYZOYaw55T4/U7uB6HluDp2jLmqFur5Lgl7Udk=;
        b=5+GNCfjACXe2V+23YB7sKr2nOy/95yiCv9QRvN/lxECOnMEnxqRfSycquAyb4rNodn
         AqlOqOtyPQtsMplNTuxpew1jbUKhYBOuXpatupcvzeXlLBahbRb0pUWEygVXrpr/6DGB
         2hxnpXwGyT4jURhPrYPNznMfnUrCWUNhEhUQ+cKxc4W5GdHAqMeNBsTPWaQilFLl8TiR
         6XToUK9TVPLT5141czurFLTuMo7WKajLJImoxrR4iL6hSgccg1vyrD+WDvgPbcYVcf4z
         8HBMnKjcrPGtP3m2ZQrQTNyzroB2OcbA6sLUlpND1OUtIi9UxVWFWGixUjxZTVGc230Z
         3jaA==
X-Gm-Message-State: AO0yUKWgZCiE+uykiGvrd+clfUz1bbw7JlmPggcnXvnjyd7PhSLvWBzT
        Yr5GPVlyzeNqnTYvw9vHHM0erA==
X-Google-Smtp-Source: AK7set+U3njUjM09dNb3PhuIwUi7v92VZ3jxeQsc4pQp6g50/l2NlUMjFGNBfyAF+0AeOnOrTUXGgQ==
X-Received: by 2002:ac2:560b:0:b0:4db:2c28:8974 with SMTP id v11-20020ac2560b000000b004db2c288974mr3923462lfd.12.1678192322765;
        Tue, 07 Mar 2023 04:32:02 -0800 (PST)
Received: from localhost.localdomain (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id t20-20020a2e7814000000b0029462e98c07sm2156501ljc.35.2023.03.07.04.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 04:32:02 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] clk: qcom: gcc-sm6375: Update the .pwrsts for usb gdsc
Date:   Tue,  7 Mar 2023 13:31:57 +0100
Message-Id: <20230307123159.3797551-1-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The USB controller on sm6375 doesn't retain its state when the system
goes into low power state and the GDSCs are turned off.

This can be observed by the USB connection not coming back alive after
putting the device into suspend, essentially breaking USB.

Work around this by updating the .pwrsts for the USB GDSCs so they only
transition to retention state in low power.

This change should be reverted when a proper suspend sequence is
implemented in the USB drivers.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
v1 -> v2:
- Reword "fix" to "work around", mention it should be temporary
- Add TODO:

 drivers/clk/qcom/gcc-sm6375.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-sm6375.c b/drivers/clk/qcom/gcc-sm6375.c
index ad3c4833990d..417a0fd242ec 100644
--- a/drivers/clk/qcom/gcc-sm6375.c
+++ b/drivers/clk/qcom/gcc-sm6375.c
@@ -3534,7 +3534,8 @@ static struct gdsc usb30_prim_gdsc = {
 	.pd = {
 		.name = "usb30_prim_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	/* TODO: Change to OFF_ON when USB drivers get proper suspend support */
+	.pwrsts = PWRSTS_RET_ON,
 };
 
 static struct gdsc ufs_phy_gdsc = {
-- 
2.39.2

