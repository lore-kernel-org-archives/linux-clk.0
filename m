Return-Path: <SRS0=b9GY=MJ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E037C43382
	for <linux-clk@archiver.kernel.org>; Thu, 27 Sep 2018 11:50:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AF2152150D
	for <linux-clk@archiver.kernel.org>; Thu, 27 Sep 2018 11:50:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="PbjR4KQv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF2152150D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727691AbeI0SIP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 27 Sep 2018 14:08:15 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:45884 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727145AbeI0SIO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 27 Sep 2018 14:08:14 -0400
Received: by mail-pg1-f193.google.com with SMTP id t70-v6so1761118pgd.12
        for <linux-clk@vger.kernel.org>; Thu, 27 Sep 2018 04:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Mkh8JJna+rFqognYZHFz3DRcgzLcGu1+fY41Hy8qrpw=;
        b=PbjR4KQv278yn6tIoN3/UxyFcBTGR6EhU58tPxm99ztmRy+8b7lwqHnSjqgZkyZW55
         ThgjqV0+/G+uyHRsslyTnSI9CFQ/Qib1NZnjwEuO+D/Rg12g8HFe8TOPmKgBH0YVBWwL
         LmGV+Azj29nFbqThY1BwcF16/bz6x1xR0qPM8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Mkh8JJna+rFqognYZHFz3DRcgzLcGu1+fY41Hy8qrpw=;
        b=q+nmuFah5SB43XqvZY6XGcZ9132TOjgqYIx3kMcHT9OQzQ9aLoLpV0iDcm+Xw6ZQBb
         zPyV0IZE1phzxdjFklYGRFgR/vWB+oX6cm6BzWucHHue6Hih0CtXv2/nkUikXmpITY7o
         I4DfF7BQQArFvO556+X8TRnRkOKZHxLENMvRzw6RqXFXUm6XeDhUgu2Ie4b/qlNs7TcW
         BzRnXs8nxGp4IIBKpinCh989lCS6nB1wx8sUrbZKP4YonKmWmGYXbs1iH8qpC75Ui05v
         Z9thEPAt4gHR7LzMxVdqI2IW9I0wddg9wJDH6OKEfuMmcoVDjWBlkHAMBHIHrTxQ5HNx
         T6VA==
X-Gm-Message-State: ABuFfoi5MvUtEr76a6uqhPeRtEHjkX3308C2uef7j6vhr0L9L+6uvVII
        Ud+nhBD4CMuOtBted/46H5tDdg==
X-Google-Smtp-Source: ACcGV60bLPZdblOC8fzTH/0IpFLn86HNJg+N6Up5oAb3AZpOuyCezCuas754jeIQiT6nwku3nimuJQ==
X-Received: by 2002:a63:7c1d:: with SMTP id x29-v6mr9872440pgc.273.1538049019101;
        Thu, 27 Sep 2018 04:50:19 -0700 (PDT)
Received: from localhost.localdomain ([183.82.230.83])
        by smtp.gmail.com with ESMTPSA id v36-v6sm3744872pgn.85.2018.09.27.04.50.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Sep 2018 04:50:18 -0700 (PDT)
From:   Jagan Teki <jagan@amarulasolutions.com>
To:     Maxime Ripard <maxime.ripard@free-electrons.com>,
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
Subject: [PATCH 09/12] dt-bindings: panel: Add Bananapi S070WV20-CT16 MIPI-DSI panel bindings
Date:   Thu, 27 Sep 2018 17:18:47 +0530
Message-Id: <20180927114850.24565-10-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20180927114850.24565-1-jagan@amarulasolutions.com>
References: <20180927114850.24565-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org
Message-ID: <20180927114847.V7MT_5sl7lsDszSOZ2hDeYtu5VfINITOmmNPTXoaMo4@z>

Bananapi S070WV20-CT16 is 800x480, 4-lane MIPI-DSI panel, the
same panel PCB comes with parallel RBG which is supported via
panel-simple with "bananapi,s070wv20-ct16" compatible.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 .../panel/bananapi,s070wv20-ct16-dsi.txt      | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/bananapi,s070wv20-ct16-dsi.txt

diff --git a/Documentation/devicetree/bindings/display/panel/bananapi,s070wv20-ct16-dsi.txt b/Documentation/devicetree/bindings/display/panel/bananapi,s070wv20-ct16-dsi.txt
new file mode 100644
index 000000000000..c477163f7999
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/bananapi,s070wv20-ct16-dsi.txt
@@ -0,0 +1,21 @@
+Bananapi S070WV20 CT16 MIPI-DSI panel
+
+Required properties:
+- compatible: must be "bananapi,s070wv20-ct16-dsi"
+- reg: DSI virtual channel used by that screen
+- avdd-supply: analog regulator dc1 switch
+- dvdd-supply: 3v3 digital regulator
+- reset-gpios: a GPIO phandle for the reset pin
+
+Optional properties:
+- backlight: phandle for the backlight control.
+
+Example:
+panel@0 {
+	compatible = "bananapi,s070wv20-ct16-dsi";
+	reg = <0>;
+	avdd-supply = <&reg_dc1sw>;
+	dvdd-supply = <&reg_dldo1>;
+	reset-gpios = <&pio 3 6 GPIO_ACTIVE_HIGH>; /* PD6 */
+	backlight = <&backlight_dsi>;
+};
-- 
2.18.0.321.gffc6fa0e3

