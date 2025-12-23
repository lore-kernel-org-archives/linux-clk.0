Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A818E34D3AF
	for <linux-clk@vger.kernel.org>; Tue, 23 Dec 2025 20:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766521208; cv=none; b=Xet/yJ9J71cmRmk/0l357XGV2LzhBEfcPwDV1FmYowYPCUVqUe3J8Kw+wdz2b5+RWB9kPDypAHOZTjRXJIcIz9CLagiBbh2VtYoWqkKTw+D8hCkXC872AUTdvzEXQXeOPtEWzADX/4ah98A/KFKM22okIjhyTfNaLZ/xFmDYQWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766521208; c=relaxed/simple;
	bh=lnkhvIt3TrOEyzf6TQ1BG1hfakQAvNrAup7QLQoickg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I3OfYmPQ6SzJubvn7BBCzztqGXycraSnN8Yb6ucp0HQFwyKlJNw0PK61tV0oh71UrHyfw/IDu1APeMS6Cq6NY7HYl7acC2uQHrwfqWeJUDRtlITWQ9XUGmql3TiYjFSmvA2kGiB/8Nn50tDBkz5WsDGOiO2OCozJ9byW2d6W8iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=UajBDKTY; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="UajBDKTY"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7bb710d1d1dso7426896b3a.1
        for <linux-clk@vger.kernel.org>; Tue, 23 Dec 2025 12:20:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1766521206; x=1767126006; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=akmDQhsi4smXKOu+AQ0134jZY6Y2uyR0jebUNjrF2nI=;
        b=UajBDKTYlKcruvSkRnlFr8tjHgo7vqKYdeF6g6i2LgrtBlAxi/x6/j2FzFA7aa8IFJ
         zCbk+kIU9UJjaY8OIT95qG20Y9itoXB0IHgRnrBEMTEvoYeZOBFiUZ+FDnpmRXib51JM
         VlieXBhkKajYtWxLUzmgiSHsdXHz3zT/Iqy7FF7c8goVaCwQ7p9fsGuBegWYWqK+Jb8n
         9jJK6EEPqAU5wS6uLrfhFlUXf2YYvHGfb6tTbrFyqsIqLuSPy6BdmhvfuxR/0v/GvHPn
         PnUCBlucC/3gAqVgR3ks06eKS/hQ6am0E1QuYjf8Chz+G9uMrPAlcGrBGz7oOlpk1iTI
         ZzLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766521206; x=1767126006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=akmDQhsi4smXKOu+AQ0134jZY6Y2uyR0jebUNjrF2nI=;
        b=iaKGdJrAs9zW/JwnAirM1+Rwh1JJXK9JlAiOiJNhpcqxZZxxD2SHrd5UZyEKS0oB0i
         C94+xHEHCpCRTW8rEbQfVQQPkXACudsxYsRh3/sGvpfeB0q3USpVsxPFNEx9T9WaEN2y
         7koqIsx1wb1R0iJu9RTyxfD9tw+WRFLrh4F/GLue8Sritt0C0n3rXy6RT1109joKneju
         bZqHKBJow4y4GqcNwZ/oI2zN4Hm+LX4WrKBVj+6ZttStP0zc0qi2rb4RrOCWx7m0YxxN
         G+9ofWbFYyZN2YMeNpavbTZXch4GyQUN++HC3PO04jknd1Tnh/YwLiFhJqfIr9uw0KB0
         cbYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWr/E/Q3+ipHFnkqrdh4bqZlFpoKPuVtSDafuBHcoOekCKhRctH9Gz0K6B8SaEmdGVRKrzmf2zieAk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGxQidYjeibqLL1MYecg/cLb/Lkuh7vhAgNyAlQcyMeP1WQFK+
	N38Mj/kPUJXOgMIDtnrG7zmwAXx8zBk28Nkh5TBvzN/tA3Sq/IExrs3F6VPQ7UWYQ2s=
X-Gm-Gg: AY/fxX7YFM26NfO4PpQCqxkS/XF4wc5scZZ12qI2lfyB4emA52mK12xADf8tpCDfMyJ
	16U/MYLNeHFFoWpiBn/6WyqO1Rvt6HBqwpUInumPf4HJ205+S12X5NmNqwXQjfu6LgRmIMCbmJy
	/Arsb0xG6tv3hW6kgI2W1q9HEXdrf71KA0v42tTNGPEjjdZiyztvs3PHbWpTJvkMX2+rBwPqx0Z
	GzsgYWzUSmhlD6cb9YPrw6j0OHpL5zz3itOrCqlADCn0vB0kYILOurzQKBH6hYs+Ijafbh038CA
	c1VeZEgSgXIItIW/xmm1I340OkVYszWBbTupOWC7XAq1mPcSzN34nQQiXBEpHHfTFUZbSbOnRMt
	dqzB0Wc7T74bI1iRmrKs0SHN96ysSAoYzlOOezO91AmsXOmwGNPej5Wx6aqBAxwDAFdvT7FWgD6
	VDDNPhEvT4GETbrFrIaltVeQgjar5Nwqvrt/cXDTNOd67cOQFnOyG77M3zbA05M4HF3Nis8CxVu
	t7mMvcE
X-Google-Smtp-Source: AGHT+IEAtWdhcWPCbENBvZFgr3c7IxJWeT0r5R2X+lgPN+f3cgKBnmk37uhjXoH7niVY6cpG/hJphA==
X-Received: by 2002:a05:6a20:9146:b0:34e:959d:e144 with SMTP id adf61e73a8af0-376aabf97b6mr15698314637.54.1766521205797;
        Tue, 23 Dec 2025 12:20:05 -0800 (PST)
Received: from fedora (dh207-15-53.xnet.hr. [88.207.15.53])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-c1e7cbfa619sm12567549a12.36.2025.12.23.12.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 12:20:05 -0800 (PST)
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
Subject: [PATCH v3 03/15] dt-bindings: mfd: atmel,sama5d2-flexcom: add microchip,lan9691-flexcom
Date: Tue, 23 Dec 2025 21:16:14 +0100
Message-ID: <20251223201921.1332786-4-robert.marko@sartura.hr>
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

Add binding documentation for Microchip LAN969x.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes in v3:
* Pick Acked-by from Conor

 Documentation/devicetree/bindings/mfd/atmel,sama5d2-flexcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/atmel,sama5d2-flexcom.yaml b/Documentation/devicetree/bindings/mfd/atmel,sama5d2-flexcom.yaml
index c7d6cf96796c..5e5dec2f6564 100644
--- a/Documentation/devicetree/bindings/mfd/atmel,sama5d2-flexcom.yaml
+++ b/Documentation/devicetree/bindings/mfd/atmel,sama5d2-flexcom.yaml
@@ -20,6 +20,7 @@ properties:
       - const: atmel,sama5d2-flexcom
       - items:
           - enum:
+              - microchip,lan9691-flexcom
               - microchip,sam9x7-flexcom
               - microchip,sama7d65-flexcom
               - microchip,sama7g5-flexcom
-- 
2.52.0

