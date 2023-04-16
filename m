Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90982C77B73
	for <linux-clk@archiver.kernel.org>; Sun, 16 Apr 2023 15:00:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229774AbjDPPAP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 16 Apr 2023 11:00:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229672AbjDPPAP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 16 Apr 2023 11:00:15 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41D8CA6
        for <linux-clk@vger.kernel.org>; Sun, 16 Apr 2023 08:00:13 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-6a42afd77abso455789a34.1
        for <linux-clk@vger.kernel.org>; Sun, 16 Apr 2023 08:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681657212; x=1684249212;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+fpiS9sF0S365faNHxi4OaPza89UOtPx9+KzqrqO3OU=;
        b=XPoxAZ/9BzkucIoLG8eDBxRicKYmh4vtlkGRGfqZyKjvQsKfhgFr2QAdliWj5cjiZm
         2gpOUbgj0m0z4bUwRyvjkJBIbvk3H/EtvuuZgzEp7N1Vf9vqvD9dAxQTPviRWbecKlwZ
         IRkTdyxjp+yHV+qO0Eocn1Ab9FmIQ+LKzoN6vI2DC2ok+sejn2pdIayjbAoSYvanms6a
         AFr/5yB151cBJGWQQw6ehSTAlV/9HQYAsYophiyghipazcQQxAh2uquLFS+A5qISQFWF
         rYZa9FUF4yg3NekBe8dylqkFMYrGOn79a+NyKCaPD19DOQQJZtLs5pJRY/bME8Z9WsDt
         ggRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681657212; x=1684249212;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+fpiS9sF0S365faNHxi4OaPza89UOtPx9+KzqrqO3OU=;
        b=ABrY4YJ6yBRHCDMvnWHW5JlwtcJ4Xf6/uQp4pT5N/2sec6XX2Z3zIXBAeMUq9xI9YV
         dtnT+iIJP1YD+CbA3BlHG9nKlWgr+WTc0Tc8+5HxmrqU+uOVguXI6uk6HKyW+fEbx/mI
         8DpVVxWP2YrJ/2TsW1EPxvB5gqw7xxUujpvnddvsl6AiJH5Z/rfz6TlZPm9nKdNRkKX0
         kwWJ2tYh8XhnxCIKfKIlZoU7vo399vVJnHppaJ0/iWXuu8gIIjUHdhvCmWxjj2GBbdPc
         bJQn/95TIr2QCyxvud9a7xY3GbOkOIhohDzLEWlBLJGMtkzw5jI2aczZxAtCLijfaTFo
         Eebw==
X-Gm-Message-State: AAQBX9eZQ/rdUfGvxyHSCeARiFWR6jHqcLZeLWqdevfNIUjC3Ni9seSx
        826dsPqYXw/zp2JMMRWNLg6bcetrGt8=
X-Google-Smtp-Source: AKy350bxV36Ibls7OSAOhDK9JycCBXP4HKUdgQKJWCv8XweXDtuJ8X+xx2VzP3zQypLM4WxSlsbigQ==
X-Received: by 2002:a05:6870:332b:b0:183:fed0:940 with SMTP id x43-20020a056870332b00b00183fed00940mr5120901oae.1.1681657212486;
        Sun, 16 Apr 2023 08:00:12 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b69:70b9:3a68:ec59:4ade])
        by smtp.gmail.com with ESMTPSA id y6-20020a9d6346000000b006a17bbe32f8sm3569252otk.51.2023.04.16.08.00.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Apr 2023 08:00:11 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     abelvesa@kernel.org
Cc:     sboyd@kernel.org, linux-clk@vger.kernel.org,
        Fabio Estevam <festevam@denx.de>
Subject: [PATCH] clk: imx: imx6sx: Remove CLK_SET_RATE_PARENT from the LDB clocks
Date:   Sun, 16 Apr 2023 12:00:04 -0300
Message-Id: <20230416150004.16834-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Fabio Estevam <festevam@denx.de>

On the i.MX6SX, it is common to use the LDB and LCDIF with the same
parent clock, such as the IMX6SX_CLK_PLL5_VIDEO_DIV, for example.

Due to the CLK_SET_RATE_PARENT flag, the LDB clock would try to set the
clock parent rate, which can mess with the required clock rate calculated
from the eLCDIF driver.

To prevent this problem, remove the CLK_SET_RATE_PARENT flag from the
LDB clocks, so that a correct clock relationship can be achieved.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 drivers/clk/imx/clk-imx6sx.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/imx/clk-imx6sx.c b/drivers/clk/imx/clk-imx6sx.c
index 7cf86707bc39..3f1502933e59 100644
--- a/drivers/clk/imx/clk-imx6sx.c
+++ b/drivers/clk/imx/clk-imx6sx.c
@@ -302,10 +302,10 @@ static void __init imx6sx_clocks_init(struct device_node *ccm_node)
 	hws[IMX6SX_CLK_CKO2_SEL]           = imx_clk_hw_mux("cko2_sel",         base + 0x60,  16,     5,      cko2_sels,         ARRAY_SIZE(cko2_sels));
 	hws[IMX6SX_CLK_CKO]                = imx_clk_hw_mux("cko",              base + 0x60,  8,      1,      cko_sels,          ARRAY_SIZE(cko_sels));
 
-	hws[IMX6SX_CLK_LDB_DI1_DIV_SEL]    = imx_clk_hw_mux_flags("ldb_di1_div_sel", base + 0x20, 11, 1, ldb_di1_div_sels, ARRAY_SIZE(ldb_di1_div_sels), CLK_SET_RATE_PARENT);
-	hws[IMX6SX_CLK_LDB_DI0_DIV_SEL]    = imx_clk_hw_mux_flags("ldb_di0_div_sel", base + 0x20, 10, 1, ldb_di0_div_sels, ARRAY_SIZE(ldb_di0_div_sels), CLK_SET_RATE_PARENT);
-	hws[IMX6SX_CLK_LDB_DI1_SEL]        = imx_clk_hw_mux_flags("ldb_di1_sel",     base + 0x2c, 12, 3, ldb_di1_sels,      ARRAY_SIZE(ldb_di1_sels),    CLK_SET_RATE_PARENT);
-	hws[IMX6SX_CLK_LDB_DI0_SEL]        = imx_clk_hw_mux_flags("ldb_di0_sel",     base + 0x2c, 9,  3, ldb_di0_sels,      ARRAY_SIZE(ldb_di0_sels),    CLK_SET_RATE_PARENT);
+	hws[IMX6SX_CLK_LDB_DI1_DIV_SEL]    = imx_clk_hw_mux("ldb_di1_div_sel", base + 0x20, 11, 1, ldb_di1_div_sels, ARRAY_SIZE(ldb_di1_div_sels));
+	hws[IMX6SX_CLK_LDB_DI0_DIV_SEL]    = imx_clk_hw_mux("ldb_di0_div_sel", base + 0x20, 10, 1, ldb_di0_div_sels, ARRAY_SIZE(ldb_di0_div_sels));
+	hws[IMX6SX_CLK_LDB_DI1_SEL]        = imx_clk_hw_mux("ldb_di1_sel",     base + 0x2c, 12, 3, ldb_di1_sels,      ARRAY_SIZE(ldb_di1_sels));
+	hws[IMX6SX_CLK_LDB_DI0_SEL]        = imx_clk_hw_mux("ldb_di0_sel",     base + 0x2c, 9,  3, ldb_di0_sels,      ARRAY_SIZE(ldb_di0_sels));
 	hws[IMX6SX_CLK_LCDIF1_PRE_SEL]     = imx_clk_hw_mux_flags("lcdif1_pre_sel",  base + 0x38, 15, 3, lcdif1_pre_sels,   ARRAY_SIZE(lcdif1_pre_sels), CLK_SET_RATE_PARENT);
 	hws[IMX6SX_CLK_LCDIF1_SEL]         = imx_clk_hw_mux_flags("lcdif1_sel",      base + 0x38, 9,  3, lcdif1_sels,       ARRAY_SIZE(lcdif1_sels),     CLK_SET_RATE_PARENT);
 
-- 
2.34.1

