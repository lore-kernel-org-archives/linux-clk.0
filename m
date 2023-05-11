Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52BF3C77B7F
	for <linux-clk@archiver.kernel.org>; Thu, 11 May 2023 13:34:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238275AbjEKNeG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 11 May 2023 09:34:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238279AbjEKNdb (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 11 May 2023 09:33:31 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D56FEAD11
        for <linux-clk@vger.kernel.org>; Thu, 11 May 2023 06:32:40 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-3f415a90215so64272625e9.0
        for <linux-clk@vger.kernel.org>; Thu, 11 May 2023 06:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1683811959; x=1686403959;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/UFGhB83ROP440y4JzZ2DWi4wx7mDPzfDrtis1oh0Uc=;
        b=j61F2EZHIzVROnVnEJ5dWEjJ++EssalrBvY6bt/WB/zE+mHTfRUUC/bBLbEd7+yPl6
         RX8i5zBHeuDrZGi+bAPCxS1N991+YDw3bs5Zy6SAnO/xM/UudkTyW4UgDraICDPSf0/I
         RECDKvfIjuag395gnx5RBeyaOahlsldWTVmNJrb5bFCd2AFM8Qf9VbXRqbeqTfRbpPAa
         1CeZH70bHm/Pbt2PyULvdqvNP2tnNQ2ufDY8zlryLlFsHPdx1AzWPUJJ3QSnFUSYgRjk
         2lMw0iTxLG9t0Cbw7IhYC2ioUqEjinWoW4QCUgSMcDQNnMe5Dpl/5VMizBghngXbBcU2
         I5ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683811959; x=1686403959;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/UFGhB83ROP440y4JzZ2DWi4wx7mDPzfDrtis1oh0Uc=;
        b=ivgW04SBHdogG0MW0EcooCLCO9Yr5QACBwwfN9qoXKD3ygKsi5DJo9qlVlFv5vKR2U
         UlEaP8WAiYlS/YX1/zlG1QzIf4mBJyAa8Q5LhrBqJI92u1TEo37jjagEQrouIdzp3m4A
         61IgWb/Kt41+sF+xEtZn7XOhgBLcq9nE9egL5iYni8DGnRaYiUp3IwcqMmRnY1Evs/ki
         YL9X/+XZAGcqylQi+2o/std/X7Cs4aJw3BXvFQFE8fMBvphr8+wLYUNjJgzdN//9F56j
         kbXzvkxmkKyVyo1ekXackYimkc3vX7mMFi0syv2esaULrNFu71FO5YCnZwQ4lVrgzbX5
         zkDA==
X-Gm-Message-State: AC+VfDxOSsrqlbPPlZLAf+EffTNLJOylM1IOghKWKAXB2T8DIRnnJ6GV
        5udEa8f6skFWXVtmV6nX09X81w==
X-Google-Smtp-Source: ACHHUZ5ETDXp0nRcAzcgFbv4kgG4x2FThcMMysyf2EOpF2sHVg9H4CuAY5NsAJC60miMV3Ro02gxAw==
X-Received: by 2002:adf:e690:0:b0:2e8:b9bb:f969 with SMTP id r16-20020adfe690000000b002e8b9bbf969mr15481747wrm.0.1683811958720;
        Thu, 11 May 2023 06:32:38 -0700 (PDT)
Received: from blmsp.fritz.box ([2001:4090:a246:80f3:ef71:25ff:df82:9cc9])
        by smtp.gmail.com with ESMTPSA id a15-20020adff7cf000000b002f6176cc6desm20479025wrq.110.2023.05.11.06.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 06:32:38 -0700 (PDT)
From:   Markus Schneider-Pargmann <msp@baylibre.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Markus Schneider-Pargmann <msp@baylibre.com>,
        Alexandre Mergnat <amergnat@baylibre.com>
Subject: [PATCH] clk: mediatek: mt8365: Fix inverted topclk operations
Date:   Thu, 11 May 2023 15:32:26 +0200
Message-Id: <20230511133226.913600-1-msp@baylibre.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The given operations are inverted for the wrong registers which makes
multiple of the mt8365 hardware units unusable. In my setup at least usb
did not work.

Fixed by swapping the operations with the inverted ones.

Reported-by: Alexandre Mergnat <amergnat@baylibre.com>
Fixes: 905b7430d3cc ("clk: mediatek: mt8365: Convert simple_gate to mtk_gate clocks")
Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---
 drivers/clk/mediatek/clk-mt8365.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8365.c b/drivers/clk/mediatek/clk-mt8365.c
index 6b4e193f648d..6d785ec5754d 100644
--- a/drivers/clk/mediatek/clk-mt8365.c
+++ b/drivers/clk/mediatek/clk-mt8365.c
@@ -583,15 +583,15 @@ static const struct mtk_gate_regs top2_cg_regs = {
 
 #define GATE_TOP0(_id, _name, _parent, _shift)			\
 	GATE_MTK(_id, _name, _parent, &top0_cg_regs,		\
-		 _shift, &mtk_clk_gate_ops_no_setclr_inv)
+		 _shift, &mtk_clk_gate_ops_no_setclr)
 
 #define GATE_TOP1(_id, _name, _parent, _shift)			\
 	GATE_MTK(_id, _name, _parent, &top1_cg_regs,		\
-		 _shift, &mtk_clk_gate_ops_no_setclr)
+		 _shift, &mtk_clk_gate_ops_no_setclr_inv)
 
 #define GATE_TOP2(_id, _name, _parent, _shift)			\
 	GATE_MTK(_id, _name, _parent, &top2_cg_regs,		\
-		 _shift, &mtk_clk_gate_ops_no_setclr)
+		 _shift, &mtk_clk_gate_ops_no_setclr_inv)
 
 static const struct mtk_gate top_clk_gates[] = {
 	GATE_TOP0(CLK_TOP_CONN_32K, "conn_32k", "clk32k", 10),
-- 
2.40.1

