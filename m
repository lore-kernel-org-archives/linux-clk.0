Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 903A92BDC32
	for <linux-clk@vger.kernel.org>; Thu, 21 May 2026 15:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779377819; cv=none; b=tl5hoHSkqH6gET5pSyEjWFnzRg4bHW6kAbpmuJFy7WwxmdtL1gCRqismmqwCHzhMJi2W49ofHaQ5ILaQOUwEXCaaF4Y1/gQsUBD0bDbqx9FVg2Jkre+inUlYbtVmsGojHtpdzNRHmKuZ/ghaGDrby4X0lnGsbp4nXPCfwOhCCHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779377819; c=relaxed/simple;
	bh=FD8IvK1gXQx5wLqh2EUIHl/A6W3peoBLFvUS6imjxoU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lbd78IF03Z5qf7sxgi0IOWfeEElpgDbTLYTWgcF9XFhYITeO2dJXPfyOVNaL5gqxH2lL/9Z7Pa1zREEACg3gKZ3OE0fMFsZu9E+lzcyfZy4nhgMONv//Z5b+1PxCs7pHdwA39HiboUOnlOQPZik4fetEV8KN3tuxdqGUjX2yJU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=orLOn2EC; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="orLOn2EC"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48d146705b4so69473755e9.3
        for <linux-clk@vger.kernel.org>; Thu, 21 May 2026 08:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779377816; x=1779982616; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=atavLJO9ib3dVO9oXs0ZfRhlR41n5og9pxT0XRvm9dc=;
        b=orLOn2ECKDOEFtB6WvL4t+HhrcdY49Z5P0pZIVwla/5GYUOYJWYjUNbm+nNqoJVPKs
         mfsoOzAs7MKUYxZzgs8+t+YVxmD7nYXbRloKM4IkYYsF3OfYqlUcVvBC2oxKixw2UpHp
         Y7t/W9qGFqfvYONlm+AMHfLPeTwP7kuqdbvEboZLuHgMquVxhQXZ3NhhMQt7FFMnHhMT
         BNGaaVYTsgk0+FZftShpBaAbM+H/oZ0t1DEAMYDiNWVvdi4xjG6uyhV2Yo2cxB0gkn12
         uPVXUBOJ5heeoUPzHbY7Gv8xe0wt1HRn+cfe0QxeeCwwhkR0AkGm7owEWN5rPEHsHf5W
         P+Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779377816; x=1779982616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=atavLJO9ib3dVO9oXs0ZfRhlR41n5og9pxT0XRvm9dc=;
        b=oi0/rmLIYzbN1HsTomItC/0JmXW3OQDMXjV6J8jw/nUJCyeHRq/J1L918XBAvq1SiI
         kZzvbWV83pqIMJZjHh/B2aUABYd7LG38li+XDyaqcYK5uqdiHxnLb6eIfmFCSY8b88FF
         +6WS+tpt7VFQFNWRwczPvI7WF+JYsJUA2hKLNqyiWn8O6GBZJea+SDOV1OfjSRyYmTww
         5Q9cYDBKCXIFH0vzznkK2S6Zw25dDSMdgbRuDTEEB3LilDTgDOl/gaaNvrTlVPN5UG8u
         BJf7kZkDWEeveffO0lKsldEkvcdnJZIh6nTVt4QGsd+60TnWUv94mi1ZM3kWin34hXGR
         ZJNQ==
X-Forwarded-Encrypted: i=1; AFNElJ+aX8kl5T8O8Oo1VCuallRlSzFRJx/18VZ/hweSjgVIM0cMZwgwbqsv8Vq/0KKe30gjIH6k/y8V2EQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzrIAkUmpkWfhbtCIitp9V5Jfq65SAxpU9frvyZEzditb7/2jY
	T4KXdjaH+JODZrhs68cceeHVo6OaVxcAPY4uZjDSnPlF/Xns8zvh4aY4
X-Gm-Gg: Acq92OFRekmxM1ZBwfBn9o/NejD1T+fN3TXJ8rOIF3okrI5pTNlaydJ3jGt2F3s1Ysx
	YyyGT/p9js2+xYPNX5lYGUHKhe/db9VCLcZfOCtDmEa+cENsCiIsVbkSKKtcfHdiP/663B46Q66
	P7A3fvg+fwOfHtx2Rk9z22VJ/+ntkfw8+/4V2XUvGpnz4o5EBWWugFHHItFZ9+jLKUR+39Sf052
	HAAinE6Sitcdsx+XE2QF2fYGGtjnMLzSeU59I+co7AQzj8EOT/cYIFcPAk9kdcMY1cMX4xNbNDA
	OkONlfr9moEtaG4uz+tDCxiyR5YnPWUJ/9XOLittbDNFnjPJzvasMzAFivTYsRo32Cuj1U7t+Wv
	W96IzadFacHC8VGb5zn1yq+529Zkgd5uzTgu77r4gZ11lU6h4iUmDYTncVfv5ae1AImUth/9lt8
	Kgvgu5waFO2g194IOQbHWvC/svthyW6ms5UM+UaeyyePil1LAqD4jPS4Ve3SPA338=
X-Received: by 2002:a05:600c:470e:b0:490:3ec9:8711 with SMTP id 5b1f17b1804b1-4903ec98789mr14784095e9.18.1779377815576;
        Thu, 21 May 2026 08:36:55 -0700 (PDT)
Received: from Ansuel-XPS24 (host-79-22-5-99.retail.telecomitalia.it. [79.22.5.99])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49033d9edcbsm79159825e9.13.2026.05.21.08.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 08:36:54 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v9 1/5] dt-bindings: clock: airoha: Add PHY binding for Serdes port
Date: Thu, 21 May 2026 17:35:52 +0200
Message-ID: <20260521153645.7028-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260521153645.7028-1-ansuelsmth@gmail.com>
References: <20260521153645.7028-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add PHY cell property for Serdes port selection. Currently supported only
for Airoha AN7581 SoC, that support up to 4 Serdes port.

The Serdes port can support both PCIe, USB3 or Ethernet mode.

- PCIe1 Serdes can support PCIe or Ethernet mode.
- PCIe2 Serdes can support PCIe or Ethernet mode.
- USB1 Serdes can support USB3 or HSGMII mode.
- USB2 Serdes can support USB3 or PCIe mode.

Add bindings to permit correct reference of the Serdes ports in DT.
Values are just symbolic and enumerates the Serdes port with a specific
number for precise reference.

The available Serdes port can be selected following the dt-binding header
in [2].

[2] <include/dt-bindings/soc/airoha,scu-ssr.h>

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/airoha,en7523-scu.yaml  |  9 +++++++++
 include/dt-bindings/soc/airoha,scu-ssr.h              | 11 +++++++++++
 2 files changed, 20 insertions(+)
 create mode 100644 include/dt-bindings/soc/airoha,scu-ssr.h

diff --git a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
index eb24a5687639..913ddc16182b 100644
--- a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
+++ b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
@@ -23,6 +23,7 @@ description: |
 
   All these identifiers can be found in:
   [1]: <include/dt-bindings/clock/en7523-clk.h>.
+  [2]: <include/dt-bindings/soc/airoha,scu-ssr.h>.
 
   The clocks are provided inside a system controller node.
 
@@ -50,6 +51,12 @@ properties:
     description: ID of the controller reset line
     const: 1
 
+  '#phy-cells':
+    description:
+      The first cell indicates the serdes phy number, see [2] for the
+      available serdes port.
+    const: 1
+
 required:
   - compatible
   - reg
@@ -65,6 +72,8 @@ allOf:
         reg:
           minItems: 2
 
+        '#phy-cells': false
+
   - if:
       properties:
         compatible:
diff --git a/include/dt-bindings/soc/airoha,scu-ssr.h b/include/dt-bindings/soc/airoha,scu-ssr.h
new file mode 100644
index 000000000000..33c64844ada3
--- /dev/null
+++ b/include/dt-bindings/soc/airoha,scu-ssr.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+#ifndef __DT_BINDINGS_AIROHA_SCU_SSR_H
+#define __DT_BINDINGS_AIROHA_SCU_SSR_H
+
+#define AIROHA_SCU_SERDES_PCIE1		0
+#define AIROHA_SCU_SERDES_PCIE2		1
+#define AIROHA_SCU_SERDES_USB1		2
+#define AIROHA_SCU_SERDES_USB2		3
+
+#endif /* __DT_BINDINGS_AIROHA_SCU_SSR_H */
-- 
2.53.0

