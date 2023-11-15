Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B3C82E646
	for <linux-clk@vger.kernel.org>; Wed, 15 Nov 2023 14:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="ramrNADH"
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 085F518D
	for <linux-clk@vger.kernel.org>; Wed, 15 Nov 2023 06:28:47 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-53dd3f169d8so10276318a12.3
        for <linux-clk@vger.kernel.org>; Wed, 15 Nov 2023 06:28:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1700058525; x=1700663325; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ewZ9xRCba+P0eMIANOBLPqwHZjc7NQgwGPmpIitVuvg=;
        b=ramrNADHtyRQFkdp114gxzCYwEKCMLSWuntKvmc5fsXBQpLGSjSd2XKJWiHA6tEi43
         lc8xzN87POLshqDqEwuIXMcCOPuMEWuOsUmNsyBq6KxGJHcze3Z998qzpx6d03g6DICl
         /7rIs9teYJvl8cpsE6PoWPIW95bqj5CAW5mNzO5tmHv9s3i5dbnnkJUPc48bHZV1cNhe
         3LJ3Ho9wRf4iSPuunhZ6rPHJhO9Xe/IzQgVEot/HlLFpazVrxzdZaLrGSDS6xJveu2/o
         QIUNg1GvXmgqb6y75Dh1jFrsaiuiaQcQiyK1M5Em+miZSciqRI/K7tEom4Y5eUt/h8xl
         VgIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700058525; x=1700663325;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ewZ9xRCba+P0eMIANOBLPqwHZjc7NQgwGPmpIitVuvg=;
        b=VXeeekc6O3qj67mFchnnWWZXDquTbXHhT3EE/6GQBmBQlDvf7scuSK9K8ru5yYgbI7
         u+VATTx/e4BBoVdFB4Cy3P25Otiy8w9D2PgVEqCb9zTnu3VfbQ/RX6hfA0vAdl0j2fZG
         XNRUcNVZlBA2z7Zl9UhvtnPDq1SxuTlXHaVUWB3jiqnr9LqP0qPq/xOm8uSAjKEMktF8
         /O5LC8NcRMlalNugFYRWDSKUAqoHYbFMV5gWqeB3+c+PT65acjANrnT4Tqw/7NSICm/r
         1UhD++rJC3CaS7i7gcHAHSx5o4jge9pPRaUc7zJ+xJzKK9f2DdYAAaEzQXIE1cwpQxzs
         evpA==
X-Gm-Message-State: AOJu0YyL25Rz6Rwkt63U4kcaLIMg2r+M+k7Y3FSOfWOCt7BcJPunD120
	2tD3iGfDQ0+YJnhxN1UbKxqo2A==
X-Google-Smtp-Source: AGHT+IFr/Hvgb/Q5rpptKwRVNx5Ia+XXFIsScjiUsfOiX96bVOTiwcLamrYFhGW1obFHCL06cwdmVQ==
X-Received: by 2002:a17:906:e8c:b0:9e5:e9ef:a322 with SMTP id p12-20020a1709060e8c00b009e5e9efa322mr9524778ejf.31.1700058525328;
        Wed, 15 Nov 2023 06:28:45 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.119])
        by smtp.gmail.com with ESMTPSA id i11-20020a170906264b00b0099bd5d28dc4sm7186394ejc.195.2023.11.15.06.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 06:28:44 -0800 (PST)
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
Subject: [PATCH v2 6/9] irqchip/renesas-rzg2l: Implement restriction when writing ISCR register
Date: Wed, 15 Nov 2023 16:27:46 +0200
Message-Id: <20231115142749.853106-7-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231115142749.853106-1-claudiu.beznea.uj@bp.renesas.com>
References: <20231115142749.853106-1-claudiu.beznea.uj@bp.renesas.com>
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

Changes in v2:
- adapted according to review comments
- improved commit description
- used uppercase letter after ":" in patch title

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

