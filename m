Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB1E2673B7
	for <linux-clk@vger.kernel.org>; Sun, 14 Sep 2025 12:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757853763; cv=none; b=uoKTYZsWqCGgdi3U9NP0r3Ruv0r+OQrCZClSuKJ1I+TcGpCG7CnE/aukKdnWIgQmAJgCwQ5Kh+8wUcsqXOE/r/nu0LCn7rK4Zv64uW45AJ3m8UJuVLlmEiFGuORsGdoZHYA1EVI/GLy9mhlXwNlQWAipCyuZ9XPuHgSMSjGV+sI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757853763; c=relaxed/simple;
	bh=XF2fZOZPuf6TK3Ja6tqEkOXwBn2O95DGQeB9O8Y0xMA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ak336CmML1d2O78rKTLMSpTc1bcOPuvq9xSk51lf2CMTMZ53AVwgVZtJrL2Wn3JhJE23x/9SqYPoH//bUSITjv3lcBeO6aBDUSKaLVK3cVwdURiuLRXunUdeYmCcnJcUupvAwJBIJvUBtjo70OS46Qm+/6zU60uwom6bDN4F+GE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d37bmD31; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d37bmD31"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45f2a69d876so2967735e9.0
        for <linux-clk@vger.kernel.org>; Sun, 14 Sep 2025 05:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757853759; x=1758458559; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sL3h2k4pBCTkRmow4y5yXo+3wwdOgJcWXSzEovR09vA=;
        b=d37bmD317qyGBZNawxzwXLvWfUHvPkh6QbPiceO8BC021OePWQtyhk7BVDaXmhCl42
         ceGbsDirz142J1h2rWJORSNUNfaiRd8UIekA0ojNEg50nZCVW532D1y3zSX8FS9JDah+
         A28HiWiri+aYFCaIWnrXfhg5gJsxzi2Pk/almAqvbJ6W1WFzYKgYnhmaa41C1s/7xjVc
         YC9vD77otOa7VG7XQrgTxwtUBp7cLDlrzXK0gfTVIPyrdxdsJDfxz1Kb472vYFhtcNao
         S/dMMCZAq+zqOcJl4z9Nh2xVEzhLh3mhCOMsN517H0G3wHzT+HdNhk+Z5HcRER7HhFPv
         CVOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757853759; x=1758458559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sL3h2k4pBCTkRmow4y5yXo+3wwdOgJcWXSzEovR09vA=;
        b=TY2O8JLLBlFg/WxU8FH+iNzDcQ9PBcffQyyBtLqfzVFCUjs36JTCf7349jITIgrS7F
         hrd0sEgHDhgXIWuT9ZXnZUJ1Vc2fuPRQpx2g0XjjkjXYhEnm24xZSp+gU1o9G93fj+Fu
         +/1anf2y0C8OxEMC046rZ9DhhnYOvioZIOyMMKSAYv8VFTg/Hm/dby2rTokCV2rzBEll
         kfzmVycPahYFefkVydI+qli4pgNB02ei+2hOPxviLUqQjdDJzzLv5376/sMbm3N/egcp
         zHv46HoeFH4882EzK1C26sGK1MrUC+IZ2Ycm6rCte+O9bMXhRY9vk1+nC3tz9DT352ME
         0CAA==
X-Forwarded-Encrypted: i=1; AJvYcCUASiukpftFfvtN5PNP7U51fRIq1HD/9pNyTp541plud5dcSxPkyPymHtf95KkZHZstb3sazsQCKYQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYWcglW5X8CB8UQhsaGiOxO4sa5DChzsLHq5piRgq0qk3K2ALF
	QZzPs6Fumd7lQFyVeBGUSd8mN9gETVjWiNRPUwrdIGTeQndqJ+KtsTNf
X-Gm-Gg: ASbGnctDphgfO1ClYjji53llbTLol+rC7ykBVon1R3F74KmR8mm/aZ92FCQwS2qxsgp
	kNd3OLbRSHH/fTotfZzSKbm1UPcQQliwrt4cJIW/ZE6yVU6d9dEl5FzIB40YCGVK6BswSedeZ8l
	fMDTV7jq+6Hx8q1SQMiqRFoQlg9PJd8FoWC5rrSzThgRKoue6/jm2+06DU3LhFZPyKlRUtP4IB6
	/ROERYocaJDWbpjhsU+RdUqx7UGiyJBJcR40/fyvVdgNhuYJf8Vgrum+C6EK/i1YnAYkcneZhsu
	HivU8Ll2qqaE0DQJoH85Rtk6o9P89h1gH4UeNsr8om7uF1ZkopyahDcEwMe9sMPhU0GTAvFtcI5
	jovnrKLVxphsvb/Dg2yNh7J3a6Tj94Ze+ykwj9d0paGz9icH4XQDXBXZO2E82FlVy4BhJ5siOy0
	IjaimEJvf3
X-Google-Smtp-Source: AGHT+IFYosvL3hlqrkRZJH4U1D4gQFiKB/hkk7FIzmqQ6IP5m5X7qRfmT1T4W59kT9wKZJ/WlTy0JQ==
X-Received: by 2002:a05:600c:5798:b0:45d:ddc6:74a9 with SMTP id 5b1f17b1804b1-45f211d5507mr57562525e9.12.1757853759405;
        Sun, 14 Sep 2025 05:42:39 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e9511abbccsm3727773f8f.9.2025.09.14.05.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 05:42:38 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/7] dt-bindings: mfd: samsung,s2mps11: add compatible for s2mps16-pmic
Date: Sun, 14 Sep 2025 15:42:22 +0300
Message-ID: <20250914124227.2619925-3-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250914124227.2619925-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250914124227.2619925-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

S2MPS16 is a PMIC present in Samsung's exynos8890 devices. It houses
voltage regulators (38 LDOs and 11 BUCKs), an RTC and a clocks module.
Add the compatible string "samsung,s2mps16-pmic" to the PMIC.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 .../bindings/mfd/samsung,s2mps11.yaml           | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml b/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml
index 31d544a9c..445596323 100644
--- a/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml
+++ b/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/mfd/samsung,s2mps11.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Samsung S2MPS11/13/14/15 and S2MPU02 Power Management IC
+title: Samsung S2MPS11/13/14/15/16 and S2MPU02 Power Management IC
 
 maintainers:
   - Krzysztof Kozlowski <krzk@kernel.org>
@@ -13,7 +13,7 @@ description: |
   This is a part of device tree bindings for S2M and S5M family of Power
   Management IC (PMIC).
 
-  The Samsung S2MPS11/13/14/15 and S2MPU02 is a family of Power Management IC
+  The Samsung S2MPS11/13/14/15/16 and S2MPU02 is a family of Power Management IC
   which include voltage and current regulators, RTC, clock outputs and other
   sub-blocks.
 
@@ -25,6 +25,7 @@ properties:
       - samsung,s2mps13-pmic
       - samsung,s2mps14-pmic
       - samsung,s2mps15-pmic
+      - samsung,s2mps16-pmic
       - samsung,s2mpu02-pmic
       - samsung,s2mpu05-pmic
 
@@ -141,6 +142,18 @@ allOf:
         samsung,s2mps11-acokb-ground: false
         samsung,s2mps11-wrstbi-ground: false
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,s2mps16-pmic
+    then:
+      properties:
+        regulators:
+          $ref: /schemas/regulator/samsung,s2mps16.yaml
+        samsung,s2mps11-acokb-ground: false
+        samsung,s2mps11-wrstbi-ground: false
+
   - if:
       properties:
         compatible:
-- 
2.43.0

