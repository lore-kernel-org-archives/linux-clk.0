Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02CE070807
	for <linux-clk@vger.kernel.org>; Fri, 31 Jan 2025 16:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738340941; cv=none; b=UWg8C3sOTRp9OxGDekKZWCdehG6QfXwyxt73UTdMH0Stukm6FqvyS0JQFAtZgix02Jvx61BkAepPoIgn17ft//4FMk4dbU3rmVzY+6kWnk6gzqFLfCVKSsCJYGTplJjwLGdy4V0WIwlYGCVNHFlzlEOWqtIejY0KBeD8qk6seg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738340941; c=relaxed/simple;
	bh=V+XH+LiN3DIHa7BqAesNVb4/Wt5RwOlnoDZW3X7Tm78=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GAR5KZUd0hpbhq3D/907KJpIog2ShR0jqxfLF+Hk1z0bQ+oamM9yGQiYiPceEsr+n5SkV6wDvEhu0NyMCrLSeoS+JiKnKka34phEhq0gYKhknYj4SfW723XrlmzxEXx4L59YFbfykYSVrM6Yl/d01nZfqOvhCa0tiqq0ErZuKBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=JO7qS9Y7; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="JO7qS9Y7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=WYs/kgR9xMvuWj
	r1kYMsrWbEPHqVE+5/a5Cq1MDfH5U=; b=JO7qS9Y7phyeFQYKpOU91lo4w25C7t
	TwA5y/Wlic3sbPXCxmmcoePWPUf5ENSvvAQvg/t5/+CdjNb3y6QtTbnBsTgXeeEK
	1s1Miwb3h8+ewBrGxYDiWJGB/aaHjzdBqfdkxnrCJnBEAPzVJ0yzQdmIRYUKQgq/
	+JBTUsJH2L5X65gEr9/5hhCxZ0sCtQh8ZODM/K2aOnk3xLl+ytrnQWPCEVBXvBs7
	CkDFH8aQA80Qlc6CTjPA84voltLgc+bAp/ZpGtzXgNBAQmz+j/LlahqLJQOXaw2F
	uZgWRzCL1bty1h8HfpvT5CImumQEcwh6N9ccdqiLUhnEtH/iNBe3mqag==
Received: (qmail 1739795 invoked from network); 31 Jan 2025 17:28:57 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 31 Jan 2025 17:28:57 +0100
X-UD-Smtp-Session: l3s3148p1@CXwTCgMtrP3Uph5e
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
Subject: [PATCH] dt-bindings: clocks: atmel,at91rm9200-pmc: add missing compatibles
Date: Fri, 31 Jan 2025 17:28:45 +0100
Message-ID: <20250131162845.33637-2-wsa+renesas@sang-engineering.com>
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
 .../devicetree/bindings/clock/atmel,at91rm9200-pmc.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/atmel,at91rm9200-pmc.yaml b/Documentation/devicetree/bindings/clock/atmel,at91rm9200-pmc.yaml
index 885d47dd5724..8b65390d2d54 100644
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
-- 
2.45.2

