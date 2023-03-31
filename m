Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89E73C77B62
	for <linux-clk@archiver.kernel.org>; Fri, 31 Mar 2023 08:37:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231855AbjCaIhE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 31 Mar 2023 04:37:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231712AbjCaIgU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 31 Mar 2023 04:36:20 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3C5C1D93C
        for <linux-clk@vger.kernel.org>; Fri, 31 Mar 2023 01:35:09 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id h17so21571413wrt.8
        for <linux-clk@vger.kernel.org>; Fri, 31 Mar 2023 01:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680251709;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A5/X3/1Tx5hLaqv79uU7wuySkv7lfnq2I4RAVqFuiIk=;
        b=JRJQX3qf6nbWRRhjPQNrARTIyJRjN85WbOZTRhfjLkq95loPYQtmcz9uuRtmXD+gF0
         pbjlvjWUpM5s35eLwCfaIEAjNdqCVJqUbIoJ0QQ+NUMzZjtV7Kxbb9qHdGemp2rn+kMY
         Iogew4j3vSCvnnTWMPSv3pUmltFB4eJLvdhtB7DgxhbLKFxRNR7Kae+MW+amWDOuGH+K
         0TIBTDavzQ/ATWYsYCgjlgvssAy0cZ+yRGjNI/IOQWRKqbCot7nTCcwYctdEE3g9Fhow
         0GHMU5sij/cF06KleMdx4uNj5gz06aYrtqcKb/iZZ8GuVraLGpO2QvwZWp3MdMXVyQ6A
         wvNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680251709;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A5/X3/1Tx5hLaqv79uU7wuySkv7lfnq2I4RAVqFuiIk=;
        b=y4z2tBFtTtpNjGBdVXyBhZwwjbMGWDh9F4E/Ez1mmYwLmj32/U5L9t3zhY3Ghh0iul
         BagdalIUu+3c2r+lFbgfOd3CJPlSDSdI1RQ+dtTODxkD/owvtRLWwmRxITnxSE5iyOuL
         WTXeS1t/W0zrs+LA8APkqRZXPJgjGYJCv6h58HiW9zMmNQ034tOeulCj0a7CSzg9VrAn
         Ndlgk0ccnvibsCpZjU6s/nHvC5Tfz6S5SiY+6+EWRnZJdeJV0GtqLJ9Dv9s35YYlV8OP
         x9FZEeU2m/yZiqJBV9JJEX0NSMX0G52eBxzAr/ndR/m9otSg4m4sb4zHqOEyXzv4lypq
         dmnA==
X-Gm-Message-State: AAQBX9fxs7koQGvdzOChzSxnCTPHVndkx53Zh0iJ9LL0R/W/TJBKUc0+
        CvUwqIfCvElRl5CNLIuSWatiXg==
X-Google-Smtp-Source: AKy350aYemXoWmOPKcUW9zRssljXvnRo5Q8xdKbF8v8OuSCqLpxJ51RrFOLM7mEYYMCY0HOKI4STBA==
X-Received: by 2002:adf:f04b:0:b0:2d8:57b1:db6c with SMTP id t11-20020adff04b000000b002d857b1db6cmr18990831wro.9.1680251709411;
        Fri, 31 Mar 2023 01:35:09 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id e11-20020a5d4e8b000000b002cde626cd96sm1563153wru.65.2023.03.31.01.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 01:35:09 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Fri, 31 Mar 2023 10:34:56 +0200
Subject: [PATCH RFC 18/20] irqchip: irq-versatile-fpga: remove obsolete
 oxnas compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230331-topic-oxnas-upstream-remove-v1-18-5bd58fd1dd1f@linaro.org>
References: <20230331-topic-oxnas-upstream-remove-v1-0-5bd58fd1dd1f@linaro.org>
In-Reply-To: <20230331-topic-oxnas-upstream-remove-v1-0-5bd58fd1dd1f@linaro.org>
To:     Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        soc@kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Russell King <linux@armlinux.org.uk>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Sebastian Reichel <sre@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Marc Zyngier <maz@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-mtd@lists.infradead.org, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-gpio@vger.kernel.org, linux-pm@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Due to lack of maintainance and stall of development for a few years now,
and since no new features will ever be added upstream, remove support
for OX810 and OX820 IRQ controller.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/irqchip/irq-versatile-fpga.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/irqchip/irq-versatile-fpga.c b/drivers/irqchip/irq-versatile-fpga.c
index ba543ed9c154..5018a06060e6 100644
--- a/drivers/irqchip/irq-versatile-fpga.c
+++ b/drivers/irqchip/irq-versatile-fpga.c
@@ -242,5 +242,4 @@ static int __init fpga_irq_of_init(struct device_node *node,
 }
 IRQCHIP_DECLARE(arm_fpga, "arm,versatile-fpga-irq", fpga_irq_of_init);
 IRQCHIP_DECLARE(arm_fpga_sic, "arm,versatile-sic", fpga_irq_of_init);
-IRQCHIP_DECLARE(ox810se_rps, "oxsemi,ox810se-rps-irq", fpga_irq_of_init);
 #endif

-- 
2.34.1

