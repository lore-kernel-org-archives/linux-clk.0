Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E22F34EEF0
	for <linux-clk@vger.kernel.org>; Tue, 23 Dec 2025 20:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766521244; cv=none; b=NLVXEvPD+C87lmEXE8+GAGRcluBuU3L8mjufY7eGhOErceDXT1OJYnAoCT1eDJ8mHxq9GRKJLfQmW51CHskgyr2QAECXyeK5uVkmbsnft/BThuspVXhBoONr8oq/Tk/NwTFUZiR7OQFt06t06crD2BUBZHQV9K6wIto65vE3+ZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766521244; c=relaxed/simple;
	bh=FesjP41xiT0Kda2nCLhQhKtJNrqGgysPl3yJ23vj64A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MjEb9pHkulLe//t/RZiJ+y+v8PDtFaiFHXM5UxcXCdS6OcKuSZLt9GmQDEbh1bkulZE8gz7z/TH0mm34lzSxl807JVSHQtFWWMKOag/uaiMdSA2GOpU5yD2vGoV4dZAFEZgez41DmYl8MueLzx9yg5pqawWRHRxeod4UYss0gy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=ZccbyyzW; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="ZccbyyzW"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7b7828bf7bcso6122962b3a.2
        for <linux-clk@vger.kernel.org>; Tue, 23 Dec 2025 12:20:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1766521241; x=1767126041; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ClyoGQdLbQ+NSakHU5SbIxGsiXAmeIUAvdUGZfMfHas=;
        b=ZccbyyzW2lxJMbJYlm/wBafWsE2XB2bAypOFFnOukvOGI4F8bnHvNijeGAjtavqUGB
         p0NANjErF7ofDVkrLy/JmBZttd7li18QNaynTXMtfLOpiv0nuWEKeVd6DYSHktO1ISNl
         6HyxFIVBPwLfGivhk+/vTFkVzBO162ZkHkA0Jkp141/OWZ4XiUFeOAFelEoZvX1rskGB
         Wmk7CX8M65WvlFHXo4cHRpqzkjaDkKV3yp4+zvmH9jj17QAzZ6OaiuFPVXcNUQshasmH
         a2wdlKOVQBgvLOgq5SEy9w7xvNTCfKQBAhS5xqnESy2htUeDknWhV2G8qFo/rgWWwYNn
         KE1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766521241; x=1767126041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ClyoGQdLbQ+NSakHU5SbIxGsiXAmeIUAvdUGZfMfHas=;
        b=lMsNvRD0w+MKSRA2A4UvwI8pAw8elWBsjw6P7NYiu8ojoY4g61lsq1Cd+4PxZZ5Ikz
         67vqfrCXvYW2ZhUR0FwwvepBSKHWgLpK6TTSFmeVoRyzUea/qaxnIv4bjU36Zs1X7XIc
         LDvfLsMTyx5YSEXBi7IfN9eqkwcn0S3qhhYIRqodvITHXz9L61AfbzYVixuzop5lneFD
         8uffLMRLHpfReA+1K6/sPfu6LOHsWfxHdhIM/YDdxq+489hWLZSlvTIwHp9Iw898cVnF
         9uCh86/VYJxSwBcUBF4mhrWC0v9kONbL0HCUOB/tMMj3QDCNblp8jSJCzu4bdKHKtPFz
         IlvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHR4hlvDVr6Q6j7CROEX6GmZ45l1i/hL7n/KYnTg5AbS00caHDGNhvtDWwrlAV2ZHC4pw+vA2WNX4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGcA88n7z9KhBw4nvUVN0mx+MeoC62LyajGn/3H+goR98iyPNr
	Ph62IwDC2z2Dm76IQucQyii0q0r0QzUNjhNfttD31IdoCYNSgzPqfXU6GyzLQVnRG/o=
X-Gm-Gg: AY/fxX5xQtwVYNUMVeLFkoR/V0w9CYHoEm0CnSnV4ARv/VjvXs1NskiW0aLReBka1rg
	r+Bj5Z/QRwmQFZI+hq6+IHdjk4naiIoGZyXip6HxPj/+4O2L5hvGs/+TmX8yAY650XwKvuOk5R8
	mOkJFsxilc0NGAn/V2pg7tXD5GB6djzbqQq+y39vNrOy5gTfk9C5eeftYuawmtovmNC1BM3AbIc
	+/IiizRUZ0wMei6QdICp9C/k1uDc1GYwESE83sHqqxpAm+9VFtmZiHvfsXL0ZfVW/pTjXUGNLea
	qEO7QE8o84n42tJwUciTblf6jpCkzC2CW+1Y0odKCFziJKeeKM0lutaxHXU12bihZmpe/QEE46G
	jUEiMy5Gl7kUMZoWnanE/8Xhqrkys9t679Y80+VVMw4is/n0b92vhSpdVXit2xPHoUeyn3g17Hl
	DKC6XrlJffCcakLwK7C/2wakgp/upLWXpM/KrciskMIDbX2YrSwSDhnr+0+n/t2q/hlbLhMad+F
	jaDIZAB
X-Google-Smtp-Source: AGHT+IGuoAHYa6yGZT2xpCk4O6bUCM8poDOiYCaAoun2Nvyagb0buXaCaJOvoitd+kEUFeEHxHKv2w==
X-Received: by 2002:a05:6a20:9185:b0:343:af1:9a57 with SMTP id adf61e73a8af0-376aa8e98d6mr14530108637.56.1766521241361;
        Tue, 23 Dec 2025 12:20:41 -0800 (PST)
Received: from fedora (dh207-15-53.xnet.hr. [88.207.15.53])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-c1e7cbfa619sm12567549a12.36.2025.12.23.12.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 12:20:40 -0800 (PST)
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
Subject: [PATCH v3 07/15] dt-bindings: rng: atmel,at91-trng: add microchip,lan9691-trng
Date: Tue, 23 Dec 2025 21:16:18 +0100
Message-ID: <20251223201921.1332786-8-robert.marko@sartura.hr>
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

Document Microchip LAN9696X TRNG compatible.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes in v3:
* Pick Acked-by from Conor

 Documentation/devicetree/bindings/rng/atmel,at91-trng.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/rng/atmel,at91-trng.yaml b/Documentation/devicetree/bindings/rng/atmel,at91-trng.yaml
index f78614100ea8..3628251b8c51 100644
--- a/Documentation/devicetree/bindings/rng/atmel,at91-trng.yaml
+++ b/Documentation/devicetree/bindings/rng/atmel,at91-trng.yaml
@@ -19,6 +19,7 @@ properties:
           - microchip,sam9x60-trng
       - items:
           - enum:
+              - microchip,lan9691-trng
               - microchip,sama7g5-trng
           - const: atmel,at91sam9g45-trng
       - items:
-- 
2.52.0

