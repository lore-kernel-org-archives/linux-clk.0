Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD1A3502BA
	for <linux-clk@vger.kernel.org>; Tue, 23 Dec 2025 20:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766521281; cv=none; b=se9NSc+knM4eD8rgMlnmm5nkULWDt5c5fGJULdmNZP4HvEn67R0yR0MGb0txn4bDdjaqi4E2304ZuDp+GoOHu1p5byV3jJi7qn94iKDYB/G7yI78/PFx2E1oCoIQSt/QqeU+62gAsJL8d0gBeLdQzHRBiYVK0h8MeRzqMEHUOkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766521281; c=relaxed/simple;
	bh=omWUVkHfDgWK8/wVYsqR1gmKx3uRcWW/S7wsFlqvQZU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SSGZFkC4a0W06lw4veAtkp8JHIg5zQKdPWJPk8aIe/My0Vh8/6NfE0AASu7Uk+OGPSrSl6tRqlqEIznBAn5mGBJBwTUGQW98y+sR+Xc4EP+Gm9s7D2D97Tv++R60xwt8JoLA12JSN9b5qo5kB3wPxSQRAL27E5wtfMtCS0zcfpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=TqO1SVDy; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="TqO1SVDy"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-34be2be4b7cso3543533a91.3
        for <linux-clk@vger.kernel.org>; Tue, 23 Dec 2025 12:21:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1766521278; x=1767126078; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pe7/bfwW61qpTH+JIS3AKR1VkqKbIoFXot2V67cYu6g=;
        b=TqO1SVDyDPy6oeM2rbEwUbThg0ZMdnWKh7T7VD8KZSzOa/J3kT4ROyy/pl8C/wyVsx
         87KW2ws4VZeH2LmCpVD56F3zdAx5JXs6BVI4CuP0krQwFRfdL5t80ZUQoSqx/9VjCZ93
         2xHRYX+ZNHO4M/4rPr+tVC07JSbvH9LFNrnBQ7xv2se4nRY89nnVpeQCvPP5R7bR74dN
         8ViTbRe6BIWhzI31DQmgEro4hW0FWUc++XgR7MG6fQJ7WiTyuHPokC+8mh/pV6Sq6piW
         ZgBIqf3KQjUSOvTNzk6HjjuoWV62KCEhAtinLcS332mSds9tBcYhX9IcAH44WscTKXwf
         1cEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766521278; x=1767126078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Pe7/bfwW61qpTH+JIS3AKR1VkqKbIoFXot2V67cYu6g=;
        b=nlhPxmDxu6fJrsXeBXYbz5IGpa0EgSjFilqv2x+6MS+4KHPCfnw1EPWNHzjzOU8ZgA
         e0pRJ0NLAjJwudMc9wptr+Gxt1lyaxxVsaeX6YBB8oAJg/C4kRywKBGRc03PGcPds9YI
         hs9yH26TIULuDCn/OIzisbAaditz7KoiN63QPRqLWaCjevcx+uNORRhaMf+bNK8xngf2
         wAh6ZEFuuHlSHiZdwCcQiMHJ/pvtK5Q7KMtL1Y4uYA7FJanpDtYugxcVTvXnxi9Yb2kW
         Qd4P2eQl8dXDViW81BiTl8GRfwvcM17YWGXJ21rF4fOyx+9GdwmjFJuZEwW8knhYb7y0
         3N0g==
X-Forwarded-Encrypted: i=1; AJvYcCWXtAi6RCKxKWz+BGl6g1qoH/iZxMjzu14EKYQAXrDG2ywhcsSPPs4wRZDK7SNjRt8gBd7weJhE8Tg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0EJTMPGf6jBhx1FVndOoa1YqCgH7bp2Zn9sCRi+JLMou5gI2z
	uO75CWFf+qbxDbQ84/jr1mB7d7qcmgFbP6z3HNSdNkRtg6wi/vesRqK6Jvd4KJsmjUI=
X-Gm-Gg: AY/fxX7e2zR36SfD3cae7iSoMHZtxBQzoLa/MD8LytUuVyW+haDn1j5KvQ2dyC54QX2
	kMqOyuwpjPXH/Ee0bqQ/asySTEe10LBUfl1jFBZduqEZduzfG0UVgRzJUvf012LuTkjwN/zHA94
	28XvzrS7CwS3yK7lZhEGomV8VA/1b3cXfA57q2I0emrmROCttb8rN7RuS1lGRFzsKKFcQ3scOGA
	mv1ZOkAJFu7GFUpLWR/lkNiH2BI/9LL73MJrnSEjV0Z+JfeHIxdPs3vnHiFT4JCGPIhWlVdcxm+
	EoGlbqBpP/rD1HiKxuxbKEVP9bNdFvObhJd0dACjzezyYBiNR1/xDtS7ZXsBno0RuPuGXKHb17C
	U0XdJu3z3ii1D9+LS4RzI6fTzsZKFn3n63ZLRNk8O6koUOyruGHtOnCoUdfhbzk5seyif4NVaFl
	NRMcqbHxifbqDWPB0yE3xxoWswe6PJ9Cl7z1NPFuyjuHEtW4JO8H5VeI23Kqws5Yg4N94Bi4G4v
	Mmwity3
X-Google-Smtp-Source: AGHT+IHeRAtPKwVz6qoPOdL+Osxtu3PLTheDOvUOr8YysaVV8Js4PDKym39wxYhmLqVHZ9ksN45wJw==
X-Received: by 2002:a17:90b:3c4e:b0:340:c60b:f362 with SMTP id 98e67ed59e1d1-34e921131a2mr14020700a91.6.1766521277662;
        Tue, 23 Dec 2025 12:21:17 -0800 (PST)
Received: from fedora (dh207-15-53.xnet.hr. [88.207.15.53])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-c1e7cbfa619sm12567549a12.36.2025.12.23.12.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 12:21:17 -0800 (PST)
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
Subject: [PATCH v3 11/15] dt-bindings: net: mscc-miim: add microchip,lan9691-miim
Date: Tue, 23 Dec 2025 21:16:22 +0100
Message-ID: <20251223201921.1332786-12-robert.marko@sartura.hr>
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

Document Microchip LAN969x MIIM compatible.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes in v3:
* Pick Acked-by from Conor

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

