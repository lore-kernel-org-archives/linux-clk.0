Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD139C47083
	for <linux-clk@archiver.kernel.org>; Wed,  2 Jun 2021 11:05:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 96A5A613D6
	for <linux-clk@archiver.kernel.org>; Wed,  2 Jun 2021 11:05:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231844AbhFBLG4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 2 Jun 2021 07:06:56 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:52347 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231899AbhFBLGi (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 2 Jun 2021 07:06:38 -0400
Received: from mail-wm1-f71.google.com ([209.85.128.71])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1loOgA-0003vA-HE
        for linux-clk@vger.kernel.org; Wed, 02 Jun 2021 11:04:54 +0000
Received: by mail-wm1-f71.google.com with SMTP id r15-20020a05600c35cfb029017cc4b1e9faso2039672wmq.8
        for <linux-clk@vger.kernel.org>; Wed, 02 Jun 2021 04:04:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ji+tC5V5g/Ce+vgR+BJKn16Nmk3kGVreTbAerQ8gR/A=;
        b=b5X+2gK/DGoJsIs/lsJI0Lf5bdUayh68r2nyRt0SmPrfOPU3RzmL7a/+nxKfbhJgEU
         Mf8FAkEsvEl5d76QYuiiC7ptiR5Z36vt78BKxM8Su9U7UBXf4KWk2C1xhVzrQe1O3ws4
         jAIqid/bPQM7z8qudn5NXNQ5x+yrQX9WNc97YrNSUaoKOPHLK0Cwd7Uc7EaX9g+FK8WS
         akoBt4vzT/TG0vgb83SVzVDUM8iTov0jv+QOMuvf6wy1O4LYfdiicgpLawwD8TYgPUMs
         Ss0hoXelVXG7Ao+AAUir5HCkJ1ZUDtgcynntEiPUETWF++ECLOIx9pxsXjyR5Q+Yuv1z
         yYLA==
X-Gm-Message-State: AOAM530Z63ZPXxbmRcGOzQo/RSUOtv+HevH7sI4mh4737MQaJb8yMFP2
        N7wJnuChslfnXoPqLImxAgk5RFAK1kBbWo+OCNsHhrSaPJEq0zV21oREzwnDqsoNLFpxExsWpEE
        fwjnsy31Y7LLIzTIKhM4rskGpFSmoUcB26MJuYQ==
X-Received: by 2002:a1c:f316:: with SMTP id q22mr31373942wmq.152.1622631894324;
        Wed, 02 Jun 2021 04:04:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzUi60Islv2sP9zukPKfLBZO8KAnwQYQoa56n07SmYetGNc/q6ebYs8y1pFF8rJvd04u2vnXw==
X-Received: by 2002:a1c:f316:: with SMTP id q22mr31373922wmq.152.1622631894111;
        Wed, 02 Jun 2021 04:04:54 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-185-9.adslplus.ch. [188.155.185.9])
        by smtp.gmail.com with ESMTPSA id f5sm6948175wrf.22.2021.06.02.04.04.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 04:04:53 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [RESEND PATCH v2 1/4] mfd: sec-irq: Do not enforce (incorrect) interrupt trigger type
Date:   Wed,  2 Jun 2021 13:04:42 +0200
Message-Id: <20210602110445.33536-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Krzysztof Kozlowski <krzk@kernel.org>

Interrupt line can be configured on different hardware in different way,
even inverted.  Therefore driver should not enforce specific trigger
type - edge falling - but instead rely on Devicetree to configure it.

The Samsung PMIC drivers are used only on Devicetree boards.

Additionally, the PMIC datasheets describe the interrupt line as active
low with a requirement of acknowledge from the CPU therefore the edge
falling is not correct.

Marek Szyprowski reports that together with DTS change (proper level in
DTS) it fixes RTC alarm failure that he observed from time to time on
TM2e board.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

---

Rebased on https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git/log/?h=for-mfd-next

Changes since v1:
1. Mention in commit msg that this fixes TM2e RTC alarm.
2. Add Marek's tested-by.
---
 drivers/mfd/sec-irq.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mfd/sec-irq.c b/drivers/mfd/sec-irq.c
index e473c2fb42d5..f5f59fdc72fe 100644
--- a/drivers/mfd/sec-irq.c
+++ b/drivers/mfd/sec-irq.c
@@ -479,8 +479,7 @@ int sec_irq_init(struct sec_pmic_dev *sec_pmic)
 	}
 
 	ret = devm_regmap_add_irq_chip(sec_pmic->dev, sec_pmic->regmap_pmic,
-				       sec_pmic->irq,
-				       IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
+				       sec_pmic->irq, IRQF_ONESHOT,
 				       0, sec_irq_chip, &sec_pmic->irq_data);
 	if (ret != 0) {
 		dev_err(sec_pmic->dev, "Failed to register IRQ chip: %d\n", ret);
-- 
2.27.0

