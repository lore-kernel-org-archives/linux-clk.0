Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 870302D04F
	for <linux-clk@vger.kernel.org>; Wed, 15 Nov 2023 14:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="WMPnnI2a"
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B647101
	for <linux-clk@vger.kernel.org>; Wed, 15 Nov 2023 06:28:42 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-9e1fb7faa9dso1019401666b.2
        for <linux-clk@vger.kernel.org>; Wed, 15 Nov 2023 06:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1700058520; x=1700663320; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bS8qg7v/mSX4sJHwfdJG3kD1BNBszOYIoRYlKPnXKMg=;
        b=WMPnnI2acNiJvNjPNuDA+Vs3sVYWWVI0Bdpuc2fP1cksMErkEedALjdvXZZY/tQj+N
         HFg/AXnEqPa4w1JSshB6Jt+8Ewp/Hm/ImG31wCHsC3U6RhAWb5OJ6Pt/i0GoLyV1ytrK
         iwdSirriG65i9hFn3k1EBKceH7vBmDoLx82dYhG+FCOxZ91qgy/TRXkq2W8G6LwsN8Py
         ohh3fA7eIlLRLe4JeDwALcls5Rh06xDPS8uztdZ3RJJa+9IUQqbbNJy4R+r5aqiK/E/O
         QenMJcP2P3tiwvOU47rxbnilgxt4O2+zsqpvqBEznALM66r+jBkNcm8Mgti9G3zMkl2d
         g3xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700058520; x=1700663320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bS8qg7v/mSX4sJHwfdJG3kD1BNBszOYIoRYlKPnXKMg=;
        b=bmbDn2cLBuNxiU63ljdkAivWz1x/6HWDjh2HwtuU+R5kT3cqfWsaGISGKJ8KjaDt/q
         U+rsDhEzwEVDTS0oEnNIOGHd/fSjjsa5DLyVcvopseZIUJHdYFEh10szSTrIYraZ7KT4
         QwNUo5v6muWDImAJezldeMCWkWVHcRDRlX5WyShFFyxtufS9Z6DXJFuyCwsmOq7z2ocG
         YnpfsHznSGE7ZWV2weHWsF/fkqbxvOxe+0F0RW9iDV2jWE2C4EIiHpzZIwzL4bOd2mEd
         nJ5wgkduo1wC6X17MRuh/LvNxXBQmZr+tH8NzgU/+J3qiWLOHz8mZfHUT5TnJdZF3bm/
         +hBg==
X-Gm-Message-State: AOJu0YxpoU2SikGFvTM6/Q064uuqzd+23mtSSAympDr9KBEiqYfaus5a
	hrZKZ4rhEbF7ZSzMfjRs/i9Fvg==
X-Google-Smtp-Source: AGHT+IGIZlRywh2OGv/s0LdNKxDjI8m0OS+PXIUtS7vI+Ud9wErXZJ1cvlvhTpGNnIy1WOH1qrYodQ==
X-Received: by 2002:a17:907:6d0a:b0:9e7:d1ab:e90b with SMTP id sa10-20020a1709076d0a00b009e7d1abe90bmr11336470ejc.19.1700058520716;
        Wed, 15 Nov 2023 06:28:40 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.119])
        by smtp.gmail.com with ESMTPSA id i11-20020a170906264b00b0099bd5d28dc4sm7186394ejc.195.2023.11.15.06.28.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 06:28:40 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: tglx@linutronix.de,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 3/9] irqchip/renesas-rzg2l: Use tabs instead of spaces
Date: Wed, 15 Nov 2023 16:27:43 +0200
Message-Id: <20231115142749.853106-4-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231115142749.853106-1-claudiu.beznea.uj@bp.renesas.com>
References: <20231115142749.853106-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Use tabs instead of spaces in definition of TINT_EXTRACT_HWIRQ()
and TINT_EXTRACT_GPIOINT() macros to align with coding style
requirements described in Documentation/process/coding-style.rst,
"Indentation" chapter.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- improved commit description
- used uppercase letter after ":" in patch title

 drivers/irqchip/irq-renesas-rzg2l.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rzg2l.c b/drivers/irqchip/irq-renesas-rzg2l.c
index fe8d516f3614..cc42cbd05762 100644
--- a/drivers/irqchip/irq-renesas-rzg2l.c
+++ b/drivers/irqchip/irq-renesas-rzg2l.c
@@ -53,8 +53,8 @@
 #define IITSR_IITSEL_EDGE_BOTH		3
 #define IITSR_IITSEL_MASK(n)		IITSR_IITSEL((n), 3)
 
-#define TINT_EXTRACT_HWIRQ(x)           FIELD_GET(GENMASK(15, 0), (x))
-#define TINT_EXTRACT_GPIOINT(x)         FIELD_GET(GENMASK(31, 16), (x))
+#define TINT_EXTRACT_HWIRQ(x)		FIELD_GET(GENMASK(15, 0), (x))
+#define TINT_EXTRACT_GPIOINT(x)		FIELD_GET(GENMASK(31, 16), (x))
 
 struct rzg2l_irqc_priv {
 	void __iomem *base;
-- 
2.39.2

