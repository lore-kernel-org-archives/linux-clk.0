Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB032773DE
	for <linux-clk@vger.kernel.org>; Sun, 12 Jul 2026 16:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783872266; cv=none; b=cmpS1joqXy84yPbNaCE34JNP6AiBNEMf6uZ1IjSm0JJWv7p0C0/y0aZqGe/CAqtUYc/eWwij0rGJy1Q1hg/0zvmRksF5K9eB1tn+m+5yB/IgzNcXVK6Do+Bx7XUmOH3e/oqafSOfGcH+pQXQtFDLaR8+jUKCTv9oXSjquqSmcGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783872266; c=relaxed/simple;
	bh=aATECKOCtlFQMaXKY1fICIPDpwmKETh8M/PFHWEOfjM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OLO5eqU9WrQ24o2p6jMLFPZ0nT1IG1cqC9mixA82rrFf2oUSXEOFigqaDrIN7WvRr+CZYRJnpVDtOK+x3vjyUQA9C8mr+RptFPfPqW6vQUS+inklBAYGofXfhOYaPfgfHBhvMkaqHUJ90XrgPTc9AKxa5hvSX7V1avRa8BSvYmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hGbTAgX7; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hGbTAgX7"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-493b7612475so19020365e9.3
        for <linux-clk@vger.kernel.org>; Sun, 12 Jul 2026 09:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783872264; x=1784477064; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=k7WWDimv3b4NdwES6tpNCGufjtNL62BZYyk5PVukc5o=;
        b=hGbTAgX7xLAHe7pTU/c8gBumi8wmbJLeHvFcR175u+vn9tx3vpNKiGn2R8q9QDaWEM
         JASW1kRnwIM6yMvcMDs0xBEDZGWP1HyGMLQaHxWBdW0iSCYTeeadEwgIQsC6zOuvghb4
         AaEiaGGZmnJojAPuJjRwoJ3Iz5+K7w7lxE+3v+Ypbm5flxDOXI84i7EIwi0PyaMxYJJ2
         14W9n1HArF3sTUL7/7qEp9Z4TBZbomKQAjHSMakFjkLlC5SnLn0g3h9umzkipvYt14nn
         lG3em9U4zC6CT/cgSDNEsXcHiF4WmMOqffGSLRjZMI9b6YnGOGkMdnjPIbyX7xqPU1vS
         NZoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783872264; x=1784477064;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k7WWDimv3b4NdwES6tpNCGufjtNL62BZYyk5PVukc5o=;
        b=p/G9RlV7VR7S/4acFiFwJ2jNSdLoe84mAFnzAlBc8ms0OV7YHRxhKh9tVg5CmWDUGC
         77lxSpwmY4B2LNsYbdCDvb6VVcZ1WDuowcfsMw/JzOrhuD7pv18zv24NTjpLAJM7IKSH
         D7VaeeYKVD2ObMcPu6IrxGR1DU+F4GD+gz25WZ8wJh/NXjz1McveonAfkXVIhRE71IRc
         Y6n0+Bd6SZxrDepG6K9bynHanVcImwtpSah0z9EIqRjfVTYo3l6VrDfmJUzKKUA4UYtd
         KGilDyjsQd54yVRTy4Pq7IotEuCHH0f8gBUX/+EscQ7/YdoQs1Z66nhoC5l8xe8CdSD6
         TI2Q==
X-Forwarded-Encrypted: i=1; AHgh+Rp5vMwAyRn672e1tePmDEHXWk/V/Bu04cnE8yv/ZqFNYqx2lXzuvY+lwwtSiZ5kpp+l52qjicE4RFA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzj7sMyPKUqzVozXcByjRkjdztJ7sY5LklfP3W6yQex5bHUkvzx
	89gGLSZiIrXhbdG7lw0EsgNbIbvWBX7D4XABX7+pEcV1lQPffEAiJMTV
X-Gm-Gg: AfdE7cnP1fFnG1QHGA7esGeH08fq95WS8LbmExSapMgorwXe3QJZWOEpxdQWMG3SpHT
	AmrfeXZHZkuihhNslcmfawAjJoojvNg/3rrXGC4rl1/bCbOkeI27xdKMa4cv35XK67CvdB2QXlP
	wwbJnnEz9Q7E2iKeFIS6vwB4nwK1txXNK6JbLzwNlv01B+wgxLHv6fHAyOGbQkw8qEc384048qD
	3xGbZ46MUgX5GxCcYo3k0KgEFYwdtXl1rHOHfhZOlz8vo30xV2egtTUwVNcLA5suEx8/vYXk23h
	cSyBBkBRJjaT9jHevUxyHcCqzbhrenM5oxLQAN8xLvYXIhj/qhiqjPW8ECAvnos0DWYjzjRsAJ9
	gLK3k+4wwzU1q3AoID1odtCXYZ0g7869MIpSGGKA1OTRLS/NP1NhoLOfOouiyHKvOORAoKJ1o4I
	P/HEvyxCab+81aJVTZJz8K6mC+GtLNaisHGRDk6UBYKvGKRcJpZ3DmJXS3d7oKwWqwsNcHpiu9b
	CcPkBXB9EDagDT7///PgFixcqVhs7X7yVxGE/ly5SC/BykAnRhhCZ0j
X-Received: by 2002:a05:600c:5392:b0:493:b811:e549 with SMTP id 5b1f17b1804b1-493f8829963mr60790915e9.29.1783872263381;
        Sun, 12 Jul 2026 09:04:23 -0700 (PDT)
Received: from localhost.localdomain (dynamic-095-117-112-249.95.117.pool.telefonica.de. [95.117.112.249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493f2c8de2asm204774265e9.1.2026.07.12.09.04.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 12 Jul 2026 09:04:22 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Ryan Chen <ryan_chen@aspeedtech.com>
Cc: Joel Stanley <joel@jms.id.au>,
	Brian Masney <bmasney@redhat.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	linux-clk@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Karl Mehltretter <kmehltretter@gmail.com>
Subject: [PATCH] clk: aspeed: ast2700: select AUXILIARY_BUS
Date: Sun, 12 Jul 2026 18:03:01 +0200
Message-Id: <20260712160301.98941-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The AST2700 clock driver also exposes the SoC reset controller: it hands
its register base to a reset auxiliary device via
devm_auxiliary_device_create(), which the separate ASPEED reset driver
(RESET_ASPEED) then binds to. That create call needs the auxiliary bus
core (AUXILIARY_BUS), not the reset driver itself, but COMMON_CLK_AST2700
does not select AUXILIARY_BUS.

It builds today only because RESET_ASPEED selects AUXILIARY_BUS and is
normally enabled alongside the clock driver. On a randconfig with
COMMON_CLK_AST2700=y and RESET_ASPEED=n, nothing pulls the auxiliary bus
in and the kernel fails to link:

  ld: drivers/clk/aspeed/clk-ast2700.o: in function `ast2700_soc_clk_probe':
  clk-ast2700.c:(.text+0x147c): undefined reference to `__devm_auxiliary_device_create'

Select AUXILIARY_BUS directly, as other clock drivers that create
auxiliary devices do, so it builds regardless of the reset driver.

Fixes: fdc1eb624ddc ("clk: aspeed: add AST2700 clock driver")
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 drivers/clk/aspeed/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/aspeed/Kconfig b/drivers/clk/aspeed/Kconfig
index ef50481c31ff..2f505eb3ca95 100644
--- a/drivers/clk/aspeed/Kconfig
+++ b/drivers/clk/aspeed/Kconfig
@@ -15,6 +15,7 @@ config COMMON_CLK_ASPEED
 config COMMON_CLK_AST2700
         bool "Clock driver for AST2700 SoC"
         depends on ARCH_ASPEED || COMPILE_TEST
+        select AUXILIARY_BUS
         help
           This driver provides support for clock on AST2700 SoC.
           The driver is responsible for managing the various clocks required
-- 
2.39.5 (Apple Git-154)

