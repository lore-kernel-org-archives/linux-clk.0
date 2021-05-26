Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 966C8C4708B
	for <linux-clk@archiver.kernel.org>; Wed, 26 May 2021 17:21:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7EC11611B0
	for <linux-clk@archiver.kernel.org>; Wed, 26 May 2021 17:21:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234916AbhEZRXI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 26 May 2021 13:23:08 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:36789 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235107AbhEZRWg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 26 May 2021 13:22:36 -0400
Received: from mail-vs1-f70.google.com ([209.85.217.70])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1llxDL-0003ce-9j
        for linux-clk@vger.kernel.org; Wed, 26 May 2021 17:21:03 +0000
Received: by mail-vs1-f70.google.com with SMTP id p14-20020a67e94e0000b029023fa53ce6e9so551247vso.14
        for <linux-clk@vger.kernel.org>; Wed, 26 May 2021 10:21:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GmEoQJnYyHa6LUU8eDJ5U1vBJGHUMr9Q2pgbu4Jz5Pw=;
        b=mH6baNv2h7A8vHXlv3qf6o2B2eYAygwA7Pu1fGxnr5n+V+bef2Ds8pgtTfuYs4ceWY
         jbY30vnuLCSWgwMnmRZ5q+g/QIHbYI9mBIHnWswLOFyXMhaR9QcvFmf2WbXCNWsmKkk7
         dp0lZf1ACTynz8t85t+5e/QcqS0JO3nLi05ZTgkaAf/nqCRibBYjhCNcfCS9EroCMHIn
         b+dFhgFdBNi5qZifTUQ2VZVFOu0mC7+3IdIPJB/8vblmJPhC3+wviRLgLWufj5CCWKgy
         pXppbeazqGyPyXvawpCcTqCbf5K0q8XNQjgaNYP/Nyfe1CQe6pkspYHWtKiwf2CJ7S4y
         um3Q==
X-Gm-Message-State: AOAM531DzxWf5VXtL2r6iDQukgM3c/LLyZDfFxVtv+i+gkOiintGCQ8I
        OmIjRbAThtClkf6zlUCIFuDelzddhLLCZepbIfojFfJeHKqLY00gz6v4VRxc1gVeK/ve4g8HwUJ
        2Sehr1/eW7L2QIITz2YKxB4f35vrC0nq5Opeixg==
X-Received: by 2002:a05:6102:124d:: with SMTP id p13mr32602219vsg.58.1622049662242;
        Wed, 26 May 2021 10:21:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx9xh7stKNjLHMO5aPJf5U1x+d8xsFxY3fMgzBN4TM4e3umiNoUIJM1/Sf2sd3i0ilvlipGjw==
X-Received: by 2002:a05:6102:124d:: with SMTP id p13mr32602180vsg.58.1622049661974;
        Wed, 26 May 2021 10:21:01 -0700 (PDT)
Received: from localhost.localdomain ([45.237.48.6])
        by smtp.gmail.com with ESMTPSA id u195sm2036032vsc.10.2021.05.26.10.20.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 10:21:01 -0700 (PDT)
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
Cc:     Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v2 6/7] power: supply: max17042: Do not enforce (incorrect) interrupt trigger type
Date:   Wed, 26 May 2021 13:20:35 -0400
Message-Id: <20210526172036.183223-7-krzysztof.kozlowski@canonical.com>
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

The Maxim 17047/77693 datasheets describe the interrupt line as active
low with a requirement of acknowledge from the CPU therefore the edge
falling is not correct.

The interrupt line is shared between PMIC and RTC driver, so using level
sensitive interrupt is here especially important to avoid races.  With
an edge configuration in case if first PMIC signals interrupt followed
shortly after by the RTC, the interrupt might not be yet cleared/acked
thus the second one would not be noticed.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v1:
1. None
---
 drivers/power/supply/max17042_battery.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/power/supply/max17042_battery.c b/drivers/power/supply/max17042_battery.c
index 1d7326cd8fc6..ce2041b30a06 100644
--- a/drivers/power/supply/max17042_battery.c
+++ b/drivers/power/supply/max17042_battery.c
@@ -1104,7 +1104,7 @@ static int max17042_probe(struct i2c_client *client,
 	}
 
 	if (client->irq) {
-		unsigned int flags = IRQF_TRIGGER_FALLING | IRQF_ONESHOT;
+		unsigned int flags = IRQF_ONESHOT;
 
 		/*
 		 * On ACPI systems the IRQ may be handled by ACPI-event code,
-- 
2.27.0

