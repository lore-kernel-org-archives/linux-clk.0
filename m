Received: from mail.thorsis.com (mail.thorsis.com [217.92.40.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0823314C8;
	Tue, 20 Jan 2026 15:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.92.40.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768923910; cv=none; b=H2njXglyV4gDCLmsj/rXFoHx7lDTRfan2epU9Dl0GSbU+Xf+Leb1UASOqQi1fLHpzkeuRxE84mKGo6qxAGjwFO75z1JMUeI6+ojEZTDqQDl6uIqZ30pOE8dkf0+c3rF81NbWhzdxuqS0uKSsDzgHuPL/tuFNCoGZwkgJUWvA0n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768923910; c=relaxed/simple;
	bh=2F3Ic8dnVXSZ6XAYCS0sMyqTJm6Qsx5CCLU3rhvRvQ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a5ih+VAmNZN++X5mE1Tth/AvyIR9izbfYfqHDHpfnLILrRtRFIRYgkIdhIcPKw2ra0c0H2gQTny2UfVvCobPri/VNEEEjwp31YUighUg61hSOi3J+UnduinowlIrTwHosrHB7jp6PcGTBMxRU+99hD11u3YoX1bbSzfXbtIHWNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com; spf=pass smtp.mailfrom=thorsis.com; dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b=iByFYCyf; arc=none smtp.client-ip=217.92.40.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thorsis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b="iByFYCyf"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CB4621488638;
	Tue, 20 Jan 2026 16:45:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1768923906; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=6XzkSDuDP0HfzejUTV5XzIVGv3/HCsAZ2kabQBiMoXc=;
	b=iByFYCyfUh4fzZbkAaIh3uUNrC7AgaXWIDcvavtToDdRBL8j4mYuf4mVePiXwwiSLXSx1L
	7iPjDE3iP/m/a6HsNUXvSfeViSbYL8ypacU7GAgkShDLM1gng8+njIKqrnzggv6zOVPCHU
	yCMnXFYJKL7lp+3VeFhAAb7YERJ6L3zmJgmK8VTxElUbni7UomEP1HUP3oArhGq0V80Axg
	FWoEpmXxlIGbQrXdBjPnT9Tg3LKsmvpOvOFUq25MbDFBmBPdpWL3xqOYZwMuFOITfoByf3
	QdlI7SDf3crsysFguHqKCd3l7MiDNt+pZNrGp81mMMc72hkeTcTL9VNyCGuH8Q==
From: Alexander Dahl <ada@thorsis.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Ryan Wanner <ryan.wanner@microchip.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Cristian Birsan <cristian.birsan@microchip.com>,
	Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>,
	Varshini Rajendran <varshini.rajendran@microchip.com>
Subject: [PATCH v3 07/19] clk: at91: Add peripheral id for OTPC
Date: Tue, 20 Jan 2026 16:44:41 +0100
Message-ID: <20260120154502.1280938-1-ada@thorsis.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260120143759.904013-1-ada@thorsis.com>
References: <20260120143759.904013-1-ada@thorsis.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

That peripheral clock is required for proper OTPC function.

Link: https://lore.kernel.org/linux-clk/ec34efc2-2051-4b8a-b5d8-6e2fd5e08c28@microchip.com/T/#u
Signed-off-by: Alexander Dahl <ada@thorsis.com>
---

Notes:
    v3:
    - no changes
    
    v2:
    - new patch in series, was not present in v1

 drivers/clk/at91/sam9x60.c  | 1 +
 drivers/clk/at91/sam9x7.c   | 1 +
 drivers/clk/at91/sama7d65.c | 1 +
 drivers/clk/at91/sama7g5.c  | 1 +
 4 files changed, 4 insertions(+)

diff --git a/drivers/clk/at91/sam9x60.c b/drivers/clk/at91/sam9x60.c
index a9f293a8e3b26..11f16126ff9e9 100644
--- a/drivers/clk/at91/sam9x60.c
+++ b/drivers/clk/at91/sam9x60.c
@@ -146,6 +146,7 @@ static const struct {
 	{ .n = "isi_clk",    .id = 43, },
 	{ .n = "pioD_clk",   .id = 44, },
 	{ .n = "tcb1_clk",   .id = 45, },
+	{ .n = "otpc_clk",   .id = 46, },
 	{ .n = "dbgu_clk",   .id = 47, },
 	/*
 	 * mpddr_clk feeds DDR controller and is enabled by bootloader thus we
diff --git a/drivers/clk/at91/sam9x7.c b/drivers/clk/at91/sam9x7.c
index 9a5afd258cb86..c4d2b022d9d07 100644
--- a/drivers/clk/at91/sam9x7.c
+++ b/drivers/clk/at91/sam9x7.c
@@ -407,6 +407,7 @@ static const struct {
 	{ .n = "isi_clk",	.id = 43, },
 	{ .n = "pioD_clk",	.id = 44, },
 	{ .n = "tcb1_clk",	.id = 45, },
+	{ .n = "otpc_clk",	.id = 46, },
 	{ .n = "dbgu_clk",	.id = 47, },
 	{ .n = "pmecc_clk",	.id = 48, },
 	/*
diff --git a/drivers/clk/at91/sama7d65.c b/drivers/clk/at91/sama7d65.c
index 5d8973aa50a53..52467d629258f 100644
--- a/drivers/clk/at91/sama7d65.c
+++ b/drivers/clk/at91/sama7d65.c
@@ -641,6 +641,7 @@ static struct {
 	{ .n = "mcan2_clk",	.p = PCK_PARENT_HW_MCK5, .id = 60, .r = { .max = 200000000, }, },
 	{ .n = "mcan3_clk",	.p = PCK_PARENT_HW_MCK5, .id = 61, .r = { .max = 200000000, }, },
 	{ .n = "mcan4_clk",	.p = PCK_PARENT_HW_MCK5, .id = 62, .r = { .max = 200000000, }, },
+	{ .n = "otpc_clk",	.p = PCK_PARENT_HW_MCK0, .id = 63, },
 	{ .n = "pdmc0_clk",	.p = PCK_PARENT_HW_MCK9, .id = 64, .r = { .max = 200000000, }, },
 	{ .n = "pdmc1_clk",	.p = PCK_PARENT_HW_MCK9, .id = 65, .r = { .max = 200000000, }, },
 	{ .n = "pit64b0_clk",	.p = PCK_PARENT_HW_MCK7, .id = 66, },
diff --git a/drivers/clk/at91/sama7g5.c b/drivers/clk/at91/sama7g5.c
index 9a6f0f30b2b7e..3e0cfd2613851 100644
--- a/drivers/clk/at91/sama7g5.c
+++ b/drivers/clk/at91/sama7g5.c
@@ -504,6 +504,7 @@ static struct {
 	{ .n = "mcan3_clk",	.p = PCK_PARENT_HW_MCK1, .id = 64, .r = { .max = 200000000, }, },
 	{ .n = "mcan4_clk",	.p = PCK_PARENT_HW_MCK1, .id = 65, .r = { .max = 200000000, }, },
 	{ .n = "mcan5_clk",	.p = PCK_PARENT_HW_MCK1, .id = 66, .r = { .max = 200000000, }, },
+	{ .n = "otpc_clk",	.p = PCK_PARENT_HW_MCK0, .id = 67, },
 	{ .n = "pdmc0_clk",	.p = PCK_PARENT_HW_MCK1, .id = 68, .r = { .max = 200000000, }, },
 	{ .n = "pdmc1_clk",	.p = PCK_PARENT_HW_MCK1, .id = 69, .r = { .max = 200000000, }, },
 	{ .n = "pit64b0_clk",	.p = PCK_PARENT_HW_MCK1, .id = 70, },
-- 
2.47.3

