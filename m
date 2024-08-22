Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC281CCB41
	for <linux-clk@vger.kernel.org>; Thu, 22 Aug 2024 15:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724340503; cv=none; b=aiouyvjyKG3ouDMy2h2IbrgSSiHVQ9DvCqLzO3IbAY5x10StZzBHbCAmcH5xlU625fkxDpErXUptjUG7uD1nQhd3wlFGAN9czwkPFXuC7gesnatQSHINhAhuJlPhhbnTlBRbbETsZ3ucfWUMTT3sXZ01+Qi1g4Ft1RCxPlVxCzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724340503; c=relaxed/simple;
	bh=osweiIUhbbeltULTsJND2atipL+PT7sQYi1BW5J7EeQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XdrxwjhK3RSpDB1oCEAj2N8Cr62S9fwflGcUqNsmaxW241qbk+WbhPkJ8gIknFa3yOO+8Xg/zK4sGteQJ/5RfLzTZJ2Clw6EU0VQkZApVlD6FJLtYCq0XrGDLK1Rwo6hK4f02YEDeZL8Bn/LdgTaw13tCCgtThrVMTsuHDyxBZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=OoZkwW00; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="OoZkwW00"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a869332c2c2so118806566b.0
        for <linux-clk@vger.kernel.org>; Thu, 22 Aug 2024 08:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1724340501; x=1724945301; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T/Tria7vwi+NxmbhPx5iyMMpWnKPFvb0PWDauQE1PU8=;
        b=OoZkwW00uYQJJFBr1P2UTXTaLZ3TI21A/jKMffsItISu1Srv5b+A5ZjzRklpE+JqPm
         d+HDtUyBSbA8mC1HsUug9RmPBP8+1S3xuLKi5MEuIJV+xrGGs3iUWJ9/aGx3zrxxoqFY
         ifRYhXXkU4aTyle3Z+4V7bxtpnCtvrUZLky06FNQnuWhwZuQ7X6LnFRL5OpurhjEDj1F
         LusoodoXmAnlOkSXs0GLs/jFINeB+dvaEu4uOERnoZO/J6xd0ANWwDcWrcr1dDBtug99
         nxjOY44PiQTWguBF5qaK8Yj+VGubtDZntz2JAchxVyQgm2IGQvDUzN5mBwwY14rI5UF8
         xHNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724340501; x=1724945301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T/Tria7vwi+NxmbhPx5iyMMpWnKPFvb0PWDauQE1PU8=;
        b=dHBYrELeutOTj9kNBCsq6fmNTg4YfPphoTnsEWNzYXOyrURllzQe3nZHNG1s6uXVjT
         kUKKs/EXQCFaHAJyE5EboPF4SQQgH32myDk55q4pvi5fohkPuIffUke0XWLZHwnCJTLw
         vjT8b7MmyvHhd5/m800TofOLCE0AWoz8TfT7fInO1tZK/JMEGU44JgFl/Mi6lCvrY2Lp
         VUbZGVbmdld2r9pOMlCwy1vwV4btzjBFZ4VyxRLhq38LqXTi86OfEM2m2F0JN80PWL8v
         wTb9lXw8g1rySGDPLKhbo8GfPplwVEACkq064EDm92TsCiVM2NIdtDogQoJks3kb+qg3
         F1pQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWM5Mx1/is5KcrqlzLpzRGRTcRKozCmjnbivaksgBju3GiaqtIczj3plKLyJR+9ipbC2KTBX4Tt2Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2FiJHxeLIT/5fygBFJEQmTiS7sK/xnN/jJ6Y6byNJlgYOdgs7
	vhk7j3M/Yw0atxd8b7BCLC1aDIXq4YuCGo73AbUcDa5sRyz/ovQK6Fhm4qYr+ys=
X-Google-Smtp-Source: AGHT+IEDGiFS9rTl2gT4mpF+7WDWt9rKV3W2mQ9PNVf1k+OndljloE3v+2XJ/Wih9mrH3Tadrpyqjw==
X-Received: by 2002:a17:907:9307:b0:a7a:a4cf:4f93 with SMTP id a640c23a62f3a-a868a97d6f2mr322799366b.32.1724340499945;
        Thu, 22 Aug 2024 08:28:19 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f484dc5sm134189166b.171.2024.08.22.08.28.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 08:28:19 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: vkoul@kernel.org,
	kishon@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	gregkh@linuxfoundation.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	yoshihiro.shimoda.uh@renesas.com,
	biju.das.jz@bp.renesas.com,
	ulf.hansson@linaro.org
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 02/16] dt-bindings: soc: renesas: renesas,rzg2l-sysc: Add #reset-cells for RZ/G3S
Date: Thu, 22 Aug 2024 18:27:47 +0300
Message-Id: <20240822152801.602318-3-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240822152801.602318-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240822152801.602318-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The RZ/G3S System controller has registers to control signals that need
to be de-asserted/asserted before/after different SoC areas are power
on/off. This signals are implemented as reset signals. For this document
the #reset-cells property.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 .../bindings/soc/renesas/renesas,rzg2l-sysc.yaml | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas,rzg2l-sysc.yaml b/Documentation/devicetree/bindings/soc/renesas/renesas,rzg2l-sysc.yaml
index 4386b2c3fa4d..6b0bb34485d9 100644
--- a/Documentation/devicetree/bindings/soc/renesas/renesas,rzg2l-sysc.yaml
+++ b/Documentation/devicetree/bindings/soc/renesas/renesas,rzg2l-sysc.yaml
@@ -42,12 +42,28 @@ properties:
       - const: cm33stbyr_int
       - const: ca55_deny
 
+  "#reset-cells":
+    const: 1
+
 required:
   - compatible
   - reg
 
 additionalProperties: false
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a08g045-sysc
+    then:
+      required:
+        - "#reset-cells"
+    else:
+      properties:
+        "#reset-cells": false
+
 examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
-- 
2.39.2

