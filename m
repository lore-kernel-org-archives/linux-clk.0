Return-Path: <SRS0=HxJ1=NG=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66C89C6786E
	for <linux-clk@archiver.kernel.org>; Fri, 26 Oct 2018 14:46:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3006D2086B
	for <linux-clk@archiver.kernel.org>; Fri, 26 Oct 2018 14:46:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="a6FCB3Rc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3006D2086B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727790AbeJZXXV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 26 Oct 2018 19:23:21 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:34759 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727698AbeJZXXU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 26 Oct 2018 19:23:20 -0400
Received: by mail-pf1-f196.google.com with SMTP id f78-v6so678759pfe.1
        for <linux-clk@vger.kernel.org>; Fri, 26 Oct 2018 07:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=acJxcwDug0RNjCC0CqQln/iczgTpC/B74n+2IS67m6E=;
        b=a6FCB3RcbuPty2mtbcfJLBbTlp1Fv20qcecUMSJWN4QMjgvdedzvRRgwzlf/NtU74O
         /iGWt4wcXFBHbi3qDQ76I2Sv5Lq7Pvi5l9lFggSHRCv2WyHOFp/0MaC6aWrlI+wVhfiM
         K2jCjxsEAapSBgGiovWVeBxF+qYgIAuvAvLf0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=acJxcwDug0RNjCC0CqQln/iczgTpC/B74n+2IS67m6E=;
        b=hColMg5vIzydpkeQ4uJOytLCoNsNPjtsL5TK2Tfb5KgM6oOSA3lWJX0xYyEmE/HB12
         BzIUbk0fVf4f8erEsgZ/4bp3V/ULYdA7KyZuGDA4CPsHe69QzSXfSZObQmCLCKIn72Um
         81yYBq81ei/A+HKFUypZw8naBoIs4IxHDeN8PUnBBc8ZLOd1CaWp+y7UftaZCMZ0G2qp
         xEfcMptUPoseOgtRpZ5RNUoRDpmC7QzpZUjpkxdmZVsemApVAcYwvRmS7uxCVF9KddXi
         t/C67yA5YeS4ZB9yLT0IWgQla9jhoZKKOU+bWg68ixbMp04Q4KAbBp0W2WwR0eG35dNA
         /N2w==
X-Gm-Message-State: AGRZ1gLO2DJGG4hCYUH+m1mnaEyyHWwMS86r6yeIOehLiFAzZ7Laon1k
        GSAvdQWpGlEH2yP6z/iWlPbs4w==
X-Google-Smtp-Source: AJdET5dgy5QAYnte8XlvbEclZbd/2Gm9j+c/ltsRcQQzVB5sVcS0HdFs55TqX7ZZmMYPUN1jeAGk7Q==
X-Received: by 2002:a63:cc51:: with SMTP id q17-v6mr3696782pgi.291.1540565159841;
        Fri, 26 Oct 2018 07:45:59 -0700 (PDT)
Received: from localhost.localdomain ([27.7.51.1])
        by smtp.gmail.com with ESMTPSA id z22-v6sm12044467pgv.24.2018.10.26.07.45.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Oct 2018 07:45:59 -0700 (PDT)
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
Subject: [PATCH v3 19/25] dt-bindings: panel: Add Techstar TS8550B MIPI DSI panel
Date:   Fri, 26 Oct 2018 20:13:38 +0530
Message-Id: <20181026144344.27778-20-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20181026144344.27778-1-jagan@amarulasolutions.com>
References: <20181026144344.27778-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Techstar TS8550B MIPI DSI panel is 480x854, 2-lane MIPI DSI
LCD panel. Add dt-bingings for it.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v3:
- new patch
Changes for v2:
- none

 .../display/panel/techstar,ts8550b.txt        | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/techstar,ts8550b.txt

diff --git a/Documentation/devicetree/bindings/display/panel/techstar,ts8550b.txt b/Documentation/devicetree/bindings/display/panel/techstar,ts8550b.txt
new file mode 100644
index 000000000000..6da050621d07
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/techstar,ts8550b.txt
@@ -0,0 +1,20 @@
+Techstar TS8550B MIPI DSI LCD Panel
+
+Required properties:
+- compatible: must be "techstar,ts8550b"
+- reg: DSI virtual channel used by that screen
+- avdd-supply: analog regulator dc1 switch
+- dvdd-supply: 3v3 digital regulator
+- reset-gpios: a GPIO phandle for the reset pin
+
+Optional properties:
+- backlight: phandle for the backlight control.
+
+panel@0 {
+	compatible = "techstar,ts8550b";
+	reg = <0>;
+	avdd-supply = <&reg_dc1sw>;
+	dvdd-supply = <&reg_dldo2>;
+	reset-gpios = <&pio 3 24 GPIO_ACTIVE_HIGH>; /* PD24 */
+	backlight = <&backlight>;
+};
-- 
2.18.0.321.gffc6fa0e3

