Return-Path: <SRS0=nRqW=NY=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3E31C43441
	for <linux-clk@archiver.kernel.org>; Tue, 13 Nov 2018 11:18:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9B9F12250E
	for <linux-clk@archiver.kernel.org>; Tue, 13 Nov 2018 11:18:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="dAqS7a6o"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B9F12250E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732462AbeKMVQX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 13 Nov 2018 16:16:23 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:36115 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732873AbeKMVQW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 13 Nov 2018 16:16:22 -0500
Received: by mail-pg1-f195.google.com with SMTP id z17-v6so5546112pgv.3
        for <linux-clk@vger.kernel.org>; Tue, 13 Nov 2018 03:18:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Bezu7kJZ0Njo2tp9TTb/Vi97QjlcQqipnPzN/MWROLI=;
        b=dAqS7a6ocybtD8nrw1Axf8g9rZo4v1m5pFASPnJnrgZGsrdIwbOWDXEPnW3izMQSee
         IXtyXDQYiX2wwxVnc92mT1+eBA+QDFkISWYoPwYNjpPZ/Y8GMTsFUAyyCdBUYHfQ+m36
         jGb2Psr1ymojpM7Wm0IXnzDnuI2Q6FGQSF7e0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Bezu7kJZ0Njo2tp9TTb/Vi97QjlcQqipnPzN/MWROLI=;
        b=ZQRnhjMeJC2ik29UWQPdJPFPjQu6G8QXqUN6nz245/7HGlDOczbS8LzLXfPtQWLDqz
         egWFGXpL7TEOPVPDLeiohLWgcjQLsu7OsRX6zbV0dCcABw6EOTIdZB3S0EWbZFlY/MZW
         C8LrknAsr7WoqzAG9kMm8U79jE6muhBpMySZrtiCBvyWjh3j+4sAaLE1iNSwcMkJuwuf
         cCayLNvpcU+wR5oGJ3xPi0id5uf6tdr5bnYMXAx6Bm8Gzouw6Nd0w99aNMJCyH3KgXje
         D01Xk0ERSCzjbJNBe7iGosYdNBpbTWjAyZmJyqnWsQRu5djjAZo49iRCW0jKIAki9ubb
         lEMA==
X-Gm-Message-State: AGRZ1gLa1VGnZo73aX5YiUl6ggOIJXHZ1zA6sRcl37fSDzelk9oWvjfB
        CYTVH2coFyDxa7sVDe+PxAyIjA==
X-Google-Smtp-Source: AJdET5dLcpR4r1ZiXsuc5sWpJUAicNgYqjYRYQhgVTHlMZ4e7mGSt7n/tj7HdJI4t8H9yiejkK1N+Q==
X-Received: by 2002:a63:310:: with SMTP id 16mr4255308pgd.79.1542107923736;
        Tue, 13 Nov 2018 03:18:43 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:3670:3f11:bc71:2ef7:4a39:e260])
        by smtp.gmail.com with ESMTPSA id 27-v6sm28531377pfm.36.2018.11.13.03.18.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 13 Nov 2018 03:18:43 -0800 (PST)
From:   Jagan Teki <jagan@amarulasolutions.com>
To:     Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>, Icenowy Zheng <icenowy@aosc.io>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Vasily Khoruzhick <anarsoul@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        Michael Trimarchi <michael@amarulasolutions.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com,
        linux-amarula@amarulasolutions.com
Cc:     Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH v4 18/26] dt-bindings: panel: Add Bananapi S070WV20-CT16 ICN6211 MIPI-DSI to RGB bridge
Date:   Tue, 13 Nov 2018 16:46:25 +0530
Message-Id: <20181113111633.20189-19-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20181113111633.20189-1-jagan@amarulasolutions.com>
References: <20181113111633.20189-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Bananapi S070WV20-CT16 ICN6211 is 800x480, 4-lane MIPI-DSI to RGB
bridge panel, which is available on same PCB with 24-bit RGB interface.

So, this patch adds DSI specific binding details on existing
dt-bindings file.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../display/panel/bananapi,s070wv20-ct16.txt  | 31 +++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/bananapi,s070wv20-ct16.txt b/Documentation/devicetree/bindings/display/panel/bananapi,s070wv20-ct16.txt
index 35bc0c839f49..b7855dc7c66f 100644
--- a/Documentation/devicetree/bindings/display/panel/bananapi,s070wv20-ct16.txt
+++ b/Documentation/devicetree/bindings/display/panel/bananapi,s070wv20-ct16.txt
@@ -1,12 +1,39 @@
 Banana Pi 7" (S070WV20-CT16) TFT LCD Panel
 
+S070WV20-CT16 is 7" 800x480 panel connected through a 24-bit RGB interface.
+
+Depending on the variant, the PCB attached to the panel module either
+supports DSI, or DSI + 24-bit RGB. DSI is converted to 24-bit RGB via
+an onboard ICN6211 MIPI DSI - RGB bridge chip, then fed to the panel
+itself
+
 Required properties:
-- compatible: should be "bananapi,s070wv20-ct16"
+- compatible:
+  for 24-bit RGB interface, use "bananapi,s070wv20-ct16"
+  for ICN6211 MIPI-DSI to RGB bridge, use "bananapi,s070wv20-ct16-icn6211"
+
+Required properties for RGB:
 - power-supply: see ./panel-common.txt
 
+Required properties for MIPI-DSI to RGB:
+- reg: for DSI virtual channel used by that screen
+- avdd-supply: analog regulator dc1 switch
+- dvdd-supply: 3v3 digital regulator
+- reset-gpios: a GPIO phandle for the reset pin
+
 Optional properties:
-- enable-gpios: see ./simple-panel.txt
+- enable-gpios: see ./simple-panel.txt(not available in MIPI-DSI to RGB bridge)
 - backlight: see ./simple-panel.txt
 
 This binding is compatible with the simple-panel binding, which is specified
 in ./simple-panel.txt.
+
+Example:
+panel@0 {
+	compatible = "bananapi,s070wv20-ct16-icn6211";
+	reg = <0>;
+	avdd-supply = <&reg_dc1sw>;
+	dvdd-supply = <&reg_dldo1>;
+	reset-gpios = <&pio 3 6 GPIO_ACTIVE_HIGH>; /* PD6 */
+	backlight = <&backlight_dsi>;
+};
-- 
2.18.0.321.gffc6fa0e3

