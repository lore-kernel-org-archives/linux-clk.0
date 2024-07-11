Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E449515B971
	for <linux-clk@vger.kernel.org>; Thu, 11 Jul 2024 12:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720701255; cv=none; b=Ec3uGEDNIoln85s5jVSNedL8BKOo1tvqeAmydZwPxGC9GD0IHc3vpZQHaNxMtcusehTQEbjZ06SOwLQlOjFjksdH83PMf8tW+aa9jJQNh2iSH40ohY5w1e3picFrrf/VX4icrx9XJZ7RvBPpaj8vtPn5OmtTRwgYeV8Dq8x9nAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720701255; c=relaxed/simple;
	bh=dY61pVfeYdptbpc1CWeooXje6VkidAQD5fhpL0AyjXQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZUu6d1LVKzPvuyOyLzO5mArpMl1GNW/HB645KqXfXn3SVQZlnZJ9M5whtSTcUYi9lpRSL662uxVxZg5Btfsfp1KX6W5IVuA7aVOgHCDH50BnXsIBzANnBPvt6Y3i/DOwLwBp3hLsuIYGD8X9yv9ZXDw7yxnEv6XJ4haJ/z9ZgVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=reIq8+ku; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="reIq8+ku"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4266f344091so6856355e9.0
        for <linux-clk@vger.kernel.org>; Thu, 11 Jul 2024 05:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1720701251; x=1721306051; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LAFQBuBHIxkQvbv8fOdzuOd5saHrgFyg5FB8jBW+qBE=;
        b=reIq8+ku8dLPzXdOR/+4yeP7tX03CHvSovobC+OsHWrzWNRNjY3DGIMRuqSjgQ+EjH
         MuSjdLH/DcBKYJi854NYsUwPEtnN6B7ItGztFkO3A3w+MGMJagKrj01xeLFOnWMCdBkK
         cDAQ46yJ/3PCht9picOteYdOa1djQ0AfbvEYMlb414R0GoBdtnuIdIs8wNBmMy+pek+M
         xblNvBLLziD+/cLsslUlaaK/qrDmXahyBkcFqS3jXvbgMAOmis5rDcRoMhTwTDbXO6Fb
         h/cRu0g19QqlpvQDcTNtfZ7oppzE89pwhCGoqVh242BPzj2SCxHTAxTM1D5UKJAweH50
         g31A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720701251; x=1721306051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LAFQBuBHIxkQvbv8fOdzuOd5saHrgFyg5FB8jBW+qBE=;
        b=jF60nsNAR8aKQ02MNKmnh/yhalUl3dtGguoGFg8UTBc/tELQmEhmU2JXk/gbnt2goS
         73VMM8IN9nEzBeMnLcYTQUdS2snOxfXbVH/Z1rbYJKr1UenjTLJmLTzFqeiua2Vidzd7
         fetFbaNbONnCsnvemjAo2BpF2wYWqmtH9QuE33R+8xyh8qb4OslfhcqEtfLtSaSbwbwl
         FaRdD19IJGEGOcunHdHkn2SVpMK4Hnwjj0mU5gxRaclopZfBBZV1+hiSSHHXpI7qsaWO
         YPgCzgXE4ar153H2TfJxvm7vhTnc0kd1AuEuJ4mvXI+95E5Zkb6bsvzIk27McDGatCys
         x0uA==
X-Forwarded-Encrypted: i=1; AJvYcCUi9vLKo6NRe5RKLjIuiu+DfwpGbG1HusuAawIuCH90cdQcCnvGcmFnTZNYNhoIsTgNtpuoQa76pqiaudevwKT7a+5CRO0k4++V
X-Gm-Message-State: AOJu0YxuXRA8OTE1ByJU09logZ0qWGUJVJxnbtQZY7g+qzBfBLOjkaQC
	xMj0xq9BNFOuV2qwNO9Qlqs+2JRe3b3fA10dDpmHSRB8jUIHaHPJDg5KNJ5lCug=
X-Google-Smtp-Source: AGHT+IFpavZbQE94svJyuAh6eTlEt3fIERDL3R/CcPSJlAFPUb9Zk6IvoUXtrZbD2FDIq2wriausKA==
X-Received: by 2002:a05:600c:6d4:b0:426:6b85:bafb with SMTP id 5b1f17b1804b1-426707db6e7mr45894665e9.20.1720701251335;
        Thu, 11 Jul 2024 05:34:11 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4266f741fa6sm118583955e9.45.2024.07.11.05.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 05:34:10 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: vkoul@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	biju.das.jz@bp.renesas.com
Cc: dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 1/3] clk: renesas: r9a08g045-cpg: Add DMA clocks and resets
Date: Thu, 11 Jul 2024 15:34:03 +0300
Message-Id: <20240711123405.2966302-2-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240711123405.2966302-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240711123405.2966302-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add the missing DMA clock and resets.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/clk/renesas/r9a08g045-cpg.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/renesas/r9a08g045-cpg.c b/drivers/clk/renesas/r9a08g045-cpg.c
index 1e471426d4af..8a3ec5780722 100644
--- a/drivers/clk/renesas/r9a08g045-cpg.c
+++ b/drivers/clk/renesas/r9a08g045-cpg.c
@@ -193,6 +193,7 @@ static const struct rzg2l_mod_clk r9a08g045_mod_clks[] = {
 	DEF_MOD("ia55_pclk",		R9A08G045_IA55_PCLK, R9A08G045_CLK_P2, 0x518, 0),
 	DEF_MOD("ia55_clk",		R9A08G045_IA55_CLK, R9A08G045_CLK_P1, 0x518, 1),
 	DEF_MOD("dmac_aclk",		R9A08G045_DMAC_ACLK, R9A08G045_CLK_P3, 0x52c, 0),
+	DEF_MOD("dmac_pclk",		R9A08G045_DMAC_PCLK, CLK_P3_DIV2, 0x52c, 1),
 	DEF_MOD("wdt0_pclk",		R9A08G045_WDT0_PCLK, R9A08G045_CLK_P0, 0x548, 0),
 	DEF_MOD("wdt0_clk",		R9A08G045_WDT0_CLK, R9A08G045_OSCCLK, 0x548, 1),
 	DEF_MOD("sdhi0_imclk",		R9A08G045_SDHI0_IMCLK, CLK_SD0_DIV4, 0x554, 0),
@@ -233,6 +234,8 @@ static const struct rzg2l_reset r9a08g045_resets[] = {
 	DEF_RST(R9A08G045_GIC600_GICRESET_N, 0x814, 0),
 	DEF_RST(R9A08G045_GIC600_DBG_GICRESET_N, 0x814, 1),
 	DEF_RST(R9A08G045_IA55_RESETN, 0x818, 0),
+	DEF_RST(R9A08G045_DMAC_ARESETN, 0x82c, 0),
+	DEF_RST(R9A08G045_DMAC_RST_ASYNC, 0x82c, 1),
 	DEF_RST(R9A08G045_WDT0_PRESETN, 0x848, 0),
 	DEF_RST(R9A08G045_SDHI0_IXRST, 0x854, 0),
 	DEF_RST(R9A08G045_SDHI1_IXRST, 0x854, 1),
-- 
2.39.2

