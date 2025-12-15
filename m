Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 506CF335546
	for <linux-clk@vger.kernel.org>; Mon, 15 Dec 2025 16:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765816727; cv=none; b=q/SIioA/eXdG/ztrnhSyQ8Mx2C7OOd57IqrMbLrk2XCbov7rI0llpMempVCkC4CM9zUQW0zSuH1r84c8v2EeIhcARFbE5cmOvxCVAeMFSB2mcubV2OrkBSZguiybaP6aehRy343ysqlf7Dqrm7YLDY6cXDSbb9HtypYZsEhqUtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765816727; c=relaxed/simple;
	bh=Wi9AS/Q9Z9rJWlYN+9bptQ35O1l7qMfPD8Nl+Hhabzg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OWW0Plp+DMTH5O4Hf151ueo06nbySYFbnmqZmIGyzLrQIawvZVYfAAHCXddytaNHxLkkoNXh8+zy7wIPdez8rWGcMYLgmK5lx6Lkk+qXb95ud1Y/mc9suV9v00dIuMMEsirrk4Qq7MIf5dVehMnwOVQCQ8iaqKXfTTqLVMyTFd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=mh3bUpSK; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="mh3bUpSK"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4779adb38d3so28325385e9.2
        for <linux-clk@vger.kernel.org>; Mon, 15 Dec 2025 08:38:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1765816721; x=1766421521; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2dr/KALHxcw299I9hw1j3lrM8oXcQDyuqwKf9keXmbo=;
        b=mh3bUpSKu6JlE2ZCje7XOGuaHUYeu2cxxu+IFs9v1wVAGHi8paQTpFs9+NH5OVCp0N
         IaP1HdtWkevWI5zyVvTj1IT/ssgm7NUeftrGx6xtKwNhtFX3HeSnE2DO8hvKzvkvMeqK
         bZbhFfk/QeR0QJG8UnZ8noCrwYcXUu0soBEQ/4uABPC2yg0ey0hv1kKgLI3f4Li5fb48
         R22A9VIhPq666CCEvipUWez6Zxxu01uB+fdRWpn7Ka1i/uiypH1W0PqYYEw8+Rl34yz2
         JtFz/ipWF9b1RitIgLBKMqQMVUoZyjMQPSiOhcuTPsd90t1A2ohaklznD+C81YD7CK2a
         4eQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765816721; x=1766421521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2dr/KALHxcw299I9hw1j3lrM8oXcQDyuqwKf9keXmbo=;
        b=XTbf5huc/xQRDhcJ4M8v7lykzOUtziXk0LWgFhZ3l+bZy/65+49REyo3I5zwc8WLCv
         MPP6PUT1zgjsKYJO773skB2ZscTANIrWVKEMt474uHu2xDQ3mgfwYgpHgc4WGJMrQmGU
         m3pWRnXhFnkP47AUtq5K/2zEZ6K3BIJ+dF40ASWBXe/f42ps42dLh0VNsMOcI2kCNpLd
         egRCllXRNwt6aoh0ZjdVIjC6opYMgwWeHYKBGQjoP+Ch9/PQpvhp3YM0meT+XV8Xkk6A
         LzkUhO5hkwUCCWu6PoXniDV3Jl2Zcg5fnyhZgUl/fgGPzi3Fvy6dX0DtimyvpgWQDspI
         89rw==
X-Forwarded-Encrypted: i=1; AJvYcCXeetAnUxOHi7BuRncqaD/uRG7O7kcjTLLx6eoaYIBBI44UE7GlPMWiTim4kFl056tjEQ1DPFzlPk8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyl9ECd++pwpW4+pgOjHp4tCWNX297UBOcpJb/pa02fB1vgpvjw
	1uh9DYsnwA/CNugNWUo4iOYGcdBuncXBed3kmlOeoufGyqOUenKpr1U8NZ2kYBBCiBI=
X-Gm-Gg: AY/fxX6yI5t+MIs0a/QS9JRyKnFhxc4s/0hQTxg8UUCjTuhwkf7em0ng2x/g4eWl/w2
	Dhjl0IHPA1nphluSxbJZ1JPJQDez7OuvxouD6vuJXXcVsy0FYXRKnIvilMlgYmjnjaWjfReXNsj
	+l3UmJJNCuI+WTKYkgnIM6ctK4a7goAt61xPc9RFAiWYN4sS4szt65zr2j1qmw2R3AFekvMgQwa
	fxXewitRizWfRomxIuJmd4wqbbKBsgP+NUw3TJiOfYBPB5y4b/etXfbVq8/kWGK3boceWAhYmbp
	OVOgtWEPzBsXAzQI4J72+gfv67g6KVxG8IpX5oFRxlu79Zr+0oJVGMGpMpB8lS7A/v4AVVVMhBo
	OLdx/XaWjM30fWYwPlvE6Oqd6QNdnDFvw4R3Lq96VmNcssGicg1/5LB2J03Gx1xZbviPpwKYv1C
	Py5ufwcm8meiaVhllFi9jiNOYnkl9IGwW27Gq9MJwGQbAN
X-Google-Smtp-Source: AGHT+IHVHrhWHHd5t7v+NK+1xDZQB9RPKOfbhSwk160Kp7+0yxWrCigeVebl1Gn8PfXk1Ze7IDyXTw==
X-Received: by 2002:a05:600c:64c5:b0:477:b48d:ba7a with SMTP id 5b1f17b1804b1-47a8f915607mr114002895e9.32.1765816721213;
        Mon, 15 Dec 2025 08:38:41 -0800 (PST)
Received: from fedora (cpezg-94-253-146-254-cbl.xnet.hr. [94.253.146.254])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-47a8f74b44csm192209725e9.3.2025.12.15.08.38.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 08:38:40 -0800 (PST)
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
Subject: [PATCH v2 06/19] dt-bindings: mfd: atmel,sama5d2-flexcom: add microchip,lan9691-flexcom
Date: Mon, 15 Dec 2025 17:35:23 +0100
Message-ID: <20251215163820.1584926-6-robert.marko@sartura.hr>
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

Add binding documentation for Microchip LAN969x.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
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

