Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A486C00A8F
	for <linux-clk@archiver.kernel.org>; Mon, 23 Oct 2023 10:23:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229870AbjJWKXB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 23 Oct 2023 06:23:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229935AbjJWKW7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 23 Oct 2023 06:22:59 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F1BFD73
        for <linux-clk@vger.kernel.org>; Mon, 23 Oct 2023 03:22:57 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4083f61312eso25491725e9.3
        for <linux-clk@vger.kernel.org>; Mon, 23 Oct 2023 03:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1698056576; x=1698661376; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SN/3LO5tvVwfDdWFrwqMG2p+XEYGEFttmBsUPHkc9hE=;
        b=Q8eyWNMVYCFPXdQCKD+uFAz3sNMSJ/bCz/vX3s/eoIsQoPwC16JVibDJtkaXC1GHhW
         3/NzzkFJ8fhj+P6BmeMlvs2eHUvGQlpNTHBwcQ3t5H3Yq7ga78igm/3Kc0MRrIyiVgE2
         b4hwgqR9Yp8/4OOjkf4/C4WjhE3SHTcWJtlH4KBx+Aj5uhmeBTe3oAmCLrgQ7QWPJOKu
         zBANkvXNtdUve7m85YNp6xJZF1zHsUN+S5ABcAnPySUnSvllEmkIu21pDWDQ3g9nLnkC
         2A+bcclW1CZDmBTV4trkJXvq5cp74FsMEAs+MhYU6+icNqWQX9ZdVH1AxZqIUQGv2xGg
         OG5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698056576; x=1698661376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SN/3LO5tvVwfDdWFrwqMG2p+XEYGEFttmBsUPHkc9hE=;
        b=bzwdh0mHDjkI0JDw0zMNAjBLb1tNG0VbNGwWsTiSTR8ooZzQonizUn/hpWydizS9Aj
         mZyx1Qx+oVPZTfBBc4IDgK8vUL6Ee1nZp5SKxOuPuEPDlxwp0SjuYrVXL9DyFGOJSgAV
         P9bNS+1G5zZGvGleAAIA7JCNMHeHgjhaVdsEdXLbSMcVq/ZzKL8KHsADu0MUTP16vZIM
         J6myaULXId2eF7cBjAQeqayZejlvECQ8fuaknsDn6r0h4qQ/D+viYCckUuswxFHM7ogO
         7EkSKSYVPMAzcDhB6KDcMFMUIrqZohp8c/LVPZuVjXaiUangW+liEcb+VHWaqzILaxJ1
         PVeA==
X-Gm-Message-State: AOJu0YxpmwpmpHQUM9khZ6gPdABWRRGMKaNrKyo0jzIvJLzsrKp2+qNw
        4kOoXOWHdHLlEmDXYumA6igYSQ==
X-Google-Smtp-Source: AGHT+IGe6Tqmo8KBv27r4U/I4sG811IvcqDvhd8343Xi3gHNdWdtBLdm9FzmPugPuFUNj4KbgtYP1A==
X-Received: by 2002:a05:600c:9a5:b0:406:599f:f934 with SMTP id w37-20020a05600c09a500b00406599ff934mr7577051wmp.12.1698056575778;
        Mon, 23 Oct 2023 03:22:55 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.185])
        by smtp.gmail.com with ESMTPSA id 1-20020a05600c228100b0040596352951sm13593275wmf.5.2023.10.23.03.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 03:22:55 -0700 (PDT)
From:   Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To:     tglx@linutronix.de, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        geert+renesas@glider.be, magnus.damm@gmail.com,
        mturquette@baylibre.com, sboyd@kernel.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 4/7] irqchip/renesas-rzg2l: implement restriction when writing ISCR register
Date:   Mon, 23 Oct 2023 13:22:20 +0300
Message-Id: <20231023102223.1309614-5-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231023102223.1309614-1-claudiu.beznea.uj@bp.renesas.com>
References: <20231023102223.1309614-1-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

In hardware manual of RZ/G2L (r01uh0914ej0130-rzg2l-rzg2lc.pdf)
is available the following statement with regards to clearing interrupts
though ISCR register:

[Write operation]
When "Falling-edge detection", "Rising-edge detection" or
"Falling/Rising-edge detection" is set in ISCR.:
- In case ISTAT is 1
	0: IRQn interrupt detection status is cleared.
	1: Invalid to write.
- In case ISTAT is 0
	Invalid to write.
When “Low-level detection” is set in IITSR.:
	Invalid to write.

Thus, take into account interrupt type when clearing interrupts though
ISCR register.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/irqchip/irq-renesas-rzg2l.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rzg2l.c b/drivers/irqchip/irq-renesas-rzg2l.c
index 9ce0d6d67486..1ed9cb7178fa 100644
--- a/drivers/irqchip/irq-renesas-rzg2l.c
+++ b/drivers/irqchip/irq-renesas-rzg2l.c
@@ -73,11 +73,17 @@ static void rzg2l_irq_eoi(struct irq_data *d)
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
+	 * ISCR could be cleared only if type is falling-edge, rising-edge or
+	 * falling/rising-edge.
+	 */
+	if ((iscr & bit) && (iitsr & IITSR_IITSEL_MASK(hw_irq)))
+		writel_relaxed(iscr & ~bit, priv->base + ISCR);
 }
 
 static void rzg2l_tint_eoi(struct irq_data *d)
-- 
2.39.2

