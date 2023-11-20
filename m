Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="A5lX2Xkt"
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A5641709
	for <linux-clk@vger.kernel.org>; Mon, 20 Nov 2023 03:18:38 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-40a4d04af5cso12286975e9.0
        for <linux-clk@vger.kernel.org>; Mon, 20 Nov 2023 03:18:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1700479116; x=1701083916; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mx4aN/zGGPbPx5wuHBwZqoZnjcfUFGnzIbzLn9y7CFM=;
        b=A5lX2XkttnakvOALBo9HgEMO/99tfIMdnWeKfg0aarUCsl1vg4QtB/K3GXZ4Eihxbs
         FJEEZGHTGECduu3sL63UqbAZ33Gp88XgBzSLa4N3WpFSmtKeUX72NTISinjAPnF/pOCx
         bRc5nlxZJ9lZKkipMFdLzo8vfSrmeYcNBbmbqD261Xfa3+k7+kS93Eoum3QHH1YOSIza
         DcSwgdqTXhRfGE+yh8ksTGujHQKs3LfYomnVU2+HQiWc2RUX80siP6PPRd+4auzIpLFF
         U8Y4wC9lsmP5fgCglaAc/kBVdL1P6m07pbiVVUZO4N/y8XfZGpv3NnxIxSzu65xLxWcp
         LhnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700479116; x=1701083916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mx4aN/zGGPbPx5wuHBwZqoZnjcfUFGnzIbzLn9y7CFM=;
        b=YDLBgtP/YQrUWP3dxhNCztYOqe/lYXwjmDY+dg2EgJBAgRUGz3oKjwsyWeBmiw/Ff4
         i7e55ucdu7w4qvm0Hjy9vPdbicfsGMIRtPp0TDnEHheiRRFTSUHgdMceKRAg/YxZqdNI
         IymWDIj1DWyfZVE1xBoKksd4Jg3j0nZZdVWomWZrTuUio1mqVpIIGeLoAZon7ilTtdDW
         4YmzHs4FIpCGXf6366G2u5Hp70RCA6UHnJ1LVmBpJub+O2BebYu83TBHC0BB7e1l4CbI
         3GFzisEFcF7JQ8LFqceAy3CN/9b5LP/CzIQP92N1iYvDktehUa+rEPyy6YFCwotyxJ2y
         C4Qw==
X-Gm-Message-State: AOJu0YzDDuRYcNYi5Vm1dknEoZCIpc/KsxiVgceaHU3pEkk8ZQk4vr0/
	Z+oVLZVML9QOZYDI+6qqWaCrMw==
X-Google-Smtp-Source: AGHT+IG4q9+CFKWWh1PtV4CMYsm0ublGYiA2GT1Ip89ZJtr+DG+TrKWQY2HA9TpUNmUJDiG8Qb2AvQ==
X-Received: by 2002:a05:600c:a07:b0:409:703c:b9b1 with SMTP id z7-20020a05600c0a0700b00409703cb9b1mr6455336wmp.40.1700479116562;
        Mon, 20 Nov 2023 03:18:36 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.183])
        by smtp.gmail.com with ESMTPSA id g6-20020a05600c310600b0040651505684sm13142676wmo.29.2023.11.20.03.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 03:18:36 -0800 (PST)
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
Subject: [PATCH v3 5/9] irqchip/renesas-rzg2l: Implement restriction when writing ISCR register
Date: Mon, 20 Nov 2023 13:18:16 +0200
Message-Id: <20231120111820.87398-6-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231120111820.87398-1-claudiu.beznea.uj@bp.renesas.com>
References: <20231120111820.87398-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The RZ/G2L manual (chapter "IRQ Status Control Register (ISCR)") describes
the operation to clear interrupts through the ISCR register as follows:

[Write operation]
When "Falling-edge detection", "Rising-edge detection" or
"Falling/Rising-edge detection" is set in IITSR:
- In case ISTAT is 1
	0: IRQn interrupt detection status is cleared.
	1: Invalid to write.
- In case ISTAT is 0
	Invalid to write.

When “Low-level detection” is set in IITSR.:
	Invalid to write.

Take the interrupt type into account when clearing interrupts through
the ISCR register to avoid writing the ISCR when interrupt type is
level.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/irqchip/irq-renesas-rzg2l.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rzg2l.c b/drivers/irqchip/irq-renesas-rzg2l.c
index d666912adc74..a77ac6e1606f 100644
--- a/drivers/irqchip/irq-renesas-rzg2l.c
+++ b/drivers/irqchip/irq-renesas-rzg2l.c
@@ -78,11 +78,17 @@ static void rzg2l_irq_eoi(struct irq_data *d)
 	unsigned int hw_irq = irqd_to_hwirq(d) - IRQC_IRQ_START;
 	struct rzg2l_irqc_priv *priv = irq_data_to_priv(d);
 	u32 bit = BIT(hw_irq);
-	u32 reg;
+	u32 iitsr, iscr;
 
-	reg = readl_relaxed(priv->base + ISCR);
-	if (reg & bit)
-		writel_relaxed(reg & ~bit, priv->base + ISCR);
+	iscr = readl_relaxed(priv->base + ISCR);
+	iitsr = readl_relaxed(priv->base + IITSR);
+
+	/*
+	 * ISCR can only be cleared if the type is falling-edge, rising-edge or
+	 * falling/rising-edge.
+	 */
+	if ((iscr & bit) && (iitsr & IITSR_IITSEL_MASK(hw_irq)))
+		writel_relaxed(iscr & ~bit, priv->base + ISCR);
 }
 
 static void rzg2l_tint_eoi(struct irq_data *d)
-- 
2.39.2

