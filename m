Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E01A2D61C
	for <linux-clk@vger.kernel.org>; Wed, 15 Nov 2023 14:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Q3v2Mhpq"
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44020125
	for <linux-clk@vger.kernel.org>; Wed, 15 Nov 2023 06:28:39 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-9e4675c7a5fso969966766b.0
        for <linux-clk@vger.kernel.org>; Wed, 15 Nov 2023 06:28:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1700058518; x=1700663318; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0dTX6msw9z6skyilnKqLPZuHp7mBZQKZUfa82STaeHA=;
        b=Q3v2MhpqiYklfdxY+wabX+gqiTz4xSps9TpPLY5/HAZaKTr8eA7TCWvZdRp9iuOU/5
         fd+6F7Z3gs71/s4dZRdu2yzZ7naEGcKHMbTblqBP6iR/6uzCj3TbwLx2pecFqCG3E52i
         2WB05ew+hAK4xnA1r4AzSsEQNpdLET90JtpYXz5+UiyXkJG5LFRy0H9Bn11hNXc/2R/I
         eWSR326a9r243a+RPPoLh/TK6dGgVfuDD9nAGpRJzXD6oXmZ0469/A4dX7ey1m4w+S0G
         8/KCptAoNJDZFpMpwoJaDouYUejMTuAYtV81la89TiY1yMK81ab4jVhKL6eVmZj8rQtq
         wXIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700058518; x=1700663318;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0dTX6msw9z6skyilnKqLPZuHp7mBZQKZUfa82STaeHA=;
        b=ZLNOTkOPs60KPblnHjW7tqy9QvaAPdbxALDNMN9/wtAFw/LOavECyCISYdptHpwFYr
         K5C540qq1mgI9Ti3VezPzJ0O90gD8yF7SlseNl8ptvtSJ0fI+TJMiISkHVkq0YuOQh6U
         F5b9K115vXvLIRen5a+Zx0DK0urychXUMvdnoYQ0P98TigKUyVsK2i0h8m7jkPeV3ji9
         By5TVKW2FKLrQVppE/+zodSVi5cvIoiTKU46OR3hy/H92XrnzXmqETd01CN76ji0kYYE
         YNjUQijm6pQ6sJbw2DMGIcLdfoVWE1RXZCEoR1V/tPziCHYrLH6LqxbdOarhtqfuszjJ
         TJDQ==
X-Gm-Message-State: AOJu0Yyeo64lNyhsTJp2P7DZl7MG+lWdfCIR/yMToN1HPv2qAJZkbG+w
	13PGqnMqSzhXOpajZpwinQBKXg==
X-Google-Smtp-Source: AGHT+IF8sEsLU/SFq5g4LrZoT/tLOUEvnKEWckZJZrHKmsPxT0xhvzQ0DuCUO8+eKKsBUTngfX/FlQ==
X-Received: by 2002:a17:906:f293:b0:9e2:af56:c380 with SMTP id gu19-20020a170906f29300b009e2af56c380mr10048889ejb.6.1700058517819;
        Wed, 15 Nov 2023 06:28:37 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.119])
        by smtp.gmail.com with ESMTPSA id i11-20020a170906264b00b0099bd5d28dc4sm7186394ejc.195.2023.11.15.06.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 06:28:37 -0800 (PST)
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
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 1/9] dt-bindings: interrupt-controller: renesas,rzg2l-irqc: Document RZ/G3S
Date: Wed, 15 Nov 2023 16:27:41 +0200
Message-Id: <20231115142749.853106-2-claudiu.beznea.uj@bp.renesas.com>
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

Document RZ/G3S (R9108G045) interrupt controller. This has few extra
functionalities compared with RZ/G2UL but the already existing driver
could still be used.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- collected tag

 .../bindings/interrupt-controller/renesas,rzg2l-irqc.yaml    | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.yaml b/Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.yaml
index 2ef3081eaaf3..d3b5aec0a3f7 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.yaml
@@ -26,6 +26,7 @@ properties:
           - renesas,r9a07g043u-irqc   # RZ/G2UL
           - renesas,r9a07g044-irqc    # RZ/G2{L,LC}
           - renesas,r9a07g054-irqc    # RZ/V2L
+          - renesas,r9a08g045-irqc    # RZ/G3S
       - const: renesas,rzg2l-irqc
 
   '#interrupt-cells':
@@ -167,7 +168,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: renesas,r9a07g043u-irqc
+            enum:
+              - renesas,r9a07g043u-irqc
+              - renesas,r9a08g045-irqc
     then:
       properties:
         interrupts:
-- 
2.39.2

