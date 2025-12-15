Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C5B335BAA
	for <linux-clk@vger.kernel.org>; Mon, 15 Dec 2025 16:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765816750; cv=none; b=gr4olX9oCu73dwT3B4MLLgorvH4jQME7MC68sH32uAD/EgA46Z+Q2Irz+YQwngvxJ29A9d55PaWYPmNfQXIvziptLg2ZjP/4ACCmLCc2pNKUa87VaZQ8LKgR89Z5lchBXYaAyFTCCiwYgUdOoHMSWaXaq3BANvOMmQDI4tb70Qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765816750; c=relaxed/simple;
	bh=E3VI+rCrnmESMLY+TqQMYn/Qmb4uG9OsOtBt2o1msik=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m306MqjHLtMPfoE+CK1BurIwSiccOIrUv8zyi0iR5q2PX5Vvyd1RO0Nyxwz4s1cntkIjmhsz5lbqHHXeSKFnZT5dpChDTQucUCkPgiTNUrw/qflTTgoa4d6UmmrkpJeuAsrtdKXgzgWSFSN97eUevR2jNaS+oI1b8C6nvz0Ie2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=wO7dD4TP; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="wO7dD4TP"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47775fb6cb4so26282895e9.0
        for <linux-clk@vger.kernel.org>; Mon, 15 Dec 2025 08:38:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1765816735; x=1766421535; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y0/OVgNCzmU+9SvTTiS2Q9ByKJcSPr0aQjDQgeNdxB0=;
        b=wO7dD4TPSyGMuRk0L6Ap9dSOcZI1MZ1dmXvZP//4NxH9Ao2EtrEp1gij5AvQqRBoEf
         8/YKWDj0e6ORbpDGL0K2pmL2kANfBBtNcCXZ/FLKXdN0Aak9995tfCaYWT0liApnYAF6
         /k7QAludqmVxhJoPW8yzEenGG98K3ZS6GslinItJqraPWqJ3aAhA2DB7tElRJBStUOGT
         TGig3lOlaSKRh0ClgQL5MNGq5Q++TY3eJbJMEXqClIM2iIQPS4jenSvoWsXF8TDQ+U+C
         5ddf6xKmuhevQI54uTki1bmtabDkq+fkecpTNbUxb3Fr7saSEf26UVilsblB5krE+rZi
         rwBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765816735; x=1766421535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y0/OVgNCzmU+9SvTTiS2Q9ByKJcSPr0aQjDQgeNdxB0=;
        b=W29tB7oT53lVgOQxZDPXgThnPLpNb4SbvRCVtfwv444ypWdmsnrlmlJpetHeDmB0IH
         fAMvt6jvlpm1dqmBL3Nkwz9ha3aQIqGSfWGGr7lvuu7uYmvR2Nxi3ca7cWfLZ0/gWuTZ
         GJ5zK+Ccp1r8g3FtmPgHlbMYY9NrOOT1NNJqteodE75QZtDsoU+Fo8tfdJv6FHcoJeqm
         V+fOjLIQbntf6gq9qTUccn76bGYoLdGZJ9fZlAd5g9U9CxH+tbJt0UMA1oeQppnGwWeL
         wVZlAVNy5+X7W0Lh6kQrWTPVapjgShVaJfoT/3BN24yy+zSD++UQDYUvo5fDxuAhYj1f
         kMXA==
X-Forwarded-Encrypted: i=1; AJvYcCXYEJb5FdugVFu7E2YxdgXznL74cj4pgaiC8QMl+VEylaiQLhkPcDfUi4fgieC+G952zovwVsgZbFs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+ICf+dtEjTwQ3uvvhGYcaM4tPPlFHkdQVQjyeAGcyzSbRmwj7
	jNjjY9Pfws+vFuXy3BMxUkp6TfGdBNaoxcqhXKEu17ypD1yBURZjpjhilTNcKngrz7E=
X-Gm-Gg: AY/fxX7O0Qo+gQgUo0rMGC6tKUpE/z1Lrbhw82A9UXotE9r8zTS32LGFz+i/oMNHPkK
	pN6yamgWPL6Q16OMy2YpLvNR0UDwEnZLd0XRU77j8c4HxwBVltnF8j9QPAxoscMxlw6vtLmGlxB
	LLtyN742oiuYxQ65JGl1I7gwGLBW38vpm7GHZzxtAuBy/a8bjs7XbwZ8b3qNrGOjn5zJeGqs+ya
	Cyrtd29W421cr+1hMUAkSaFSdWL2ASQWNrzVGZTe+U8S9tu6oRuWFfRvIdDzMbX1LmkVzc8jIMA
	6bDcyfTYIJUZrS+ZuP08mJNGCAzBhjADErMnCzbRjwBaRsWmKX7Ps+7KlnPIzn9w8aoMMro96VI
	iZ319nRFTwUACIy2aXP6yhTT1OTK1VebP/1NITZqmg0Mlbc/lk3nLJO3j4ix5Y85UBgYH/mfl7F
	n0JTFsqaCdYEJlXTw5vzu5ex+W1Fhc+MNKw2WYUmoUYV8c
X-Google-Smtp-Source: AGHT+IGUYIEgjlTnPr2tLcPVUCL9l3M6N90prpNBbolsxQuhh1uHZmWWgCbqjrFvhJbCg5Xq2mMw6A==
X-Received: by 2002:a05:600c:a012:b0:479:3a88:de5e with SMTP id 5b1f17b1804b1-47a8f92029emr95523575e9.37.1765816735298;
        Mon, 15 Dec 2025 08:38:55 -0800 (PST)
Received: from fedora (cpezg-94-253-146-254-cbl.xnet.hr. [94.253.146.254])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-47a8f74b44csm192209725e9.3.2025.12.15.08.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 08:38:54 -0800 (PST)
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
Subject: [PATCH v2 12/19] dt-bindings: crypto: atmel,at91sam9g46-sha: add microchip,lan9691-sha
Date: Mon, 15 Dec 2025 17:35:29 +0100
Message-ID: <20251215163820.1584926-12-robert.marko@sartura.hr>
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

Document Microchip LAN969x SHA compatible.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 .../devicetree/bindings/crypto/atmel,at91sam9g46-sha.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-sha.yaml b/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-sha.yaml
index 39e076b275b3..16704ff0dd7f 100644
--- a/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-sha.yaml
+++ b/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-sha.yaml
@@ -16,6 +16,7 @@ properties:
       - const: atmel,at91sam9g46-sha
       - items:
           - enum:
+              - microchip,lan9691-sha
               - microchip,sam9x7-sha
               - microchip,sama7d65-sha
           - const: atmel,at91sam9g46-sha
-- 
2.52.0

