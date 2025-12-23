Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D9F354AE2
	for <linux-clk@vger.kernel.org>; Tue, 23 Dec 2025 20:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766521271; cv=none; b=cLtURluUJk+ufNjWFCeHpp8yTgwSn9pgWjcMeUZ0zXFn1IEtkapDsdc6TCbSzi0OQo8xy/AXQlvl7fF02SygWFzKpduvjK+3P2mOoccMwxsb89KBszLqWilFNP9lia7bqsnawQ+Gm1HuuttsxSmXR0kaa9ePtF9H2wHJcZZQLRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766521271; c=relaxed/simple;
	bh=7jtkvldmPSo6tJBxZSibRZu5hmUTyLaiO8iQq/Sa4wg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FhwAc8CM/+/rARVJnnUNXYaAQjDDDmYBGGFNseIxpRcGAX+pPwh+ERRC/T9YiLb3j9cCwHlaRW88kMRXGRsIBTcfWwI/kaN1KUScJ2PfdJWHkdsvZHIem6AS2XD4WIt5mLGeKuwd7j5D/5jl1e8OeMWE8atg46gdkqUB46BLHLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=ojfFSlET; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="ojfFSlET"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2a07f8dd9cdso57888405ad.1
        for <linux-clk@vger.kernel.org>; Tue, 23 Dec 2025 12:21:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1766521269; x=1767126069; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZY5t/vT8/2JoNFBpsoZEjWJnrTyKVma3HFBR0NVkIKs=;
        b=ojfFSlET0cv79OaTDF1oKOqUXItgurMOgYcFv8b26PVp6292pJdfQ79anRb5B1+0uZ
         crU6noIRI5hrwH6+UBj3tgm9TBiCgBtq1MFeUM+P/kFaGiC3sxHi5NwmveHrG+90Fq5o
         +fRaB9u1u9Ldhg65JUonooSLko3zOgChDlBBUota2eUoVVNbVpEE9ZJhAK4YnlT13kuZ
         E8AIksIE7PjEyyrs7wStSwLN6vio4NMCgjATLzIr7LsdS7PcEQ/s8WsI174oVmnIoh9i
         daQbQa+9rLjpjcUf7Tgx8EBLVVp9f44DfK0v7fmYSVhOHs9bQMd6l9J1qZdOOXgjmz0K
         NS9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766521269; x=1767126069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZY5t/vT8/2JoNFBpsoZEjWJnrTyKVma3HFBR0NVkIKs=;
        b=bGsq9RBXBi85fu17ACdGoOC2PiCJhBM/9VoaEj7aS+X/IjyAiLJr77bn1DUenbcsX3
         ZK8pzHdf07zrh5mZj1YQqbrOSFx7xFHdUB32HkA4vEs2qoE3cVmDrn2Peo/tjYlNXAh1
         +hwv6aYy8/s2CL4NNUJMQofzEGo1PJJPDFI8QDqEbW7wfsjmqqO5GnLJUBGGhADYjFgv
         z0UMtiSRxZN2Z235vVlCAvZe4bWbJaflksQ+CyBqmLgXggy4szCBsc+pwYliWQCfvwfQ
         b05rXoafCRBUQY51uD5C+Ob+fLS+e8e9BdH91kVngaVHsX+SXoiQ111PNViCkl5Mge/F
         vz/g==
X-Forwarded-Encrypted: i=1; AJvYcCXOTTvenspDIW33IFCRw+7dHDJZ+eEpl1yXxyVx/Gu98xM/1dYRaP8I7ZpCdCF2x6CAtvFP1MX2YRY=@vger.kernel.org
X-Gm-Message-State: AOJu0YztrducFbJ4MamFPvx83kREU31WWPQI8pWI+PFxmZsY6LGZOhmx
	Q/LxgOlrOQp09cr9vrdwpkeBv0frYF+nG6f7ckBTyLePm83BJfvCA2ATkS/zPXRlg+I=
X-Gm-Gg: AY/fxX5giizXdYGXRQHKfto/r0nhp2n6ugtgxi9tdPnPmNUOrp/3xlLKd7sO0bM69mW
	fbROxooW/KOSsnnvIZ6BhqVK/DA8w4VJBXo8kIIOKGV50T9Whhh5XOB3crdne3KFSEHhlZUQCt2
	k9EjgE8DkZhA+64cvCXBOG6j9rV1YA8d0DEvv+opqVLlJL8P3P/0XTu+ERZ+TDRxDVkyKkmjc/V
	qSnmJas/NT3eZBHDxjG4f5UJaky0poqEIeJEBXuu6tLUb5gP+rvYYJAMoYA95BnUW4OBl8fR6lq
	vkoq+TxVRgMRimJwa5jm4EzcIUO8/eL6YW9D0d8C50uKixJ8JXRWTxP1Y/pgw3bKkPChiNaeUmU
	lo56ANQIpOSUMQVybUqKXYg2DzdKBWc60YDuylfn9n8hcx/wfJ6ABz/mSyfkbdgH3WCsZFr+T6x
	XlcIP1jH0tWTCBW4OMS/NBxn/NM0O1yD0FCYbpJTNcvvKXPRDBrPf48bJTWYdt2EOxK0B7d17sV
	/O9iKNpgFgGmcoawlc=
X-Google-Smtp-Source: AGHT+IG1vVzPBAn5k790jfykavL0vRFl8+h9Eo75I4DE3aZwMJ8QtXRL/RgKMb5SBrHdzfjqO29A2w==
X-Received: by 2002:a17:902:ccc4:b0:2a2:f0cb:dfa2 with SMTP id d9443c01a7336-2a2f222a763mr171273565ad.13.1766521268730;
        Tue, 23 Dec 2025 12:21:08 -0800 (PST)
Received: from fedora (dh207-15-53.xnet.hr. [88.207.15.53])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-c1e7cbfa619sm12567549a12.36.2025.12.23.12.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 12:21:08 -0800 (PST)
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
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v3 10/15] dt-bindings: dma: atmel: add microchip,lan9691-dma
Date: Tue, 23 Dec 2025 21:16:21 +0100
Message-ID: <20251223201921.1332786-11-robert.marko@sartura.hr>
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

Document Microchip LAN969x DMA compatible which is compatible to SAMA7G5.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v3:
* Merged with microchip,sama7d65-dma since that also falls back to
microchip,sama7g5-dma

 Documentation/devicetree/bindings/dma/atmel,sama5d4-dma.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/dma/atmel,sama5d4-dma.yaml b/Documentation/devicetree/bindings/dma/atmel,sama5d4-dma.yaml
index 73fc13b902b3..197efb19b07a 100644
--- a/Documentation/devicetree/bindings/dma/atmel,sama5d4-dma.yaml
+++ b/Documentation/devicetree/bindings/dma/atmel,sama5d4-dma.yaml
@@ -33,7 +33,9 @@ properties:
               - microchip,sam9x7-dma
           - const: atmel,sama5d4-dma
       - items:
-          - const: microchip,sama7d65-dma
+          - enum:
+              - microchip,lan9691-dma
+              - microchip,sama7d65-dma
           - const: microchip,sama7g5-dma
 
   "#dma-cells":
-- 
2.52.0

