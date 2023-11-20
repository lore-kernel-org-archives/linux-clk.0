Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="FFiMjGl9"
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C666D5D
	for <linux-clk@vger.kernel.org>; Mon, 20 Nov 2023 03:18:35 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4084b0223ccso14923815e9.2
        for <linux-clk@vger.kernel.org>; Mon, 20 Nov 2023 03:18:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1700479113; x=1701083913; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fqTdxNbR3DIWsz90mETj0syANj+j4DLCa1dx7/EKSLU=;
        b=FFiMjGl9DXP9ZUo53s3400ANiQ+OJGY3XLbwLiILiFV9AbFMt6wCcVYc4BoohCzbf4
         Z+60P10VHsScbMoV/s1DShDHhGQmD8rLou4CSKpJysI3/Ie7AA6H3KQaJ3V0Wk9vD9HU
         GoJ9rASMn+Sad3cl9vXzHHvW2bhSzHBP+jplDpgxFixsQKFkWv4T2Z7lthd18fdUZ0U+
         cZpMMeYHmKpXU9tM1VJ+UOwjAdRqwNKUJpOjJQcU78yAaZtxg8Cg/yjGePfalkN/lZRg
         V5P0m+rBn9WP0/etgRYPZz6sj0nFA+ibtjR9GCJNJchfIK1K2e9dGuWj8v95Mb32E36O
         ruJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700479113; x=1701083913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fqTdxNbR3DIWsz90mETj0syANj+j4DLCa1dx7/EKSLU=;
        b=BkuNwkTmS3HeeplZaNcO5V45INaJ3wRJ4RpztZXM0G+r/JBWHjU7musNO5T2+AsduF
         k4iSK+0Ir3pBnuJ0pj51KvQ4cgw8jsIV5tKi91nqBJcEJ8yA/4i9uRdlKU9V+fu9zzY0
         xNBBNCL/TY7J4thmwif/7pbKbtCKpIZgXXVktUNSK4LQ1YdlMr1yKotJgOKO/jPxZuHZ
         F6O5aUrvhCdE6mgrirgfS57vCCdStkmoM6t2OiVX7lQm7QT6hYk6tCLMGcMHsqKjlbyB
         3lm6b/2HQmNUbV8DHYU3suUG6FivTSXodOzjMUTrlPgo2FrEOUyEkyrKt2Uw3YJWERwT
         9Y3A==
X-Gm-Message-State: AOJu0YxewQwh7pY8NTlePtfkzkcFyVs1x/O9bQrUaiNsDbQs88MLaaO3
	PD5CXwXaad+E72m5BqSZg9V+Xw==
X-Google-Smtp-Source: AGHT+IHgzpzdAPQRoTygB2X9zpY2EXIcjHCka24fPfFIsh88xrSV88jkI8f1ygKOgzJkWwOk1S4GeA==
X-Received: by 2002:a05:600c:4752:b0:406:52f1:7e6f with SMTP id w18-20020a05600c475200b0040652f17e6fmr5869517wmo.12.1700479113644;
        Mon, 20 Nov 2023 03:18:33 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.183])
        by smtp.gmail.com with ESMTPSA id g6-20020a05600c310600b0040651505684sm13142676wmo.29.2023.11.20.03.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 03:18:33 -0800 (PST)
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
Subject: [PATCH v3 3/9] irqchip/renesas-rzg2l: Align struct member names to tabs
Date: Mon, 20 Nov 2023 13:18:14 +0200
Message-Id: <20231120111820.87398-4-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231120111820.87398-1-claudiu.beznea.uj@bp.renesas.com>
References: <20231120111820.87398-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Align struct member names to tabs to follow the requirements from
maintainer-tip file. 3 tabs were used at the moment as the next commits
will add a new member which requires 3 tabs for a better view.

Link: https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#struct-declarations-and-initializers
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/irqchip/irq-renesas-rzg2l.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rzg2l.c b/drivers/irqchip/irq-renesas-rzg2l.c
index cc42cbd05762..90971ab06f0c 100644
--- a/drivers/irqchip/irq-renesas-rzg2l.c
+++ b/drivers/irqchip/irq-renesas-rzg2l.c
@@ -57,9 +57,9 @@
 #define TINT_EXTRACT_GPIOINT(x)		FIELD_GET(GENMASK(31, 16), (x))
 
 struct rzg2l_irqc_priv {
-	void __iomem *base;
-	struct irq_fwspec fwspec[IRQC_NUM_IRQ];
-	raw_spinlock_t lock;
+	void __iomem			*base;
+	struct irq_fwspec		fwspec[IRQC_NUM_IRQ];
+	raw_spinlock_t			lock;
 };
 
 static struct rzg2l_irqc_priv *irq_data_to_priv(struct irq_data *data)
-- 
2.39.2

