Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0496648B372
	for <linux-clk@vger.kernel.org>; Fri, 15 May 2026 15:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778857857; cv=none; b=hRL6SXpmt0mBpib81TA4yLMgxBd7NQ6pL4ED4aBDyDBTlQkl2NQFNMlGFs/DRwNE9ArvN71WfqxqoRcWA1F5NXJn7cId2+sEQbUbYeU+9/YUar3mncAhNiH7gKH4Xs+gq6qZHxAGkxd73NTDorGwD4MaCBR8FUEKJVLyA6Yoyuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778857857; c=relaxed/simple;
	bh=gvAmfioqT8y1jSwHw1J8q75Xek5LTO+pwLGKsmQhLUs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Yhn5j87l82ughOGiPt5UMe/+gjpKTCA9arev2T6xKlq3x0RpmVKNp39M3sGOn4KsalO4RseyH2F8od/4s8wYrrabWiFF2oU86izljjNrtFiocDrk5vZDJbNPEk9iVfIA/O/M5NzXxVEf9f+saDXKzsfKQxbvfjthyskK4UACico=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=FtRFVDLl; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="FtRFVDLl"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4890d945eb4so6040105e9.0
        for <linux-clk@vger.kernel.org>; Fri, 15 May 2026 08:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778857854; x=1779462654; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PZKNei31dHIg7fHym3DByQ5PK1IfJWqB5musI/fgNj0=;
        b=FtRFVDLl7cBUrmfFwBPcm++wlj8Wu4c7NYVRbL/OD3vZpzeopvXg5ruL9CzUOuXmAQ
         G/Vovfhb1CrIWqc5gPUs9SSqAMbU1U25D8L8G4FvZ80J0RHr2OMGz+uaQPij3H4LiGrX
         FDE6/PsarbY02LlX/i3SBqLMfAKXZ7BzOPcSnB12QgfZW+af+pqhw+QzNepeCkM4EWQi
         b/q2bzQGo5qomcoggucdvUEOuxzFa/A7QytGwojgjhsdOOl72reUyeIbMP0JpjjRz9hy
         8p1pbmpWOWSjOa+j7nr7TONHnZq47LnBO4HTw/SDqmdcu7HSNYrQRcTD/Z3HxysV+k9J
         LZOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778857854; x=1779462654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PZKNei31dHIg7fHym3DByQ5PK1IfJWqB5musI/fgNj0=;
        b=rJLZYHwgT/IT7rUKNFLgkAvyxnRVPCRen1WS2Lfr0cH1m2lP0BtmX1sedT0a8qO45f
         SPqb0mUmNxIMIXyUrjG6T0zF/za3hlB2FSTEc0N+j/54Ps9rwAB2h+3waVoCRXonTllH
         nTfUDGnVGRro24wI9Pj2G7xh2DzkrH7EwKfhq2YMngNqniBSymeyFYIg4pnTwLzHN5vK
         2n6fq3ovBf/IDSU8r9Vq9wQTVkfXq7emLxO4fH4J4ONlzv61dgnTxmtaKFtoBJRzoCwH
         /+Zj5WhcX6UbMRSKajJJPBT73vkDSXhan1baYexnsJ+7mSLnB7lI0QjTBLTCCGEIIbzQ
         pe8w==
X-Forwarded-Encrypted: i=1; AFNElJ+w3TnpJ1C1Hep7d/7Q0QlSPBZLy4zzNe98bMKuIygX7BH58KouLDGuKKqluC6vuC6cFnhQx8UDYks=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFgBRvh9GdWSps7O99I9LOq+M+trCTf1ti0uqNwHF90XM+O02q
	i1tbU+OZO05DVKTd+BgAlSgWUEwDeAxLcYuc0M9fh8wgzcBaVgBo5PBaeb6XKdSfdUo=
X-Gm-Gg: Acq92OFoBTf4v8j7eafppHYOHkH0022DAuqrUqA0PKhocwjkPzMujnZWkaqeo4sQISy
	HsQKLkguRGW4H75msZ58lsLXn4/sEeETUacUjo2PBsKKx/fvcia4MkBwss5ojk+52deMBrnzUOb
	MRRBDZMFdks6E6yzZZDwwo1L++hsL7u8iM+fy6/ZZPCIv/GDNnw9x93qvAMDNN/YjOf4a1Io9VB
	jpuCcOc3cIt3OYLg3wXaoq46s0pPvdJvT7gkTnj5CPu7cbRxMENzcIn3SdBO7BNGHGxWCEydDAZ
	lJ8amYjT7+TIUipjoiq8VYkxSxVKGwoKQ2LdNOsXm+LSb2/GQU5bYO9crzjU0BroBjyC5ydd5oO
	p+Ov9HwSce2zVmPn6BB+ZGLkrQqPZTitICbZwtBa8HaNX9mVPBI7N6Ledlyen1bBgF1zbXtYh4M
	lTh70NoxApAiAFBlyJQT43Cwj6GVwzQJQXtwv9OCFMrgeh1hqbhsHsDvdQbXNLiQ+umr5F0FMqA
	UHYBYal/pOLd64=
X-Received: by 2002:a05:600c:a09:b0:485:3cef:d6ea with SMTP id 5b1f17b1804b1-48fe539198fmr59832065e9.13.1778857853567;
        Fri, 15 May 2026 08:10:53 -0700 (PDT)
Received: from localhost (p200300f65f47db047ce9331f6697a627.dip0.t-ipconnect.de. [2003:f6:5f47:db04:7ce9:331f:6697:a627])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-48febe6b9efsm26863105e9.5.2026.05.15.08.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 08:10:53 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Max Filippov <jcmvbkbc@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Alex Helms <alexander.helms.jy@renesas.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] clk: Use named initializers for arrays of i2c_device_data
Date: Fri, 15 May 2026 17:10:40 +0200
Message-ID:  <3a193d91e64703892900b62709bd1a67f540f39b.1778857289.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1778857289.git.u.kleine-koenig@baylibre.com>
References: <cover.1778857289.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=9372; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=gvAmfioqT8y1jSwHw1J8q75Xek5LTO+pwLGKsmQhLUs=; b=owGbwMvMwMXY3/A7olbonx/jabUkhix282KF8Gpv+aL0rw39bb2RDFe2W7cwi/Pyri1bMF1X6 R4Th1cnozELAyMXg6yYIot945pMqyq5yM61/y7DDGJlApnCwMUpABM5c4L9n9o395+692Oe2N1c ImS+cfd85tM/S+3OHDvYrB5dapTvXncpNU/95653rzaqGzL+jfJQty8snJdjPu3808LjjtHpcdq czGqcV2222Iq0Jv9dufV35tQXF1wczJO/hBQZHn0zxX5ZgtLN1w4W6ovDu90cuWakb5N6Eqy3p6 a98+WuqoDEC/cdeQOLM8Nnbu89xrhxUx77Pul5mwJXFd6xDN+98uCcaXq/9poa5XDal9fP/dF3o kon6PCJhZxLv3FcLrhX3cv+Jz6yS6Ugvun6jEuKZ4NZOSqerb+T387h//RViIf7Jufpbjx2n3OT PRuCGf2DvVzc3aT1th8vnx25MEdcJyFVS+qP6w/5agsA
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

While being less compact, using named initializers allows to more easily
see which members of the structs are assigned which value without having
to lookup the declaration of the struct. And it's also more robust
against changes to the struct definition.

The mentioned robustness is relevant for a planned change to struct
i2c_device_id that replaces .driver_data by an anonymous union.

While touching all these arrays, unify usage of whitespace and commas.

This patch doesn't modify the compiled arrays, only their representation
in source form benefits. The former was confirmed with x86 and arm64
builds.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/clk/clk-cdce706.c      |  2 +-
 drivers/clk/clk-cdce925.c      |  8 ++++----
 drivers/clk/clk-cs2000-cp.c    |  4 ++--
 drivers/clk/clk-renesas-pcie.c |  6 +++---
 drivers/clk/clk-si514.c        |  2 +-
 drivers/clk/clk-si521xx.c      |  6 +++---
 drivers/clk/clk-si5351.c       |  8 ++++----
 drivers/clk/clk-si544.c        |  6 +++---
 drivers/clk/clk-si570.c        |  8 ++++----
 drivers/clk/clk-versaclock5.c  | 16 ++++++++--------
 drivers/clk/clk-versaclock7.c  |  4 ++--
 11 files changed, 35 insertions(+), 35 deletions(-)

diff --git a/drivers/clk/clk-cdce706.c b/drivers/clk/clk-cdce706.c
index a495d313b02f..425a0481f46f 100644
--- a/drivers/clk/clk-cdce706.c
+++ b/drivers/clk/clk-cdce706.c
@@ -680,7 +680,7 @@ MODULE_DEVICE_TABLE(of, cdce706_dt_match);
 #endif
 
 static const struct i2c_device_id cdce706_id[] = {
-	{ "cdce706" },
+	{ .name = "cdce706" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, cdce706_id);
diff --git a/drivers/clk/clk-cdce925.c b/drivers/clk/clk-cdce925.c
index 0b2ad21e6e4d..30d0493c7718 100644
--- a/drivers/clk/clk-cdce925.c
+++ b/drivers/clk/clk-cdce925.c
@@ -826,10 +826,10 @@ static const struct clk_cdce925_chip_info clk_cdce949_info = {
 };
 
 static const struct i2c_device_id cdce925_id[] = {
-	{ "cdce913", (kernel_ulong_t)&clk_cdce913_info },
-	{ "cdce925", (kernel_ulong_t)&clk_cdce925_info },
-	{ "cdce937", (kernel_ulong_t)&clk_cdce937_info },
-	{ "cdce949", (kernel_ulong_t)&clk_cdce949_info },
+	{ .name = "cdce913", .driver_data = (kernel_ulong_t)&clk_cdce913_info },
+	{ .name = "cdce925", .driver_data = (kernel_ulong_t)&clk_cdce925_info },
+	{ .name = "cdce937", .driver_data = (kernel_ulong_t)&clk_cdce937_info },
+	{ .name = "cdce949", .driver_data = (kernel_ulong_t)&clk_cdce949_info },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, cdce925_id);
diff --git a/drivers/clk/clk-cs2000-cp.c b/drivers/clk/clk-cs2000-cp.c
index 8800472ba63f..fd277dcefad7 100644
--- a/drivers/clk/clk-cs2000-cp.c
+++ b/drivers/clk/clk-cs2000-cp.c
@@ -122,8 +122,8 @@ static const struct of_device_id cs2000_of_match[] = {
 MODULE_DEVICE_TABLE(of, cs2000_of_match);
 
 static const struct i2c_device_id cs2000_id[] = {
-	{ "cs2000-cp", },
-	{}
+	{ .name = "cs2000-cp" },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, cs2000_id);
 
diff --git a/drivers/clk/clk-renesas-pcie.c b/drivers/clk/clk-renesas-pcie.c
index aa108df12e44..b59607e3e659 100644
--- a/drivers/clk/clk-renesas-pcie.c
+++ b/drivers/clk/clk-renesas-pcie.c
@@ -395,9 +395,9 @@ static const struct rs9_chip_info renesas_9fgv0841_info = {
 };
 
 static const struct i2c_device_id rs9_id[] = {
-	{ "9fgv0241", .driver_data = (kernel_ulong_t)&renesas_9fgv0241_info },
-	{ "9fgv0441", .driver_data = (kernel_ulong_t)&renesas_9fgv0441_info },
-	{ "9fgv0841", .driver_data = (kernel_ulong_t)&renesas_9fgv0841_info },
+	{ .name = "9fgv0241", .driver_data = (kernel_ulong_t)&renesas_9fgv0241_info },
+	{ .name = "9fgv0441", .driver_data = (kernel_ulong_t)&renesas_9fgv0441_info },
+	{ .name = "9fgv0841", .driver_data = (kernel_ulong_t)&renesas_9fgv0841_info },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, rs9_id);
diff --git a/drivers/clk/clk-si514.c b/drivers/clk/clk-si514.c
index f61590d70575..c0b433ad9372 100644
--- a/drivers/clk/clk-si514.c
+++ b/drivers/clk/clk-si514.c
@@ -379,7 +379,7 @@ static int si514_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id si514_id[] = {
-	{ "si514" },
+	{ .name = "si514" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, si514_id);
diff --git a/drivers/clk/clk-si521xx.c b/drivers/clk/clk-si521xx.c
index 4ed4e1a5f4f2..e41d922437ee 100644
--- a/drivers/clk/clk-si521xx.c
+++ b/drivers/clk/clk-si521xx.c
@@ -365,9 +365,9 @@ static int __maybe_unused si521xx_resume(struct device *dev)
 }
 
 static const struct i2c_device_id si521xx_id[] = {
-	{ "si52144", .driver_data = SI521XX_OE_MAP(0x5, 0xc0) },
-	{ "si52146", .driver_data = SI521XX_OE_MAP(0x15, 0xe0) },
-	{ "si52147", .driver_data = SI521XX_OE_MAP(0x17, 0xf8) },
+	{ .name = "si52144", .driver_data = SI521XX_OE_MAP(0x5, 0xc0) },
+	{ .name = "si52146", .driver_data = SI521XX_OE_MAP(0x15, 0xe0) },
+	{ .name = "si52147", .driver_data = SI521XX_OE_MAP(0x17, 0xf8) },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, si521xx_id);
diff --git a/drivers/clk/clk-si5351.c b/drivers/clk/clk-si5351.c
index e755db545e2e..20b0c3c48b86 100644
--- a/drivers/clk/clk-si5351.c
+++ b/drivers/clk/clk-si5351.c
@@ -1425,10 +1425,10 @@ si53351_of_clk_get(struct of_phandle_args *clkspec, void *data)
 #endif /* CONFIG_OF */
 
 static const struct i2c_device_id si5351_i2c_ids[] = {
-	{ "si5351a", SI5351_VARIANT_A },
-	{ "si5351a-msop", SI5351_VARIANT_A3 },
-	{ "si5351b", SI5351_VARIANT_B },
-	{ "si5351c", SI5351_VARIANT_C },
+	{ .name = "si5351a", .driver_data = SI5351_VARIANT_A },
+	{ .name = "si5351a-msop", .driver_data = SI5351_VARIANT_A3 },
+	{ .name = "si5351b", .driver_data = SI5351_VARIANT_B },
+	{ .name = "si5351c", .driver_data = SI5351_VARIANT_C },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, si5351_i2c_ids);
diff --git a/drivers/clk/clk-si544.c b/drivers/clk/clk-si544.c
index 09c06ecec1a5..f45f3f73aa82 100644
--- a/drivers/clk/clk-si544.c
+++ b/drivers/clk/clk-si544.c
@@ -479,9 +479,9 @@ static int si544_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id si544_id[] = {
-	{ "si544a", 1500000000 },
-	{ "si544b", 800000000 },
-	{ "si544c", 350000000 },
+	{ .name = "si544a", .driver_data = 1500000000 },
+	{ .name = "si544b", .driver_data = 800000000 },
+	{ .name = "si544c", .driver_data = 350000000 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, si544_id);
diff --git a/drivers/clk/clk-si570.c b/drivers/clk/clk-si570.c
index b0b1830dd430..3063e38c66da 100644
--- a/drivers/clk/clk-si570.c
+++ b/drivers/clk/clk-si570.c
@@ -503,10 +503,10 @@ static const struct clk_si570_info clk_si590_info = {
 };
 
 static const struct i2c_device_id si570_id[] = {
-	{ "si570", (kernel_ulong_t)&clk_si570_info },
-	{ "si571", (kernel_ulong_t)&clk_si570_info },
-	{ "si598", (kernel_ulong_t)&clk_si590_info },
-	{ "si599", (kernel_ulong_t)&clk_si590_info },
+	{ .name = "si570", .driver_data = (kernel_ulong_t)&clk_si570_info },
+	{ .name = "si571", .driver_data = (kernel_ulong_t)&clk_si570_info },
+	{ .name = "si598", .driver_data = (kernel_ulong_t)&clk_si590_info },
+	{ .name = "si599", .driver_data = (kernel_ulong_t)&clk_si590_info },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, si570_id);
diff --git a/drivers/clk/clk-versaclock5.c b/drivers/clk/clk-versaclock5.c
index 57228e88e81d..484b02726b3a 100644
--- a/drivers/clk/clk-versaclock5.c
+++ b/drivers/clk/clk-versaclock5.c
@@ -1311,14 +1311,14 @@ static const struct vc5_chip_info idt_5p49v6975_info = {
 };
 
 static const struct i2c_device_id vc5_id[] = {
-	{ "5p49v5923", .driver_data = (kernel_ulong_t)&idt_5p49v5923_info },
-	{ "5p49v5925", .driver_data = (kernel_ulong_t)&idt_5p49v5925_info },
-	{ "5p49v5933", .driver_data = (kernel_ulong_t)&idt_5p49v5933_info },
-	{ "5p49v5935", .driver_data = (kernel_ulong_t)&idt_5p49v5935_info },
-	{ "5p49v60", .driver_data = (kernel_ulong_t)&idt_5p49v60_info },
-	{ "5p49v6901", .driver_data = (kernel_ulong_t)&idt_5p49v6901_info },
-	{ "5p49v6965", .driver_data = (kernel_ulong_t)&idt_5p49v6965_info },
-	{ "5p49v6975", .driver_data = (kernel_ulong_t)&idt_5p49v6975_info },
+	{ .name = "5p49v5923", .driver_data = (kernel_ulong_t)&idt_5p49v5923_info },
+	{ .name = "5p49v5925", .driver_data = (kernel_ulong_t)&idt_5p49v5925_info },
+	{ .name = "5p49v5933", .driver_data = (kernel_ulong_t)&idt_5p49v5933_info },
+	{ .name = "5p49v5935", .driver_data = (kernel_ulong_t)&idt_5p49v5935_info },
+	{ .name = "5p49v60", .driver_data = (kernel_ulong_t)&idt_5p49v60_info },
+	{ .name = "5p49v6901", .driver_data = (kernel_ulong_t)&idt_5p49v6901_info },
+	{ .name = "5p49v6965", .driver_data = (kernel_ulong_t)&idt_5p49v6965_info },
+	{ .name = "5p49v6975", .driver_data = (kernel_ulong_t)&idt_5p49v6975_info },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, vc5_id);
diff --git a/drivers/clk/clk-versaclock7.c b/drivers/clk/clk-versaclock7.c
index adcc603e3259..e0b57e7022b2 100644
--- a/drivers/clk/clk-versaclock7.c
+++ b/drivers/clk/clk-versaclock7.c
@@ -1288,8 +1288,8 @@ static const struct regmap_config vc7_regmap_config = {
 };
 
 static const struct i2c_device_id vc7_i2c_id[] = {
-	{ "rc21008a", .driver_data = (kernel_ulong_t)&vc7_rc21008a_info },
-	{}
+	{ .name = "rc21008a", .driver_data = (kernel_ulong_t)&vc7_rc21008a_info },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, vc7_i2c_id);
 
-- 
2.47.3

