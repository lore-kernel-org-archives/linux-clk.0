Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B5EF219313
	for <linux-clk@vger.kernel.org>; Tue, 23 Dec 2025 20:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766521235; cv=none; b=Jr/jm8MHICoPCfv6I9mXLawDbnGCAdBv3E9YoOfXWxl58ynVbGlxoBu57TsxIqw3OBscOLpm8EE36XFZ6usl4Hfr8y1JpIIxrVhi6IvYZC1DDDthV3Uiaj42CzktTLk9cr4L/3lD9MLcbXPBPKwiRlEb2qWrUGiuRZy8Zdq1O4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766521235; c=relaxed/simple;
	bh=fcTtzHF7gWsSvucVbLas/Xk6BXcFxykzA9hcJy3JeRQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gT7jjgHyKjciYcu4F+kzfbfG4IJsfWQjNv+VRupdhOYuH+MJQ0d3hFwq0Oq02ROXJB3ydmlpvWPEzCuplLDcjIzySGutLb7T0du+DGGXQ3r3Xm2pqjCCb01oxSb/QO5FJSEljw+DRLsWOvT3Wv4cTPyC1G9Vau1cwzkWJtA0ot4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=LUNMGrbH; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="LUNMGrbH"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7b8e49d8b35so6588186b3a.3
        for <linux-clk@vger.kernel.org>; Tue, 23 Dec 2025 12:20:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1766521233; x=1767126033; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PfrUlgr4mKAwpRgF31HqFmZ+jq2Qg/gWBBCl9WoQ4uk=;
        b=LUNMGrbHejcYyFw2a6c/kwd75fcTpoU1Txm3aDp5WPaRLflEN5x2KyQhCtoR9nYbgT
         G52WiWvsYMxeLN/e/NSOuMsHnDfXefk6LgHaMbT8DP/khfakpFdXf78tzEfqEQYq9umm
         8rUPkhi3lgUD8VCN0hh0xf5Tv1It8Rv1rO+V2kqbTcq9xtv6gqraS5r9CYDAF0oDXnwy
         A6H/V+0geM16PmRCt0ZWpCoe9tUowVQVnULVxxmuV0eluI1StV4l38cNFbXf7zru+Fid
         /S+ns2Pa9hMFFGRmLhFQ0nB62Ctm1T8/RBYKVCWZIl/75WNAdNzC5Bt5WKa2FK2zeCHI
         z4Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766521233; x=1767126033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PfrUlgr4mKAwpRgF31HqFmZ+jq2Qg/gWBBCl9WoQ4uk=;
        b=k6GxBlMEoU0BS+dgJrmP+m768c0s29iShEg720LELldHiGdiN5SjgfUQy2EpVmlpX0
         cBTGAPlemv7/W8j0CaksLAdWLe3qRqjxHDeKlXmGKwOqyJ3xQiofE18G8HmR5OUMSydh
         hgml76R2y1Wnm43SRd4XWXeOjlH5a0Fq1sSMntHeq9HFpIvqquJo5XKek3ZXeEXZMmbz
         g9jsJmfLYnuU5fil84uvEmAuiIhXDRo9OMPmhhVjReojWlBvtFPIkFFUhXBvQ44XbN7l
         vNlzx+0Gc+HbgMjIcfnItLe/dTSKoUkK0laQyFjDVsoW/c6VdpNuBsUEE6OA2ZxQBg/Z
         7KXw==
X-Forwarded-Encrypted: i=1; AJvYcCVoUVagKAjLUU302EtHNGMgo3ScD8LCbVr90M/+QqLFbLR9Drt6Z7Oqm4SYQFWV4Z9sDXbw9Q2Bj7k=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyjGVrBLohNVsBKwnYuhXy0N1IQW8+a/K4BlVa8nINGXJRqMHw
	7iY14Q6uhTQZKUI4ewJCYIGMOPw16GCZLgwH70WZL580JVKgbO3IYdh5wW1YM54dW5Y=
X-Gm-Gg: AY/fxX6kg5uzGCkTnOEMnYhJhortOIXQnlDipTbyONdKZ9qoNjuCH5aM2blnRJXE0zC
	irSXtvk+2OCMtIx8sSEgPo4TsB0zXPNZIyP/7X1XH7w3wOhYcB3EW7HQqe8gqDVhK7jqxjDzqm6
	hxPzdW0rGyzBlNvCLJ6poLANKwRHUv1vNbfsIiWwhsq5O51MN3Hb5p0yEsJ+1StD/17D6UiryZ4
	xbHEJk5kFd9EYqgNscq+hGvgBXKzYrTU5lhWCBqEgKSRdbF7VLZ9NKJ4oZWBL0ZWhC7dhBr12MV
	tpsCvknch5bkUfSdQR/oYek/m+2AmOjMOYCXojm+FrqWx2yo40ASCj1QEzRkErdP/0Hc1+TIO+4
	c7d0etZgCrv45DRFkdAEZb87sabCRa3cg6QuZMDwILihAatyBdGjSphw/ZQXLaWQJ76KrGe0+SC
	cv0X9ur9QX5jhGXfu6HKDu8mcEpGnI+QcZ7AfbnYsjMKVHpyX2L8/rnK2WY7LtvzEQ2ouThsvJj
	IDPiFcf
X-Google-Smtp-Source: AGHT+IH+vGo67Kz7b+8QZvoO1bYGr/XHDGO/seoLyNk1DncRQFKXbN1uskDp9cfikbL8HUPUhf7HaQ==
X-Received: by 2002:a05:6a21:32a3:b0:366:14ac:e1e1 with SMTP id adf61e73a8af0-376ab2e706dmr14672619637.71.1766521232584;
        Tue, 23 Dec 2025 12:20:32 -0800 (PST)
Received: from fedora (dh207-15-53.xnet.hr. [88.207.15.53])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-c1e7cbfa619sm12567549a12.36.2025.12.23.12.20.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 12:20:32 -0800 (PST)
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
Subject: [PATCH v3 06/15] dt-bindings: i2c: atmel,at91sam: add microchip,lan9691-i2c
Date: Tue, 23 Dec 2025 21:16:17 +0100
Message-ID: <20251223201921.1332786-7-robert.marko@sartura.hr>
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

Document Microchip LAN969x I2C compatible.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes in v3:
* Pick Acked-by from Conor

 Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml b/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml
index e61cdb5b16ef..c83674c3183b 100644
--- a/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml
@@ -26,6 +26,7 @@ properties:
               - microchip,sam9x60-i2c
       - items:
           - enum:
+              - microchip,lan9691-i2c
               - microchip,sama7d65-i2c
               - microchip,sama7g5-i2c
               - microchip,sam9x7-i2c
-- 
2.52.0

