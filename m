Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C540274FDB
	for <linux-clk@vger.kernel.org>; Tue, 23 Dec 2025 20:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766521218; cv=none; b=rJBgNcFIXCJwkD6o5ay5IFVloseZLnevCjvt4uyvQtcoHYB90KB/dsD1wLF1jsl+ooNAj6pCP2v5RDilVnz4PShguiMFmCs7mQ8NIhm3Rq6MMvJOrmuta8dmC3fq41xgM8tgNHqIS/S677iwWNXq8p+C7HrDKnnlYYM/MP6CnJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766521218; c=relaxed/simple;
	bh=GSmfufS+BjcFXAR7DhKTmRXgeyl65npdKjntCPPDfHY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lqK2ov5MaZ1NecH17doTShs1LSvh+FfcZ7X8Izeq2F5G7NxqsavyLVt/AthVUqgnjbnanTHD30fUWfbMO61HM9QIsPR/nX2KQObhdu2vf3Nsj+W+luYU/nLQ+zkvxgzJDPDCF1h2cYWSxwX5Zr7HUpIqnWtuLg1xYo8uqgdR6MM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=mknI3aHD; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="mknI3aHD"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7ba55660769so4322692b3a.1
        for <linux-clk@vger.kernel.org>; Tue, 23 Dec 2025 12:20:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1766521215; x=1767126015; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m2FSF4N3N2MYzlByPoECc2cAz8v8tXyMKGpnQtUm3aY=;
        b=mknI3aHDk/xx6E1DXCAkhUtT53KYTa8H/fy7ZqYi5lMAYZ2pnjDOEBbpIn+PxzsEih
         Wi8gHCcxw6toR6SqJxa0bt8CxPRFrw2FGeuOBXtyqNd/OiX8LDNzXflhB1fmTCJggOR+
         YGkdiMbAf487Cc3/wOyoWB7V8JvpTpMJwDUOtBr7clyUt5ACpOC3y4DWtOmXN/0bgspv
         S+1LRRlkfT/LfRuRi8mvNfnDrTa7d0Rz3fVOwnNtuYqX9hOvYGnRNM8NwkprFzIiTiGt
         DCBGCog1PbUG/q40amKbvFtSJI3QV2PfA7L1Id37cDtu8ahGqYpYnBl3zRj+quKK05rp
         MSiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766521215; x=1767126015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=m2FSF4N3N2MYzlByPoECc2cAz8v8tXyMKGpnQtUm3aY=;
        b=QrHGtRsbhyaoZJQnPLhVZ3hEWwv2CCJYzA8tVk/t/BKUXpDOH5iscJ3UzY3//Xp6sY
         8k7SmfVn5lJ8iEbYHtZseyRRiE8Illx/iowS7OOlDCLppD6ZTpU5a1u8Fq6Q8tDKm6Pz
         YHYfM++l34EocAn37IIYAuWnPOaut+7yt2S3RF5XRtNijA/8i/bb5NhK9t94euuxpJks
         jj845e1m+IarPnkl/YwgzkJAuNGMpj1UeVzV75+3RP9tixeuQxeBpXzOTIvhJY1wskko
         O7XHwvbdLIopfoAbnqRs+o8op/Dbbrx21ulX1XnVp61kx36IMaVWCGUibFB+rNVJrA/G
         CD3A==
X-Forwarded-Encrypted: i=1; AJvYcCWQgc9lDeODqH8H7Ft2uDl9CbjUdLiLZjWcCROKEf0xRx6cTVOBskCC2KIcWKSA0R6W0amVEYti9RY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+EumLG1Agy0wO+KOzT29eaH7UiVlOxAp+J7BbXKF8mtwNLY0/
	QRQ3g7l96JQNV4We9Fo6+cTT+mUO8+9ho/uZyiFosL7Ji3ExWrWIuEdXa3ctGCxq2P4=
X-Gm-Gg: AY/fxX4lhUmyFc5tIIVsvdusZnE0QZYwIXHP3bxtevdcHTnoSkr2DB1CCejgnQZQjT/
	EFMZ8om40wj7nnay1yDzp4PO/8xvrJsueUx0kxcDwUzqVvfs7WnsUBFQ7b0q6/NEHKUV6FqXm5V
	1DmQy/+XklC7Ltq3jTHFPkpAKbCuRDUcWO/pMUEJttrli1d+HoGsOnmUhMrGgo91v0RB6EYBt/Y
	YitCC7fh9tbPsvw105MCxk66hGXUrANoI801oLjz/bwtOFEzeKmHnys6ByQCNCYBRAUGrkHX9Im
	DIJs3rOvHkwsQHM86BD079MJ5Z3JnR1pfxzgC2f5XCj+9oY3vSTY4GvIe/yQ5lR6OojM6o0jVGW
	GMxWzjAg5DTZQjMv+js35XxydkdxKKijbRtnDj0PO+HgaGmZTfagPvSY30Yy3f1IuJmHzl3+RoO
	n4qyxhOf4CCCdrxHNOwqfm3E2kxrx28tnZT4LESsN8R7odIqnXVURyUAkLtGrhqnR160Pvh/SHx
	n2NnbaR
X-Google-Smtp-Source: AGHT+IHTipKQ2GYkfIzCrgEkT5HgaT5cetpxH7RTkCWDpkBy3UcCKVeG1Kf0FvBM/eI9Sln/VDayPg==
X-Received: by 2002:a05:6a20:9149:b0:347:67b8:731e with SMTP id adf61e73a8af0-376a77f12e8mr16762772637.14.1766521214766;
        Tue, 23 Dec 2025 12:20:14 -0800 (PST)
Received: from fedora (dh207-15-53.xnet.hr. [88.207.15.53])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-c1e7cbfa619sm12567549a12.36.2025.12.23.12.20.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 12:20:14 -0800 (PST)
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
Subject: [PATCH v3 04/15] dt-bindings: serial: atmel,at91-usart: add microchip,lan9691-usart
Date: Tue, 23 Dec 2025 21:16:15 +0100
Message-ID: <20251223201921.1332786-5-robert.marko@sartura.hr>
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

Document Microchip LAN969x USART compatible.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes in v3:
* Pick Acked-by from Conor

 Documentation/devicetree/bindings/serial/atmel,at91-usart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/atmel,at91-usart.yaml b/Documentation/devicetree/bindings/serial/atmel,at91-usart.yaml
index 087a8926f8b4..375cd50bc5cc 100644
--- a/Documentation/devicetree/bindings/serial/atmel,at91-usart.yaml
+++ b/Documentation/devicetree/bindings/serial/atmel,at91-usart.yaml
@@ -24,6 +24,7 @@ properties:
           - const: atmel,at91sam9260-usart
       - items:
           - enum:
+              - microchip,lan9691-usart
               - microchip,sam9x60-usart
               - microchip,sam9x7-usart
               - microchip,sama7d65-usart
-- 
2.52.0

