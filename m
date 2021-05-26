Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDD20C47082
	for <linux-clk@archiver.kernel.org>; Wed, 26 May 2021 17:21:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A1FF6611B0
	for <linux-clk@archiver.kernel.org>; Wed, 26 May 2021 17:21:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235356AbhEZRXP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 26 May 2021 13:23:15 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:36805 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233700AbhEZRWj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 26 May 2021 13:22:39 -0400
Received: from mail-ua1-f70.google.com ([209.85.222.70])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1llxDN-0003eD-Cy
        for linux-clk@vger.kernel.org; Wed, 26 May 2021 17:21:06 +0000
Received: by mail-ua1-f70.google.com with SMTP id v20-20020ab076940000b029020b0b4ada34so1110594uaq.4
        for <linux-clk@vger.kernel.org>; Wed, 26 May 2021 10:21:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YYv9QSwtcmYn0218F0zCf1aEruGYQ8/WBysY7w5EfCc=;
        b=IjWBSprgyGBnqGBbPjiE7swpuBgyavGVpDTfcJJQVI5jJ16wauNgcDeE00Zd2E3Jdr
         hHov7nLBV7eo0gaXB/W43a2gSr2p4Zq83t/I8YANVH8snXSGHdeAOniHXDySRVYVl97V
         AdPczBOhJ/xLPgb1oSFR50QRsyon/ARL84p1Ii3mALgRJczGw8WDu7eBv/Jp3+x6BVvW
         WHr6tXn8jqRm1byxyK6UZquH9HqeIyWOFJ9/PfjAGhjBHGlUSgSvLCakKc3XN7vZIyxF
         UvNp4i0IVcEkm688Y3dDKv81sLxVAQNi2epO8deqI6ex0ocBqvTd2RYyQ3tPBkpdxKHf
         i2sA==
X-Gm-Message-State: AOAM531toA/EtxMflAYkedh7k0CACMqVq6pU2C4oZXG0QelxM8VZvjud
        dSutc4erUYIp8wLuFymM9sbKvN2IQCZ5d6QAzG35s9Lw3ObLZJfXYprbQSftHLzoNAXhdAxEm9t
        F19YiVcmnXO+MMfwt4ODQTs8V8lf1NFEHls5t3g==
X-Received: by 2002:ac5:c382:: with SMTP id s2mr31980816vkk.24.1622049664524;
        Wed, 26 May 2021 10:21:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyBWWyrs1VJTSEVr7gNlAWxnMbfMY4X+d68llpnvHKbyCP4O8ma7yU99jBXSJa7bdYyXsWV8g==
X-Received: by 2002:ac5:c382:: with SMTP id s2mr31980793vkk.24.1622049664379;
        Wed, 26 May 2021 10:21:04 -0700 (PDT)
Received: from localhost.localdomain ([45.237.48.6])
        by smtp.gmail.com with ESMTPSA id u195sm2036032vsc.10.2021.05.26.10.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 10:21:03 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Sebastian Reichel <sre@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-rtc@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Iskren Chernev <iskren.chernev@gmail.com>
Subject: [PATCH v2 7/7] power: supply: max17040: Do not enforce (incorrect) interrupt trigger type
Date:   Wed, 26 May 2021 13:20:36 -0400
Message-Id: <20210526172036.183223-8-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210526172036.183223-1-krzysztof.kozlowski@canonical.com>
References: <20210526172036.183223-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Krzysztof Kozlowski <krzk@kernel.org>

Interrupt line can be configured on different hardware in different way,
even inverted.  Therefore driver should not enforce specific trigger
type - edge falling - but instead rely on Devicetree to configure it.

The Maxim 14577/77836 datasheets describe the interrupt line as active
low with a requirement of acknowledge from the CPU therefore the edge
falling is not correct.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Acked-by: Iskren Chernev <iskren.chernev@gmail.com>

---

Changes since v1:
1. Remove the 'flags' variable.
2. Added ack.
3. Rebase - the bindings were converted to dtschema.
---
 .../devicetree/bindings/power/supply/maxim,max17040.yaml      | 2 +-
 drivers/power/supply/max17040_battery.c                       | 4 +---
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/power/supply/maxim,max17040.yaml b/Documentation/devicetree/bindings/power/supply/maxim,max17040.yaml
index de91cf3f058c..f792d06db413 100644
--- a/Documentation/devicetree/bindings/power/supply/maxim,max17040.yaml
+++ b/Documentation/devicetree/bindings/power/supply/maxim,max17040.yaml
@@ -89,7 +89,7 @@ examples:
         reg = <0x36>;
         maxim,alert-low-soc-level = <10>;
         interrupt-parent = <&gpio7>;
-        interrupts = <2 IRQ_TYPE_EDGE_FALLING>;
+        interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
         wakeup-source;
       };
     };
diff --git a/drivers/power/supply/max17040_battery.c b/drivers/power/supply/max17040_battery.c
index 1aab868adabf..e80dd9141ae7 100644
--- a/drivers/power/supply/max17040_battery.c
+++ b/drivers/power/supply/max17040_battery.c
@@ -361,12 +361,10 @@ static irqreturn_t max17040_thread_handler(int id, void *dev)
 static int max17040_enable_alert_irq(struct max17040_chip *chip)
 {
 	struct i2c_client *client = chip->client;
-	unsigned int flags;
 	int ret;
 
-	flags = IRQF_TRIGGER_FALLING | IRQF_ONESHOT;
 	ret = devm_request_threaded_irq(&client->dev, client->irq, NULL,
-					max17040_thread_handler, flags,
+					max17040_thread_handler, IRQF_ONESHOT,
 					chip->battery->desc->name, chip);
 
 	return ret;
-- 
2.27.0

