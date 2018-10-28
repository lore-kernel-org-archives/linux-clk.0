Return-Path: <SRS0=wuwk=NI=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCFE0ECDE46
	for <linux-clk@archiver.kernel.org>; Sun, 28 Oct 2018 12:09:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A508120665
	for <linux-clk@archiver.kernel.org>; Sun, 28 Oct 2018 12:09:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="njfBDzVO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A508120665
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727507AbeJ1Uxj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 28 Oct 2018 16:53:39 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:33022 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726379AbeJ1Uxj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 28 Oct 2018 16:53:39 -0400
Received: by mail-wr1-f66.google.com with SMTP id u1-v6so5708255wrn.0;
        Sun, 28 Oct 2018 05:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=e3r/UHlnEgHpCcmWhw43f3zgREtskc4oLadyRqv617w=;
        b=njfBDzVOrmZjnEWiAo3cK2DCcahx1b8msUbaoYVME3A3U/i5B33zlwTQ/gpQ1pG2kl
         YR/+LsllUr8kfDiNDjQKfkQRSUcex7qrQ1pKsDZ0gR1HTtEtJQXCZN6eKsksrdQNSShg
         iNK5exiobQsnyGrPlmckN2i2SQXFMBrsavWOOasLt3xovjpBFkC42q4qBQpkmXfydW2L
         X86SvjzVXaqfdYs5TCKpgx390q84rbjmqRqc4HaImsiGCr6g3Ghp5PA3+3p6W7Sg9sRH
         avln+Bmb+a6zXkVxh+BycgJ68KD2118Hp6W0moMpzcDLE9B9QmnEP4Lh/tT7vUHkWgOg
         vVdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=e3r/UHlnEgHpCcmWhw43f3zgREtskc4oLadyRqv617w=;
        b=TrsLgI2hVaS+pXlJhhDvqMPsf8D0oMmf8eml/6kxY7GBfMGzeJiU+U+CmaDu+vA2in
         R5CqT3Ac7vKTXwDNGZ+4RuNzEmR/fJPJW1DbhZIwzpu3BppzyTftHGERJdi76uiKhUHr
         9kjjukmPS+/WBRDTqdkuGPtwSUJgIyM/oct0JrhlyAr9cDxYMjdkAZbPGdiCnSgGe9Mw
         jq4PUzpkTxY5LblB7f/te/OQX3zd7r6nhrKhdO65u+meDxkytoSmlKci+SvxvefgkKIM
         EBiClhiLecutNacna4/HMwzdfUrD1HZ3lh/A0F9HzBW4hXZLNB/QyYmrjDk/8wtzhD05
         NuXg==
X-Gm-Message-State: AGRZ1gIGc50Ph9tn+e8n5F4nwbf4GGrRjLV2qirMxpMSr/OuCjLc97WH
        NloBqYLLgi3X47+qUmBjLGM=
X-Google-Smtp-Source: AJdET5dLxRK4V9ct1CHy6eGfHk2DYU3Fjtxr6OJvluiwy26iajKiS4QnBIJ8KBpePCJlddYdgkRYmg==
X-Received: by 2002:adf:e551:: with SMTP id z17-v6mr10880340wrm.238.1540728550446;
        Sun, 28 Oct 2018 05:09:10 -0700 (PDT)
Received: from blackbox.darklights.net (p200300DCD7072200691979D1FB980407.dip0.t-ipconnect.de. [2003:dc:d707:2200:6919:79d1:fb98:407])
        by smtp.googlemail.com with ESMTPSA id 193-v6sm11699772wmj.21.2018.10.28.05.09.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 28 Oct 2018 05:09:09 -0700 (PDT)
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To:     narmstrong@baylibre.com, jbrunet@baylibre.com, robh+dt@kernel.org,
        mark.rutland@arm.com, linux-amlogic@lists.infradead.org,
        devicetree@vger.kernel.org
Cc:     mturquette@baylibre.com, sboyd@kernel.org, carlo@caione.org,
        khilman@baylibre.com, linux-clk@vger.kernel.org,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v2 2/3] clk: meson: meson8b: use the HHI syscon if available
Date:   Sun, 28 Oct 2018 13:08:58 +0100
Message-Id: <20181028120859.5735-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181028120859.5735-1-martin.blumenstingl@googlemail.com>
References: <20181028120859.5735-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The clock controller is located in a register range (called "HHI") which
contains more than just registers for the clock controller. Known
consumers of the HHI register range are:
- the clock controller
- a reset controller
- temperature sensor calibration coefficient (TSC) (only on Meson8b and
  Meson8m2)
- HDMI controller

The main reason for using a syscon is the "temperature sensor
calibration coefficient" which has to be set for the built-in temperature
sensor to work correctly. Four TSC bits are located in the SAR ADC's
register space. However on Meson8b and Meson8m2 there is a fifth TSC bit
which is unfortunately located in the HHI register space. To be more
precise, bit 9 of the HHI_DPLL_TOP_0 register (which sits right between
the HHI_SYS_PLL and HHI_VID_PLL registers).

Get the regmap from the parent (HHI syscon) node to support all
functionality of the HHI register range. Backwards compatibility with
old .dtbs is ensured by falling back to parsing the registers just like
before this change.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Acked-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/clk/meson/meson8b.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
index 1e02ca4be2fc..9bd5920da0ff 100644
--- a/drivers/clk/meson/meson8b.c
+++ b/drivers/clk/meson/meson8b.c
@@ -10,6 +10,7 @@
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/init.h>
+#include <linux/mfd/syscon.h>
 #include <linux/of_address.h>
 #include <linux/reset-controller.h>
 #include <linux/slab.h>
@@ -1115,16 +1116,21 @@ static void __init meson8b_clkc_init(struct device_node *np)
 	struct regmap *map;
 	int i, ret;
 
-	/* Generic clocks, PLLs and some of the reset-bits */
-	clk_base = of_iomap(np, 1);
-	if (!clk_base) {
-		pr_err("%s: Unable to map clk base\n", __func__);
-		return;
-	}
+	map = syscon_node_to_regmap(of_get_parent(np));
+	if (IS_ERR(map)) {
+		pr_info("failed to get HHI regmap - Trying obsolete regs\n");
 
-	map = regmap_init_mmio(NULL, clk_base, &clkc_regmap_config);
-	if (IS_ERR(map))
-		return;
+		/* Generic clocks, PLLs and some of the reset-bits */
+		clk_base = of_iomap(np, 1);
+		if (!clk_base) {
+			pr_err("%s: Unable to map clk base\n", __func__);
+			return;
+		}
+
+		map = regmap_init_mmio(NULL, clk_base, &clkc_regmap_config);
+		if (IS_ERR(map))
+			return;
+	}
 
 	rstc = kzalloc(sizeof(*rstc), GFP_KERNEL);
 	if (!rstc)
-- 
2.19.1

