Return-Path: <SRS0=Sw4L=2H=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B546C2D0CD
	for <linux-clk@archiver.kernel.org>; Tue, 17 Dec 2019 21:05:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5DA2921775
	for <linux-clk@archiver.kernel.org>; Tue, 17 Dec 2019 21:05:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t3sDIijj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727954AbfLQVFL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 17 Dec 2019 16:05:11 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:35057 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727820AbfLQVFL (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 17 Dec 2019 16:05:11 -0500
Received: by mail-lj1-f196.google.com with SMTP id j6so12562835lja.2
        for <linux-clk@vger.kernel.org>; Tue, 17 Dec 2019 13:05:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aLf9wz93MEAXNDXIPlXLX3P5OWuWNJuqEQzvRIvyEF0=;
        b=t3sDIijjpkmZPa1OEJaHkKJD+lIEgJSbdZO8WFtcYy/wUdGrlDP6XzD7OsCmYBPyVh
         jUcYEpW6DOTKh7Fua/JyxY9y7QC+/FVLsctGhLahsyonTsJUj7eMf++WY0iJb+lWpoux
         K7FxHDDmBRW2X9539RCx1hd4HRnlyPD33Ja/hI9MfYBq7X8GiNOtIKlz78+zpyY1uv8p
         PAf9odOInpNCB9Jli85GEkVim383+dfWlyhKpUrFRFCGerCDIkRTTOpkovagyPIf7SRu
         Kc549zy2AWaejKFpMj1b9UGL/UEJqkgnrSERrQMXPANcxD6GSo/bIUeQVL1W9yydLJ9Y
         zDpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aLf9wz93MEAXNDXIPlXLX3P5OWuWNJuqEQzvRIvyEF0=;
        b=coGF/rjZ6vwJ0n3NxTgl9rLkBU2xCRpHWXBXoe3ReQS8bJ/a2ZuX4cB6Ol473ASsb5
         hpKqaARTFHHOgfBRaSNpQfCaFr2vXg/YH6dtFu1KDzO8T5IZsTyY58Cre7U+CG9m13FV
         G+qCADFguKu6A1BVPN+Bj5Eq5YWEIiY6Z58mDAUtYMGuYKXvy71tzgq/oV3tH/B06UTE
         ygYFm3v+t9Lg9Czjlxa26p/AnswebgNHGoJvx2mz70omNbwJ8Lr9iCzzo76xwUkR1WkO
         Bp3EjlbR4lsZoydaGAZzwI9vo+ODq6mTxZKXZjlaLP7MQSik0xnI/7mXuY0w43KT2kte
         Hp6g==
X-Gm-Message-State: APjAAAWrHkS3z1lg9Zp6RmlnoPH4y8C/KH62TdQ9POZIyuyEkhCDSjhp
        LrBWGOHX0Z3LRPaIugE82mY4keeMA1U0oQ==
X-Google-Smtp-Source: APXvYqwgbaxwnw809S062XGPwR4/odi9mZz+jctSDrWBOijOS3IZrE65A1TJvlgdb0G2BXJnPW0V+w==
X-Received: by 2002:a2e:8119:: with SMTP id d25mr508206ljg.76.1576616708754;
        Tue, 17 Dec 2019 13:05:08 -0800 (PST)
Received: from localhost.bredbandsbolaget (c-21cd225c.014-348-6c756e10.bbcust.telenor.se. [92.34.205.33])
        by smtp.gmail.com with ESMTPSA id u20sm13176467lju.34.2019.12.17.13.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2019 13:05:08 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH] clk: ux500: Fix up the SGA clock for some variants
Date:   Tue, 17 Dec 2019 22:05:04 +0100
Message-Id: <20191217210504.27888-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Some of the special PRCMU firmware variants were not
properly detected in the Ux500 clock driver, resulting
in the wrong clock for the SGA.

Cc: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Stephan Gerhold <stephan@gerhold.net>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/clk/ux500/u8500_of_clk.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/ux500/u8500_of_clk.c b/drivers/clk/ux500/u8500_of_clk.c
index 72ed97c6662a..0aedd42fad52 100644
--- a/drivers/clk/ux500/u8500_of_clk.c
+++ b/drivers/clk/ux500/u8500_of_clk.c
@@ -99,8 +99,10 @@ static void u8500_clk_init(struct device_node *np)
 	if (fw_version != NULL) {
 		switch (fw_version->project) {
 		case PRCMU_FW_PROJECT_U8500_C2:
+		case PRCMU_FW_PROJECT_U8500_MBL:
 		case PRCMU_FW_PROJECT_U8520:
 		case PRCMU_FW_PROJECT_U8420:
+		case PRCMU_FW_PROJECT_U8420_SYSCLK:
 			sgaclk_parent = "soc0_pll";
 			break;
 		default:
-- 
2.21.0

