Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C911FE458
	for <linux-clk@vger.kernel.org>; Fri,  6 Dec 2024 11:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733483659; cv=none; b=dPR5ohUAkmmNDsPQ0kkZonyjdGi6TL1gxXpyMPm+f5AafldAWdjz/nN796V7EbzNefUKcKNqu4cb70d6dPemqMAmNI2ctXiFUh3o2CcCeRtBwaadO1kKh8vCH0gJBPehIs+CfxQgvuWz2rBzGyYaGojgnwhV0gZiVGlDIZuvKeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733483659; c=relaxed/simple;
	bh=yHXEczmr3zgBN9Y5LQq53zyVDIkVuwqZazKuyqw+yEw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ait6YAQpAnovi40iuQgU1mOUMrUD3WS0MM7D2f2v7v9Bvw1Z5+Jc6rR5qXLJwcwFhW+EbHAkVv1x+WrTx57WObS6XB41dYA4P7Zg9hSKXQf7YTxlZ7PeXJz7RB7PIhqh3+pxF0fPDfRqpKCVVCCuppEDpa25emHGDGPokwqBMdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=RxSNxfTk; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="RxSNxfTk"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a9ec267b879so371028166b.2
        for <linux-clk@vger.kernel.org>; Fri, 06 Dec 2024 03:14:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733483655; x=1734088455; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ztquiO5zqo8/ypj6kpM7FV/n638PGdmNV83SwxwWZys=;
        b=RxSNxfTkdhKEMGKm1wiBlmyaeKNCwrVugZWsDZ8efNvBqvnpEiTOVOQY0zoKqVUspG
         pgEmNRfFfZQx20TO5Sk4w6ECbuKTUtLzWP+hwITACcHbvH8rPj6DpQ3UnYXdI+o5b7i3
         DHS5Ad/SxxExKECRJoq2hyGX+HOw3FXbJNiYGTSH+y/8Yua2nNcxVu0I/u4nVLkQiF2K
         y9pNfhZvB5avNXkVneN5RWM4ypD3aIRDIJm1nX2KHYal5GCjWTn5rCboa5HquZ3sZkRC
         ORekgKAQd6oSVSzarRQpCLs74579Pylv1tLDYrYG8aNbi9o4S2NIK4MKQnD2DN9GxYfv
         cS4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733483655; x=1734088455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ztquiO5zqo8/ypj6kpM7FV/n638PGdmNV83SwxwWZys=;
        b=hwqjw19SdA6+nU6j3T4gHBu29LJKE8E/qvXDvcpJd1wbfEemLnTxgc/QOn6Yc8EZ3D
         9pWXChZ5emlPtLkZCy6Iu5YeGDjbMToHzTx1DFxC/We45uf70x6uathcnr9FjiHINW5V
         zsG5zIFouv8eGmWdSglOsS9ykYK1geAPmaqwt7lptg6bisiYRnOJosRZRlFAIIowUZFx
         8toDBJrjGwvCZN+yg/mZEwezObwCBRwOtufEaD7+tmuq1p6U6FUvleMOn+Gp/ggdaVhu
         cMUZ16MSKjZqJudgY0rULtv0yAc7DjSQtca4FZXQsfR83WKB5yTrNBZW2kgEouI0i1tM
         9BWw==
X-Forwarded-Encrypted: i=1; AJvYcCWPmc1H8v17x7gCjXSxLu6jxRkQLhF2InLiaj6BuBckkreom9W6k8OfDmi1bYbBZ78tUOR5nNJ2TFM=@vger.kernel.org
X-Gm-Message-State: AOJu0YycilbFSpEfLn2oQMDARhDMo0GKTiaryjteGSOUqfa23k7dlly5
	r1KlqsyYNVhxFHFjvwvib96OugJDnJr0oOJezWRh20fEQdVhUgJiHxEYvDUenaw=
X-Gm-Gg: ASbGncuIpqY5NEPES8UverUtyqkgx6pg68vSNynwrZ8/bF1ggdT/olfsJVXbuYQBlhq
	mMf9aj9FoL7RXtCMDr2AVaU7Bjtv9R4ipYCYIxlRsrkD7utymRVYEhZ+4lzhaeK1oECmccNK5+j
	rdp4z5h+UiGZuqDeKP+qv2TNoqU643S1WIqiyz7cX9pT/nRJqlCalQSyacEUiSMzyDfF3dGFva0
	vu+8QpdkdCjV0iA1KYLCsWEUQMMsRRVFDTjomKdrKCodXeSMO8xDkXFeFQqw2n/b19RpnQgwrw+
	DXukDPHz
X-Google-Smtp-Source: AGHT+IEvXec05NePap0xg2+L8yTjn/PbPq51j1Lf2h7n3v46RbGZ/jBjPtqf7h5Sg7tKTHnIWh1xJA==
X-Received: by 2002:a17:906:30cc:b0:aa6:2018:8741 with SMTP id a640c23a62f3a-aa639fa2ce9mr196485666b.7.1733483655271;
        Fri, 06 Dec 2024 03:14:15 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625eee2a6sm226877866b.90.2024.12.06.03.14.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 03:14:14 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: prabhakar.mahadev-lad.rj@bp.renesas.com,
	jic23@kernel.org,
	lars@metafoo.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-iio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 12/15] dt-bindings: iio: adc: renesas,rzg2l-adc: Document RZ/G3S SoC
Date: Fri,  6 Dec 2024 13:13:34 +0200
Message-Id: <20241206111337.726244-13-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241206111337.726244-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241206111337.726244-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Document the ADC IP available on the RZ/G3S SoC. The ADC IP on the RZ/G3S
differs slightly from the one found on the RZ/G2L. The identified
differences are as follows:
- different number of channels (one being used for temperature conversion);
  consequently, various registers differ; the temperature channel
  support was not available for the RZ/G2L variant; the #io-channel-cells
  property was added to be able to request the temperature channel from
  the thermal driver
- different default sampling periods
- the RZ/G3S variant lacks the ADVIC register.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- collected tags

 .../bindings/iio/adc/renesas,rzg2l-adc.yaml   | 37 +++++++++++++------
 1 file changed, 26 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/adc/renesas,rzg2l-adc.yaml b/Documentation/devicetree/bindings/iio/adc/renesas,rzg2l-adc.yaml
index ba86c7b7d622..40341d541726 100644
--- a/Documentation/devicetree/bindings/iio/adc/renesas,rzg2l-adc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/renesas,rzg2l-adc.yaml
@@ -17,12 +17,15 @@ description: |
 
 properties:
   compatible:
-    items:
-      - enum:
-          - renesas,r9a07g043-adc   # RZ/G2UL and RZ/Five
-          - renesas,r9a07g044-adc   # RZ/G2L
-          - renesas,r9a07g054-adc   # RZ/V2L
-      - const: renesas,rzg2l-adc
+    oneOf:
+      - items:
+          - enum:
+              - renesas,r9a07g043-adc   # RZ/G2UL and RZ/Five
+              - renesas,r9a07g044-adc   # RZ/G2L
+              - renesas,r9a07g054-adc   # RZ/V2L
+          - const: renesas,rzg2l-adc
+      - items:
+          - const: renesas,r9a08g045-adc  # RZ/G3S
 
   reg:
     maxItems: 1
@@ -57,6 +60,9 @@ properties:
   '#size-cells':
     const: 0
 
+  "#io-channel-cells":
+    const: 1
+
 required:
   - compatible
   - reg
@@ -68,7 +74,7 @@ required:
   - reset-names
 
 patternProperties:
-  "^channel@[0-7]$":
+  "^channel@[0-8]$":
     $ref: adc.yaml
     type: object
     description: |
@@ -78,6 +84,8 @@ patternProperties:
       reg:
         description: |
           The channel number.
+        minimum: 0
+        maximum: 8
 
     required:
       - reg
@@ -92,18 +100,25 @@ allOf:
             const: renesas,r9a07g043-adc
     then:
       patternProperties:
-        "^channel@[2-7]$": false
+        "^channel@[2-8]$": false
         "^channel@[0-1]$":
           properties:
             reg:
-              minimum: 0
               maximum: 1
-    else:
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - renesas,r9a07g044-adc
+              - renesas,r9a07g054-adc
+    then:
       patternProperties:
+        "^channel@[8]$": false
         "^channel@[0-7]$":
           properties:
             reg:
-              minimum: 0
               maximum: 7
 
 additionalProperties: false
-- 
2.39.2

