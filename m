Return-Path: <SRS0=UrzD=QE=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89723C282C8
	for <linux-clk@archiver.kernel.org>; Mon, 28 Jan 2019 18:04:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 575082148E
	for <linux-clk@archiver.kernel.org>; Mon, 28 Jan 2019 18:04:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="zokui+Tl"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727074AbfA1SEs (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 28 Jan 2019 13:04:48 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:36001 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727052AbfA1SEs (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 28 Jan 2019 13:04:48 -0500
Received: by mail-wm1-f66.google.com with SMTP id p6so14921209wmc.1
        for <linux-clk@vger.kernel.org>; Mon, 28 Jan 2019 10:04:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jxiL0ybfHeOFIjwNJisaDSjhHM5fwBbvxrHh17glkpo=;
        b=zokui+Tl7nAaqnJAKhYpH4JjWiX/OfsRcgUjR3xJeQw8lYVobavil06hUxjJuBEnDm
         KAMD2RXczMKyM39dSfM7U2ehwwYomCWvGyxJE5YyuCZlZ+N8bHDtdcrkmLfYf8lJLl3N
         MY7ybdbq1BqImrwNPAASlT4e+D/rbtd9GyRn/4bAxtwJHKWGIFb9PIlMXIshamcCScru
         kC2lVQHd4vLOlvsOAGwB+5tz1CBNaok5ayecQgQ2OMCPy3RsxoJJq0fMMO6HmJM8ihR1
         XnpuXvMEmxLuGLZ5ibkKP8Sol4+JckazGsGbWTLxFo8Ao9lS/RJeNfOtRLehQ1+SNXrw
         /ElA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jxiL0ybfHeOFIjwNJisaDSjhHM5fwBbvxrHh17glkpo=;
        b=A2tkwoFKzHY+t0nupeagVrrdERDwyfxKrF8LDVhcQosd5aI0xaapg9PYJOk3Kh9qVH
         hq3BtZMDXoSojqrUJDmewlBZ8sL/Xy2R4nrKusBjUfvgDPuayTdl0UwV7TzOceukvjSQ
         qbv77vzZhifpxLVHjpMokriXyQcx0lpfhEvOTF+JrcQoUtQRiYfBg3LJ4Wecuq3UAzOK
         NHJrSaHLVtZO5ygisohfqUb250SoiD4+hIfgTtjifopX1DMh+tzgSEsiidg8tzUro1xx
         DcXhFCfzu4UTPsokoXNsWT1UjocNjXshCH9QJjTgTpkTMf+1xSKM0RApZkaFxvvFhtAr
         OMJQ==
X-Gm-Message-State: AJcUukfmbG57JLBBR0D/NFPbIu3OKGqkpgfwzf2Bd09FNmD+SzawVIrp
        ghYyyDKyPBpr2BKBh8p7G4d5nw==
X-Google-Smtp-Source: AHgI3IaWxr5X1uid7/Vo1ZeiTLguHcKoXOrRKhtR6Fxy68C9dTQWMzJCEFqyUhlczJcOOPAZ85Q95A==
X-Received: by 2002:a1c:488b:: with SMTP id v133mr8620594wma.31.1548698686336;
        Mon, 28 Jan 2019 10:04:46 -0800 (PST)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
        by smtp.googlemail.com with ESMTPSA id p6sm145548193wrx.50.2019.01.28.10.04.44
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Jan 2019 10:04:45 -0800 (PST)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Neil Armstrong <narmstrong@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 03/14] clk: meson: axg-audio does not require syscon
Date:   Mon, 28 Jan 2019 19:04:19 +0100
Message-Id: <20190128180430.28689-4-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190128180430.28689-1-jbrunet@baylibre.com>
References: <20190128180430.28689-1-jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The axg audio clock controller uses regmap mmio, not syscon.

Fixes: 1cd50181750f ("clk: meson: axg: add the audio clock controller driver")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
index efaa70f682b4..2479dab09d70 100644
--- a/drivers/clk/meson/Kconfig
+++ b/drivers/clk/meson/Kconfig
@@ -50,7 +50,7 @@ config COMMON_CLK_AXG_AUDIO
 	tristate "Meson AXG Audio Clock Controller Driver"
 	depends on COMMON_CLK_AXG
 	select COMMON_CLK_AMLOGIC_AUDIO
-	select MFD_SYSCON
+	select REGMAP_MMIO
 	help
 	  Support for the audio clock controller on AmLogic A113D devices,
 	  aka axg, Say Y if you want audio subsystem to work.
-- 
2.20.1

