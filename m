Return-Path: <SRS0=XCXc=UE=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B159C28CC5
	for <linux-clk@archiver.kernel.org>; Wed,  5 Jun 2019 23:57:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 49A9A20830
	for <linux-clk@archiver.kernel.org>; Wed,  5 Jun 2019 23:57:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ttD0EcZd"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726561AbfFEX5a (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 5 Jun 2019 19:57:30 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:37054 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726510AbfFEX5a (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 5 Jun 2019 19:57:30 -0400
Received: by mail-wm1-f67.google.com with SMTP id 22so557717wmg.2;
        Wed, 05 Jun 2019 16:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CoEKt3CyAM8pXZNIOFLtJ4NXiqc8XDf8/zgh2kIleYE=;
        b=ttD0EcZdokG+eHCPuoKzaxTh1/e9jppmuGOG9Bx7wn2M+XZ/MzL4+73QYIgcSOlF98
         Wwrmkd9J3VNehRzye7Kbqk7O1XJUqKO8zNxx0yoHZ3cKwl1IIKYgREu5zmc5APYT/6h/
         Ke5faRmuunUoqwM3bk52rYrH3bm/MytLpIew8Nk2h0oVNleTVbzqPn2XiOWRd55CYBvM
         +1iHfw1DAvWlcOSjBB+nHK0QvHrvPzX/N2U/jb7iyiZQwQbtRui/tPOEOjs+sLyg60rC
         j9orX4xyMYpUC2jKnVN++F8VXkZuu11O797s1ZyL53s0lhpvJdpBF0h7CbFEQGxO2+DS
         s3lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CoEKt3CyAM8pXZNIOFLtJ4NXiqc8XDf8/zgh2kIleYE=;
        b=Pwl84w3Cjs8iK67sKq3q35yB2DcrXIG9i/4xU6mY8OeQoMjeITPe/xbV0L/C4cpuyP
         x4n6tkKtSWoY3gH0383CnKnv5c47rbP3wIM3j2ErqpoawgSVJhFcdDTjMFcfIYevHOdO
         h0fbXsoR5A4BWCWr9TX3G0XNBUllMYv24Ejf8kFnznjmGqKoMWyoRmC2WiSsEbU87nvt
         g4sMwnaZdwjqWZgqNhsBdgizK3cPkXhKCfXMgqhjucpF46yfsF95RQ2I2zJuw1RkzSAR
         bgH3UTPmntrdkU/qJMdjsMG4uh1OWHpiP/1TmceYjXp3+VXNIXCvyX64keK2L5Nv5gE2
         c2IA==
X-Gm-Message-State: APjAAAXp4SIIlzGEjJA6aar5QKPMU7CAO7WsMeC6ciVZrOuRse1Ju/xg
        sVoizdcAzT83yqTA89had3I=
X-Google-Smtp-Source: APXvYqwNXvyVrYJ/+XP8N6e1Hk1Le0wEopGarZqZ89V6cCoDAPq+dq0qX6FmIYJZdMYXIYqWTGNRIA==
X-Received: by 2002:a1c:f70f:: with SMTP id v15mr23841079wmh.102.1559779048577;
        Wed, 05 Jun 2019 16:57:28 -0700 (PDT)
Received: from X555LD.home ([2a02:85f:1501:7500:4991:f471:d726:d8ee])
        by smtp.gmail.com with ESMTPSA id q15sm245915wrr.19.2019.06.05.16.57.26
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 05 Jun 2019 16:57:27 -0700 (PDT)
From:   "Leonidas P. Papadakos" <papadakospan@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        "Leonidas P. Papadakos" <papadakospan@gmail.com>
Subject: [PATCH 1/2] clk: rockchip: add clock for the watchdog pclk on rk3328
Date:   Thu,  6 Jun 2019 02:57:13 +0300
Message-Id: <20190605235714.22432-1-papadakospan@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: <itdaniher@gmail.com>

Following the discussion here:
https://github.com/rockchip-linux/kernel/issues/123

it can be seen that these are the changes needed to enable the use of the hardware watchdog in the rk3328 SoC.

This is in line with past changes for the rk3288:
http://lists.infradead.org/pipermail/linux-rockchip/2015-January/002314.html

Signed-off-by: Leonidas P. Papadakos <papadakospan@gmail.com>
---
 drivers/clk/rockchip/clk-rk3328.c      | 9 +++++++++
 include/dt-bindings/clock/rk3328-cru.h | 1 +
 2 files changed, 10 insertions(+)

diff --git a/drivers/clk/rockchip/clk-rk3328.c b/drivers/clk/rockchip/clk-rk3328.c
index 076b9777a..546ee0ab7 100644
--- a/drivers/clk/rockchip/clk-rk3328.c
+++ b/drivers/clk/rockchip/clk-rk3328.c
@@ -876,6 +876,8 @@ static const char *const rk3328_critical_clocks[] __initconst = {
 
 static void __init rk3328_clk_init(struct device_node *np)
 {
+	struct clk *clk;
+
 	struct rockchip_clk_provider *ctx;
 	void __iomem *reg_base;
 
@@ -892,6 +894,13 @@ static void __init rk3328_clk_init(struct device_node *np)
 		return;
 	}
 
+	clk = clk_register_fixed_factor(NULL, "pclk_wdt", "pclk_bus", 0, 1, 1);
+	if (IS_ERR(clk))
+		pr_warn("%s: could not register clock pclk_wdt: %ld\n",
+			__func__, PTR_ERR(clk));
+	else
+		rockchip_clk_add_lookup(ctx, clk, PCLK_WDT);
+
 	rockchip_clk_register_plls(ctx, rk3328_pll_clks,
 				   ARRAY_SIZE(rk3328_pll_clks),
 				   RK3328_GRF_SOC_STATUS0);
diff --git a/include/dt-bindings/clock/rk3328-cru.h b/include/dt-bindings/clock/rk3328-cru.h
index afb811340..555b4ff66 100644
--- a/include/dt-bindings/clock/rk3328-cru.h
+++ b/include/dt-bindings/clock/rk3328-cru.h
@@ -164,6 +164,7 @@
 #define PCLK_DCF		233
 #define PCLK_SARADC		234
 #define PCLK_ACODECPHY		235
+#define PCLK_WDT		236
 
 /* hclk gates */
 #define HCLK_PERI		308
-- 
2.21.0

