Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1B4433030E
	for <linux-clk@vger.kernel.org>; Mon, 15 Dec 2025 16:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765816720; cv=none; b=o0DKRKZr/eZeJb8wpBWuSsUT7/eRCU/dVwQNzD1jeaJtI9Ksft8+u7KCEUIbt6bvyRZG+4CpHIKQV62RHYzqPU3Dg3Y6Bnw5TOfWFmM/iOozYd8mKrgo87UlpX92EP0DEpbZnZwt9G+rwCm1tw1PMRnLDWQgcNhZE42z5CboOoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765816720; c=relaxed/simple;
	bh=QNwkm9U81awz7MWrlZNJ8gv2P0ICIp/KsNuSQyBzV0c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c8y+r+ObfiBAcqIGfKDv+GhhA4LkqY8t3WxK1JbBEhJbrZ4RrDhgspzR5Yb8iuVTOs/qL3sz4B+GdPBO/ZfCSeyTIHRUy1bMjBJtyo2/k65rRE2xYCX/7KayZGZoBYIYgoCjk7UsOL90hIWTV+3jCuNvUoR5vS95IcW2Nm4yMXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=NsVvFFhS; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="NsVvFFhS"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4775895d69cso14964885e9.0
        for <linux-clk@vger.kernel.org>; Mon, 15 Dec 2025 08:38:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1765816714; x=1766421514; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BxaNMbhOAlt3TDMVPp5Rm4PIt/K6yh2QHyxLJcGOJ5Y=;
        b=NsVvFFhSrTcmsEq+9aWzF4cCJXY3RNtfTOELWK/X7PK6FcAKCiLKNqtYjY2FMogtrO
         PLt8Wd3BJ2nN7qhu9uLiiubIO820dt42IeB40vKIzDQhYuvBsk2DodCyA3iNPLJG8Pmz
         KGhKAPGRnkY7L2iWfDIL8RhdqfuuBSwBNYa33s/hhufc5wmQ8rjIih/h41yQ9unmNYFW
         HXB0GajUAQJZ/S6eLuOag6yycLOYvqFT3BOCA6pV+RziKUHaUgAy5tRVSj1xOK2iW2LV
         /SJzx0opgUKWAysIRljHP/gNLyBP1exfX27FAnuEng7fgZdfuN5YjJuDd20q495urx7X
         l/bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765816714; x=1766421514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BxaNMbhOAlt3TDMVPp5Rm4PIt/K6yh2QHyxLJcGOJ5Y=;
        b=p2WJCrv7Sx0hkOukmp5bbOBU91hHT8gTRwSAOJxNuQ8ccbQ8VSJwrPJE6zQILcGp2X
         5XWaKzIOCaPNUzKm2Fcp6IKMy07Qj19QWe6yp/8duc17EFwE4sy1QFuMaK5s+E7KemLp
         ept8tR+SS0rmLwoXXZpKbZYdrw+ugiFZTH4VR32BxpS4pzyijuVAJQL2ePh3Im6K5vSK
         PA5V46owO7rfeY5OXXtO47zOPlv6BUs7EwvbeUUNdaWSPiCN5bi5BJLr8d4Z13NZeYlT
         VzwCqkbpPPj7A/jqlZ7/0Wcf7kFz1Qj9wqjzQB6nAxHo2iv1ybFjQNo8X7RKNjcRWOhj
         KYPw==
X-Forwarded-Encrypted: i=1; AJvYcCUU2BC5QQlcVixLkdo8Rsvs8UPFaiqX+WArrx/uRHflZ4tY7r/XweZknK1d7DVlOrsZg5cPKcKDjNg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6E+f5QzWwX3zNDM+7RTD0wwgbbqbh7E0pUjoDcev2I8J9xCR9
	v8qEkvqsC1JcydHKUutjMcyjXWM2XfdM0ZDpOKoywhA9GccYBA4lHFAwcCS7ZV2d2qs=
X-Gm-Gg: AY/fxX66kz56QhkhLD6D26cytNkMv1fY+zhPFqd0zd9nC0T9wk7k+gbqHhnxzK7EgPj
	bxuXD6L5vmsjSQtamIAaZFE2f1zR9hH+/e/qrrb0pV0CgzWJbZ3T6XoGTYkI6PqC62a23OEaStl
	W1DmYtPVz2Xl8rsF9SRXp3yvlD+gRzrElUY/KjSbEIrFJuKsH944bvPYgKcQ+UUcdxoKJi7KOB7
	AbVarSP1qUI5/6bNWcWmdSuRpCKaTrGgQV9V6mD/nxEug+kTiozMOxwtVN9BnF9PUvRNA7CqfMR
	J2OSzR1KkT/7DLh5Y5gBJB3UDcSJSIpzgHzQDrOTl9sujgTN+eZLrB6ynUafEFgChfSVCZHcDJu
	1ZtMvFvy1VfGvFoqo1JJpct4K1J3n6qW7Vfpnx0r9nG1hbPJcfm1YeLJxGepI02T/Kcsn+nVAGu
	OSH3tVE8F89czXeHh2IMU1b/K4gOCAxUtqihroo3wDA4au
X-Google-Smtp-Source: AGHT+IFmd5yjjsN4pJIoEKmwS1dt07aTMkZ4FgJk47aEX+6lFjDEQnmHIR80M20dZsQbY4fZQ9SOEA==
X-Received: by 2002:a05:600d:6443:10b0:477:7b30:a6fc with SMTP id 5b1f17b1804b1-47a8f90f371mr103502135e9.30.1765816714084;
        Mon, 15 Dec 2025 08:38:34 -0800 (PST)
Received: from fedora (cpezg-94-253-146-254-cbl.xnet.hr. [94.253.146.254])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-47a8f74b44csm192209725e9.3.2025.12.15.08.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 08:38:33 -0800 (PST)
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
Subject: [PATCH v2 03/19] dt-bindings: arm: AT91: relicense to dual GPL-2.0/BSD-2-Clause
Date: Mon, 15 Dec 2025 17:35:20 +0100
Message-ID: <20251215163820.1584926-3-robert.marko@sartura.hr>
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

As it is preferred to have bindings dual licensed, lets relicense the AT91
bindings from GPL-2.0 only to GPL-2.0/BSD-2 Clause.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 Documentation/devicetree/bindings/arm/atmel-at91.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/atmel-at91.yaml b/Documentation/devicetree/bindings/arm/atmel-at91.yaml
index 3a34b7a2e8d4..88edca9b84d2 100644
--- a/Documentation/devicetree/bindings/arm/atmel-at91.yaml
+++ b/Documentation/devicetree/bindings/arm/atmel-at91.yaml
@@ -1,4 +1,4 @@
-# SPDX-License-Identifier: GPL-2.0
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
 $id: http://devicetree.org/schemas/arm/atmel-at91.yaml#
-- 
2.52.0

