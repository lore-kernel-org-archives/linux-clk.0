Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.92.40.78
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793880565;
	b=fIpDsgtKqHlQ1cnmnN8DlYKYr+x/ciVdTgSTXCyETEaWHZEPsWF7yV36lObWnIVrpxNj
	 MvFcjaRJG0JAGchjrvFt5Di1ucl/tEcZfpPAgOJOh5W8sGnoB6wWtY4L8GtKd5P2Gc/Kf
	 VSr5RoXIWMENdnqi3rUrrVPBYzYJ8VrjztLJ/dtGlDYS6snByjymSZLbm7M0hnHPd5JFr
	 n05Aseu3M8k+AT90WXAWTnpThSNxu7KcQHLQmCjBMTo5fBLeOgbm4+PJy5jeqylGO7Y4p
	 Lv07kjU3785z8Xw6j7jqk7vNJITm0Xq732AstXj1DfK1h9n+2/nR9F8gJbKDH18RZGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793880565;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=MVt4jUBXqyElZ0SSRIhpdxWMUMvKdg3ek8bVkKAtdNk=;
	b=YWLUKPZ7WWSQxWHJv9qO418pKl3pAXirp9VvUBDUYqgc9pMoieodwcnw8s2/33WuAdSK
	 c7kACk2oLMwagr+KRIyseo+91aw0dgJeoIvvHzzQXP5QUTy0kBDMrujb1APIdkl29hwYB
	 QM0RpHd79/HRwXLeXZHkqGp+soje5seMF6o1+mQ98j1W7pBTzQ3b/b13syknW5Ueue2ix
	 Z/vHaAReaZMzEvBKiqDnnQ0/LPwsW5Za9jgB/stZtX5fUSJkKpWNrdKSSx6AnFCUXkUMY
	 RkkrhpA0Dtt3cIKZUwN0BYYB68KFMOYZsvRqeLvzjYGmARJ8LRywDtlrgD7VXTsFKpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=thorsis.com;
	spf=pass smtp.mailfrom=thorsis.com;
	dkim=pass header.d=thorsis.com header.i=@thorsis.com header.a=rsa-sha256 header.s=dkim header.b=suEgwP3Q;
	arc=none smtp.remote-ip=217.92.40.78
Received: from mail.thorsis.com (mail.thorsis.com [217.92.40.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6AB5606A33B;
	Thu,  5 Nov 2026 12:09:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6AB5606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thorsis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=thorsis.com header.i=@thorsis.com header.a=rsa-sha256 header.s=dkim header.b=suEgwP3Q
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 46B7D14966A9;
	Thu, 05 Nov 2026 13:09:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1793880598; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=MVt4jUBXqyElZ0SSRIhpdxWMUMvKdg3ek8bVkKAtdNk=;
	b=suEgwP3Q78IIN724CzYRSSlNnTvr5+Dbkxy/6rXKWS/DxVSjJd7zOywboXOSuA3BRMuMha
	kfG/zhpyBpdMfekk1/t8ewOKEq6ybszdOrqVubbfb4rD/8ph7PVMeESedO9eiRJpF6GpFY
	nIMsdN3wHr65BOCzNJj7fWvCgbeH9hxtJkwqSm6VFObT4H+lweGx+hvEbW7Izi1y7+DWKz
	etXPTjWVmOLPK2pPdceuLnUqtf+Rw2NIbsDMhAohFYfWJrO7CJp1S2yupu7IbggiJ4kGki
	GGb0+j/3vZbg3m/0hSeI5SBVxQLLvxxQQbXbKX8HcLTgN04UELA4D362x5hEMg==
From: Alexander Dahl <ada@thorsis.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Ryan Wanner <ryan.wanner@microchip.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Mihai Sain <mihai.sain@microchip.com>,
	Durai Manickam KR <durai.manickamkr@microchip.com>,
	Manikandan Muralidharan <manikandan.m@microchip.com>
Subject: [PATCH v4 06/16] clk: at91: Add peripheral clock id for OTPC
Date: Thu,  5 Nov 2026 12:06:42 +0100
Message-ID: <20261105110715.2486432-7-ada@thorsis.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261105110715.2486432-1-ada@thorsis.com>
References: <20261105110715.2486432-1-ada@thorsis.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Add the peripheral clock IDs for OTPC.
This clock is required for proper OTPC operation.

Signed-off-by: Alexander Dahl <ada@thorsis.com>
---

Notes:
    v4:
    - Reword patch title and message
    
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
index 4a7ff559522eb..b4cd001782604 100644
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
index 194a8e44aa0ec..8edf62fb9f371 100644
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
index ef54d2fa6cf40..1f3c724739133 100644
--- a/drivers/clk/at91/sama7d65.c
+++ b/drivers/clk/at91/sama7d65.c
@@ -643,6 +643,7 @@ static struct {
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

