Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 924CE1E7648
	for <linux-clk@vger.kernel.org>; Fri,  8 Nov 2024 10:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731063023; cv=none; b=QdRG9ubDu3h26vPeSlmbfxmOhRk552qDye2bFwblQC47tG9DezRNAAYTNS85jqqHZhJkhibT3TGvHdT9Sn5pKW3FNemwPudFqEyGsm8HqgQrHJKApQm66xJnxR4rABWVJgzOV6D0xesTCYbGVITWLVI5snRQAfDXHlGNYguG3nY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731063023; c=relaxed/simple;
	bh=gcbLp0EDuhXnLWcMfm7HepHAEOi/ma1whorW46vYLVc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jGuVgDuY8kZafHHsKVB74rFlBgEFhtyXUQ7uI75cqionR7ZbIstRWeNvsZ214B8aMscm6Ucv+uMahd16XCG1G8aAsz9rhEXYXSAIJRBR8/mNg1cnnu0StQbIC2DpigLVUhOf/BuWMbnoCiTHhpQRy4uTuZ5Z6tA1vxNKQSgZp0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=JYHpwHmO; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="JYHpwHmO"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a99f646ff1bso284287166b.2
        for <linux-clk@vger.kernel.org>; Fri, 08 Nov 2024 02:50:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1731063019; x=1731667819; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E9TIDVBXswiUE5qwMC9ASUWD1mYCqJbFdA9aImOCUio=;
        b=JYHpwHmO3Xe5Xq6eoP1qTEBV7R7rLrulFoSaktZ4tgiwRFL5uHzOnjbUv77xFH75ac
         35hnxHCV4NyfY1VN7Gl1Bj4Hq4cRGkG+8MsbIgPoBaQWq+fLQ2RPHGdD2xlOMjxzIY86
         gkTyhl3r8C87BmzeAxOsi9iHJdtyJKxConxafdIwYRv8eOPVeScM1PUz1uDrDIL/8wgV
         Nk6A0FXeaFGV9jT7F0VnUDdPUTb8+dFKfVRRnDUSPEyRzPTjM+kSbt8gNUmgaofHgoaY
         8Ve5W1USshjgDvKkBKDdO8r013QGy+CPEyYBiZeDTnDtekW8eYdr+UbIDBMhqDKU+v0t
         Peuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731063019; x=1731667819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E9TIDVBXswiUE5qwMC9ASUWD1mYCqJbFdA9aImOCUio=;
        b=NFj71/bOhtBE5PZLqeBz0o+S2YgQZJYvT/X8KXrICa9XjoNE1smlPMNVTF/yHtOc7x
         kL3GJfltA9S3ZtrDa6lBxwP1g2Kgyqy99iDWlFaELe0gZX7qj9PTU25dK5GY2QW39v5o
         GA138v4cUmASBm55Aoo3Qv6FulHlcPGRvbUQa/b+t8qJzPFO3DBFQk7N0itw0PKskWVs
         U1ea3Ts+heqLfeYuWafm32IIvMfcJaOxvCZTFsE6RQHjiDEueSNGVPqTSa+dR5fpyJBa
         4du4D8SCtPU1rEFExBoanz5wLe0QpebgD0w8I4Qla4U/pcA/cAdbQypyOBLn9K0Z0mO0
         qQtw==
X-Forwarded-Encrypted: i=1; AJvYcCXFMwLw2/v/6MjtfIWkzwe4YTQkf6whxs8dheB0Ilo2eJKJ+2rHl7iuRpUQD7N0XdJiI5u4hzeSmpY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzw74lrYZs4/xHdvyKh1Pn1qdVhnHqSXCXiSl54hnlCaldjE1nj
	D0jefuAkuIRxUUj/XoPDIwP9S1LLPcLit0NSdOjzj9N62YaWyZKha+zVJMwJsg8=
X-Google-Smtp-Source: AGHT+IHeDcoAe/sAQtrD3IXuJOZe9XyJNaWHB16C9eW/o6XJaPaVjTfxbe6gh+mYzP09cZuV2+uATQ==
X-Received: by 2002:a17:907:6d04:b0:a9e:441c:f729 with SMTP id a640c23a62f3a-a9eefced5fbmr221846166b.0.1731063018920;
        Fri, 08 Nov 2024 02:50:18 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0dc574dsm220464866b.101.2024.11.08.02.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 02:50:18 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	magnus.damm@gmail.com,
	linus.walleij@linaro.org,
	perex@perex.cz,
	tiwai@suse.com,
	p.zabel@pengutronix.de
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 04/25] clk: versaclock3: Add support for the 5L35023 variant
Date: Fri,  8 Nov 2024 12:49:37 +0200
Message-Id: <20241108104958.2931943-5-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241108104958.2931943-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241108104958.2931943-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add support for the 5L35023 variant of the Versa 3 clock generator.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- none

 drivers/clk/clk-versaclock3.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clk/clk-versaclock3.c b/drivers/clk/clk-versaclock3.c
index 1398d16df5d0..9fe27dace111 100644
--- a/drivers/clk/clk-versaclock3.c
+++ b/drivers/clk/clk-versaclock3.c
@@ -1133,8 +1133,14 @@ static const struct vc3_hw_cfg vc3_5p = {
 	.se2_clk_sel_msk = BIT(6),
 };
 
+static const struct vc3_hw_cfg vc3_5l = {
+	.pll2_vco = { .min = 30000000UL, .max = 130000000UL },
+	.se2_clk_sel_msk = BIT(0),
+};
+
 static const struct of_device_id dev_ids[] = {
 	{ .compatible = "renesas,5p35023", .data = &vc3_5p },
+	{ .compatible = "renesas,5l35023", .data = &vc3_5l },
 	{ /* Sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, dev_ids);
-- 
2.39.2

