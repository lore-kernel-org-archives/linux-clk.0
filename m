Return-Path: <SRS0=HxJ1=NG=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABC90C6786E
	for <linux-clk@archiver.kernel.org>; Fri, 26 Oct 2018 14:45:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 71CF620651
	for <linux-clk@archiver.kernel.org>; Fri, 26 Oct 2018 14:45:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="X6HHISz1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 71CF620651
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727676AbeJZXXJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 26 Oct 2018 19:23:09 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:33679 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727683AbeJZXXJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 26 Oct 2018 19:23:09 -0400
Received: by mail-pl1-f195.google.com with SMTP id x6-v6so636707pln.0
        for <linux-clk@vger.kernel.org>; Fri, 26 Oct 2018 07:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oeSMNKpNfhPY+Ywe9odsVBbi7HxlUs5js+iUwbEI7fY=;
        b=X6HHISz1Ob4/o1zChSdV8ygNvjFt/GbpwkT12/qLNrlRU2odUyoJjbDIza9uISvsop
         zLNrn3eQOt2NZsewltYEGV/FWBiIk2blpLaAqQsCWy0A+l9JAOCimrLvXRc7bzzoQDNj
         f1rhjI7deAaYEPIbrLjrljNStdOtyX3KuJyFQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oeSMNKpNfhPY+Ywe9odsVBbi7HxlUs5js+iUwbEI7fY=;
        b=Hme1X3Tku8YCgxxh2oFIUeOrFds1h9w53iFXA34Jeg36EV+LlF5zNNtekU3zmfWTb5
         j/ZH6LvEgtW8QeGkN1BY/YByrUZLR4g8RaxE8+urOmIR/qidhXvf8EBGmpKlYn19PBhC
         waGm0GRnbHSRVZMtDx9KHgkrbI/wzzcMd4HNM5qlRJX/o4c5BkKtHb0K9vZvd6tWonnj
         gKbF98egeeo17xs81SCLWmAWb74mDfWE0lokjHlsp2OEa1PCvBhPs07fzgl85CAHBlMt
         H6zbvFkQ23LluEvcpeVuQU717dyu+ZMktDZ9XOsdmUbtdP1PjYu6BmBww0qiBjJcbywe
         vzLg==
X-Gm-Message-State: AGRZ1gK/GajmeH07+uAJRoej3Df5HR1tR8+wr2o7hERVw3MiZiDUfUd6
        PbBoTmiReMOzgzSYj01ytqey5g==
X-Google-Smtp-Source: AJdET5eCSw09pC+nyEzugpgTLUFFRA3oIYc1CZlO/7K3hhLsvt95Uo2gbj80mVh0MyOmVoCooM4DKw==
X-Received: by 2002:a17:902:e00a:: with SMTP id ca10-v6mr3745128plb.166.1540565148172;
        Fri, 26 Oct 2018 07:45:48 -0700 (PDT)
Received: from localhost.localdomain ([27.7.51.1])
        by smtp.gmail.com with ESMTPSA id z22-v6sm12044467pgv.24.2018.10.26.07.45.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Oct 2018 07:45:47 -0700 (PDT)
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
        linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
Cc:     Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH v3 17/25] dt-bindings: panel: Add Bananapi S070WV20-CT16 ICN6211 MIPI-DSI to RGB bridge
Date:   Fri, 26 Oct 2018 20:13:36 +0530
Message-Id: <20181026144344.27778-18-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20181026144344.27778-1-jagan@amarulasolutions.com>
References: <20181026144344.27778-1-jagan@amarulasolutions.com>
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
---
Changes for v3:
- Use existing binding doc and update dsi details
Changes for v2:
- none

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

