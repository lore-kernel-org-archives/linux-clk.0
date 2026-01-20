Received: from mail.thorsis.com (mail.thorsis.com [217.92.40.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A8443E9E2;
	Tue, 20 Jan 2026 14:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.92.40.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768919922; cv=none; b=cReEliR2QukDtGELXxoPG3HoauMwaYqaR4A3zw58gRQQkekSbLHo3V9tnIJ4niFXs2XAaaWOT71CWHT0EJoyigU680Q5ntzqPUzYAh2Iu2AxquLI7B/EmcmchM9B8rvzKaQnApQmRpt5DhQhNikyYLFsOPVfLrsexfH3mP/BNeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768919922; c=relaxed/simple;
	bh=5IXIty+hb1ESLMVODzeay27xZWNFrZHYk30S64+Zr9U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XJASdTx2Cfnl7oxve2g8fLqtHLTfNAbPA4/iLm5mJUzlCuHmum8uUN4FxM9RuZH3QJW5cU4imk6FvhUswO5qG7a9PcDdAMJmFpVB+X7zM3IIE5RMq4KD1t0LRDw7TM7Ry1tq/OOzfVU5WCdiIJ+VP/mKrC7v0oUwj/NqsOvNY/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com; spf=pass smtp.mailfrom=thorsis.com; dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b=Z9NLRCM4; arc=none smtp.client-ip=217.92.40.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thorsis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b="Z9NLRCM4"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 30AF6148AD46;
	Tue, 20 Jan 2026 15:38:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1768919918; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=iwoue6etwXNACANrpcSyWt6z5Amc2nmpEVMpidiMMUs=;
	b=Z9NLRCM4HpsIkStvE5ywBfvF5SBI5aEY0OkWW8ddKhtLI5lf8ML49VHmCd/xm4YjLOmBl/
	/iGzvn5MopJOW+RyA8WtqJfxmnY2eS+bbe8VTTztm3E8i2xh7nTKViQ4jlW+OKQT8ISBLl
	zQ0/c0H9nER4uoyeOCeFsYk3GSWSZDeLJPpg9hblPoKt/By4j4sd35GPrAimSoqHIvITEm
	TLoX0cKqApP0KRL4N7H1bAyv4q9Hw1LO8A8+qxTrjKgS7mVluOkf9f87wOn5EZUp+Q10wl
	PZ/3M6l6Z+5aQj1Yv05WgKfRdZnpejFJ3am1g093kHga3meUb42KW0FBuU+Rew==
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
	Cristian Birsan <cristian.birsan@microchip.com>
Subject: [PATCH v3 05/19] clk: at91: sama7d65: Use highest PMC definition as max index
Date: Tue, 20 Jan 2026 15:37:26 +0100
Message-ID: <20260120143759.904013-6-ada@thorsis.com>
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

Consistent with all the other at91 clock drivers now, which also use the
highest PMC definition as max value, and no extra number.

Signed-off-by: Alexander Dahl <ada@thorsis.com>
---

Notes:
    v3:
    - new patch, not present in v2

 drivers/clk/at91/sama7d65.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/clk/at91/sama7d65.c b/drivers/clk/at91/sama7d65.c
index f6f86261ceefd..4ccffa8db43a5 100644
--- a/drivers/clk/at91/sama7d65.c
+++ b/drivers/clk/at91/sama7d65.c
@@ -19,8 +19,6 @@ static DEFINE_SPINLOCK(pmc_pll_lock);
 static DEFINE_SPINLOCK(pmc_mck0_lock);
 static DEFINE_SPINLOCK(pmc_mckX_lock);
 
-#define PMC_INDEX_MAX	25
-
 /*
  * PLL clocks identifiers
  * @PLL_ID_CPU:		CPU PLL identifier
@@ -1120,7 +1118,7 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
 	if (IS_ERR(regmap))
 		return;
 
-	sama7d65_pmc = pmc_data_allocate(PMC_INDEX_MAX,
+	sama7d65_pmc = pmc_data_allocate(SAMA7D65_PMC_MCK5 + 1,
 					 nck(sama7d65_systemck),
 					 nck(sama7d65_periphck),
 					 nck(sama7d65_gck), 8);
-- 
2.47.3

