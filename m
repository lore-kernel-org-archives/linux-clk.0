Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FABC4CA264
	for <linux-clk@vger.kernel.org>; Mon, 11 May 2026 18:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778525474; cv=none; b=JTuLucvJbjGcWiCZVN71MLavr8QLJQtpHtQolnvMFAkQYNmjsZlKBKXz77mSJ+oBR4rAhhYyQuhfwHJV/kWoiztUobCASuFt2/k39JGplpGsHtPFBOsNpfp1mAJfleBf76n+Wti1rsZGP274rBzvS98O5QMQrYwtScbJeswMZcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778525474; c=relaxed/simple;
	bh=nDJAbJCFuUB7OnJXjKjnKvBkXflAc5qn8SUxoJPyYn8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lTRoKYoxjd0AM1A6VcADVdrJCbr/jTLI5/1CD8UKbpj/8y3G4Sck73qHbijIUMeFxaLOXPKwG7XjYOvjXXFMaVBCiQgFh3A0tsKAMjb9rCeAx04uisPONTQ47kTBPToe9QkVzM9hB+cy14rjszg9x7Ygr2SUpxAiQx9Fxv/yhNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jZ2Zzveo; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jZ2Zzveo"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-488a9033b2cso43415115e9.2
        for <linux-clk@vger.kernel.org>; Mon, 11 May 2026 11:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778525470; x=1779130270; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Av9KMOeHNoLZjJvkQ1HtWMUmgg+DhH4RllPkn9qKDs=;
        b=jZ2ZzveoTEvVY1IJ2YGdes/ZtrfZ+Oi9pw5DbzFjU9kA6j+d1PsEiJn6u6aqvs+KzM
         7R19IjFUsajdZNxYHYEhleJP3YRFIJ7x8OHCHGlEuDEQk9nLYDsPa5TTJ05QO5DlD0JP
         /p0MDO/7JtDv5UFR0yTJJmkojv21NbEnIQJ6lOSa27bJF50RMuFZfWinUhNYGoPc8n4b
         uo+CpSj2tgwXHNL9qNQZsgve0P1EqfraqODUUHoMo/OESO/DQ+lL0zlaEalVPzsAZPPg
         /aXgqEG4XTpNYQSlyoA7SfJWSrc9/MSnzdm01DR1gvDFqJUTaOprc7i1Msy2Cwd9fvZb
         g/jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778525470; x=1779130270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2Av9KMOeHNoLZjJvkQ1HtWMUmgg+DhH4RllPkn9qKDs=;
        b=rAmyceiZwWIbtL5/ONZgr7VH4jI4fEqXiWrT2nH3cDBtuCSdr3B1fyj1DIC9MUUSg1
         +XLlwkn+tlzY/JXf4flDcHnwt/3VQtOfPa08hnQ47S8i4Tjf5rlKvjSNHX18yplHBUci
         EOJfnl5WQiFKTIhHA9x24s94ZYuUQluwAZY5TRb2XwcBBNIQ7YChGtDfCo6W5Ixvcg29
         3rlUR6MSR3RCLnN2JfKgEtQ+Ch4pkMSNhqACEzi/IpWLRdakfJllu/sESjblEtzn/jt3
         It2AHgipCXeHDi4sR5hxLyhofTypmLjRgrecf7EpgCXLVxpylzpiljsIDBuQL8eCsK+S
         WrVQ==
X-Forwarded-Encrypted: i=1; AFNElJ9yL9JFrvd/vqFFJrB23yC1FjJMo058MSS09Ykyj/DPU2hLwrZJ6A8hIM1bLfDB538qk0DUS8x5r7k=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpNI90munQJBl/bO7ldpaw3hcfBZj7aEb2S3QchXcuJjIzc9jg
	X+FQvdvCwyKNMXFD6Pm6uqtwYwl2yaDYwnnE/jTRLcS7dWGuKx58Kx28NM6xxAss
X-Gm-Gg: Acq92OGsJgU3x98R2iTaUmOw6B+GASRZAmib35qjEoUel5vfmDX56fEjeoYAPgXaFNB
	0jPwFpcsBCTUIV2FKCtrCvbs0ebMim8D9WT01pArPWHe6h4hGNvYMI4vpfD55LH3JvMWapFZVPF
	mEDhTyaOc2JSkjBpCtMrMc1wOqJHzCbs2v79bSph+yXbR9zYFiryz3kdvJE7iHEeTYhy63So2Zx
	hzhIVKvYthewrc7RHh22R3pFfUyPoX1RG9ScFdw99Y/qvL6enyKj0c+3VoBOQIfCafPnJ+0M6C3
	/alZ5yYPy9J6yFYWks39DL3glfHBe6wJ7ilMR7xYqHnxfLx0D8IhXxUp1ToeXzFuJxKJKkQg8u/
	5s+Q7bTz0e/Npmbk3fx7hHfj3gpmB15jH52SDfi2Bs/n0IwM8A3ZdMRUt/SoLDfuHMzM8Ae99OM
	nocHT7sG10HFIxnjoAXO3xlwYSdkYwn/03cxYka0T+IrMQ5DhOVyFeiZa7WOycEunotW4S4lplM
	TxzE4Q2L+VklA5dAQjQpjkuO6kaJc4+9MdrYD9ZcA2XMzLZ
X-Received: by 2002:a05:600c:c11c:b0:488:c078:bfda with SMTP id 5b1f17b1804b1-48e706e0168mr119438945e9.26.1778525470462;
        Mon, 11 May 2026 11:51:10 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:e687:6094:b849:9886])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e8f3cf0cdsm854775e9.2.2026.05.11.11.51.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 11:51:10 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Magnus Damm <magnus.damm@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [RFC PATCH 6/9] watchdog: rzv2h: Refactor WDTDCR start/stop handling
Date: Mon, 11 May 2026 19:50:55 +0100
Message-ID: <20260511185058.1926869-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260511185058.1926869-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260511185058.1926869-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Refactor the WDTDCR start/stop helpers by introducing a common
rzt2h_wdt_wdtdcr_count_ctrl() function that controls the WDTSTOPCTRL
bit based on a boolean parameter.

This is in preparation for switching WDTDCR access to regmap-based
handling, where consolidating the control path simplifies the
conversion.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/watchdog/rzv2h_wdt.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/watchdog/rzv2h_wdt.c b/drivers/watchdog/rzv2h_wdt.c
index 3b6abb66a1da..e9545b8f5fd0 100644
--- a/drivers/watchdog/rzv2h_wdt.c
+++ b/drivers/watchdog/rzv2h_wdt.c
@@ -89,18 +89,26 @@ static int rzv2h_wdt_ping(struct watchdog_device *wdev)
 	return 0;
 }
 
-static void rzt2h_wdt_wdtdcr_count_stop(struct rzv2h_wdt_priv *priv)
+static void rzt2h_wdt_wdtdcr_count_ctrl(struct rzv2h_wdt_priv *priv, bool start)
 {
 	u32 reg = readl(priv->wdtdcr + WDTDCR);
 
-	writel(reg | WDTDCR_WDTSTOPCTRL, priv->wdtdcr + WDTDCR);
+	if (start)
+		reg &= ~WDTDCR_WDTSTOPCTRL;
+	else
+		reg |= WDTDCR_WDTSTOPCTRL;
+
+	writel(reg, priv->wdtdcr + WDTDCR);
 }
 
-static void rzt2h_wdt_wdtdcr_count_start(struct rzv2h_wdt_priv *priv)
+static void rzt2h_wdt_wdtdcr_count_stop(struct rzv2h_wdt_priv *priv)
 {
-	u32 reg = readl(priv->wdtdcr + WDTDCR);
+	rzt2h_wdt_wdtdcr_count_ctrl(priv, false);
+}
 
-	writel(reg & ~WDTDCR_WDTSTOPCTRL, priv->wdtdcr + WDTDCR);
+static void rzt2h_wdt_wdtdcr_count_start(struct rzv2h_wdt_priv *priv)
+{
+	rzt2h_wdt_wdtdcr_count_ctrl(priv, true);
 }
 
 static void rzv2h_wdt_setup(struct watchdog_device *wdev, u16 wdtcr)
-- 
2.54.0

