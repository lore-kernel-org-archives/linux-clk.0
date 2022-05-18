Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66339C433FE
	for <linux-clk@archiver.kernel.org>; Wed, 18 May 2022 17:29:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241113AbiERR3R (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 18 May 2022 13:29:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241093AbiERR3Q (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 18 May 2022 13:29:16 -0400
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com [IPv6:2607:f8b0:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 033531B1CFF
        for <linux-clk@vger.kernel.org>; Wed, 18 May 2022 10:29:16 -0700 (PDT)
Received: by mail-il1-x130.google.com with SMTP id o16so1979173ilq.8
        for <linux-clk@vger.kernel.org>; Wed, 18 May 2022 10:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Rkbt5ZVirKns48qhAK32oNhTzBfAgzibIPoeemaAR3g=;
        b=nUK1oeTrUAfeqqk3C+bw0qeWUnjgBaBkRmxULrrBygyH+hB4XY3AhMJZNoxGD2smEH
         NKg4xRjMKpGoPcVkytsbluGsvzXwGZ/5XgrQbbhygb9c+w2O0nzk/PDBsDxBQUuh97km
         rChdta0ljTnT/XVwZMAItPyVL6DifqbBwxWehDVkxUVfnW9wzNIMVnK2WEplpdAswWjj
         m2XH56f+p7VgJAKA7K43C8vzuS1xEkbcShKT0hb9c2h2yVFm6snDFrslQ+ZCerxLO3kY
         UCTYgzLa6sIWWSm9DMVOG36M2v7es4GAc1CCg1ZbNHWkxt/pixBaRYUPJrDw+9VZ5bTy
         iPOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Rkbt5ZVirKns48qhAK32oNhTzBfAgzibIPoeemaAR3g=;
        b=pbVzIxKHZGehP4jktoeF3Hsw5SuHLFbH4qFv1ZgQyz9jZyaqwsm0t6PAIi7R7qrFTI
         GosB09VTiPzLlKdpOjEU8c0NmHY1LwOxgIDkUgYSjP6uG+a20I2vRNsnlABBmTkNZ/rE
         yw47RKVfAhxlvzZ+yJhtvuzI9X1hjr91rOxEh/FxfJzB0R8g4I/vk9NQlVvasrRqCDjk
         k541L8h45ZaaBKKV0JhujIJYQ5B18tFivxDigbwM5N8gw2tQunqcayjekVb50vJDLH3O
         TbXMkli8rRnd0UTkhSKmhNbdw5gzNZtl1y9k6WLFvaQ3p/rbQVKounrx5OpBek/vT8kx
         6AZw==
X-Gm-Message-State: AOAM531DH33rEd7mlAu7CcZ4ZWKXDbuXPYEME+zvkd8xkYM6OECHx51Z
        l+F6C0OXocyYdPTZrjEblZrsog==
X-Google-Smtp-Source: ABdhPJybPTe3txnO3Cq6UgUh1aOBNY4CNC0u4kYHHq2OmtynBN31vFZgDyxhb5p3pYgqYC/L+Urj0g==
X-Received: by 2002:a05:6e02:1bea:b0:2cf:5e28:aa5b with SMTP id y10-20020a056e021bea00b002cf5e28aa5bmr419280ilv.183.1652894955436;
        Wed, 18 May 2022 10:29:15 -0700 (PDT)
Received: from maple.netwinder.org (rfs.netwinder.org. [206.248.184.2])
        by smtp.gmail.com with ESMTPSA id v11-20020a05663812cb00b0032ba5cbae2esm12858jas.144.2022.05.18.10.29.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 May 2022 10:29:15 -0700 (PDT)
From:   Ralph Siemsen <ralph.siemsen@linaro.org>
To:     linux-renesas-soc@vger.kernel.org
Cc:     phil.edworthy@renesas.com,
        Ralph Siemsen <ralph.siemsen@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-clk@vger.kernel.org
Subject: [PATCH 3/3] clk: renesas: r9a06g032: remove unused field
Date:   Wed, 18 May 2022 13:27:17 -0400
Message-Id: <20220518172808.1691450-3-ralph.siemsen@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220518172808.1691450-1-ralph.siemsen@linaro.org>
References: <20220518172808.1691450-1-ralph.siemsen@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

As the D_UGATE macro no longer uses _gi, drop it from all declarations.

Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
---
 drivers/clk/renesas/r9a06g032-clocks.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/renesas/r9a06g032-clocks.c b/drivers/clk/renesas/r9a06g032-clocks.c
index 9dbcf9620fa0..fe56560c54df 100644
--- a/drivers/clk/renesas/r9a06g032-clocks.c
+++ b/drivers/clk/renesas/r9a06g032-clocks.c
@@ -79,7 +79,7 @@ struct r9a06g032_clkdesc {
 		.source = 1 + R9A06G032_##_src, .name = _n, \
 		.reg = _reg, .div_min = _min, .div_max = _max, \
 		.div_table = { __VA_ARGS__ } }
-#define D_UGATE(_idx, _n, _src, _g, _gi, _g1, _r1, _g2, _r2) \
+#define D_UGATE(_idx, _n, _src, _g, _g1, _r1, _g2, _r2) \
 	{ .type = K_DUALGATE, .index = R9A06G032_##_idx, \
 		.source = 1 + R9A06G032_##_src, .name = _n, \
 		.dual = { .group = _g, \
@@ -297,14 +297,14 @@ static const struct r9a06g032_clkdesc r9a06g032_clocks[] = {
 		.dual.sel = ((0xec / 4) << 5) | 24,
 		.dual.group = 1,
 	},
-	D_UGATE(CLK_UART0, "clk_uart0", UART_GROUP_012, 0, 0, 0x1b2, 0x1b3, 0x1b4, 0x1b5),
-	D_UGATE(CLK_UART1, "clk_uart1", UART_GROUP_012, 0, 1, 0x1b6, 0x1b7, 0x1b8, 0x1b9),
-	D_UGATE(CLK_UART2, "clk_uart2", UART_GROUP_012, 0, 2, 0x1ba, 0x1bb, 0x1bc, 0x1bd),
-	D_UGATE(CLK_UART3, "clk_uart3", UART_GROUP_34567, 1, 0, 0x760, 0x761, 0x762, 0x763),
-	D_UGATE(CLK_UART4, "clk_uart4", UART_GROUP_34567, 1, 1, 0x764, 0x765, 0x766, 0x767),
-	D_UGATE(CLK_UART5, "clk_uart5", UART_GROUP_34567, 1, 2, 0x768, 0x769, 0x76a, 0x76b),
-	D_UGATE(CLK_UART6, "clk_uart6", UART_GROUP_34567, 1, 3, 0x76c, 0x76d, 0x76e, 0x76f),
-	D_UGATE(CLK_UART7, "clk_uart7", UART_GROUP_34567, 1, 4, 0x770, 0x771, 0x772, 0x773),
+	D_UGATE(CLK_UART0, "clk_uart0", UART_GROUP_012, 0, 0x1b2, 0x1b3, 0x1b4, 0x1b5),
+	D_UGATE(CLK_UART1, "clk_uart1", UART_GROUP_012, 0, 0x1b6, 0x1b7, 0x1b8, 0x1b9),
+	D_UGATE(CLK_UART2, "clk_uart2", UART_GROUP_012, 0, 0x1ba, 0x1bb, 0x1bc, 0x1bd),
+	D_UGATE(CLK_UART3, "clk_uart3", UART_GROUP_34567, 1, 0x760, 0x761, 0x762, 0x763),
+	D_UGATE(CLK_UART4, "clk_uart4", UART_GROUP_34567, 1, 0x764, 0x765, 0x766, 0x767),
+	D_UGATE(CLK_UART5, "clk_uart5", UART_GROUP_34567, 1, 0x768, 0x769, 0x76a, 0x76b),
+	D_UGATE(CLK_UART6, "clk_uart6", UART_GROUP_34567, 1, 0x76c, 0x76d, 0x76e, 0x76f),
+	D_UGATE(CLK_UART7, "clk_uart7", UART_GROUP_34567, 1, 0x770, 0x771, 0x772, 0x773),
 };
 
 struct r9a06g032_priv {
-- 
2.25.1

