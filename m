Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6CA7C43381
	for <linux-clk@archiver.kernel.org>; Thu,  4 Mar 2021 22:12:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8E1AB64FF1
	for <linux-clk@archiver.kernel.org>; Thu,  4 Mar 2021 22:12:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231313AbhCDWMy (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 4 Mar 2021 17:12:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230124AbhCDWMx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 4 Mar 2021 17:12:53 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CC29C061756
        for <linux-clk@vger.kernel.org>; Thu,  4 Mar 2021 14:12:53 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id b13so27855234edx.1
        for <linux-clk@vger.kernel.org>; Thu, 04 Mar 2021 14:12:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=v/pPDOAIiRjR7lEs29siBxnpMbhMpFCg4qL6RvapyuQ=;
        b=ZvgjxCFdW+xEIJQRTSrZL9RG99WKcuzdTurrplaWC8+EC8MZwlMwU+OBT9Nm8QNzO5
         NdOoYpYInzinJHNu6McP1uHtYkzgOrhNUi32Us+kUjDel5XCS1sga1lOsHnl9S6lAqYl
         N+2auUjyYr0kuUMvKyhGGBAlXCZ08f4U1dgJY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=v/pPDOAIiRjR7lEs29siBxnpMbhMpFCg4qL6RvapyuQ=;
        b=Adx1H1SSPD9BPrePI6HNbR5wi0LwK3aLzOLxQmqoTGsoouXkiH/P4M4VhCSyDVGiKA
         VJz7ClxKfQegJvEx7j20ImVQ+YTBYUrxqPZYL0jRQ0QnB7DyQbYKCWzmeS3I3cad95bs
         tGuG36OwyIVA4JD0XNY5mMVxl6C37ZfIOi51vbgwvYlHqTLnrdViGX37nA/gStavY/ip
         mLQISpeWMPPj2iLD3XHsN94JpRq6FD5pwHQYivtEqymOTXGdzyaZHR2O8BEpvi9xGbXV
         /5gvD6BXf93BtyujuOniM6uc/OK8OyPxNYW1Kh2IH0jjC90mKk0sys7af8t/SYDNuB/1
         31vg==
X-Gm-Message-State: AOAM530vO0rdzlSdjt5ViPnam3kRh495GHFn2d2VzSI0Wbm5LcY/EH4f
        QaBJbttuR8GRPVn8GlY0XHnmOA==
X-Google-Smtp-Source: ABdhPJy3H4qGxTqJAT6Dy3t671giI6caxeE5c2SF84vG2D259IJR/Gin3MwbgSzzwbdGCsregOluwQ==
X-Received: by 2002:aa7:c889:: with SMTP id p9mr6615207eds.82.1614895972167;
        Thu, 04 Mar 2021 14:12:52 -0800 (PST)
Received: from prevas-ravi.prevas.se ([80.208.71.141])
        by smtp.gmail.com with ESMTPSA id q22sm362099ejy.5.2021.03.04.14.12.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Mar 2021 14:12:51 -0800 (PST)
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
To:     Arnd Bergmann <arnd@arndb.de>, Guenter Roeck <linux@roeck-us.net>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-watchdog@vger.kernel.org,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Arnd Bergmann <arnd@kernel.org>
Subject: [PATCH v2 2/3] dt-bindings: watchdog: add optional "delay" clock to gpio-wdt binding
Date:   Thu,  4 Mar 2021 23:12:46 +0100
Message-Id: <20210304221247.488173-3-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210304221247.488173-1-linux@rasmusvillemoes.dk>
References: <20210226141411.2517368-1-linux@rasmusvillemoes.dk>
 <20210304221247.488173-1-linux@rasmusvillemoes.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

[DO NOT MERGE - see cover letter]

We have a board where the reset output from the ADM706S is split in
two: directly routed to an interrupt, and also to start a ripple
counter, which 64 ms later than pulls the SOC's reset pin. That ripple
counter only works if the RTC's 32kHz output is enabled, and since
linux by default disables unused clocks, that effectively renders the
watchdog useless. So add an optional "delay" clock binding.

Suggested-by: Arnd Bergmann <arnd@kernel.org>
Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 Documentation/devicetree/bindings/watchdog/gpio-wdt.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/gpio-wdt.txt b/Documentation/devicetree/bindings/watchdog/gpio-wdt.txt
index 198794963786..527be6b30451 100644
--- a/Documentation/devicetree/bindings/watchdog/gpio-wdt.txt
+++ b/Documentation/devicetree/bindings/watchdog/gpio-wdt.txt
@@ -17,6 +17,10 @@ Optional Properties:
 - always-running: If the watchdog timer cannot be disabled, add this flag to
   have the driver keep toggling the signal without a client. It will only cease
   to toggle the signal when the device is open and the timeout elapsed.
+- clock-names: May contain the entry "delay" if the board has logic
+  that delays the reset signal from the watchdog and which requires an
+  external signal to function.
+- clocks: Phandles corresponding to the clock-names.
 
 Example:
 	watchdog: watchdog {
@@ -25,4 +29,6 @@ Example:
 		gpios = <&gpio3 9 GPIO_ACTIVE_LOW>;
 		hw_algo = "toggle";
 		hw_margin_ms = <1600>;
+		clock-names = "delay";
+		clocks = <&rtc 1>;
 	};
-- 
2.29.2

