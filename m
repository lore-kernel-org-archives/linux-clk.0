Return-Path: <SRS0=3VTX=3J=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16F16C2D0DB
	for <linux-clk@archiver.kernel.org>; Mon, 20 Jan 2020 13:45:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E62062087E
	for <linux-clk@archiver.kernel.org>; Mon, 20 Jan 2020 13:45:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726798AbgATNpY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 20 Jan 2020 08:45:24 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:32814 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726626AbgATNpY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 20 Jan 2020 08:45:24 -0500
Received: by mail-lj1-f196.google.com with SMTP id y6so33951503lji.0
        for <linux-clk@vger.kernel.org>; Mon, 20 Jan 2020 05:45:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=5QNVtAV9LaUH05D29OP9f7feVsXbDJBH0BokQEGeup4=;
        b=RJHIHN7TSJ+j0P6AL87wBVzfJB5MWfCABHHOXlceJ3raVbxwkWurGx1G6Hq55EGas0
         L1b1WCYPN5wqrLIO3weQAxlZaJg6AuT6d8Xu0xJGB628y4IG3JEfwRt/WRFZZnhPFLlN
         iXhpzYkZ+Cjl3yf45nHFxi2X+RjWJhPeMTC2bA50bzymnXPZqT+EMWVBjUdPz487TH+P
         jyf/lE9LsbLWuC2AMj0pTZIKzi2mUOorN6xIEGv6qCwcd9KuuZQYOZk8nqWHypMMiyp9
         40qt6BmMpcL1pfgg+uVf1Ie9nsXkq5FfYq3weE0m4liMQF7GBB/zOlu5Tqb8cCTE1dPf
         q24A==
X-Gm-Message-State: APjAAAW2uX8r0vSNZX39/qFswiW/i6u1SgOZS1wJI09p6oPNnbzYyAL+
        j8hfUTeskfTJwb87uKxiyK8=
X-Google-Smtp-Source: APXvYqx1N3V5ySMX7QVA4FKPZS+TOJVAoLEnH8oDDWFxTuFSmOWuBBK5E/j+mymvURkBkxt1r8gICA==
X-Received: by 2002:a2e:b610:: with SMTP id r16mr11087042ljn.33.1579527922374;
        Mon, 20 Jan 2020 05:45:22 -0800 (PST)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id y8sm16836068lji.56.2020.01.20.05.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2020 05:45:21 -0800 (PST)
Date:   Mon, 20 Jan 2020 15:45:11 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Lee Jones <lee.jones@linaro.org>, Mark Brown <broonie@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-clk@vger.kernel.org, linux-gpio@ger.kernel.org
Subject: [PATCH v13 09/11] mfd: bd70528: Fix hour register mask
Message-ID: <15dbc51a6a7e2836534f2059e4188ee5a719a10f.1579527444.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1579527444.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1579527444.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

When RTC is used in 24H mode (and it is by this driver) the maximum
hour value is 24 in BCD. This occupies bits [5:0] - which means
correct mask for HOUR register is 0x3f not 0x1f. Fix the mask

Fixes: 32a4a4ebf768 ("rtc: bd70528: Initial support for ROHM bd70528 RTC")

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
---
 include/linux/mfd/rohm-bd70528.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/mfd/rohm-bd70528.h b/include/linux/mfd/rohm-bd70528.h
index 2ad2320d0a96..edae6f7afd8e 100644
--- a/include/linux/mfd/rohm-bd70528.h
+++ b/include/linux/mfd/rohm-bd70528.h
@@ -311,7 +311,7 @@ enum {
 #define BD70528_MASK_RTC_MINUTE		0x7f
 #define BD70528_MASK_RTC_HOUR_24H	0x80
 #define BD70528_MASK_RTC_HOUR_PM	0x20
-#define BD70528_MASK_RTC_HOUR		0x1f
+#define BD70528_MASK_RTC_HOUR		0x3f
 #define BD70528_MASK_RTC_DAY		0x3f
 #define BD70528_MASK_RTC_WEEK		0x07
 #define BD70528_MASK_RTC_MONTH		0x1f
-- 
2.21.0


-- 
Matti Vaittinen, Linux device drivers
ROHM Semiconductors, Finland SWDC
Kiviharjunlenkki 1E
90220 OULU
FINLAND

~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
Simon says - in Latin please.
~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
Thanks to Simon Glass for the translation =] 
