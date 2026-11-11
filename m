Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794434259;
	b=NmaCWXwTVoFPayu2+c8itXJdRCO3G7IXweexO/EdxL0+NNS7J/OpyxULrKOyPArz7X09
	 QkJwsNz/U8wsgMtXPr0sxZ8PowFLI93i3LUvIbxuSC4XtPDSQIrzjV1xY1X8XfSIKik3P
	 sLcQDsnqpjAJt88zhUC7xo0HrHYAwPEfe91ekhAoecOuMkzU90Fn1LMQj5FZ7QBWLv1fF
	 IkxiXP+mEfyM6WpqkgAMVAf8orMXxTqscXz00AHxyFVMQ/fT4C4cuWbvubcebBA70VdsP
	 YiFLxrrULeNhKkPyC2L0tch5rXDWx8SUJaAu8G1uiUTDzY0wE7MLEx4GRLZLmH6+TiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794434259;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4Id6YLrXdo/sbhtyWZLRtT4JHuBONTss7g5b/bmKuAI=;
	b=E+Yuwj4kUmQNAsaikghdeAWyAmWN4ZOy3nUFVQnUw1CrngiN+t2fIfD0NmORX7ryzEQq
	 LEkLDWDVtpX5hfeIsw3rU8+4Np1XE84JCY8MEtyyjCTqq1+WNNcKM2RykdgCLnjDvmpgQ
	 btGPZz4RVATEu9BVCcwZlIwEUKREtK31qBfZMOPXw7fbLYofpW8WVR4NI0LMKlAFE3a/4
	 +e6qaUcvRcvQsxpMtwNX14gBW7zfJl3xfJZfa+okYImVDY+N9BQilv0EJMnKCeta/LbN3
	 VQsyW8BNMLghE37OkmUFlLrqMSYEu3ghLjj4KY9q0BtHmf/6E8cgbWUtzKhpfcwFMVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VXHAYuoH;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D40606A8A4
	for <linux-clk@vger.kernel.org>; Wed, 11 Nov 2026 21:57:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94D40606A8A4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VXHAYuoH
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3b094e649d3so2129136a91.0
        for <linux-clk@vger.kernel.org>; Wed, 11 Nov 2026 13:57:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794434259; x=1795039059; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4Id6YLrXdo/sbhtyWZLRtT4JHuBONTss7g5b/bmKuAI=;
        b=VXHAYuoHU92lfwUVxtqfkVZGdQiNbVjxf1xXEV1GYQnL17GdS6R95T+ObDNlDmzinz
         pICwPj37iXBxXLTWt2tjwwJqcSbeFg1StgFcyp3IrKaYoS4aFivkgZybTOBkz6WP1lbb
         Habps8kmQ+GE5KgDT6Ipvpy7G24hHm+/MXrnc2MSxkSeqnVZTeQdzt3ISK2qWifjuBct
         Z4sfhZv3Tkxr6CappcuNZ9a7MIXtFIp6Q3ahlQLCDQQ3H22wG8XKA0JhNnKXanEwjorS
         FNrNT+UtuRJLME5T9ug0pLoQvFnr8E4aBOkTj228wOdNiq8m+3ZOziiE3Wa818rBzLkM
         Ll4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794434259; x=1795039059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4Id6YLrXdo/sbhtyWZLRtT4JHuBONTss7g5b/bmKuAI=;
        b=kQIbKzNrYQSqDpAExCPcenG7MNxaQroOvnbnU1sur2VCUDxVPwYTFi70LbHY9gZCXp
         cK8YZlmjEc2/IO/6cG7BQMPYy8ibVw39z8qRV+XsNYbLtPCtRvDsqWA8pLCYzQO2DNTb
         BxURibrDJcXabO68AqbPQ757JdYHX9wflnS16oy8kJhihq3+iZzAxcPYscCmGoo0Kz6w
         1z8Ny4eEA8/5udOXQGgQzYTO49YayOIXfX24j8jj4u8/p43fzNiol6xajjWO8TKGfB43
         5y2iMwVoMOSAACnS06MRAnfd5NhMSxzpRBs4Y+MlHSL8aL5J0AyYOecF+YNYLtV/8Tef
         KLHA==
X-Forwarded-Encrypted: i=1; AL+hErFkWv3dQ0EQv67XurKwJmtkpjGhB8bTEeuIhytHo9429BjKPJZXSMVkbnA4XHyWoZ6Mj7FWvd6GTjU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8SERWsPmm2MxZRsq+j8kj8nY+YdiXfGM2dpeKBWKu+jF9FNXCa
	7a33sA4imRJq3jhViDwiCHtS/3DsWomckgulGZFYLzgLWxSBKwXsQ1Vi
X-Gm-Gg: AYBFou0uFR44B2ZIlaR3oYykUXtUubBISZ9fiFHegKo+HuWZ6w6n5tF742EKuB/ttB0
	pg2CkDahNH6vxP1gF9UPKssodTEfPZxoV8TGxaedCiJ5J2WKMfDMJkkfW/uxc0zgTMVmuOC7vMx
	L6/H3VB2I9T13Hyyi6w68ULO6H0QNB0AasB0+vz4K2YexseoH+xV5FizTXo7cWOYKI6iKbuSUJM
	RMWsZAGVqCoYogVCCbLmDmN93bXw5xUPRzuZfu3XnF1p08B76Cn3nQR6wL5jqldDwpfsBOUFOM4
	jOm2m/Edesl7r1/KrBOThUZyrd376QzSNZr2D1X6v5/ZtDrt9rxQ34apFy7m9Fikrj7Aqll07Ew
	3xBVtL2nEaGUiVeAh3UpsHLhmKz8INGAK7So+R8NRrO2xheyVpFfgec1tHKlDLNevcXeeWZWbvT
	Wv+NbRC7/tkDhay+Ss4Wa1Xi9wB5Gi1/pr60t/Go2TqiqjLoz4t84DuXk4fj/0ITJUxpmgCmWmd
	wOKq/+vvYRzLNEoKLFpLoEl2j71X0qZU5fhNEZo4jQ8vwwlnkpSDvtginVatp7bJ/FrQ2aJ6Al1
	tsggzhZgL/9ewl2cN6WfAs7CswPt88Cb72FLPgkI4+YSqJTfshPFM0d46vbABGv6KyQnscy9dN0
	dFzAB64DoNhmhFmV/uOROo5iHA1WF+YT2lEISd1RxUGIMIyT+DsK9UvHe9oH3KKOqPzZt0tjrug
	vjBA==
X-Received: by 2002:a17:90b:134e:b0:3ab:4f1:4f76 with SMTP id 98e67ed59e1d1-3b182ed7a6dmr3796484a91.24.1794434259067;
        Wed, 11 Nov 2026 13:57:39 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197ce556dsm965429a91.6.2026.11.11.13.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 13:57:38 -0800 (PST)
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
Subject: [PATCH v3 1/7] MIPS: ath79: apply the QCA956x timer workaround in setup
Date: Wed, 11 Nov 2026 13:57:23 -0800
Message-ID: <20261111215729.10683-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261111215729.10683-1-rosenp@gmail.com>
References: <20261111215729.10683-1-rosenp@gmail.com>
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

base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47
-- 
2.56.0

