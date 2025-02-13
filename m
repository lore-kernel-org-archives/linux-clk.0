Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F5420A5DC
	for <linux-clk@vger.kernel.org>; Thu, 13 Feb 2025 09:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739438864; cv=none; b=FDR72OaYbixHzXCeh3rembLoWHwqiYKStiQvqR2BGzdPvkQH8s0ae1aLf3j7CAQlvaAWUkweRI6Zvx1laJ2Z235sGdSwlPYLV/w/JzOVnZ0m71fI7P/iHhtARD7Wgcp6UyYgLcY/2saJdE+s52r02eprGyXrjAQFbBVaI4IdTd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739438864; c=relaxed/simple;
	bh=VDL0uOf7T+TaCXbMfwI4rehvDdg7Qqg1J9JvQJ5p670=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gMIaJOQC51wAUSagIWgrrZlZkOp53vJS+vtGqzTEqsRCDduEdAAw5wq9Q/Nn83XvN8KbC+97NYMft9BccFkjxAEfqQR5qq9OuMnbKQfAH/imnWlFL4/xfTsc8u71TDLieCCHUN7RsBQyrHYR5A9ro+hCbNKD7BceMrW0gkWx4+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=SgYp9BO+; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="SgYp9BO+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=HUhoK5tjELfjF0
	VqSsnZsbkAizYp2E8hPEyT0wBFLSU=; b=SgYp9BO+sJEDfmB6Dla7eOwn+K7vbG
	f+PSyGCy8Um/Gk907fN5lQbRGOOTm9xC7lGPK/rhyUFBqXwwTIpWzKjz8gAvpxIh
	bbwt56fszeCSRw/vWlAfZ01U90t/fHw41zPTJNpF4TlzEC9UOP6nmks2uAdQMga/
	xg28hCz/d7HEpxKFiJVp0Q8d5iaiXyc2dkkgI2dzmsALBpfvDs1m1UOqqELRQ5ma
	hqto6+7Bn/uBMCa6AssmmQfyfuKw6nrJgwRslKqFkwJM48NlSQ1F4pu0sDFndk0a
	I1NVAkLHToUckfzOcyk+mYRpH8Ic9eYnjECoMqJIjV2fWVDVmMtMLhQA==
Received: (qmail 1812528 invoked from network); 13 Feb 2025 10:27:31 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Feb 2025 10:27:31 +0100
X-UD-Smtp-Session: l3s3148p1@PcbTqgIu6LVehh99
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2] dt-bindings: clocks: atmel,at91rm9200-pmc: add missing compatibles
Date: Thu, 13 Feb 2025 10:26:34 +0100
Message-ID: <20250213092728.11659-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver support more SoCs. Add the missing ones.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Changes since v1:
* add new compatibles also to clock restrictions (Thanks, Krzysztof!)

 .../devicetree/bindings/clock/atmel,at91rm9200-pmc.yaml       | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/atmel,at91rm9200-pmc.yaml b/Documentation/devicetree/bindings/clock/atmel,at91rm9200-pmc.yaml
index 885d47dd5724..e803a1fc3681 100644
--- a/Documentation/devicetree/bindings/clock/atmel,at91rm9200-pmc.yaml
+++ b/Documentation/devicetree/bindings/clock/atmel,at91rm9200-pmc.yaml
@@ -34,6 +34,8 @@ properties:
           - enum:
               - atmel,at91rm9200-pmc
               - atmel,at91sam9260-pmc
+              - atmel,at91sam9261-pmc
+              - atmel,at91sam9263-pmc
               - atmel,at91sam9g45-pmc
               - atmel,at91sam9n12-pmc
               - atmel,at91sam9rl-pmc
@@ -111,6 +113,8 @@ allOf:
             enum:
               - atmel,at91rm9200-pmc
               - atmel,at91sam9260-pmc
+              - atmel,at91sam9261-pmc
+              - atmel,at91sam9263-pmc
               - atmel,at91sam9g20-pmc
     then:
       properties:
-- 
2.45.2

