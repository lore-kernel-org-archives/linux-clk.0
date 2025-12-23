Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5097A1B394F
	for <linux-clk@vger.kernel.org>; Tue, 23 Dec 2025 20:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766521289; cv=none; b=n8wy71+ZD7gYs8IvIMs2INOtmTmE5Yib7aNA/EG+FGtRxGwH19kaeGFm+2pVW25JAsKdzr/lj0lSHetOQCk/3/eWnaFpic4CKEJZvHGNTjMV9d20XwJDaoOKyIn6Ilmwm15lFNkF5C1sr+Z0ZjQEC2FFtLhhfqj1ymIvo9IOkeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766521289; c=relaxed/simple;
	bh=Q1obzpbb74AZt0ukfBT7/Xcte4bERP/uv0lOi/h0us8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FiE8rvRWLOtQ5EzI1YT/0gLYvBfUeYWeDVQBaIgI4sXSZpjIZT6PvsJ7RAzYH3qZUsoKkpo42sOIIpiEQBEnGnfeItOjLR2BX3LxpjTzQvrdALTt2Wxm1e8XxWeOKkI4peNDl+8dhXyVONNUyWHSX47eHnYroEtkqVr9Q7UmQdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=0Y3yYrOV; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="0Y3yYrOV"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7d26a7e5639so6112897b3a.1
        for <linux-clk@vger.kernel.org>; Tue, 23 Dec 2025 12:21:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1766521287; x=1767126087; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fD3TOo20gfVbUTTrRVEjhVDMuAvx6I5y/UndE2JGgIM=;
        b=0Y3yYrOV4lOBXXN9Vmi8FcZpfpma8fAHsEwrv/KZpJ4bDFQ9Hj8/OZbbBrwygeSQtv
         +R2pAmoXwMrkJApDTq/1bonknLTGuiXbdMfbSwGx7Y3WZpmGPxp+8dyb4RU3/ploq3/9
         oX9ivgfs9uwJ6KyqkztJEeUP3ib6RX4W39VVt9XOWmFpJsc6Z+P08JsRBj7XkjkXsRgK
         6FEhbtMq03/B34/IIat6rJisXX3nDg7jxYHATU9+AJZG2BIF2yTPNhc8uDPUbZCRlsjO
         xBSQkgj2L9yEL869n+2EK47BkON9Lqp5pKY8anvn5zPp54N1j8yeau4NcczNStCM8UZB
         0rRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766521287; x=1767126087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fD3TOo20gfVbUTTrRVEjhVDMuAvx6I5y/UndE2JGgIM=;
        b=M5b6xSUz3uzGcuFRl+7Z+OkHmd7+KEjknHMPSmy0TrOAiNsGQs25Y8cV9od0+b1nK/
         WP4UsZSkDwIfRgFzg9ZVZ4FoT4qvvUloG2TTfKyFKEmECCnuLnBwEGv5PdQau/phXtwQ
         wxoRjMTBAfoPPOsfeRKMsfCHkKRzY9NscEOFamcxvdrxzWxzbBNkVyoz0aj0iSNl4LHR
         aJ+QV0h59LlIXVUy2UbQTd4GcET5R+cpggBxdddd9MZYuXRBdLbR8kvqBUg0nFV8BGXK
         rvmlw+wUkR2E9jEyz3BUUlUy47oAU9wvBfJJUg+ajcbOdZ2QjbBLuO9y4Q1OyGD5Jj0V
         URMA==
X-Forwarded-Encrypted: i=1; AJvYcCUU9hKK8siz7OxkxX/CDQFIins8xaoo/+AZj+BPT4H423g6FffY6B3ygEgJhuUCUlT6uZZ6MZtJa3s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yycl+X6qT3g34en8Fn+SAlbcufEjedaqhDi9TbcTi1H4IWQGA2s
	C8fbjve4WTNUKDwag8O6BfjE3BR5dKUziB7Y12EXGYDQ/SVaPJxLBvGDe3q2QnsaKE0=
X-Gm-Gg: AY/fxX7lminafQhLmqBUu1ZgCONRVucBMxhYilvLpWxmp+m1L6jF8iiL8gFQo4eH3No
	/s1zC8PxXeBgKoqz0eiiM5OYn9i0TRqEFkQMljJXZkA6g21a2QJ/zwVHl7RE6MDTCuFlmS5ooan
	eoNJYF0noeclWjQLUhBtgwNyZo+k6jbNgLICs0ryTF2hWeC8PxGaGnTRGvTvpf8a8iKWpM+d0rG
	3ZlafSmURn5K04XZhltS2tmH7xf3Qx0ilE91xjF8tnqVRQiA6KB7sFx15PB4rQUHlAeVYHbsN7f
	ySVCozwX30wdv5+CN/ZOe/YH6U29Qse0reht3SIzqKZ3CuwQ8oKPt+NpoDgfuuGntQCHR7Qpldp
	/dT+kPlm+Oi1ffhE43tf3OEesDQC8oXW4m2fT08zhf0Q7JbseUMoVO3TZLfBG0bVGpt7N2CCAzi
	i73yhTjvGEWIZ1aTknK3biW9cH1TmWh777OnjaGoVHUO/MfSf2EYpg6CnsZNLzbxS87nIbJyjxl
	99arANcyPwXimwvEsE=
X-Google-Smtp-Source: AGHT+IGKTAqrl4PGe4SFW7qu0192lJdQVYEzpdtaZXHZbcUYB4ioIiqnmVp7I/qce4lXwOMNJA61Eg==
X-Received: by 2002:a05:6a20:e293:b0:341:d5f3:f1ac with SMTP id adf61e73a8af0-376a9de5b1fmr15092285637.41.1766521286558;
        Tue, 23 Dec 2025 12:21:26 -0800 (PST)
Received: from fedora (dh207-15-53.xnet.hr. [88.207.15.53])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-c1e7cbfa619sm12567549a12.36.2025.12.23.12.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 12:21:26 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	vkoul@kernel.org,
	andi.shyti@kernel.org,
	lee@kernel.org,
	andrew+netdev@lunn.ch,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	linusw@kernel.org,
	Steen.Hegelund@microchip.com,
	daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com,
	olivia@selenic.com,
	radu_nicolae.pirea@upb.ro,
	richard.genoud@bootlin.com,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	broonie@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	lars.povlsen@microchip.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-clk@vger.kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 12/15] dt-bindings: pinctrl: pinctrl-microchip-sgpio: add LAN969x
Date: Tue, 23 Dec 2025 21:16:23 +0100
Message-ID: <20251223201921.1332786-13-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251223201921.1332786-1-robert.marko@sartura.hr>
References: <20251223201921.1332786-1-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document LAN969x compatibles for SGPIO.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes in v3:
* Pick Acked-by from Conor

 .../pinctrl/microchip,sparx5-sgpio.yaml       | 20 ++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml b/Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml
index fa47732d7cef..9fbbafcdc063 100644
--- a/Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml
@@ -21,10 +21,15 @@ properties:
     pattern: '^gpio@[0-9a-f]+$'
 
   compatible:
-    enum:
-      - microchip,sparx5-sgpio
-      - mscc,ocelot-sgpio
-      - mscc,luton-sgpio
+    oneOf:
+      - enum:
+          - microchip,sparx5-sgpio
+          - mscc,ocelot-sgpio
+          - mscc,luton-sgpio
+      - items:
+          - enum:
+              - microchip,lan9691-sgpio
+          - const: microchip,sparx5-sgpio
 
   '#address-cells':
     const: 1
@@ -80,7 +85,12 @@ patternProperties:
     type: object
     properties:
       compatible:
-        const: microchip,sparx5-sgpio-bank
+        oneOf:
+          - items:
+              - enum:
+                  - microchip,lan9691-sgpio-bank
+              - const: microchip,sparx5-sgpio-bank
+          - const: microchip,sparx5-sgpio-bank
 
       reg:
         description: |
-- 
2.52.0

