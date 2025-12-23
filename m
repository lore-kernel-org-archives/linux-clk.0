Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2775834DB42
	for <linux-clk@vger.kernel.org>; Tue, 23 Dec 2025 20:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766521227; cv=none; b=n6/OyCQiWtbHJQ3pIl6XPD8f3FAXsBAeHRfiOG4Wk7tUVxmRIv7ejfh1wD92d/T1RQ0TG0uQvb22mlkPXLPD1iSYtJ7ywQimsGE9nknpU85I8s0S9WBAjs4/LtkCXBQK47y0hMBp0DWUGq07FgicbS341gCm2pDyi/G11uOaUEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766521227; c=relaxed/simple;
	bh=HaP35Mv3tJhzA+ZM5JG9j+YNJFp/ZeK++35o7px2hP4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oMqjaE7Mn1ZNGg2blB/sKbV/XLWH/SIX/v72YR0aldfYz+9vIFysL3KHk2T3lUWpnbHvcvD012sYSGuXOySROEwBmhdE2NEeDbXHa8UBo4ibHCUE2y05FiWcdzuMVXfYYgiGwz/2bTc1XguOUqfRkcN1Y6QnBq5wOowydAdCJgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=WPMJMxT2; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="WPMJMxT2"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7acd9a03ba9so5734960b3a.1
        for <linux-clk@vger.kernel.org>; Tue, 23 Dec 2025 12:20:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1766521224; x=1767126024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PTgt2hO049DGrJM4Ny2YlS3thIKNeyR96EH9617zL0Q=;
        b=WPMJMxT2Z86tRUSGNKn0CYAH7lwYVAgIaWB3yVBHo64gd/T2s91doAUDCV8wqm3d1k
         DqXXsn9br1YlTxfvMupgH3TmIT1S0x0xNftveqUk5jLtfQ1ixzf9b3ZSBozDvQE2pyQj
         hhOrWomNhyMz/EC5b18RIvwIaScGg1TC0qvDuhlBcWJ6GfC1lTqE2K73G9hASX2Oxm6M
         /UgVfZTNLJNSpUC4EIkLNjKwAmUHnH4XO05eDMmPyIj+hi6/jvMdE4U0XPk1o+gmoLW5
         VBVI94hQaZ0XoDa6zJ3zoBMsb5xR+5HTpnU/B/bPo4koRUuMa3SXd6NekJ9GtM3jn5gy
         M6jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766521224; x=1767126024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PTgt2hO049DGrJM4Ny2YlS3thIKNeyR96EH9617zL0Q=;
        b=ZFsjNIuiQEqU/sMpaGILeqYU02DEeBbA+VMkeU3/b/U/xAaa/8/P6E1jnifFMxEK/U
         ggmg5QV79eHYPqxSatLv6YNOLUCfHXicnBRfJPXrFdbvR+eTP87SD1QcqUdWRaybxI1E
         1HRudrk5q10fYkbMHfq+HNzfxm+kAhv2mwgkmwXCcR0Hz0WkM7t6KQYiIQhKBCATMRIi
         YNHSzCbZLMybxy6K4jmIyuDVGdVfpHEIPZmjk4vmovdixSlEE0a4Nkho+gH0G43h+zx7
         atu/jA/rC5z4EDwgwHzF+ZOrtmNeT3apNWZ23CYV4kD0ryTgvIiK1bfWbLbbnyrx63i1
         pAQw==
X-Forwarded-Encrypted: i=1; AJvYcCWlixgW8WrhvOb6gNm0XFcBkNm0sLY+FwlirYls1KH6mDHeX16qHIKos9whzeT+FdYeZccjjsvkO5w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8B6phZQN0msRD1br7/ggwGacS2C73zJE+PtSywP0KHpVR38eK
	IOTXWkQ4QtFoCUjdDzfjvTjTD8ysarlDLqsh7FJRO8BGXmDEXHcFizKTQlHTqrFzm+I=
X-Gm-Gg: AY/fxX4MAp3+LXxjeXKyuezYhH7kJXBW5sDE7abtaghWLSAHVQ9tgfwsCCXEvY6oznt
	MqqkINNmWE3pcpGQ+PwgS6dshUrQMAy6q3E9R0LqXbdkNMk+tOhCRu+KhYyl1W0twgJO4wXUJlU
	DbLMBhxDuWeARQvhbEAfV86hLhmx0Xjmgkvh1rWv7461dCxvfCjHGszlrykAYQQcfAEUh1ofx7U
	k1D2OM4zhT0KI0Rk09qFvn00uL+b7GLDClEWf4PtGXWzuf39ZCmcVO3vW50P1CqrCYLUuTFBWFz
	DR1nV8du3J7q9PHNDApPzC8c+zzsZ1W6Rca/x4RA0J331iCoyGPp3JNG5aEjsMhKEjU4GqK7dSC
	vuIrOflAxsXUuTE2qF3j4vyLgHmsFPEyjfT9Ep2SG4Hqxpf01yeLni27Ef5e0pOscu0k+rdX823
	L989Re0vwMm7MVbyL9SRNaPQ0iNA/PkSrPxL+ylaJcuVCubrtjsTywnr/QFkbsqWwPyWhHezK2I
	xN6fjUa
X-Google-Smtp-Source: AGHT+IHEkRqkF3+ulFb7YQxPiXmGF+AIEzrSLTHIV/1Chrc5EC4Qv4EqGmxiVXP6kKzXYBSaNsC5Ow==
X-Received: by 2002:a05:6a20:3ca2:b0:344:a607:5548 with SMTP id adf61e73a8af0-376aa8f3946mr15876623637.58.1766521223699;
        Tue, 23 Dec 2025 12:20:23 -0800 (PST)
Received: from fedora (dh207-15-53.xnet.hr. [88.207.15.53])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-c1e7cbfa619sm12567549a12.36.2025.12.23.12.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 12:20:23 -0800 (PST)
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
Subject: [PATCH v3 05/15] dt-bindings: spi: at91: add microchip,lan9691-spi
Date: Tue, 23 Dec 2025 21:16:16 +0100
Message-ID: <20251223201921.1332786-6-robert.marko@sartura.hr>
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

Document Microchip LAN969x SPI compatible.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes in v3:
* Pick Acked-by from Conor

 Documentation/devicetree/bindings/spi/atmel,at91rm9200-spi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/spi/atmel,at91rm9200-spi.yaml b/Documentation/devicetree/bindings/spi/atmel,at91rm9200-spi.yaml
index 11885d0cc209..a8539b68a2f3 100644
--- a/Documentation/devicetree/bindings/spi/atmel,at91rm9200-spi.yaml
+++ b/Documentation/devicetree/bindings/spi/atmel,at91rm9200-spi.yaml
@@ -19,6 +19,7 @@ properties:
       - const: atmel,at91rm9200-spi
       - items:
           - enum:
+              - microchip,lan9691-spi
               - microchip,sam9x60-spi
               - microchip,sam9x7-spi
               - microchip,sama7d65-spi
-- 
2.52.0

