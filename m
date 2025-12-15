Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9300E339719
	for <linux-clk@vger.kernel.org>; Mon, 15 Dec 2025 16:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765816761; cv=none; b=qyzhze9hrcoJMnWSu/laCD4sg9Mbz8njTJuHk3gAWzsG7miJ1Gk6u3nhL4FVr/SpWElaWCiDISs60DBT2YZKmOF7fBU9jI+wNSZS074k4ycS7RbziRJFWKpsGMTH3oBrYmJmV4D3UC4G6DfFDCa+UlgWCyYdNJqEl2Elkc4p6yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765816761; c=relaxed/simple;
	bh=yzcerxGw6ZEQ5EAWvF/XHa1fvQNZAbIc9+3T/p54DUI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A0FDdfTqSxBImZzMVzT3I2bQvBSeWHbgoCGYo5WfGR9vyBrWwPqFy8yPU/8h3n6uf0uQUNVop3oGFHQuxsqkTp6M/Zff86Z+HLGWtYW1AehomPaIfbsATA2LzZYw8y3mcTCoTBmV+Q+rY8gQpEyKbEhTuDssMMMqpJgB7OYpGP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=wuE/sKde; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="wuE/sKde"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-477a2ab455fso40413575e9.3
        for <linux-clk@vger.kernel.org>; Mon, 15 Dec 2025 08:39:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1765816740; x=1766421540; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B7uXKaE9ntPCAZ2rjdGBHoMUGCXZvwAT6+sIs1szqdY=;
        b=wuE/sKdeZ1o995m+SXaS8gdLHPqBj9GX4ItZqDHLT/qyQVo6rZb3HQc/BcqB9c7y5T
         WAWKU5zNvBo3ukX5igI9stooGkl2JDOJfHn4J1f4AYJLQrPEKVd2idNvS1PnecZcOAyq
         mFoxp5oktt9oRgiksHv5Z4zX/eFmpFXWKx3IIax7Z8kiRoMB+FT6Ll34iiTLPHD+qAzV
         7re8uKM49/6YD+Lft9crtVxLMzWamLgsxkgI/dyKNTW413QTLQSC3Df6Xs8ax13SyOye
         EEfiPyAgiG/5/DD9prlU8lV/UkYUcRTK6gB78zSOSaMZ1IvI6Ok8OZ10nBaYz4uByJ64
         jtuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765816740; x=1766421540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B7uXKaE9ntPCAZ2rjdGBHoMUGCXZvwAT6+sIs1szqdY=;
        b=Qex+UA3fvBw/omFZ4ouXqE4BpJbwH/+eDfRXtLJOu+hkwSbMqorxg0mn8AosRGpLwL
         B3dLSM4gyU+bbYz0iURmmOFDWfugHY0OXOSMET9PdT63ImVgVIL+lEXU7G0HMO8ySu6B
         ttDwqvlv6u8Hnuw3ygGZMmyT1DFXlByiy33zMIFs/Gh7M7pIX98G1wv/YXAwyCgZm4RT
         0Yu+DogyOxtmM03IxQK91W04Yiu46QxoWOqAbWniAi4D3LiydDP2JSX2gRocbRSTNxl+
         5W5vl+0vPPp1qoQT/5Vmh6nR1F3FfjyJFPAi+44duBhNcJb2nw6edWSPP2rz6fXb2F4D
         PHVg==
X-Forwarded-Encrypted: i=1; AJvYcCXQe0ugxcCmBx9ABXnGBXbroYTfuXg1UIf7E20uV5ac2gxidYaYCudQNnB19jvmapz6OBpV3GyNGlg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzbe16QgOpa30xvww1xOpEoHVmMndui07LfJR3VrQynHf/uzwgN
	SqKqsLiSRF57j3UQ7AWbj2rpXZh6gmqz1IwCLSaW+/pV/BLtUGip1MVbsiQ8ar5l9sc=
X-Gm-Gg: AY/fxX7KLr2nCRAI4u86n2oEhZz5waZiyeTULPJtfaUotJOa/AKR09+kJp1gSMWOisR
	1rwRaRzCLjDWlSmEWSzRb8P+hieWGgBoF1S3ebvcWHYU8as2NzdraiBdVIgQsT83gmF5BHomndV
	+GTmh5nJsUF8w9c3QTj3ZNMzI666Ply6K/PKXhIVqKpKinGz76tneEFc6zi/E3yIFYOWGg9KmWi
	8J6st8KsHot1mdUMMI7lyXyhew0vdKhSDPHWwcLNE5K9R3RYPGdif4kNhpj31l3oV9jMjwPqqqb
	QZ0v8OgDFJyrZtLNEw0LS4t3ohtj04TW5ODzLsBx2gXqkv37bjONyuHJxVwVA+AkXAicrlmRl81
	lGtktbbR3/uGBIDGmi7gHnWIDEhQBq//aJn6n/4r2vgXqiP2F4Jam5tQgfmUG24fxWlHXadIFqn
	B3Qvp/QKfeCMpe51NdQ6fm3YAYkZh08xO35MG91EmJtfAl
X-Google-Smtp-Source: AGHT+IE8U04tM1LjVUd6BjLQwQ0IIQCLbUIBLs6wp+cysOg55uq2vnToFSgCzvzZIateLKaG+nb0Ew==
X-Received: by 2002:a05:600c:46c4:b0:46e:59bd:f7d3 with SMTP id 5b1f17b1804b1-47a8f9046fcmr131388855e9.20.1765816740113;
        Mon, 15 Dec 2025 08:39:00 -0800 (PST)
Received: from fedora (cpezg-94-253-146-254-cbl.xnet.hr. [94.253.146.254])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-47a8f74b44csm192209725e9.3.2025.12.15.08.38.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 08:38:59 -0800 (PST)
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
Subject: [PATCH v2 14/19] dt-bindings: net: mscc-miim: add microchip,lan9691-miim
Date: Mon, 15 Dec 2025 17:35:31 +0100
Message-ID: <20251215163820.1584926-14-robert.marko@sartura.hr>
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

Document Microchip LAN969x MIIM compatible.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 Documentation/devicetree/bindings/net/mscc,miim.yaml | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/mscc,miim.yaml b/Documentation/devicetree/bindings/net/mscc,miim.yaml
index 792f26b06b06..2207b33aee76 100644
--- a/Documentation/devicetree/bindings/net/mscc,miim.yaml
+++ b/Documentation/devicetree/bindings/net/mscc,miim.yaml
@@ -14,9 +14,14 @@ allOf:
 
 properties:
   compatible:
-    enum:
-      - mscc,ocelot-miim
-      - microchip,lan966x-miim
+    oneOf:
+      - enum:
+          - mscc,ocelot-miim
+          - microchip,lan966x-miim
+      - items:
+          - enum:
+              - microchip,lan9691-miim
+          - const: mscc,ocelot-miim
 
   "#address-cells":
     const: 1
-- 
2.52.0

