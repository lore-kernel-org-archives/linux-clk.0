Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F04E7C71155
	for <linux-clk@archiver.kernel.org>; Sun, 22 Nov 2020 09:56:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BF5DD20936
	for <linux-clk@archiver.kernel.org>; Sun, 22 Nov 2020 09:56:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QM/vOEu8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727318AbgKVJ4M (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 22 Nov 2020 04:56:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727517AbgKVJ4I (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 22 Nov 2020 04:56:08 -0500
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 262A1C0613D3;
        Sun, 22 Nov 2020 01:56:08 -0800 (PST)
Received: by mail-wm1-x344.google.com with SMTP id 1so14468730wme.3;
        Sun, 22 Nov 2020 01:56:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=g0CHHJRFLkJgpWDc0kWpwLPadBEpgRbUEt1rTCDH2OM=;
        b=QM/vOEu84chd8mToZdajKu9RssxQXHCnUjUoXlPNMo+GlfRh3Q/dFonAVhdhnK4/en
         lMWOn/Q9Dj1HpQmmEj9RVFWzBYOpUj0ZcdaCheQas1lK2Gc3kYFhomBnbJgAXdAZOZfS
         Xuk4tmaIjT0X8y9urRS4vkvm7BhOTBUwWZtVB/RY5Pcpr9FqtwTezSvT/2yWYQbeSHS3
         cuiklLs+HhdI2Awk5hDCcuKakSTCDy9J+fp/1X/OqP4+uYBbAp6h9SpDe3FV5LphwoK9
         ED0HWdQJxbv32DJtVh9L3OX0sAYkefqzA2k8iDF463vLzl2OpozpkiMemYSIVRa110aH
         lQzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=g0CHHJRFLkJgpWDc0kWpwLPadBEpgRbUEt1rTCDH2OM=;
        b=sn5hpSi4FCU3y1s2UfesaK/s1W5+WrmNcOUh0x6vQKcAPzoMySGxC2B5fmqFEl3RAZ
         UkQP5QoqcSTecs9FgS7MCg9BilLXZS8WJ/Dcujw5AR3hL+GyDUnB929cGmiocwUTr3iV
         Xb4S4OAcM5coPmfgxjoG0dh+OCtyb0wUs981HUoMUDNJR+16oQxnNeo82wNKN2fRocO5
         I6jTwyiodDWTVe7s4wkniKEFIGPfA1CDAFcuWuBzuylo47yMVDIq/4LNOUAMh/DxraCz
         jd0cTHNxetpnbdPh+haVw5lQEXh2xYlmM02lqINcTs3uTwmjy6FTQVsMHfxvXNsuHFm1
         KdDg==
X-Gm-Message-State: AOAM5337jkmrDksbpRxwlhJAPzftq22gq1Wc0zLuuFy8obyP+1Y0PYxc
        BQBYa+X4U+GTf9JDKl7p7J0=
X-Google-Smtp-Source: ABdhPJxp3A0DQalRpG59cJRBY8DqpvXBtw/5bNQayIpkHdNJ42AqfdelkZyrvHAVKpsKqC9PR2ya2g==
X-Received: by 2002:a05:600c:2159:: with SMTP id v25mr6450376wml.155.1606038966972;
        Sun, 22 Nov 2020 01:56:06 -0800 (PST)
Received: from localhost.localdomain (196.red-83-40-48.dynamicip.rima-tde.net. [83.40.48.196])
        by smtp.gmail.com with ESMTPSA id p21sm10593570wma.41.2020.11.22.01.56.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 22 Nov 2020 01:56:06 -0800 (PST)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     mturquette@baylibre.com
Cc:     sboyd@kernel.org, robh+dt@kernel.org, john@phrozen.org,
        tsbogend@alpha.franken.de, gregkh@linuxfoundation.org,
        gch981213@gmail.com, hackpascal@gmail.com,
        linux-clk@vger.kernel.org, evicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        devel@driverdev.osuosl.org, neil@brown.name
Subject: [PATCH v4 6/6] MAINTAINERS: add MT7621 CLOCK maintainer
Date:   Sun, 22 Nov 2020 10:55:56 +0100
Message-Id: <20201122095556.21597-7-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201122095556.21597-1-sergio.paracuellos@gmail.com>
References: <20201122095556.21597-1-sergio.paracuellos@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Adding myself as maintainer for mt7621 clock driver.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f1f088a29bc2..30822ad6837c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11142,6 +11142,12 @@ L:	linux-wireless@vger.kernel.org
 S:	Maintained
 F:	drivers/net/wireless/mediatek/mt7601u/
 
+MEDIATEK MT7621 CLOCK DRIVER
+M:	Sergio Paracuellos <sergio.paracuellos@gmail.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/clock/mediatek,mt7621-clk.yaml
+F:	drivers/clk/ralink/clk-mt7621.c
+
 MEDIATEK MT7621/28/88 I2C DRIVER
 M:	Stefan Roese <sr@denx.de>
 L:	linux-i2c@vger.kernel.org
-- 
2.25.1

