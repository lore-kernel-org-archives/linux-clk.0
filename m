Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E453321AA
	for <linux-clk@vger.kernel.org>; Mon, 15 Dec 2025 16:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765816750; cv=none; b=NO3Lxkx0iwl3wOT8AGrVxNRhqhPiwnvVmFVUzpC4QptCJ2Og5f1VJYIp/cWrMQlZd5RPaa52cfqXZwhNQNIl3IOE7JHbgmF0Tm6qPLsbOvNTJxEiuqfpMIH9tQsMzt//x078yxzjYC6A77cTZkLdMu0ntlNFqwfVMkWR+5bKtJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765816750; c=relaxed/simple;
	bh=aWtpS5ukM6OTjJwDQlBjaGNr3tNfLPWIVyHdFTQw0ms=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UIlCzEATXoGiwXvZy5rdzTYsKuiEQMLQczo5V22/pYqCVfGpQ1yDRy6SKonXN8I3HTPjezKDMSp+iOJwM8f0o9gkpGJ4H4dd9Ktn4cXGV51qxj4i0NT/0F80vSr2Cwt5HHdQaJWgQ1yNP/PNZIrWVTzsfgBaCHQ//n4klMHRBoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=HO5Ey94d; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="HO5Ey94d"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-477619f8ae5so28540585e9.3
        for <linux-clk@vger.kernel.org>; Mon, 15 Dec 2025 08:39:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1765816738; x=1766421538; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NzTS/0ZyMqSoKPg7ITuPysU9ip6EyV6+iAiPmDW2/tU=;
        b=HO5Ey94dpj6zWOoz0L5L0y8X69hFWvbeT04BkwlyT15jYCnbM2FPY47xRyxUSuPqq0
         CJYW5lrSNVziP6MP42xtzYz38MBnBl+eQurdkmVKST3mU2BBuppssWyfRd1DJcAkyG5o
         nLiKHlcX3Ds2BaedHt4ULkda+iLUJ7HgaENTayK0zbAufiulvaxMUHf/zJoJY50jgaPy
         vf3yqbvNxTUMYaeue/9jMOH6gOiWO9r5tXQDeePfB6H6ovEP277cbCOC+Se54QTf2bvp
         Q52StpqomWhNzdtWO6Nw007VnuvwxvRYkKBjjmLU5SY5IHblpNiPFHBan2jxZDCBPbZF
         zUFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765816738; x=1766421538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NzTS/0ZyMqSoKPg7ITuPysU9ip6EyV6+iAiPmDW2/tU=;
        b=DCG8iFOoptwQ/LYGdQ6O+KHWhp0RruAzyvU1iBY1fpxjNHIAtqe3llkkWojAktvk0g
         8uDJcxauGZCz6fWjla2+xEXKA0Gn20V76zk2cXt+Z6X+BcVWp3JR/+p/chxl14aa9Ku3
         /EoYqk0/q5USl8719jf3bREfJW7JkoUT4XQJYrpJ1gxbCAnXra+iGjJqmA/DEc/bXtZ/
         VxfiMzQWTxbb55CKvHSMPOl5V6qDgAWaoU9S75GGaCCGYQ2tV2q2oVE9eKeQtutuY/+d
         Nc6luh8KigNAcmRrSVJxBNwoS9uP6dmvbguqHHtj/nOcv1uIyC4t8g0+uN1PLTc3D7Ki
         0hnw==
X-Forwarded-Encrypted: i=1; AJvYcCVBHW1Qw4ciAD2IzfiLANmGptOU62FlNdfb6DF41SVysm794fsrclasQPA0p/f6I4mD+DiUCR9IfLA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGjHQ7puhkgwaC/ufIZVytr47ItljKUEwwjxLkA7e5cd2FiJIc
	GC1cW07OcbrX74YTGMGE7PQcC/dN0AXFGuWB4ylMfcY3cLq2ewXeZpKzHP8YUNZ8Rzw=
X-Gm-Gg: AY/fxX5QlvDHc1iB+/jFkUqFXnmh8iUA4PZu3AoiJGPTLuiMV1V+jUv7N6ouo2rTfhZ
	+QNw3yQYtcSOT58dNiYyabDDYoku0UIcVClTX/zrd4zTx0LyKqHMUGCCuPoc3f9l5N1hlp+ffFO
	fnUoAMayS1p9bAzRM+3EgDNRcIGjikqWYSWIHlyTiczm4A5m0iQ1FfPJu4TwepARtDpdvPL/rAS
	7S8JBOwqDBpFCdbGF3zuv5vTNhinLujYg39633nd1wsg0+XTWLiXomdHfMXaPxJ/GWLv07PP/Yz
	VgRgntsbL7TT+DySw1HaUQ8paWTX6DDlRDCKwftKCiF2grd3fWDOM46m7efHQGMNlL+WNS/EKOj
	oYIJOwVOPmv6oQFItO5Wnfxe7Fi99OJECc8lKrR6dDv0jeDfqQnb2Gxk37FT2G8c/2cgpEUGi//
	ICopVBMfRDYvTt/0JTxasBY11y897avmjB0m0rOUuPvErptJLv4FP8F8Y=
X-Google-Smtp-Source: AGHT+IH2I2yw55Q0CXhaNIPIXzNi6FBLabOFndmnwZCutK6Ow3Ht3tHRyLRJOxKZGFug1XR5+KxRHw==
X-Received: by 2002:a05:600c:3b8d:b0:477:55ce:f3c3 with SMTP id 5b1f17b1804b1-47a8f89c8a3mr129879935e9.5.1765816737723;
        Mon, 15 Dec 2025 08:38:57 -0800 (PST)
Received: from fedora (cpezg-94-253-146-254-cbl.xnet.hr. [94.253.146.254])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-47a8f74b44csm192209725e9.3.2025.12.15.08.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 08:38:57 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	Steen.Hegelund@microchip.com,
	daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	vkoul@kernel.org,
	linux@roeck-us.net,
	andi.shyti@kernel.org,
	lee@kernel.org,
	andrew+netdev@lunn.ch,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	linusw@kernel.org,
	olivia@selenic.com,
	radu_nicolae.pirea@upb.ro,
	richard.genoud@bootlin.com,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	richardcochran@gmail.com,
	wsa+renesas@sang-engineering.com,
	romain.sioen@microchip.com,
	Ryan.Wanner@microchip.com,
	lars.povlsen@microchip.com,
	tudor.ambarus@linaro.org,
	charan.pedumuru@microchip.com,
	kavyasree.kotagiri@microchip.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-clk@vger.kernel.org,
	mwalle@kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v2 13/19] dt-bindings: dma: atmel: add microchip,lan9691-dma
Date: Mon, 15 Dec 2025 17:35:30 +0100
Message-ID: <20251215163820.1584926-13-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251215163820.1584926-1-robert.marko@sartura.hr>
References: <20251215163820.1584926-1-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document Microchip LAN969x DMA compatible which is compatible to SAMA7G5.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 Documentation/devicetree/bindings/dma/atmel,sama5d4-dma.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/dma/atmel,sama5d4-dma.yaml b/Documentation/devicetree/bindings/dma/atmel,sama5d4-dma.yaml
index 73fc13b902b3..b0802265cb55 100644
--- a/Documentation/devicetree/bindings/dma/atmel,sama5d4-dma.yaml
+++ b/Documentation/devicetree/bindings/dma/atmel,sama5d4-dma.yaml
@@ -32,6 +32,10 @@ properties:
               - microchip,sam9x60-dma
               - microchip,sam9x7-dma
           - const: atmel,sama5d4-dma
+      - items:
+          - enum:
+              - microchip,lan9691-dma
+          - const: microchip,sama7g5-dma
       - items:
           - const: microchip,sama7d65-dma
           - const: microchip,sama7g5-dma
-- 
2.52.0

