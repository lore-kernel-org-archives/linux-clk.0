Return-Path: <SRS0=2SAN=TC=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E01C8C43219
	for <linux-clk@archiver.kernel.org>; Thu,  2 May 2019 12:18:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AECFE208C4
	for <linux-clk@archiver.kernel.org>; Thu,  2 May 2019 12:18:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="SZbstBAy"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726295AbfEBMSs (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 2 May 2019 08:18:48 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:36418 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726282AbfEBMSs (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 2 May 2019 08:18:48 -0400
Received: by mail-wr1-f68.google.com with SMTP id o4so3066854wra.3
        for <linux-clk@vger.kernel.org>; Thu, 02 May 2019 05:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8yhaNFcdvOpPcpBYXUdsomaKk+La2YImNQmSmSh3PjY=;
        b=SZbstBAyWZbN8X23/VP/9UhABke/igJxDJHJXB7ekMR7k3qBy+2f19eHpUZX5I08QV
         tTytHe/uhg8qsFMTNfklzN5ZSg0BYys58sh/b8IzQsJD0Pmf2KDRJehfrtPzev/RDOh3
         AU6e7dc/yW6EjebbghR2bq7+ekr2NGzHd3s8cVdxDQ5/mIJb8wS9oY+9QkU/vBeot2cZ
         uWxEAgGCDwUHnTeWuqWBshvrUNEp/bxUcbDDF7nDG79Z6VJrfTvtRaLd/h6aZIpHU0y1
         GIRP3mlVC5fW5U0Ce8rwO9h6nHKBOVxrNleoF0o4rauPZyFM8bEPPNJ9CvmL5vcQosnR
         yJlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8yhaNFcdvOpPcpBYXUdsomaKk+La2YImNQmSmSh3PjY=;
        b=ZhtmIRnu4glzzcz0J+sRuCHdxK3x1Sy5NFv41pctC8gZUyii9nsyxvSmKX2tTST5Ge
         Mttj6vJED4cA09JU4sBjJGLuSFEyIJR4w8V9F/LZVB73ThLsjrFzZ/Dvlga2OocUr52p
         n/qO1vqwFdTmm0GQhiiX67LMVhffI83glLtGGicD6IGiD6bROpgJ/aNM0IQ3oc/cYpvd
         qLtuVE1gvkR0L+bED2YRsaeiPYlRqJqxBKrdF6aaLe8jdGDyeRwEoqD7nHQkbOIN3N7o
         ivb+nkKOaWyTZU9TleZVptsXeEpG7EDW0Wo7wn90+0HkoDg9xvmvX5T3OkZVyY50SYft
         vZLw==
X-Gm-Message-State: APjAAAVi9F5hvZr1J5AoUR4CDSu2AIpxrZE7DMDLbvFQu5NjrzyH7PCs
        9GTbjlggGasFHTOj9ie0QSamGg==
X-Google-Smtp-Source: APXvYqybnz8QnbpKmcrmKh2L8LuuDVThIoXDaPzBG94Oj9LaHY0YI2yFN/HK2nR6zlXFItMIhB9G0w==
X-Received: by 2002:adf:e70a:: with SMTP id c10mr1268627wrm.278.1556799526486;
        Thu, 02 May 2019 05:18:46 -0700 (PDT)
Received: from localhost.localdomain (aputeaux-684-1-8-187.w90-86.abo.wanadoo.fr. [90.86.125.187])
        by smtp.gmail.com with ESMTPSA id f6sm4392842wmh.13.2019.05.02.05.18.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 02 May 2019 05:18:45 -0700 (PDT)
From:   Fabien Parent <fparent@baylibre.com>
To:     robh+dt@kernel.org, mark.rutland@arm.com, mturquette@baylibre.com,
        sboyd@kernel.org, matthias.bgg@gmail.com, wenzhen.yu@mediatek.com,
        sean.wang@mediatek.com, ryder.lee@mediatek.com
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Fabien Parent <fparent@baylibre.com>
Subject: [PATCH 1/2] dt-bindings: mediatek: audsys: add support for MT8516
Date:   Thu,  2 May 2019 14:18:42 +0200
Message-Id: <20190502121843.14493-1-fparent@baylibre.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add AUDSYS device tree bindings documentation for MediaTek MT8516 SoC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 .../bindings/arm/mediatek/mediatek,audsys.txt   |  1 +
 include/dt-bindings/clock/mt8516-clk.h          | 17 +++++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.txt
index d1606b2c3e63..a4d07108bd4c 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.txt
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.txt
@@ -9,6 +9,7 @@ Required Properties:
 	- "mediatek,mt2701-audsys", "syscon"
 	- "mediatek,mt7622-audsys", "syscon"
 	- "mediatek,mt7623-audsys", "mediatek,mt2701-audsys", "syscon"
+	- "mediatek,mt8516-audsys", "syscon"
 - #clock-cells: Must be 1
 
 The AUDSYS controller uses the common clk binding from
diff --git a/include/dt-bindings/clock/mt8516-clk.h b/include/dt-bindings/clock/mt8516-clk.h
index 9cfca53cd78d..816447b98edd 100644
--- a/include/dt-bindings/clock/mt8516-clk.h
+++ b/include/dt-bindings/clock/mt8516-clk.h
@@ -208,4 +208,21 @@
 #define CLK_TOP_MSDC2_INFRA		176
 #define CLK_TOP_NR_CLK			177
 
+/* AUDSYS */
+
+#define CLK_AUD_AFE			0
+#define CLK_AUD_I2S			1
+#define CLK_AUD_22M			2
+#define CLK_AUD_24M			3
+#define CLK_AUD_INTDIR			4
+#define CLK_AUD_APLL2_TUNER		5
+#define CLK_AUD_APLL_TUNER		6
+#define CLK_AUD_HDMI			7
+#define CLK_AUD_SPDF			8
+#define CLK_AUD_ADC			9
+#define CLK_AUD_DAC			10
+#define CLK_AUD_DAC_PREDIS		11
+#define CLK_AUD_TML			12
+#define CLK_AUD_NR_CLK			13
+
 #endif /* _DT_BINDINGS_CLK_MT8516_H */
-- 
2.20.1

