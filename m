Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A728391853
	for <linux-clk@vger.kernel.org>; Sun, 19 Jul 2026 14:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784470369; cv=none; b=F3q9J+5pQSZFJkR/BQyDJXeyXZstFQo1Iuad5QI4hIhVeVAX+nNUukDypxAKAnIhu3RjsdtrBcJOoQuEP3Vd1EzMiBUvL4rf1xC7Py7AjwUgHADo4k9venYPxtVXEoprK/isghoLYdoa3AlcGtX7UQf2dw63PDIGUBpRPnAx3rA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784470369; c=relaxed/simple;
	bh=xSIfMNUlR0w3r1Tri3/aU3oOkWS9pk//wgKxfavPJww=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ezx1S0F6he3kG0A11ZHHbs1g1rrittFZBO4MIs65LlEBBmQCgSUdlwiHkUR/flv0Tq2FdhseFAA4Ddfa1sdWR5K3fZLTqoebwunLVMqvmS02xfLh4kJrJ8TL1lOAof694JBE/tUIH2bQx1gGW2Sz7worn7NySnhmmYlc4G+tR28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ELcqzGFM; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ELcqzGFM"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49554ebb87dso9077965e9.3
        for <linux-clk@vger.kernel.org>; Sun, 19 Jul 2026 07:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784470365; x=1785075165; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NKVLLdp36yWyb0LBWITlczPVpDLZSh0yZVSkaD94rGU=;
        b=ELcqzGFMVLv9oVPmIPTBrnu5/07yKoPOTJU5wKNI1iaE9FVX8Ff+PRLj+k4pFYB+yN
         mnw09GFzJNW16w8ZPlZ8/kk/6nM2/QB5JLKLSbzkcwBBXstnPaPcVe0Yw1gj6ERjxBHZ
         1Uku35FiTHChl1D772WjMIt7sjFPyHVS0wXwL0OOoQUUNykCnHZ6cyONH8v6bMZH949x
         xkqcSGzOSp6ZNmRwUiaY4FTt4bWI3EhzWBWMUWZwcIzohdFoIUTRFRGsv36pXLX6x00i
         FcpvWetGi+oO7CgLxpSQFWwWDlry9fc07VTkJK8pA+LXUR3E5d2CiZ8W7dCrPvveQAZv
         ck5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784470365; x=1785075165;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NKVLLdp36yWyb0LBWITlczPVpDLZSh0yZVSkaD94rGU=;
        b=eDczumNb9etIcmY7GG4nQXTBaafkUVKnSX9dmOZp5aYL+RZDTyh3S9ACYTUK1Fo3Z0
         cpncZjX2Ez4UiGIwBUyGhTis5SeOtP0P9TCofTzBCzf3M58OMsasX2VIQsp0fy3Samue
         dNkJLZxgQ/Nthnie0AdqFCZULZYzQvYYNPgwqFapKOpojAJRdVUBLgathgt22B3Yfp02
         m2IrNX+iJI4kJxxSJax9kFkXC3A2hmkiJ2JxTeFvPm4yCuwJY4D01ejpSKi/465Y69kq
         /OvBJ0wd26EGjbuXLzbAP5cB91cl4KKIH4SBer63P/qGppjdGy956FT/IDpVq9lKAx0r
         rY7Q==
X-Forwarded-Encrypted: i=1; AHgh+RoHzjycrciAP8qbdc1ElOjSTYybRS+6fDVMFqWA3wBQH9+vR0vEY+PSQi1UO9avNtd4FuMTBGk5dS0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxv4CEA0S+wSHT2QvJN8dTWEXqCC7rDF+jVpqAS9riXktdQuefQ
	1cM3eGJhf6vAPg8XsSeKPjf6BbFcRrmhsor9gAC8clyncwDQwhK5uZcOiAr8y6LO
X-Gm-Gg: AfdE7cmqbenRa/2UMWuZVNqGD8wch7PEFXKK8nJMwTDaGXLn4ueJZn9zSrIUyrXl8/E
	mtmqNdrHNi51lehRETob0ebpcqrwD4d6uFp1dXXGjtJBoXRPVabpdQ5heyhgfHkCU4odl3ZdIWi
	dDdI3nMiqE0uVqf/05YIVkyYRt45r+VbdKYD3SVlU5aF3TZH6iLDY2qJzwQDlbfR79fIqonMvCV
	Crh7McqEYG0Z9LnVP/Sakn1hAKYzfg6A2gQxWq94SdzHYIXq54DPiM+rLRwoTzgtSMgP0oTrUCc
	T+NIVZTlN7RfTGyopcxTbEG1eVyb2m8ERvkA8niDeqvA9UtnW2S2FoqpPp9h+UeN++D0lTBZRNS
	U7C84hGGMSFygX6opoxVIio1W+oPjc6OUvOq3qS3oAsHzy6jWz+IztaSgSH+wZEytbyxI4SGAuJ
	plrER++RI774wE/73NZk3tzvRSQ6Qbucbzeylm9sn7+N1v
X-Received: by 2002:a05:600c:5657:b0:493:f442:3dd4 with SMTP id 5b1f17b1804b1-4954a516af8mr68375595e9.39.1784470365034;
        Sun, 19 Jul 2026 07:12:45 -0700 (PDT)
Received: from localhost.localdomain ([188.26.50.240])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4955dfa4a97sm14334175e9.4.2026.07.19.07.12.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 07:12:44 -0700 (PDT)
From: Eduard Bostina <egbostina@gmail.com>
To: Brian Masney <bmasney@redhat.com>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Eduard Bostina <egbostina@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>
Cc: daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	goledhruva@gmail.com,
	m-chawdhry@ti.com
Subject: [PATCH] dt-bindings: clock: Convert TI Palmas Clock to DT schema
Date: Sun, 19 Jul 2026 14:12:36 +0000
Message-ID: <20260719141236.3563471-1-egbostina@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Texas Instruments Palmas 32KHz clock bindings
to DT schema.

During the conversion, the node name in the example was updated
from 'palmas_clk32k@0' to 'clock-controller'. The old example
contained a unit address without a 'reg' property, which causes
dtc compilation warnings.

Signed-off-by: Eduard Bostina <egbostina@gmail.com>
---
 .../clock/clk-palmas-clk32kg-clocks.txt       | 35 ------------
 .../bindings/clock/ti,palmas-clk32kg.yaml     | 56 +++++++++++++++++++
 2 files changed, 56 insertions(+), 35 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/clk-palmas-clk32kg-clocks.txt
 create mode 100644 Documentation/devicetree/bindings/clock/ti,palmas-clk32kg.yaml

diff --git a/Documentation/devicetree/bindings/clock/clk-palmas-clk32kg-clocks.txt b/Documentation/devicetree/bindings/clock/clk-palmas-clk32kg-clocks.txt
deleted file mode 100644
index 4208886d834a..000000000000
--- a/Documentation/devicetree/bindings/clock/clk-palmas-clk32kg-clocks.txt
+++ /dev/null
@@ -1,35 +0,0 @@
-* Palmas 32KHz clocks *
-
-Palmas device has two clock output pins for 32KHz, KG and KG_AUDIO.
-
-This binding uses the common clock binding ./clock-bindings.txt.
-
-Required properties:
-- compatible :	"ti,palmas-clk32kg" for clk32kg clock
-		"ti,palmas-clk32kgaudio" for clk32kgaudio clock
-- #clock-cells : shall be set to 0.
-
-Optional property:
-- ti,external-sleep-control: The external enable input pins controlled the
-	enable/disable of clocks.  The external enable input pins ENABLE1,
-	ENABLE2 and NSLEEP. The valid values for the external pins are:
-		PALMAS_EXT_CONTROL_PIN_ENABLE1 for ENABLE1 pin
-		PALMAS_EXT_CONTROL_PIN_ENABLE2 for ENABLE2 pin
-		PALMAS_EXT_CONTROL_PIN_NSLEEP for NSLEEP pin
-	Option 0 or missing this property means the clock is enabled/disabled
-	via register access and these pins do not have any control.
-	The macros of external control pins for DTS is defined at
-	dt-bindings/mfd/palmas.h
-
-Example:
-	#include <dt-bindings/mfd/palmas.h>
-	...
-	palmas: tps65913@58 {
-		...
-		clk32kg: palmas_clk32k@0 {
-			compatible = "ti,palmas-clk32kg";
-			#clock-cells = <0>;
-			ti,external-sleep-control = <PALMAS_EXT_CONTROL_PIN_NSLEEP>;
-		};
-		...
-	};
diff --git a/Documentation/devicetree/bindings/clock/ti,palmas-clk32kg.yaml b/Documentation/devicetree/bindings/clock/ti,palmas-clk32kg.yaml
new file mode 100644
index 000000000000..c2a49be9b95a
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/ti,palmas-clk32kg.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/ti,palmas-clk32kg.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments Palmas 32KHz Clocks
+
+maintainers:
+  - Eduard Bostina <egbostina@gmail.com>
+
+description:
+  The Palmas device family has two clock output pins for 32KHz,
+  KG and KG_AUDIO.
+
+allOf:
+  - $ref: /schemas/clock/clock.yaml#
+
+properties:
+  compatible:
+    enum:
+      - ti,palmas-clk32kg
+      - ti,palmas-clk32kgaudio
+
+  "#clock-cells":
+    const: 0
+
+  ti,external-sleep-control:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [ 0, 1, 2, 3 ]
+    description: |
+      The external enable input pins control the enable/disable of clocks.
+      The valid values (defined in dt-bindings/mfd/palmas.h) are:
+        1: PALMAS_EXT_CONTROL_PIN_ENABLE1
+        2: PALMAS_EXT_CONTROL_PIN_ENABLE2
+        3: PALMAS_EXT_CONTROL_PIN_NSLEEP
+      Option 0 or missing this property means the clock is enabled/disabled
+      via register access and these pins do not have any control.
+
+required:
+  - compatible
+  - "#clock-cells"
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/mfd/palmas.h>
+
+    pmic {
+        clock-controller {
+            compatible = "ti,palmas-clk32kg";
+            #clock-cells = <0>;
+            ti,external-sleep-control = <PALMAS_EXT_CONTROL_PIN_NSLEEP>;
+        };
+    };
-- 
2.43.0

