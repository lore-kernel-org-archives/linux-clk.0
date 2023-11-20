Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="hux3o7Dx"
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10BED1984
	for <linux-clk@vger.kernel.org>; Mon, 20 Nov 2023 03:18:40 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2c87903d314so17808101fa.1
        for <linux-clk@vger.kernel.org>; Mon, 20 Nov 2023 03:18:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1700479118; x=1701083918; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LV9ajd1Vn5neabgAa2TZQ+P/1Gh4jYJqAFrZemb2qP0=;
        b=hux3o7DxjrSRfQTe46yFrhg0OqyhEEKbHEMxnFPN3DPhRAoSTyjI0Ry19qTas6fJZ9
         lwaWEKtRxUrjCeo2HmWg7JY4dxPWvDhMkDCtNmoYLKpkG9F219qimmZwI3slnJqWehvM
         RjmfTI3/8tqVeGi3/I9DPQrGi8h0+8kq7XXJWaUqMbK8Db73tflU3I2Fnd+MgdNURBSc
         xv71sirvepTkneNsB3xHjsn17Xasn9VPMqY3lnKyAV5KRB9siHJvQBv+PDPmmfHoMewt
         ddAvqNQ+P88AHXwlM0CRQbfnVo2kqoabNhTPDxWeAC2ekN4+4sj6bj9rYEnkT7Ovs+gK
         k/Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700479118; x=1701083918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LV9ajd1Vn5neabgAa2TZQ+P/1Gh4jYJqAFrZemb2qP0=;
        b=jGA5H07OzhrAYsSEJj6euLkwXr01PCKjtya5XQaPYnmpcEBhqlZEb8d0efovsRqu4c
         XplFDpmbDOL1t7HSi+FG9o0KQxT5893r8YDoGVLK5kNktV7cFMvju9/lJTu71WNlO7Jh
         O8Mg9iX994cIKhjXwShCBUj28DoJKZAgm2hMid0RWytXTYbuxhnX4YCP0mwHxp6fmOgH
         fqp/AWoGk4q33/hz/8zj4MCXe+e4EnIfKYUn2GCEVomG6bE6asw3Oq5xNTHHo9AQVThj
         8t4fmRwJc2/ygZZTC7ONc8TiKzZbXerh2RBd6Ky4GQ1dqE3dVQhQ2eaS6mzrlDOpFllA
         9qdg==
X-Gm-Message-State: AOJu0YzwEZn4ZlQIQCxXw9Y+Rja+7n4UNe/lbE0x7uoG+rVKJRDQoHOn
	UE+MVdJd0xV4Y5qn6qnrEOFB/Q==
X-Google-Smtp-Source: AGHT+IEiQKWoeAHflWfxsYGxW57vdmsVdNEpIhaVkUYjrztJ40uvkrK4CIk91VUscIDSWi9q/5RInA==
X-Received: by 2002:a2e:9b95:0:b0:2c1:9a8b:f67 with SMTP id z21-20020a2e9b95000000b002c19a8b0f67mr3867505lji.1.1700479118250;
        Mon, 20 Nov 2023 03:18:38 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.183])
        by smtp.gmail.com with ESMTPSA id g6-20020a05600c310600b0040651505684sm13142676wmo.29.2023.11.20.03.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 03:18:37 -0800 (PST)
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
Subject: [PATCH v3 6/9] irqchip/renesas-rzg2l: Add macro to retrieve TITSR register offset based on register's index
Date: Mon, 20 Nov 2023 13:18:17 +0200
Message-Id: <20231120111820.87398-7-claudiu.beznea.uj@bp.renesas.com>
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

There are 2 TITSR registers available on IA55 interrupt controller. A
single macro could be used to access both of them. Add a macro that
retrieves TITSR register offset based on it's index. This macro is
useful in commit that adds suspend/resume support to access both TITSR
registers in a for loop.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/irqchip/irq-renesas-rzg2l.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rzg2l.c b/drivers/irqchip/irq-renesas-rzg2l.c
index a77ac6e1606f..45b696db220f 100644
--- a/drivers/irqchip/irq-renesas-rzg2l.c
+++ b/drivers/irqchip/irq-renesas-rzg2l.c
@@ -28,8 +28,7 @@
 #define ISCR				0x10
 #define IITSR				0x14
 #define TSCR				0x20
-#define TITSR0				0x24
-#define TITSR1				0x28
+#define TITSR(n)			(0x24 + (n) * 4)
 #define TITSR0_MAX_INT			16
 #define TITSEL_WIDTH			0x2
 #define TSSR(n)				(0x30 + ((n) * 4))
@@ -200,8 +199,7 @@ static int rzg2l_tint_set_edge(struct irq_data *d, unsigned int type)
 	struct rzg2l_irqc_priv *priv = irq_data_to_priv(d);
 	unsigned int hwirq = irqd_to_hwirq(d);
 	u32 titseln = hwirq - IRQC_TINT_START;
-	u32 offset;
-	u8 sense;
+	u8 index, sense;
 	u32 reg;
 
 	switch (type & IRQ_TYPE_SENSE_MASK) {
@@ -217,17 +215,17 @@ static int rzg2l_tint_set_edge(struct irq_data *d, unsigned int type)
 		return -EINVAL;
 	}
 
-	offset = TITSR0;
+	index = 0;
 	if (titseln >= TITSR0_MAX_INT) {
 		titseln -= TITSR0_MAX_INT;
-		offset = TITSR1;
+		index = 1;
 	}
 
 	raw_spin_lock(&priv->lock);
-	reg = readl_relaxed(priv->base + offset);
+	reg = readl_relaxed(priv->base + TITSR(index));
 	reg &= ~(IRQ_MASK << (titseln * TITSEL_WIDTH));
 	reg |= sense << (titseln * TITSEL_WIDTH);
-	writel_relaxed(reg, priv->base + offset);
+	writel_relaxed(reg, priv->base + TITSR(index));
 	raw_spin_unlock(&priv->lock);
 
 	return 0;
-- 
2.39.2

