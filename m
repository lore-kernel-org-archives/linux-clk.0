Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF480261399;
	Wed, 12 Feb 2025 19:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739387618; cv=none; b=mTU6v/M20+eUuI3qt5zDiY5UWOxLhQY/kvvEqM8y7stksy9XUzvoBN2kgNiYejwGMLHKV6oMqoXP82qBIGGzury2jyhYT8VLShKsAk5DSoYayaQEPduH6kfa9DjiWGdRMZdFB0a2g0k1fdlPQMdtjzYFpV3+9OYVx9KApz4/zvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739387618; c=relaxed/simple;
	bh=wLCQ2f1+YJxgvCbBGI9LbW7YY48Pd+4o67I9d4wtmqE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RbUSQ31nScjYfmGEr5VjAfO/K/oQBWobO1SCbqeISyaevREhb5sZaMalZeQXZSHr2O4OLS3X+XW4iu2+b5wnAO8sGoTEu08nT3d9JuAcXV950hLRaLsCZ2A17J6/BVNX1v6LFIl5QZFna3mC0WnaPPS2RDC91YRXoB6p30zzVYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GQ0ata4a; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GQ0ata4a"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-726cdcec232so54104a34.1;
        Wed, 12 Feb 2025 11:13:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739387615; x=1739992415; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j0utfirSm2ee9OkvmXwv6k+XXpfWz1EBLM4IQ2aLZFk=;
        b=GQ0ata4aCHSJZ7U8VqiyjvZxAmbEtwVXSBXjEXOv1SBB9CPkD/bt8OiAiJVRnEALI2
         dvHIAI02r2FH11WWjUUry+yxn8NVbZ/E7hYYBS32S6oUhB6LqklO2WFF+UBsjPr1sx8p
         BMc+NZB6nNK4oRWKeEPpl1+ruJYHi9p7Qmfqj5+M+WQDezPPr8La3Ey28ObzOJWJKHOj
         eXH159NJdf8iDBUpZFsZWQGT241pOTvJg8T7MaPEZJbTG4Z4FsUaNhvAkMWdceTNx7Wt
         qtpmGrGjKfqpiSeRxVKYXsv7T+vVEhjrecI1kqGYEcqwyltY4akw7/lUNXHo/y3B2LeQ
         ontQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739387615; x=1739992415;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j0utfirSm2ee9OkvmXwv6k+XXpfWz1EBLM4IQ2aLZFk=;
        b=JVxofwjnQOMnjZBVw8kdhSor8VDHbEJD249/2DikZF8iYAurTy7xIff6eHcCAbrAhI
         mRxpQ4JQ3xTKNDiq5oo+LKo2awmAtlpQELDW80tNVbz5FkBwHygw6pvdTCz1GF4kVeBe
         GN1OqoUhN8q6BCDD+hf6FEFc1Gcvnqf5bOEqXzEwFc4PHUJBT1VfaXILCkHR60yIlvOh
         QZjmZvWrwqus2htY/anjpikW9ztGd51WKmCbkB9MueZ39MX2JjUNJntPeO4+oAJTVtl3
         Fj9yDZdz8Db7ipGjKKxlRi+pRSLQQgGTsP26peaTRqx9+6wz9Zsy7V7VNZ/pQbgIoE2s
         ACKA==
X-Forwarded-Encrypted: i=1; AJvYcCXD+UX0uAI2o1H1peYN388+cazSg84HOrbFLhfiEAm6RUBlmt9Jt0csFdtp12Z+044yA7ThlIQmh4s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzvbf+3h5NabcspVo3x+ujvjzxDuMdXEE1kfYvUbFgPnLaI0vXV
	gbe2F6so38Axi5jiXiULswV16QvsG3jK7UFVmNxcCjR9lTX0pwB1
X-Gm-Gg: ASbGnctXQcakoAo+yOJfv/tSBZvGXEAxO0z6TvrPvD32nJZl1FwNzRlF3e5K1qbIkXQ
	rAF94DeZp10bXWQ/E/7+i9NGNcw+UYovW1UTy2uJABF/RkXNFhTQqhUpRF0sYt4F6U4tUnU07xA
	QsbJBdr9sp7pfsknXIjI2Ddbff418uhOnEys/+h49HeEbPSO/ZGKMGvzkhbkmVjrZgJ89PaV8nr
	B26r1uEBdG4Tprrx1ynrl5E1G6M0McPPUK13S+o7jwcXGCJXpJ3s34sa8R+ObcId7MkmaXRdrTE
	ybAgnSNK4DWtSdR94SnrgVaYNLDofwQYxQ==
X-Google-Smtp-Source: AGHT+IHvXWfVwKRAs5NX0wSV+HxgT+3+ZggyuiN9UEZrrV9fOR3iBEdVkDm5awpiImw+tDKY3rfWQg==
X-Received: by 2002:a05:6830:4390:b0:71d:4fea:e800 with SMTP id 46e09a7af769-726f1c8378amr3274923a34.9.1739387615561;
        Wed, 12 Feb 2025 11:13:35 -0800 (PST)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf:511b:97aa:dc6:7ad4])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-726fd014926sm356033a34.32.2025.02.12.11.13.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 11:13:35 -0800 (PST)
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
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 2/2] clk: sunxi-ng: h616: Add clock/reset for LCD TCON
Date: Wed, 12 Feb 2025 13:11:09 -0600
Message-ID: <20250212191109.156766-3-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250212191109.156766-1-macroalpha82@gmail.com>
References: <20250212191109.156766-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add the required clock and reset which is used for the LCD TCON.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
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

