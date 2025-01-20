Received: from mail-gw02.astralinux.ru (mail-gw02.astralinux.ru [195.16.41.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B382C1925AF;
	Mon, 20 Jan 2025 08:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.16.41.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737363456; cv=none; b=VmqisqSxjTqi1E/tB/obbCL+1e9j9s0yLXEIMT2N4WMm/XVhT9VpFHbhSXnBYesJ0g/WG8Shu6JzJ40OOf/6hcH0sudSFbysCRhVVZ6uPs4QQCscMFoj6UoBz5LBuLzy+OnMqMK0yREDLJmvHsvVg2yJrOc5/ivbJpUQHlJdk6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737363456; c=relaxed/simple;
	bh=/5TDraNMWkYvSVw/5SoXQxyrY1tSPIng2nbH4EdoZAo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QFbphiUNEwuITDZP2nZIF96BdfWadpaorIrskRcZK6bomPbrlmeb0gB9hiS6R1k0cLhX/bF+pj5rGy1xWjNTlBT2bQc3YjjYoyRhRHdfOOvFAzoZ3sHtC0AF4aKx9loBCGoQyEFENVS74Ww7Rd1WhsRmsLOghXmmzuty2+a9ZX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=astralinux.ru; spf=pass smtp.mailfrom=astralinux.ru; arc=none smtp.client-ip=195.16.41.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=astralinux.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=astralinux.ru
Received: from gca-msk-a-srv-ksmg02.astralinux.ru (localhost [127.0.0.1])
	by mail-gw02.astralinux.ru (Postfix) with ESMTP id 705AC1F418;
	Mon, 20 Jan 2025 11:47:35 +0300 (MSK)
Received: from new-mail.astralinux.ru (gca-yc-ruca-srv-mail05.astralinux.ru [10.177.185.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-gw02.astralinux.ru (Postfix) with ESMTPS;
	Mon, 20 Jan 2025 11:47:31 +0300 (MSK)
Received: from localhost.localdomain (unknown [10.177.20.106])
	by new-mail.astralinux.ru (Postfix) with ESMTPA id 4Yc3qz6SgYz1c0sD;
	Mon, 20 Jan 2025 11:47:27 +0300 (MSK)
From: Anastasia Belova <abelova@astralinux.ru>
To: =?UTF-8?q?Emilio=20L=C3=B3pez?= <emilio@elopez.com.ar>
Cc: Anastasia Belova <abelova@astralinux.ru>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Maxime Ripard <mripard@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH] clk: sunxi: add explicit casting to prevent overflow
Date: Mon, 20 Jan 2025 11:47:16 +0300
Message-ID: <20250120084719.63116-1-abelova@astralinux.ru>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-KSMG-AntiPhishing: NotDetected
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Envelope-From: abelova@astralinux.ru
X-KSMG-AntiSpam-Info: LuaCore: 49 0.3.49 28b3b64a43732373258a371bd1554adb2caa23cb, {Tracking_arrow_text}, {Tracking_from_domain_doesnt_match_to}, d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;new-mail.astralinux.ru:7.1.1;astralinux.ru:7.1.1, FromAlignment: s
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiSpam-Lua-Profiles: 190443 [Jan 20 2025]
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Version: 6.1.1.7
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.1.0.7854, bases: 2025/01/20 05:14:00 #27075937
X-KSMG-AntiVirus-Status: NotDetected, skipped
X-KSMG-LinksScanning: NotDetected
X-KSMG-Message-Action: skipped
X-KSMG-Rule-ID: 1

If n = 255, the result of multiplication of n and 24000000
may not fit int type. Add explicit casting to prevent overflow.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: 6424e0aeebc4 ("clk: sunxi: rewrite sun9i_a80_get_pll4_factors()")
Signed-off-by: Anastasia Belova <abelova@astralinux.ru>
---
 drivers/clk/sunxi/clk-sun9i-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/sunxi/clk-sun9i-core.c b/drivers/clk/sunxi/clk-sun9i-core.c
index d93c7a53c6c0..70fbd7390d96 100644
--- a/drivers/clk/sunxi/clk-sun9i-core.c
+++ b/drivers/clk/sunxi/clk-sun9i-core.c
@@ -50,7 +50,7 @@ static void sun9i_a80_get_pll4_factors(struct factors_request *req)
 	else if (n < 12)
 		n = 12;
 
-	req->rate = ((24000000 * n) >> p) / (m + 1);
+	req->rate = ((24000000ULL * n) >> p) / (m + 1);
 	req->n = n;
 	req->m = m;
 	req->p = p;
-- 
2.43.0

