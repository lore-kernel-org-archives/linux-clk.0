Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B34B2036FA;
	Thu, 13 Feb 2025 17:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739467518; cv=none; b=oMC/m2BeLVtVIKKpQpR/OYA4fj5HgpgPIwqJBbe58MO8SjwAl4Ouz/LspwvqGpG4DlhjElp54MFKsc75zsKTJr2GtuytVtDS2hLOM7v9kmoobsGxrhtLqJr42FH7r79MPUcfyM1h7J6EZasNwnk7FXlDxR+Xw/gVO/GQ3kR0iig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739467518; c=relaxed/simple;
	bh=l5dPN45pvtGQilxxqMAKhJR7woxgI0pU9l8XeuWuM94=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oJXHEjgtskbBXrexl6Is5FXcQP/kzpEpSIVyJCSXvhd8QGoDq8qKOwE8n9UWzST9qpa8Aw5zas0+NJInXpM1LQ3zUULx0fHuUGqS0+m/C4FJR0FULFqbGD+YGTgVWwddweQDo+oeeJV3ThinajC25zU80qbgq2vuFsA6cmYumtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UagYHjvV; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UagYHjvV"
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-5fcb3ee41c5so245716eaf.1;
        Thu, 13 Feb 2025 09:25:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739467516; x=1740072316; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sCeC6vbM7JjhdZF4P2Gx6QbEh1ZqtE+jpJS2T15RIw4=;
        b=UagYHjvVwwU/kA+HSGmzxskKXZ9tuP/RiNfkmM71DR0b2Ectgjviq+e+sS3SNevWJK
         pBYzQer4NyhzJz8dnpB26mCOcRDyzdk7BC8bZHuLf6GFbN5YQuVG6HhTQykQvwMRvCWA
         UxaW3dshCtISHmiQ1aIMeWSFcI5gh5Jb9xuOICne7PGAQZzbBR6g/V48OVtq0mkpLVZS
         LJODt1wZmmnK9Z2JxiA8hBQfK1WOvKPlceqYUYLzIGjrRvpq8E8bnANHVO/Mae6XokKA
         FA80hWXKW1TfwIeU+Db+ZCYW9W3ZD2/Cazm89fyQK6Gkj7N+noNHTrQ6jf1lzsdWSraY
         h8Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739467516; x=1740072316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sCeC6vbM7JjhdZF4P2Gx6QbEh1ZqtE+jpJS2T15RIw4=;
        b=FKN42qzMKNxTC3bKqYnOIW2wiSgvZBDfl258JCzAOUMJnmWKXRj5z8VIKsfSkWGK+3
         6VZu8lQGs/ULJ+K5c0hb1muViwensghZu02Q80Q3wU2bSAMMFEFThvZrZTlBchzCamgg
         KMgM0aJjWpIqJtrLtw8FIts5tYRfYviJpE/5WWtay6tS3qOCk7NPkNS7lJczNKfXuWc4
         z25LBf2Ve56GYjfTi7rLIMtSWwpO3n9DtsEDpeqf8P0ET50In2PZp33M/9VNyQt+KHDB
         mDETIsc4ozb+orthc9SRznirK7wrMMWbdIazNh1PzpStW6m7s1mC83woH0JTK24FhH/o
         hXEg==
X-Forwarded-Encrypted: i=1; AJvYcCXZQ9U5a5D4ztNJClfnSTOGdHMGXUi/DEel8YmQtHv75W//7trnfDsr8Quhx28yAHFEZMZdpRkdxyU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZWzucp/4s2X8Pk8dv0lLfzlcWtCQ3cvHnw5F1s7pVrgKWtrmk
	TQ6eAiYgSar3QTYKdOtZgVjrBkHh5Z/xvK3KTeIP8gN6CV9xjdRZ
X-Gm-Gg: ASbGncuk43rsB5nmgXudb2bi1teM+VSLTOp9nsy7Dm1PnZF0m/5CF20ZMK3fqxi9yy7
	Y4HdHTI5t22ylj/Z62ujP5OAvJIGB67fScPRssP7X+yfMwZ1WNk4x5jl4SIOWT65iwV0/oNbzSX
	+p8GuNhWXzhaQvUlZOkuvEtDtMYvwtL2htuBRvEDm92wi5Gy8m/ySgaaOSnOVrkegmEx3f2FUBy
	oYB6h5YXJ7jn2TAyLPVYKNq1uJ2SjHhACfqiFHJXSUQNM3hNyJJR53tZ8kZqEYWIwOQRpGgRprx
	gbqn60kc4vomHFyYcKNnW944jw5wOZL6F64=
X-Google-Smtp-Source: AGHT+IH6qRsSRtamSK3BLnjwS7X5k+aZPQM3RaXmQaYZAk/4EaOjL1M8reCqrRpVQMVwez3Mn8JOBA==
X-Received: by 2002:a05:6820:2187:b0:5fc:ade5:60d8 with SMTP id 006d021491bc7-5fcaf4d6cacmr2699564eaf.4.1739467516196;
        Thu, 13 Feb 2025 09:25:16 -0800 (PST)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf:2d58:1e06:61bd:218e])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5fcb155b77dsm680358eaf.0.2025.02.13.09.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 09:25:15 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	p.zabel@pengutronix.de,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	samuel@sholland.org,
	jernej.skrabec@gmail.com,
	wens@csie.org,
	sboyd@kernel.org,
	mturquette@baylibre.com,
	ryan@testtoast.com,
	Chris Morgan <macromorgan@hotmail.com>,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH V2 2/2] clk: sunxi-ng: h616: Add clock/reset for LCD TCON
Date: Thu, 13 Feb 2025 11:22:48 -0600
Message-ID: <20250213172248.158447-3-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250213172248.158447-1-macroalpha82@gmail.com>
References: <20250213172248.158447-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add the required clock and reset which is used for the LCD TCON. Please
note that these clocks are exposed on the T507, H616, and H700; however
the H616 does not expose an LCD controller for which these clocks are
needed.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Reviewed-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/clk/sunxi-ng/ccu-sun50i-h616.c | 24 ++++++++++++++++++++++++
 drivers/clk/sunxi-ng/ccu-sun50i-h616.h |  2 +-
 2 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c b/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
index 190816c35da9..40ab6873b797 100644
--- a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
+++ b/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
@@ -645,6 +645,20 @@ static const char * const tcon_tv_parents[] = { "pll-video0",
 						"pll-video0-4x",
 						"pll-video1",
 						"pll-video1-4x" };
+static SUNXI_CCU_MUX_WITH_GATE(tcon_lcd0_clk, "tcon-lcd0",
+			       tcon_tv_parents, 0xb60,
+			       24, 3,	/* mux */
+			       BIT(31),	/* gate */
+			       CLK_SET_RATE_PARENT);
+static SUNXI_CCU_MUX_WITH_GATE(tcon_lcd1_clk, "tcon-lcd1",
+			       tcon_tv_parents, 0xb64,
+			       24, 3,	/* mux */
+			       BIT(31),	/* gate */
+			       CLK_SET_RATE_PARENT);
+static SUNXI_CCU_GATE(bus_tcon_lcd0_clk, "bus-tcon-lcd0", "ahb3",
+		      0xb7c, BIT(0), 0);
+static SUNXI_CCU_GATE(bus_tcon_lcd1_clk, "bus-tcon-lcd1", "ahb3",
+		      0xb7c, BIT(1), 0);
 static SUNXI_CCU_MP_WITH_MUX_GATE(tcon_tv0_clk, "tcon-tv0",
 				  tcon_tv_parents, 0xb80,
 				  0, 4,		/* M */
@@ -855,8 +869,12 @@ static struct ccu_common *sun50i_h616_ccu_clks[] = {
 	&hdmi_cec_clk.common,
 	&bus_hdmi_clk.common,
 	&bus_tcon_top_clk.common,
+	&tcon_lcd0_clk.common,
+	&tcon_lcd1_clk.common,
 	&tcon_tv0_clk.common,
 	&tcon_tv1_clk.common,
+	&bus_tcon_lcd0_clk.common,
+	&bus_tcon_lcd1_clk.common,
 	&bus_tcon_tv0_clk.common,
 	&bus_tcon_tv1_clk.common,
 	&tve0_clk.common,
@@ -989,8 +1007,12 @@ static struct clk_hw_onecell_data sun50i_h616_hw_clks = {
 		[CLK_HDMI_CEC]		= &hdmi_cec_clk.common.hw,
 		[CLK_BUS_HDMI]		= &bus_hdmi_clk.common.hw,
 		[CLK_BUS_TCON_TOP]	= &bus_tcon_top_clk.common.hw,
+		[CLK_TCON_LCD0]		= &tcon_lcd0_clk.common.hw,
+		[CLK_TCON_LCD1]		= &tcon_lcd1_clk.common.hw,
 		[CLK_TCON_TV0]		= &tcon_tv0_clk.common.hw,
 		[CLK_TCON_TV1]		= &tcon_tv1_clk.common.hw,
+		[CLK_BUS_TCON_LCD0]	= &bus_tcon_lcd0_clk.common.hw,
+		[CLK_BUS_TCON_LCD1]	= &bus_tcon_lcd1_clk.common.hw,
 		[CLK_BUS_TCON_TV0]	= &bus_tcon_tv0_clk.common.hw,
 		[CLK_BUS_TCON_TV1]	= &bus_tcon_tv1_clk.common.hw,
 		[CLK_TVE0]		= &tve0_clk.common.hw,
@@ -1062,6 +1084,8 @@ static const struct ccu_reset_map sun50i_h616_ccu_resets[] = {
 	[RST_BUS_HDMI]		= { 0xb1c, BIT(16) },
 	[RST_BUS_HDMI_SUB]	= { 0xb1c, BIT(17) },
 	[RST_BUS_TCON_TOP]	= { 0xb5c, BIT(16) },
+	[RST_BUS_TCON_LCD0]	= { 0xb7c, BIT(16) },
+	[RST_BUS_TCON_LCD1]	= { 0xb7c, BIT(17) },
 	[RST_BUS_TCON_TV0]	= { 0xb9c, BIT(16) },
 	[RST_BUS_TCON_TV1]	= { 0xb9c, BIT(17) },
 	[RST_BUS_TVE_TOP]	= { 0xbbc, BIT(16) },
diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h616.h b/drivers/clk/sunxi-ng/ccu-sun50i-h616.h
index a75803b49f6a..7056f293a8e0 100644
--- a/drivers/clk/sunxi-ng/ccu-sun50i-h616.h
+++ b/drivers/clk/sunxi-ng/ccu-sun50i-h616.h
@@ -51,6 +51,6 @@
 
 #define CLK_BUS_DRAM		56
 
-#define CLK_NUMBER		(CLK_BUS_GPADC + 1)
+#define CLK_NUMBER		(CLK_BUS_TCON_LCD1 + 1)
 
 #endif /* _CCU_SUN50I_H616_H_ */
-- 
2.43.0

