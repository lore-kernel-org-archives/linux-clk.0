Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793771951;
	b=5A78WjcGJ8prru7jUHDge1r6LlAeCL6A5j2dpEEq34yQuQqCCpl11lsnGx0An45M9zCP
	 P2gdF+SP2MKqmZH4QaPAHnYxyUF59V1WrYKGLGAYeqm9nmajVOg8riVmSDtau5uvxcDN5
	 ml2zfaPQNhFVeFY+nKTpojRZzVJUPQRLX41tkEYIa41ud4ZFVM73wq/5YZg5O4tZbMYIN
	 rbXTztZv4daqCn0iGkD8mptaZBSTvRERw9IVKuR8CvXFRFhSd+Nfdp0Y7fBH67IzgOmBq
	 dvs0DjtSK8vmCBEuD0sDSZHN2/l1R/N+xCRsawC4wN4XrqL+jabm0OGGCmeIYER5WJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793771951;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=2Rp4lizZz5ZPmQTX2hVm2ac2qWYjm/C0ch6Hu7hghw4=;
	b=gMKGP1fQsazlWwTQbCX8axHs/KvTAjZHNBA7k+yEeWuGJ0NkAY5omeR/chhtKIP29ocb
	 5rLQOgAIPhurdEOuQ6WUxv5X1XVNkbMDRv2g5c2vleo9PZCivH2IqCpjx8rr8VCZJO1nm
	 R/p600s6YazcKKhGytE0Qk1WfJ1j/K5QWRxYEpmtsbKuUsRmScOHioPG5Yj5G/4M19E9e
	 M8dl9M8spUjdE34xCle2ahe4vG+9MaVQKGdan/dQj4vIrURQZj+3cPhQji4fFgbL+8MsR
	 ASWWDKT2O4GVCGtFnZYsWRI5IFEYuBMKhGW+kh+Qit/edu7sFsEQa1P3gBLxb5wDWYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zJQylyrI;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E05606A32E
	for <linux-clk@vger.kernel.org>; Wed,  4 Nov 2026 05:59:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97E05606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zJQylyrI
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3ace1f3897cso202703a91.0
        for <linux-clk@vger.kernel.org>; Tue, 03 Nov 2026 21:59:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793771945; x=1794376745; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2Rp4lizZz5ZPmQTX2hVm2ac2qWYjm/C0ch6Hu7hghw4=;
        b=zJQylyrIaxkJ6qh/3H/fp8MxqtGJ/b8X2+J0P9MIJk71Xfz1vz299bZXbYwzp6c/MV
         d+5X7dTslB2r3icSDTd0zICkWYZJ/YFmLE52MaiHL/RBHNAoM66Efgq/QPYemCyKy1Ao
         F894GPvtqxZYVFnZYLTd4BokScEzWecc4p8n9OKIzLwUfv9QdyFOMUb9CEL64Wj5dzUf
         ZjvBBEb5anuFvYIIxztm8MdAJi9RQIekHlRHrpeW6Sfeo5/kR47lSwf8RX1GrL4GJkYW
         yXY1dX9gDARf33ZA9Pv+gN2yguvFlT2OkuYsfeSOZucvZmED752iWg4ZuazqomnOtWMG
         lX0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793771945; x=1794376745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2Rp4lizZz5ZPmQTX2hVm2ac2qWYjm/C0ch6Hu7hghw4=;
        b=GkRqMZtVdACmB4/ftP5KiSAqa6TcA0Nd58pWFNpM9R5wL6+bXxh80YUntbTpgg/09+
         C6UzrEm70QZQyFzikLpy87ga6cSydafGC3dgEfA0ukc95vTMdioMUTMVgD2ZHJ0bpyX7
         Mda5gU/NeU2iS/VnzN/PK7NoudI9V6vW/fDhctwrIDchVkvtnbPVM6AQazG09g7kwYed
         lNGR2UsD/UqnhNaBL/CCj1tsXTBBjqsNIT/ruUXsONhodLOTVB0emmwbgu7A8Z2JFTsL
         CSH2/b33Mt9B+YrF7N2dg/i+aHbvZVI1pMnaOWWbYTAzRiV9LyH0r/xsIBs0qm/0Qgjt
         v0Mg==
X-Forwarded-Encrypted: i=1; AKwUvBzbWsoYlq2LNYvsxl6J1TkNncmBdghSSpHAhxgdoQem+CYr/01OD4ZfAyh6rCqbZmd56eihLlNeVbw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+XnbXxtpFX9nfJ3QUPB4bWAg3aAWcsF0taINX5D7U3nIkbe8jG
	7tDFI8zj23iD5Z/0OAAq6nZMUjY30l9kfaCof4N9w/UigR0ce8XSuVXi
X-Gm-Gg: AYBFou1gx1eTjao/irAuojN31Moq4yyqL6/olUlLLCAmAobpT2vIaKuNWQVWIih/Ca5
	rfLEUNdfiVp+iJ2TY+fDkeebtpQ9dudVijfWGouLqRCIfSUsNL/r9W67cFCU+E1XoospF82C/Wd
	Nw9cqx60yvaN+fxxnnMGgqLPh3rxsI4hDEoUOSEidk+UPkcS3WvT+6OqMi0aeEV1e2fdDXa3Isx
	cRSspY/lW6lA2zlvjb/0jcBXpGgfvS/8W5FkYNB5HVGnMGSqbxq77ZBDqlV9419i63e8jo5EiKo
	HGXePgYQI3X4O9QY4PLvXjSJhHefmjrlRp+Abujj3tA/PxqilQE22R1DrHDJm4vFTaeujNWZh5k
	+vzJDy23VP9Ib1+H3eaKpKzZpiCEkBXXbjEuZN2NrY0jqoHZKhxGCe5CDFTMhPQMLdFGnGTX/KT
	zb7+BxhcxNr4k1AS9fY6xPe7fRB6MrUuXt8Fv14iWishuW6UWuaU0CyYHkVqlgOBl3NEUbUKWOI
	+MMoLuuG4pT2BYbo9GZF3CVrqOR7dQpdqZFCTPnLV9ZH6I5kiLTWFljrmWOFxg3nvJ+h9p5EkCL
	MosLugc7lnDxrZob/kyeKy9DN/GWMq7/RX3ZrPfLHNGmyLTX5oVAjmqHZ1DKkH8vUNBk78jZlN3
	HwHPJZtukwXCFADEpVafzQJUsTmorJh6SHYQbtWiFBI3x4+ArBDnJAEToR6tlFNPqWHxwRSLuKk
	yPhA==
X-Received: by 2002:a17:90b:2247:b0:3ac:7c4d:8be6 with SMTP id 98e67ed59e1d1-3ae89836523mr12002205a91.40.1793771944775;
        Tue, 03 Nov 2026 21:59:04 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c9928c4sm7840110a91.15.2026.11.03.21.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 21:59:04 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: linux-mips@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Alban Bedel <albeu@free.fr>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	linux-kernel@vger.kernel.org (open list),
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK)
Subject: [PATCH 7/8] clk: ath79: give each compatible its own init function
Date: Tue,  3 Nov 2026 21:58:51 -0800
Message-ID: <20261104055852.152340-8-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104055852.152340-1-rosenp@gmail.com>
References: <20261104055852.152340-1-rosenp@gmail.com>
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

Every compatible already has its own CLK_OF_DECLARE(), yet they all
shared one init function, which then matched the compatible again to
pick the SoC code. Have each CLK_OF_DECLARE() call a small wrapper
that passes the SoC init function to the common code instead.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/clk/clk-ath79.c | 72 +++++++++++++++++++++++++++--------------
 1 file changed, 47 insertions(+), 25 deletions(-)

diff --git a/drivers/clk/clk-ath79.c b/drivers/clk/clk-ath79.c
index 768c9e410b59..8086b4f6378c 100644
--- a/drivers/clk/clk-ath79.c
+++ b/drivers/clk/clk-ath79.c
@@ -504,11 +504,12 @@ static int __init qca956x_clocks_init(void __iomem *pll_base)
 	return ath79_set_clks(cpu_rate, ddr_rate, ahb_rate);
 }
 
-static void __init ath79_clocks_init_dt(struct device_node *np)
+static void __init ath79_clocks_init_dt(struct device_node *np,
+					int (*soc_init)(void __iomem *pll_base))
 {
 	struct clk *ref_clk;
 	void __iomem *pll_base;
-	int ret = -ENODEV;
+	int ret;
 
 	clk_data = kzalloc_flex(*clk_data, hws, ATH79_CLK_END);
 	if (!clk_data)
@@ -534,21 +535,7 @@ static void __init ath79_clocks_init_dt(struct device_node *np)
 		goto err_clk;
 	}
 
-	if (of_device_is_compatible(np, "qca,ar7100-pll"))
-		ret = ar71xx_clocks_init(pll_base);
-	else if (of_device_is_compatible(np, "qca,ar7240-pll") ||
-		 of_device_is_compatible(np, "qca,ar9130-pll"))
-		ret = ar724x_clocks_init(pll_base);
-	else if (of_device_is_compatible(np, "qca,ar9330-pll"))
-		ret = ar933x_clocks_init(pll_base);
-	else if (of_device_is_compatible(np, "qca,ar9340-pll"))
-		ret = ar934x_clocks_init(pll_base);
-	else if (of_device_is_compatible(np, "qca,qca9530-pll"))
-		ret = qca953x_clocks_init(pll_base);
-	else if (of_device_is_compatible(np, "qca,qca9550-pll"))
-		ret = qca955x_clocks_init(pll_base);
-	else if (of_device_is_compatible(np, "qca,qca9560-pll"))
-		ret = qca956x_clocks_init(pll_base);
+	ret = soc_init(pll_base);
 
 	/* the rates are fixed, so the registers aren't needed any more */
 	iounmap(pll_base);
@@ -578,11 +565,46 @@ static void __init ath79_clocks_init_dt(struct device_node *np)
 	clk_data = NULL;
 }
 
-CLK_OF_DECLARE(ar7100_clk, "qca,ar7100-pll", ath79_clocks_init_dt);
-CLK_OF_DECLARE(ar7240_clk, "qca,ar7240-pll", ath79_clocks_init_dt);
-CLK_OF_DECLARE(ar9130_clk, "qca,ar9130-pll", ath79_clocks_init_dt);
-CLK_OF_DECLARE(ar9330_clk, "qca,ar9330-pll", ath79_clocks_init_dt);
-CLK_OF_DECLARE(ar9340_clk, "qca,ar9340-pll", ath79_clocks_init_dt);
-CLK_OF_DECLARE(ar9530_clk, "qca,qca9530-pll", ath79_clocks_init_dt);
-CLK_OF_DECLARE(ar9550_clk, "qca,qca9550-pll", ath79_clocks_init_dt);
-CLK_OF_DECLARE(ar9560_clk, "qca,qca9560-pll", ath79_clocks_init_dt);
+static void __init ar71xx_clocks_init_dt(struct device_node *np)
+{
+	ath79_clocks_init_dt(np, ar71xx_clocks_init);
+}
+
+static void __init ar724x_clocks_init_dt(struct device_node *np)
+{
+	ath79_clocks_init_dt(np, ar724x_clocks_init);
+}
+
+static void __init ar933x_clocks_init_dt(struct device_node *np)
+{
+	ath79_clocks_init_dt(np, ar933x_clocks_init);
+}
+
+static void __init ar934x_clocks_init_dt(struct device_node *np)
+{
+	ath79_clocks_init_dt(np, ar934x_clocks_init);
+}
+
+static void __init qca953x_clocks_init_dt(struct device_node *np)
+{
+	ath79_clocks_init_dt(np, qca953x_clocks_init);
+}
+
+static void __init qca955x_clocks_init_dt(struct device_node *np)
+{
+	ath79_clocks_init_dt(np, qca955x_clocks_init);
+}
+
+static void __init qca956x_clocks_init_dt(struct device_node *np)
+{
+	ath79_clocks_init_dt(np, qca956x_clocks_init);
+}
+
+CLK_OF_DECLARE(ar7100_clk, "qca,ar7100-pll", ar71xx_clocks_init_dt);
+CLK_OF_DECLARE(ar7240_clk, "qca,ar7240-pll", ar724x_clocks_init_dt);
+CLK_OF_DECLARE(ar9130_clk, "qca,ar9130-pll", ar724x_clocks_init_dt);
+CLK_OF_DECLARE(ar9330_clk, "qca,ar9330-pll", ar933x_clocks_init_dt);
+CLK_OF_DECLARE(ar9340_clk, "qca,ar9340-pll", ar934x_clocks_init_dt);
+CLK_OF_DECLARE(ar9530_clk, "qca,qca9530-pll", qca953x_clocks_init_dt);
+CLK_OF_DECLARE(ar9550_clk, "qca,qca9550-pll", qca955x_clocks_init_dt);
+CLK_OF_DECLARE(ar9560_clk, "qca,qca9560-pll", qca956x_clocks_init_dt);
-- 
2.56.0

