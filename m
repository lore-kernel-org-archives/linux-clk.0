Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.92.40.78
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793880562;
	b=cZlmU83+OFt6aMdQbxMeoSOQ/NajqELXDk8PM6YUi+WoYsKaQPM1MOqfavj95/h/wxtC
	 ffQLP45cVjwBQ3MQjcF/2oMgSvwGuMlVhQqBDfNmy6dFw7mAuWYcDFCNO2f/vhA8aZCsO
	 WIc/jxgsqkE4U5O7Mm/erod6k/OSD8+znctcAqFGPjSAtZkYFwduxQOIHFUhwzBgH0o0a
	 QPc8LU7AnO1wSUyd9mrXIkXONe6NaZSAmID2DLLw6t4LVC2EFvo7k+bOrYTE1HJO4voQ+
	 J/ZX+iFww+bTaokwT9+PS+uTMxKQpYE7su9KdsiJ/tYA5CBedDAcN5DizDUbWPLcw6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793880562;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=ZJCmDBLnwO5EsL5HYpEqr+WuYOsrmebyyb4WDJ9SpxQ=;
	b=olmAjI5o9FKYyAR7OPEa65M68MSCqypDnMYy6aCFbdfRzg0764MEu3szWr2wxIlVr/BV
	 SJLgZ7675G/W5snbl1h8WcOCrJqYiLrPfF2qSMUunkwBGSQvrDjODXs7t08qHReIvbkL/
	 Ne6TEdgrrAt1Mf/D9vFbeaANrpe8NlxP1M0b0CrML7a3BEhSDszMgO+wDZwdlhu0inypT
	 AX2NclvD1DsUIrQqkxgPR7SER5DIobVHexcaNegeRki+SLsGpclIIH3quyVy4MBhlpO5d
	 a6rdR+W53Z2O+RuPr1uQrtFc7TEtOFObqkSCIpuvRqlQ5qgo25m2aN73xv/ZOmr2xLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=thorsis.com;
	spf=pass smtp.mailfrom=thorsis.com;
	dkim=pass header.d=thorsis.com header.i=@thorsis.com header.a=rsa-sha256 header.s=dkim header.b=oewv6xxY;
	arc=none smtp.remote-ip=217.92.40.78
Received: from mail.thorsis.com (mail.thorsis.com [217.92.40.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0EFE606A329;
	Thu,  5 Nov 2026 12:09:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0EFE606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thorsis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=thorsis.com header.i=@thorsis.com header.a=rsa-sha256 header.s=dkim header.b=oewv6xxY
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AF64614966A6;
	Thu, 05 Nov 2026 13:09:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1793880594; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=ZJCmDBLnwO5EsL5HYpEqr+WuYOsrmebyyb4WDJ9SpxQ=;
	b=oewv6xxYHvL1L2lScGSJnNAUassh0vm2QEd1glWUNbxE4+b0OioSybfE+dvS7ZLqmXRJ7c
	yVaT+QQCH2Zdq54RpQFKM3iASkOggJ8ZRw1CC09zdSe9ftU29klrh2NY+aIJPUBJdbnLKu
	BdOcXLSscjCUyATxqhTxJKNo+BufWZNxZpfWbh6o4vjFYsnBO8Zb1XIu5qeuNxxqpMWicf
	zWrrVeWt0e4XgdL4iwsVpm8HjGq7FQ7YfJnQO+hoye2tuc+xojh9WgeVt/Jo42OqfRCxFl
	AIooHTmz5R2TgQ7ngyXGUSiDdjNLlJNpiTUGYiv348WpwzKcUf0fPI1j4F5quQ==
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
	Manikandan Muralidharan <manikandan.m@microchip.com>,
	Durai Manickam KR <durai.manickamkr@microchip.com>
Subject: [PATCH v4 05/16] clk: at91: Allow enabling main_rc_osc through DT
Date: Thu,  5 Nov 2026 12:06:41 +0100
Message-ID: <20261105110715.2486432-6-ada@thorsis.com>
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

SAM9X60 Datasheet (DS60001579G) Section "23.4 Product Dependencies"
states:

    "The OTPC is clocked through the Power Management Controller (PMC).
    The user must power on the main RC oscillator and enable the
    peripheral clock of the OTPC prior to reading or writing the OTP
    memory."

The code for enabling/disabling the main rc oscillator clock is already
present, however, after the at91 clock device tree binding rework in
2018 (kernel v4.19), it was no longer possible to hook it up via DT.

Export the main RC oscillator for all SoCs featuring an OTPC controller
where the main RC oscillator is required for proper operation.

Signed-off-by: Alexander Dahl <ada@thorsis.com>
---

Notes:
    v4:
    - reword commit message
    
    v3:
    - no changes
    
    v2:
    - split out dt-bindings changes into separate patch
    - extend to drivers for other SoCs providing the OTPC

 drivers/clk/at91/sam9x60.c  | 1 +
 drivers/clk/at91/sam9x7.c   | 1 +
 drivers/clk/at91/sama7d65.c | 1 +
 drivers/clk/at91/sama7g5.c  | 1 +
 4 files changed, 4 insertions(+)

diff --git a/drivers/clk/at91/sam9x60.c b/drivers/clk/at91/sam9x60.c
index eba6e8c16044d..4a7ff559522eb 100644
--- a/drivers/clk/at91/sam9x60.c
+++ b/drivers/clk/at91/sam9x60.c
@@ -227,6 +227,7 @@ static void __init sam9x60_pmc_setup(struct device_node *np)
 					   50000000);
 	if (IS_ERR(hw))
 		goto err_free;
+	sam9x60_pmc->chws[SAM9X60_PMC_MAIN_RC] = hw;
 
 	hw = at91_clk_register_main_osc(regmap, "main_osc", mainxtal_name, NULL, 0);
 	if (IS_ERR(hw))
diff --git a/drivers/clk/at91/sam9x7.c b/drivers/clk/at91/sam9x7.c
index 1fc4b01a04abf..194a8e44aa0ec 100644
--- a/drivers/clk/at91/sam9x7.c
+++ b/drivers/clk/at91/sam9x7.c
@@ -763,6 +763,7 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
 					   50000000);
 	if (IS_ERR(hw))
 		goto err_free;
+	sam9x7_pmc->chws[SAM9X7_PMC_MAIN_RC] = hw;
 
 	hw = at91_clk_register_main_osc(regmap, "main_osc", mainxtal_name, NULL, 0);
 	if (IS_ERR(hw))
diff --git a/drivers/clk/at91/sama7d65.c b/drivers/clk/at91/sama7d65.c
index 0b5356467fa52..ef54d2fa6cf40 100644
--- a/drivers/clk/at91/sama7d65.c
+++ b/drivers/clk/at91/sama7d65.c
@@ -1138,6 +1138,7 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
 						   50000000);
 	if (IS_ERR(main_rc_hw))
 		goto err_free;
+	sama7d65_pmc->chws[SAMA7D65_PMC_MAIN_RC] = hw;
 
 	bypass = of_property_read_bool(np, "atmel,osc-bypass");
 
diff --git a/drivers/clk/at91/sama7g5.c b/drivers/clk/at91/sama7g5.c
index 99b4c1d9bdcca..9a6f0f30b2b7e 100644
--- a/drivers/clk/at91/sama7g5.c
+++ b/drivers/clk/at91/sama7g5.c
@@ -1014,6 +1014,7 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
 						   50000000);
 	if (IS_ERR(main_rc_hw))
 		goto err_free;
+	sama7g5_pmc->chws[SAMA7G5_PMC_MAIN_RC] = hw;
 
 	bypass = of_property_read_bool(np, "atmel,osc-bypass");
 
-- 
2.47.3

