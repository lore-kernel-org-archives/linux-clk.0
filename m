Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2870C4320A
	for <linux-clk@archiver.kernel.org>; Fri,  6 Aug 2021 15:22:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9126A611C9
	for <linux-clk@archiver.kernel.org>; Fri,  6 Aug 2021 15:22:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244559AbhHFPWR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 6 Aug 2021 11:22:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244335AbhHFPWL (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 6 Aug 2021 11:22:11 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67BC2C0617B0
        for <linux-clk@vger.kernel.org>; Fri,  6 Aug 2021 08:21:54 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id x8so18663034lfe.3
        for <linux-clk@vger.kernel.org>; Fri, 06 Aug 2021 08:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1EL13QEz0jQB5TyPm5EQVY1mhJsKtZswS+e8nPlFSmk=;
        b=xIdVeClSm5h+yaEEHwHmI3GqBB+wqqezAfScV34d1XkTvLZRrFAKkQkVA7iYInNuyd
         2uzs5o9wpyr4iuAX/aGNCTrc2UoJGgmY/wW0X+BhZltOB/Gw7k7tepcwk5u1zePvAl8r
         C6drAoqZMKRCRJdt4w614Rj1nI3mhYmV4XdwcINazOpL/cfkqrCs0vlXs/I9e0pxGryC
         f6+Ly3fv7wL8RwWoHVPFu2bw8vtAjzuUCirYn2OeupRGzFQW7JbMVIxF43GFjkWx8eUP
         Y4KNHl1+F01Yjqbj9O1ctIgrWG1RYpXEQUIaQG0NWLviKTXxXD/YMypIEj8024r9Go2U
         AzcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1EL13QEz0jQB5TyPm5EQVY1mhJsKtZswS+e8nPlFSmk=;
        b=o6JEudkODcQ29qVvOvM5OP2OhY97CibJ4LqT7re0Xr8LG3xOaiPT44OXU+9vIfTtDG
         0uwySDpVh1r8/ngU9brRT1lJWqhmY/seIIpOjwotKTkyAJGzW+rDGTphZE2P6VDNsoqE
         oLTQAMtYXAxwnYttLhCtN+RZsKh2ry13bVKqmdowUW9A5EH6ilhA0JKX8MeiABlEmDTN
         mVWgKisf95l8z1aMJLsmm8CRGCWJQR070A0wEgOH1+mzGvhEN43wt35VdBHUg+4XM45c
         xc/BoGcWmBVsotu0n4AF0BL8OMQ3LgPYLNavtX6OIFHKHQk7sZEWcHbISyATQKu38Ibh
         nu1g==
X-Gm-Message-State: AOAM532DFxIi17MxEZlkBCiGoggS6fxSWfXmKIqCpj1zIPJ0IiyzDfYf
        TVmo0WfQqUWhYqrsR3F4yChQrg==
X-Google-Smtp-Source: ABdhPJzrtuIMNwEbAEfRv2gXt1rLQY8sTcJq6ivzuavxVikoja9ulbZlZN0f+WV/0monIlJmcioKvg==
X-Received: by 2002:a19:6541:: with SMTP id c1mr7959645lfj.423.1628263312699;
        Fri, 06 Aug 2021 08:21:52 -0700 (PDT)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id i8sm861500lfu.55.2021.08.06.08.21.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Aug 2021 08:21:52 -0700 (PDT)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
Cc:     Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Charles Keepax <ckeepax@opensource.wolfsonmicro.com>,
        Ryu Euiyoul <ryu.real@samsung.com>,
        Tom Gall <tom.gall@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-serial@vger.kernel.org
Subject: [PATCH v2 3/8] dt-bindings: serial: samsung: Add Exynos850 doc
Date:   Fri,  6 Aug 2021 18:21:41 +0300
Message-Id: <20210806152146.16107-4-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210806152146.16107-1-semen.protsenko@linaro.org>
References: <20210806152146.16107-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add compatible string for Exynos850 SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
Changes in v2:
  - None

 Documentation/devicetree/bindings/serial/samsung_uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/samsung_uart.yaml b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
index f064e5b76cf1..2940afb874b3 100644
--- a/Documentation/devicetree/bindings/serial/samsung_uart.yaml
+++ b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
@@ -26,6 +26,7 @@ properties:
           - samsung,s3c6400-uart
           - samsung,s5pv210-uart
           - samsung,exynos4210-uart
+          - samsung,exynos850-uart
 
   reg:
     maxItems: 1
-- 
2.30.2

