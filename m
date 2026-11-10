Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794274614;
	b=4hLA4v5bNVAtuebF1gC93hNU7af/jroEJosVVzesf0byUSMLhHn9S8h4+R+yW880QNLp
	 AIUN7MwuOLtHcdXbYH2aC+7WxTpwJ8Y/BqIZ0q1qgrIMGaHBMXYr6Aj2uAtLv9T3rhhvZ
	 zFBsyL2uHmjoobBZBCeKaOkjWkzIlHaBRjnjUhe45JiK/NFSyc7hAF4dU553X6ArN6V9z
	 ieMJPH+zyRQt3sOGi5dt1l9nCzPHSaepu4MJNBsS9A1SqQ/2uwUWKXLUN9OVdGZl7pfPf
	 NNsgTtPagUZxH8VesZujIRI4yyrlal+ksP3nPlTN4knHUbv9c8fNqiz/U1Ory4fu80Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794274614;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KBXunWp616box3X7V9vV93MSQlhAq0/quw4oecuKOn4=;
	b=UzilYaT2wPDobeAyvh/qh9LC5IaD5RwlS94m9Fz1YMa2fqCUYUhK+ExopJfnpfwuIYbO
	 kH8A+S88oSFYKuAHlr63+EtuEJvmrKiVFFA3JVII9pewYpBf958SVk6vpwiqgRl7cQ83t
	 +b/dp5eJQXY5I4bXwVuiFDOVE4uvlXS+Mv7Ume4hx//vcQzlqJ5lHg1mbAirDiIRhUSjK
	 D/s/rCW+l/2FDn74eBnnMgs4D+SQI2SZ1CQVHP9XWAaHNT5hlXMPNExBkxTVudMHLZF1j
	 tQhTiyotx1Uz/mb5OMZpzDNDicjCSjbibkJzb8wL3BEzhdYIxCL44Z/EwE2u1skrD4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YXmwP+KM;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B62D606A336
	for <linux-clk@vger.kernel.org>; Tue, 10 Nov 2026 01:36:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B62D606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YXmwP+KM
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2e987a2ba0cso8696535ad.3
        for <linux-clk@vger.kernel.org>; Mon, 09 Nov 2026 17:36:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794274613; x=1794879413; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KBXunWp616box3X7V9vV93MSQlhAq0/quw4oecuKOn4=;
        b=YXmwP+KMjfg8Y+ppgBOIkepUy5vUlFl0hR8P/EkAHp47RMYvYcnIPP1cYSzJUvfFaG
         fa6vOok7/0ZKJ7oxI9jLyyGCaTbdn3xjgBjwuSpA0K2Vwj4MkX4/zee9AQquncJeaNjM
         PgDhHsxojGiStVqXSXYk+hhAFTLwXQeJ1ZOOIrcX2k1O7Xw6mS0tAUXDyUByid89Ciie
         34PGtCLgF4xuojkI1iBeWFhx4pHn9M6gyI5QkwFv+u69AaYpH/cZqgW9gL8Wj9DL/5BZ
         ZCbidCDfgtiBcS2sPxHdmbQfJbgvCpk2sQlRvfPJq1V6q+FOzU0+/MhB2y+FUsslk20R
         5yhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794274613; x=1794879413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KBXunWp616box3X7V9vV93MSQlhAq0/quw4oecuKOn4=;
        b=YTn7qggq1BxfZFi2aZSF3K/KZXig0xH0C5ngKl+xeWT09e2ufUFNppnQDQzrCjtzSr
         3td2lkk5pdfz3BN5GJR9QIpmbXv7edJh57FK8ujJBCmAARDNY7IO5LW9E1HvtvSE6QKg
         Q0j49PDCRMUk9vOTYjs/bQ3T4kTo2zjYOunuPeCkOyccI+uwj90VcBTpPdoUXPoHLWcK
         1+Htuq7SRkXbxnWjOtNiXxqtVXb1Me/d6QzvkPT/T5EU12R7BKRAOyjj2IDM1aBZhJ8H
         ddLP6kHj0+uMddHGOWerlUm9qrWEDalGDLyBnTufu2GYFkXR+FVLPoX44wcGB/UR884X
         3aUA==
X-Forwarded-Encrypted: i=1; AL+hErEFpfAgMs7Pqdb6djxyNP9F09ySGzoxkZB/5QN9IpUZR7JlaDbtCvb32QFWbXpK5hVA33L2z0K9V6s=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Sy9hsIMLn6lWybWVuBWTb1j0TqEBEM8/weMj1Lnew0t8mXxlK
	fFlFHl9mi8zLg6z/EGjoGETkCL60F2JpnU3Zjk8U8Vv0CcRpNXRG6DKh
X-Gm-Gg: AYBFou2dTmfeFN1JyaRZeqovQVg8QZWHc6M+yzUPEre5vGYRFdzLX0kwTgBNliNfUw8
	/FI+9IoSoVokBBY8rprnVrt7W6r7mUNXXRNbyEGDfX4CAR2v/uuRBYlQeoy3BXk57f1lruZgGxJ
	8qtmIN8PPMqIhsIOV4I8+H4qTgzOoW4KrsUY6tYOlvXiaKGTn2hEi9520Qh6XOYUWmMSaHuBk//
	Ok6AMZMVolgHAxRBm+uYPFAwPRqVhmFUiPedYsc3vYZNSJI+pcWL3ocMAOEOOe/ewV8Pk6AxH9X
	xfcQUh61E3+k8Ud3hp4rvWuPkftny0ESbgnfXTH0NXP7Wzur7E3lq2UqW30/bxtj2ltdd33+56f
	I6nBDr7CrfUozfmyXsxGnp6zXWKHySAd/Vf/uazC+0tqGbeVMn30Sgnakocap2b4BslGjoaEiwl
	LdOS7/Ss41chEH9hzGsHGMzEvq3tdZwthAOW9J6EDHSC8OX5qAPvi2Z1XErmXH0CqsoET53laTo
	GlPh7jCl29NcpGHazmroMHp9pKGOLenA9L9jjKmpZ6dbprNtcTWEXQvxPieL49hOiCgAusUym/u
	1jRFtOGdE0hhO3N6igUcmP4xj2rrW3Zon8Wp0907ETI3zZFaYKYDwF1jONTmX4g6r2mR1BNWOqa
	HNQRtc4cQ7PBr59n0F/zg1sy8V7N02t/SZE4RJKLNDPxJYBCJt2lN76f6rRFu6ZV2c4V6Y6ZzLO
	jH0Q==
X-Received: by 2002:a17:903:4683:b0:2e6:2868:e576 with SMTP id d9443c01a7336-2edb91c7094mr9718735ad.31.1794274612794;
        Mon, 09 Nov 2026 17:36:52 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6d9efd6sm3399055ad.50.2026.11.09.17.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 17:36:51 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Alban Bedel <albeu@free.fr>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 1/6] MIPS: ath79: apply the QCA956x timer workaround in setup
Date: Mon,  9 Nov 2026 17:36:41 -0800
Message-ID: <20261110013646.1582970-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261110013646.1582970-1-rosenp@gmail.com>
References: <20261110013646.1582970-1-rosenp@gmail.com>
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

qca956x_clocks_init() enables the MIPS timer interrupt in the misc
interrupt controller, which QCA956x needs before the clocks are set
up, or there are no jiffies. That has nothing to do with the clocks,
and it ties the clock code to ath79_reset_base.

Do it in plat_time_init() right before of_clk_init() instead, which
runs the clock setup. The order is the same. TP9343 boards use the
QCA956x PLL and took this path too, so check for both.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/mips/ath79/clock.c | 10 ----------
 arch/mips/ath79/setup.c | 13 +++++++++++++
 2 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/arch/mips/ath79/clock.c b/arch/mips/ath79/clock.c
index 050f6553f398..8c5eaa4ab6e0 100644
--- a/arch/mips/ath79/clock.c
+++ b/arch/mips/ath79/clock.c
@@ -523,16 +523,6 @@ static void __init qca956x_clocks_init(void __iomem *pll_base)
 	u32 cpu_pll, ddr_pll;
 	u32 bootstrap;
 
-	/*
-	 * QCA956x timer init workaround has to be applied right before setting
-	 * up the clock. Else, there will be no jiffies
-	 */
-	u32 misc;
-
-	misc = ath79_reset_rr(AR71XX_RESET_REG_MISC_INT_ENABLE);
-	misc |= MISC_INT_MIPS_SI_TIMERINT_MASK;
-	ath79_reset_wr(AR71XX_RESET_REG_MISC_INT_ENABLE, misc);
-
 	bootstrap = ath79_reset_rr(QCA956X_RESET_REG_BOOTSTRAP);
 	if (bootstrap &	QCA956X_BOOTSTRAP_REF_CLK_40)
 		ref_rate = 40 * 1000 * 1000;
diff --git a/arch/mips/ath79/setup.c b/arch/mips/ath79/setup.c
index 4e18cdcf65a0..d9e1cc77ad04 100644
--- a/arch/mips/ath79/setup.c
+++ b/arch/mips/ath79/setup.c
@@ -241,6 +241,19 @@ void __init plat_time_init(void)
 	struct clk *clk;
 	unsigned long cpu_clk_rate;
 
+	/*
+	 * QCA956x needs the MIPS timer interrupt enabled in the misc
+	 * interrupt controller before the clocks are set up, or there are
+	 * no jiffies.
+	 */
+	if (soc_is_qca956x() || soc_is_tp9343()) {
+		u32 misc;
+
+		misc = ath79_reset_rr(AR71XX_RESET_REG_MISC_INT_ENABLE);
+		misc |= MISC_INT_MIPS_SI_TIMERINT_MASK;
+		ath79_reset_wr(AR71XX_RESET_REG_MISC_INT_ENABLE, misc);
+	}
+
 	of_clk_init(NULL);
 
 	np = of_get_cpu_node(0, NULL);
-- 
2.56.0

