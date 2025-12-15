Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CBBA335572
	for <linux-clk@vger.kernel.org>; Mon, 15 Dec 2025 16:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765816754; cv=none; b=hJ9hZCA7ZLhkQNJ9ErrCT+BE9Oi6Jc1Dn16XD+0UqUPhBgX68VfOXrh+Ud+h4nWaxuR6BNxMNFOgG6Vee7fKfa5QMg33TIgR/LiDllShLgfLndurVexHaSPMDSvVKbQU+GTcLQKY85fT2TAsDcVFlwQ2sYTo7VdWQ0JT5bWKeBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765816754; c=relaxed/simple;
	bh=VPVs4jF75VJXH8mdDS9PaTAypaYoWoEKaAjTQEnezGY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HsXWIhkPlR0gRxmb52D89pXBJbjjEpARayk2Xu2gk5NyWxr3swd4ls0GEO2LuYloJPcPut01cSkYLB7VbgV1+V1bok6jhSN9VmfTj8oLr85zKgHdY30BsIcFMYyRffgDGsjteYQEnaJT2A1YZqWy4lgZtgVrCwOGD2jnz2wUz5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=VZQWF0V2; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="VZQWF0V2"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4779a637712so24958635e9.1
        for <linux-clk@vger.kernel.org>; Mon, 15 Dec 2025 08:39:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1765816742; x=1766421542; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s0OEssTGK11BYSFNM6Q5GJFG0lDY4xg8K+duT0eXTMo=;
        b=VZQWF0V29r1IgpfaJxCInv8zUo3+O4jzEdgE4tPFejZmplpHFTHeqVt5D6cXNZ3Ukk
         L6AEFF6RG8SFASe5M2a4eiD/KbzxAgbQH36T3jjYKngJbqaWT/TPp/q/OpyhBY1sXQhj
         yIpYTxkVaUCjXyiqskr0VF/Bhig7ipzAFn37azEXrBmSHDP73kWveQSfb1/oJyoZhBqz
         rtPZItei02rqsC3yEHu6GAV6lTw9A7IUX0CoC7l23pFlwdi9C53Jyfagb4uKlZFcbfRm
         cI5aKxlYdr7G1ZK6jgWC4oGsmO+YoJznPt4a0HmkcFxhQfZfAJomZynzewNj9NqRqbRN
         jstg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765816742; x=1766421542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s0OEssTGK11BYSFNM6Q5GJFG0lDY4xg8K+duT0eXTMo=;
        b=CgVvZbmDFpw3xl/zo9ST1IOs/olggDoBpSxahXHcRx2HTiYBu2dDNTYDW0p7zpjFOS
         PR+Cc63k02IvtwvZPIFi9k2PIREm1k0vnCfKZIeW9ZUBISc1QO4T4198eP7BKFDOLro7
         Jim5QwelWs16ndAM40juqf7Z2atvr10Z1ZoCkk441lWd56uMJ1XVl5SDfC9NJYOKedQI
         QlZbtgHW0eZWpiOCqbrMngjlIMO09HPnf7CCRagBCUKpAj4E68fW55PrWU9p9yX9jIeP
         EqfHso3jFrXfvJGoNmK5MLo6YL+dxsRh6VdSz/kGwWaR9h+6gGE4hH2oIct00oqxKDOj
         CD/w==
X-Forwarded-Encrypted: i=1; AJvYcCVxA8zbWhpyXigiDr2Cy5+sGO3GKhMAb7hIhZvX2ZTk1WMyLhwEPVVvRfuLjU9M35hAdmXypNxujcs=@vger.kernel.org
X-Gm-Message-State: AOJu0YywJMvO1kKYqSi91+sNDdL1YIqkjF8uAa3LWrRz7+h+Os1eEMhK
	tWVH4D9ika4b85ypr6a/qNkpxbX3OM6YqocCfAR0Jk+1yE1TwehAWH32DaDKMfYTqKU=
X-Gm-Gg: AY/fxX5qjiY00XL5vtAbuavbThUo9lKSxQozvzXTStUo3CMEWPZ6ZoO5tXW0Ym+f7am
	nG5TRst9yqkvUREXO5Jx3noscaBxcrCwa+kpIXGck4BC0fgqrzWRNChPytJXvhHpKoncZ7MZkA8
	6gxeol63avMwkDkiMiXYJlYFVNEZhA1g6Qdh5YViaLteCOUlKMtFWzL1ZxL2Z5wLTQ6aTaGs7k3
	SkbJILlUYwRtKsNRhyN5p+K/zBA1urls+ZsZR7c28N0SL0nQPg4gGOujtDbKgyR6PDNpAL++foE
	Ns88RG6b9kfidk1tb46tl4F4YnCUga15WqziC1xq9dxmK6WIIR7dn20LGIXK/HApPD6TFX8+EiG
	OUL+7V4b2ZPERZ0mHMWSTKh9EjhjFUf1Y0dujAPyC/sgWVCHTngWx5ZEKNanCToRn4Gey08jFFZ
	/1Aguo6G8W2A0iOsIw56QmYHV7oeIW8XScb4VdC4zWjBJf
X-Google-Smtp-Source: AGHT+IGZRk0nLa6XE7JBLcVbJ2etCXd7oowIPMfnZx4Z6qSPahCqU8A7b4zUyWiscDsHFjn+GrD1MQ==
X-Received: by 2002:a05:600c:8b16:b0:477:7c7d:d9b7 with SMTP id 5b1f17b1804b1-47a8f915711mr129583515e9.33.1765816742452;
        Mon, 15 Dec 2025 08:39:02 -0800 (PST)
Received: from fedora (cpezg-94-253-146-254-cbl.xnet.hr. [94.253.146.254])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-47a8f74b44csm192209725e9.3.2025.12.15.08.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 08:39:02 -0800 (PST)
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
Subject: [PATCH v2 15/19] dt-bindings: hwmon: sparx5: add microchip,lan9691-temp
Date: Mon, 15 Dec 2025 17:35:32 +0100
Message-ID: <20251215163820.1584926-15-robert.marko@sartura.hr>
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

Document LAN969x hwmon temperature sensor compatible.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 .../devicetree/bindings/hwmon/microchip,sparx5-temp.yaml  | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/hwmon/microchip,sparx5-temp.yaml b/Documentation/devicetree/bindings/hwmon/microchip,sparx5-temp.yaml
index 51e8619dbf3c..611fcadb1e77 100644
--- a/Documentation/devicetree/bindings/hwmon/microchip,sparx5-temp.yaml
+++ b/Documentation/devicetree/bindings/hwmon/microchip,sparx5-temp.yaml
@@ -14,8 +14,12 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - microchip,sparx5-temp
+    oneOf:
+      - const: microchip,sparx5-temp
+      - items:
+          - enum:
+              - microchip,lan9691-temp
+          - const: microchip,sparx5-temp
 
   reg:
     maxItems: 1
-- 
2.52.0

