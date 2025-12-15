Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 704AD338F4A
	for <linux-clk@vger.kernel.org>; Mon, 15 Dec 2025 16:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765816748; cv=none; b=h7oyZhQTs/pbIl6sw2ATz84cynOhIh2het4XaiF8ulcNWzcn2gjLwR83tMgyVasROkh9/69akTTJlIWzR0kkpQGOI0Dulk/Uz4ANAv1E+ckdzXLd9oFzI9ZbZLZG0G3tBkYASzi3IHbEurLfa2b2FFDQkalPhKpwbdnss7ahN4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765816748; c=relaxed/simple;
	bh=H5qZHJBlkQV6+/j+zTVqie7Q24nFHuF3MlV57DgQSPw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bGIJoW+6d75Rexsf9hWVV4Lx7QH42Kf0kAhBAScTaSRK4D05etO/NAer+7c8FlHphM/Nvo7NP11MLAxv2OQpppPanWnB7JIgrhlYo+Wl+azY7MMETE4lsqnSJ2lD7QXyhH7SLnG8C8r1dpTvR2BVuj34Gag+X4l2osRgJuXX/pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=g+Jpw/Rq; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="g+Jpw/Rq"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-477b91680f8so36978625e9.0
        for <linux-clk@vger.kernel.org>; Mon, 15 Dec 2025 08:38:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1765816733; x=1766421533; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cvy2LXuomfpj1nBing2L+jv3vaShIDCdMet4k/EboCs=;
        b=g+Jpw/RqdSE8R3RrrjQvhbjLiVU5JJvGAMD4icDPe28PPyf9q7p33NAR2brta51Jk1
         vhKfrzJqyBKDndGSaKieS7beK81YB610auUCmT+2t2R9OxgxySm5j6UcXqt7vDwr2yca
         IuvDhLzV7LpgZ2naTmCudKK9fP60HkJlmNpO5/Svow1GgRTRosFh1KiW3zICe/wl6SKe
         gjELLThAa/7h/I8jFCkxujmPa2VFPMEilRd1q68bEJMPgd/hEtLuCCXGcHJ6yfTsFE3e
         VjMvyu9I5um1nsezeE1uGkkQJcEcPANF4u/Csjni370le8TjbMdqiTU/AQK+gb7/fSl9
         q2LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765816733; x=1766421533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Cvy2LXuomfpj1nBing2L+jv3vaShIDCdMet4k/EboCs=;
        b=exdojz+w3pUyVZLu9W6U4X2UkpLgg4FZrHMKNSe0JxkgjGFq2+3ogSZV6vgOLEQpRc
         AK0Z6lo/ESTxpj/SE3UE6fF2BggRo+SFXHKmL3H34oco+NVOR0Oh+HOyOpDinKGSnECy
         X/FQc8SnP7b+DxUar+uVi5JqyHFwfSHTYgUtGkDiG+2B49VIEzARG15rNW2X7ebbHjVl
         lwsxTPFXhROMeNY5/CyfICDo5/KbEVgqj/g+PlRkaNvIY6DY8NvEzv//YA3SgwzxuMMk
         9dGfJRWMcPS6jsfFi7WNabNGTMjsNcd36OkcFFQBAYlUJTvOMjyC94V5VTnoaaLluHQQ
         zyBA==
X-Forwarded-Encrypted: i=1; AJvYcCVvX+XxqwOG4OWXoL2yt7iLyCi56gC0iWGgPkg0GySGAQ9kAqdSbFTXtkD0gvIrZSRuMiU/YcaHblc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvyEEPZhE3WDP2D2CdeEKOvWiTG2AbbJVQKSHKMKqmSyab0i9x
	1g/XQbGPVAeGoGQgbMscfT2QS0C2DRgzI0gdCENPlSQ7lj9aztijXhP7riZQ6DdF2Gk=
X-Gm-Gg: AY/fxX4jWBp9JYfTp9Dw3zIXrniTgGF3EnwIbVY9r16MllLAPGVdty9vakhTF90owU8
	iIm+EyRan3iiNKW7dPVhp+xs3WKmqsBnEq4JP90TtzwLwUaGwH/Uh4xCmQEIeJRTZ5y/oQOz2+A
	WS5w27duRrcksq8b+kwj2++QMyUUMOrVuvlxErRw/nQ0+GJAUzjYfjFmqNEFDvNq2g4rojrtqHr
	jYtYgpvuJPepw6B6FMLSPdu8ySqnuYzfFSA+Ufw2Dg0HFeabffdhjWvvV/y6VlMCRqQlypt8PcD
	Mh1hJOpdnzcEMYnoK3Z1o//WMXGZoYnzuxLec3nMgcBsV5/pJx/IX2OXxpaxauG0NxC2WXBbpng
	5gZS0ZGS0pIPqOtM+pY1NckJVVD11p4/HntWKkxpTwfIbH/FSJIQHQ8SOcxE/dkwomadtXvhCN3
	Wgpd7Ndnj0ztjdE/882h5Ksxia0VkcTd2JwpIsaVcpldWH
X-Google-Smtp-Source: AGHT+IFiI7Ni2LKcVl3YPoJbZhPL5dwoIiYSj1m9w7GWGjr7ZRqjP07iguNywDfLKiIq9PsRU4kDWg==
X-Received: by 2002:a05:600c:64cf:b0:477:58af:a91d with SMTP id 5b1f17b1804b1-47a8f89be65mr106452615e9.5.1765816732996;
        Mon, 15 Dec 2025 08:38:52 -0800 (PST)
Received: from fedora (cpezg-94-253-146-254-cbl.xnet.hr. [94.253.146.254])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-47a8f74b44csm192209725e9.3.2025.12.15.08.38.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 08:38:52 -0800 (PST)
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
Subject: [PATCH v2 11/19] dt-bindings: crypto: atmel,at91sam9g46-aes: add microchip,lan9691-aes
Date: Mon, 15 Dec 2025 17:35:28 +0100
Message-ID: <20251215163820.1584926-11-robert.marko@sartura.hr>
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

Document Microchip LAN969x AES compatible.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 .../devicetree/bindings/crypto/atmel,at91sam9g46-aes.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-aes.yaml b/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-aes.yaml
index 19010f90198a..f3b6af6baf15 100644
--- a/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-aes.yaml
+++ b/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-aes.yaml
@@ -16,6 +16,7 @@ properties:
       - const: atmel,at91sam9g46-aes
       - items:
           - enum:
+              - microchip,lan9691-aes
               - microchip,sam9x7-aes
               - microchip,sama7d65-aes
           - const: atmel,at91sam9g46-aes
-- 
2.52.0

