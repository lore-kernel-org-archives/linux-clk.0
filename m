Return-Path: <SRS0=q0iC=OI=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2472BC43610
	for <linux-clk@archiver.kernel.org>; Thu, 29 Nov 2018 16:45:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E119720989
	for <linux-clk@archiver.kernel.org>; Thu, 29 Nov 2018 16:45:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="DexfL2/9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E119720989
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729668AbeK3Dvf (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 29 Nov 2018 22:51:35 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:40476 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729589AbeK3Dve (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 29 Nov 2018 22:51:34 -0500
Received: by mail-wm1-f68.google.com with SMTP id q26so2916201wmf.5
        for <linux-clk@vger.kernel.org>; Thu, 29 Nov 2018 08:45:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/+HUPI7NCPEqxzAVa9O0IyRuOHGA1MJL83xJ5Lr9NJk=;
        b=DexfL2/9SQxhAxCMBRCFlGSG/pDEM1J4Q+hNwIGIjaTtqeMBPQ5n+wffryGKuNY9zB
         1wEP6MZX+SE7EUXl8E5Qc0MZy5GQVW8hUpROg0vsfEW5C48aouekelJnH6BvGQT8ndw2
         ItJPX+6wpXWguzMw99mySU85i+enMh0uk6ZURmcQfpT2FkmIbTyC65vGaoDqaibhp3O3
         vEIIHjuIZRhHqXz/KVFtb5lC0LgepyYddbSWaO+J+PjiI88BTKUpmXZeGSZEBCeg7pEs
         Ht6tbkaGJUnT5BoRjahl7FSMNSVeL8ReDBQTxwMDahOJVZ1QLT+RwEgar/904rs/I+Pc
         1p0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/+HUPI7NCPEqxzAVa9O0IyRuOHGA1MJL83xJ5Lr9NJk=;
        b=thqO5YT1xYGCzTeCkShPNzcoWOo1FmOSYptEvL1AyOtoO950M6pj4F4nRJ68Sm9Xa+
         kbzhcQgZCCEHsQ2K7jDASgOYUEZ+jd4OZZFUN/4+ZDpdwEUkq9oCCw4QvivMCBvJ3vsz
         yH0mZSRXJe7d4H7fILGZTCJEAsfjfccNM8a+YyuUjGFYall2hz1cakc/BfjSJU+U5xNF
         t7tIddvqXrBoFdm+tI33x5n7FiRP864xdB01sjvE1xs85iDa8qrtVSMNELLGFRXqFdtT
         N+yaDQ4Pey54y5uhfmWr1WzxF77jZmAjFIFDJXen6zZ16+ouxn3YcrhrEzAZ96AbaSjI
         TNhg==
X-Gm-Message-State: AA+aEWYS6lcGr1Xq/aK4qTOUHfGGCfS0e1fjubBzGhk84RTqI6Akknex
        22J4EFnuVa2PhVzBeoYBvgYwxQ==
X-Google-Smtp-Source: AFSGD/X4hOS4mY/8Ur4opOqfHA6NapOJLwyMk2VeYKSWVnp+HFPr/jK+Tw5/k3eqPuvpXMJFdx71oQ==
X-Received: by 2002:a1c:b687:: with SMTP id g129mr2353322wmf.59.1543509934245;
        Thu, 29 Nov 2018 08:45:34 -0800 (PST)
Received: from boomer.lan (cag06-3-82-243-161-21.fbx.proxad.net. [82.243.161.21])
        by smtp.googlemail.com with ESMTPSA id d4sm2721909wrp.89.2018.11.29.08.45.32
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Nov 2018 08:45:33 -0800 (PST)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Neil Armstrong <narmstrong@baylibre.com>,
        Carlo Caione <carlo@caione.org>,
        Kevin Hilman <khilman@baylibre.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] dt-bindings: clk: meson: add main controller clock input
Date:   Thu, 29 Nov 2018 17:45:23 +0100
Message-Id: <20181129164524.18670-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181129164524.18670-1-jbrunet@baylibre.com>
References: <20181129164524.18670-1-jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add the clock input of the main clock controller

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt b/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt
index e950599566a9..79454869f96d 100644
--- a/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt
+++ b/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt
@@ -9,6 +9,8 @@ Required Properties:
 		"amlogic,gxbb-clkc" for GXBB SoC,
 		"amlogic,gxl-clkc" for GXL and GXM SoC,
 		"amlogic,axg-clkc" for AXG SoC.
+- clocks: phandle to the input clock of the controller, presumably the
+	  platform xtal.
 
 - #clock-cells: should be 1.
 
@@ -31,6 +33,7 @@ sysctrl: system-controller@0 {
 	clkc: clock-controller {
 		#clock-cells = <1>;
 		compatible = "amlogic,gxbb-clkc";
+		clocks = <&xtal>
 	};
 };
 
-- 
2.19.1

