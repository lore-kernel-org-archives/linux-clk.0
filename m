Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B0A534A3AB
	for <linux-clk@vger.kernel.org>; Thu, 16 Jul 2026 21:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784238386; cv=none; b=rbPmPGRLXS+92zySWq/Qtoe5ursJa/evvYHk+mz9iTc1gdbD/2q4AiJZqSYGJZ31HQnUcLc6GfYkxRXEDeq7QBR7A+2hkdft7eCSXJ3ZAMzdv+KT0oaxAV4584A3lkYKuXcanD79w5UnShFs+uoof4jxqLoeuWiU23mhujX3LLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784238386; c=relaxed/simple;
	bh=Xip7XKi61C0yH+sanSoYPvmiyme7cY+t6S6dmaDc+fM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=bf6aYMBVrwaN9n5p8/el4Xsdss6t8cPBj0Kp5trzCLg3r1INa+2+ZEo5PGFUruKUFaBnCAsqhAjnxzslE5ar8CwUUCptjzMN2cHk+2AqVgA6YXztAHkmXHHZs0je3gIpzcfJi+SdHT0LqE4yyLEKrkidCvpX01bAS7qBtNy+YDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZFBwVVHC; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZFBwVVHC"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ccdce28edeso12540145ad.0
        for <linux-clk@vger.kernel.org>; Thu, 16 Jul 2026 14:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784238385; x=1784843185; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tPcoLLAW5Uw+e40dTUDHiSrmSGK+jhTystM4taDsNcw=;
        b=ZFBwVVHCZBxjT0EDPdgEJ4SGcvhKUscG9okuI/j/jK+q5wMzVllE65LULr0tpzavrh
         YindGe60Th/+Jtz8WisrWFCfeiFBUW8nXl2iXzYVyUUKjgMkzGkULqe/N+bw+ZCiFx+A
         KSAN0hNzekCa07HvsJ3nE+NskTC1ZaPp6YtUGQVcyR9qPKNwivrfS9zNa/r5BtkWkY98
         cku2t4pZpoF73hWzH2RsTC+5erjBWiCaMGlBamkPsBfFob32WzdVgRvvb7RndLjbTmbb
         RMB/RhBmK9E4INDNPSx1h2jCuisqO6fRbAMJw6oebiIlOA1HE/mrWeQzvVJlOncq8vNE
         1WGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784238385; x=1784843185;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=tPcoLLAW5Uw+e40dTUDHiSrmSGK+jhTystM4taDsNcw=;
        b=Um43NxVRYFriPTVBz3l437mRhkTC53btDFyNPr7oESFUxzrbsgriA8kfz5oWzIWkA0
         pPH3QT1bHINVR4kR0W/FXebohHcoUXKsZ0NGE73l6g8IwNwCvcj6abcMxmbTB7eH9ISH
         JGIKkHetdLFaqmUg+rMStPp7q2mlUjvqx2FgKKBdxFziqcPzMvY2NoI+0yNGnnQ3Vxzt
         OSGDcN1QzmcGQCUSydDToAo799Totl/+JYH2Pu9CjQhbahOzMi8Gh91xIbmBiaShCr5L
         fAGOz8Qdb0EKhu0okjESA9FLQoWi4rog4kL7bJN86kvVzczoc1TgkKyai/rYVNgssgJU
         NSzg==
X-Gm-Message-State: AOJu0YzdLZYeb0r2mMCFKZYeX94Z5qjoFo/+TFh5R0r5vMDbGX66BR5I
	UhCCF66LWFyGw5MS71qUIQda4VW/wrCAz0wcT0UM7hfhcsAVcUhe9SfG
X-Gm-Gg: AfdE7clHc71cSzs+8BxkGwrcLzVy7FlUR/5eFDaT7HcT6Pagsd6+cRGsNdg00mM88oA
	umTaheoAgRfIDD6S+rrLSkmC63dWA0Ai+oebJZ5hPCX5/YOgiL0W9k1yc726XAOa7Q+t6b13g/b
	7bP3ecb0ipa/n1tZXxdp0rASAYk3ERRwfzuHBbW0KDDmjJPjyvhjZ6+wbyvo8ado9l1WuDrfJia
	T3pueiCuss9BKpqmbuO+w8ThX7cATC9Se6gix5+SEcPPMfMpDiD/S/ruH9bWnIqekGGPDmtOP7r
	9woCO3NCOCW249Q7FSQRFYBdzuk6jKD7rltCfgWk8GrVx1kR06f0BEyiSUqHalL3nvilDMvPw1l
	OEFSjKfdwToWuaI61OyJj7K0/uSk7vD3fzl8UWhdxHNNEXtAzfKWxTL3dYwueU3i5Q9rn992crN
	eSqlnf6ZE+l4EWmio=
X-Received: by 2002:a17:902:fc45:b0:2cc:e7f3:d39e with SMTP id d9443c01a7336-2ce9e29f5b2mr191380815ad.2.1784238384875;
        Thu, 16 Jul 2026 14:46:24 -0700 (PDT)
Received: from [172.28.140.252] ([2409:40c2:5428:7379:8e6c:7b85:e813:4f3b])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13cd432e848sm15267641c88.9.2026.07.16.14.46.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 14:46:24 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Fri, 17 Jul 2026 03:15:42 +0530
Subject: [PATCH v3] dt-bindings: clock: ti,clockdomain: Convert to DT
 schema
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-ti-clockdomain-v3-1-3c263af4e9fb@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2WMSwrCMBQAryJZG0lev3HlPcTFM3ltg20jSQlK6
 d1Ni4uiyxmYmVkgbymw82FmnqIN1o0JsuOB6Q7Hlrg1iRkIKEUpBZ8s173TD+MGtCNHqIwRDUo
 0BUvR01NjX9vwekvc2TA5/97+Ua72uwL5u4qSS05KYVFio2rCS5t8f9JuYOsqwj6HvxxSnme5u
 ZOoakWwz5dl+QCfUjY/6wAAAA==
X-Change-ID: 20260610-ti-clockdomain-a27dd0fa1ad5
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Tero Kristo <kristo@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, goledhruva@gmail.com, m-chawdhry@ti.com, 
 daniel.baluta@gmail.com, simona.toaca@nxp.com, j.bhargav.u@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784238373; l=4577;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=Xip7XKi61C0yH+sanSoYPvmiyme7cY+t6S6dmaDc+fM=;
 b=9WeyKYh4k2MMl91IN95Ut0YJ9T2rvopYX+OlmHN6LITkfE52omWXB74yR+jGlYrWGB2jT+lRn
 FyfE7r1VH07Bcb9E5+0Ev8cnrBhjqNRfL+k7gksZGtsRSaF9QD/tHe1
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Convert TI clockdomain to yaml DT schema. Drop '#clock-cells' from the
required list as this binding doesn't define a new clock binding type,
it is used to group existing clock nodes under hardware hierarchy. Most
existing dts omit '#clock-cells'.

Update the reference to the old legacy text binding in the description
of bindings/clock/ti/ti,gate-clock.yaml to point to the new YAML file.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
Changes in v3:
- set limits for clock-output-names and clocks properties
- Link to v2: https://lore.kernel.org/r/20260622-ti-clockdomain-v2-1-434dbe0789e2@gmail.com

Changes in v2:
- updating the stale reference to the legacy .txt file inside
  bindings/clock/ti/ti,gate-clock.yaml to fix make refcheckdocs error
- Link to v1: https://lore.kernel.org/r/20260621-ti-clockdomain-v1-1-e99a56af98ea@gmail.com
---
 .../devicetree/bindings/clock/ti/clockdomain.txt   | 25 ------------
 .../bindings/clock/ti/ti,clockdomain.yaml          | 44 ++++++++++++++++++++++
 .../bindings/clock/ti/ti,gate-clock.yaml           |  2 +-
 3 files changed, 45 insertions(+), 26 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/ti/clockdomain.txt b/Documentation/devicetree/bindings/clock/ti/clockdomain.txt
deleted file mode 100644
index edf0b5d42768..000000000000
--- a/Documentation/devicetree/bindings/clock/ti/clockdomain.txt
+++ /dev/null
@@ -1,25 +0,0 @@
-Binding for Texas Instruments clockdomain.
-
-This binding uses the common clock binding[1] in consumer role.
-Every clock on TI SoC belongs to one clockdomain, but software
-only needs this information for specific clocks which require
-their parent clockdomain to be controlled when the clock is
-enabled/disabled. This binding doesn't define a new clock
-binding type, it is used to group existing clock nodes under
-hardware hierarchy.
-
-[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
-
-Required properties:
-- compatible : shall be "ti,clockdomain"
-- #clock-cells : from common clock binding; shall be set to 0.
-- clocks : link phandles of clocks within this domain
-
-Optional properties:
-- clock-output-names : from common clock binding.
-
-Examples:
-	dss_clkdm: dss_clkdm {
-		compatible = "ti,clockdomain";
-		clocks = <&dss1_alwon_fck_3430es2>, <&dss_ick_3430es2>;
-	};
diff --git a/Documentation/devicetree/bindings/clock/ti/ti,clockdomain.yaml b/Documentation/devicetree/bindings/clock/ti/ti,clockdomain.yaml
new file mode 100644
index 000000000000..95746bfdced4
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/ti/ti,clockdomain.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/ti/ti,clockdomain.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments clockdomain
+
+maintainers:
+  - Tero Kristo <kristo@kernel.org>
+
+description:
+  This binding uses the common clock binding in consumer role. Every clock on TI
+  SoC belongs to one clockdomain, but software only needs this information for
+  specific clocks which require their parent clockdomain to be controlled when
+  the clock is enabled/disabled. This binding doesn't define a new clock binding
+  type, it is used to group existing clock nodes under hardware hierarchy.
+
+properties:
+  compatible:
+    const: ti,clockdomain
+
+  "#clock-cells":
+    const: 0
+
+  clocks:
+    minItems: 1
+    maxItems: 64
+
+  clock-output-names:
+    maxItems: 1
+
+required:
+  - compatible
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    dss_clkdm {
+        compatible = "ti,clockdomain";
+        clocks = <&dss1_alwon_fck_3430es2>, <&dss_ick_3430es2>;
+    };
diff --git a/Documentation/devicetree/bindings/clock/ti/ti,gate-clock.yaml b/Documentation/devicetree/bindings/clock/ti/ti,gate-clock.yaml
index eaa727ab0d7f..438e190d1067 100644
--- a/Documentation/devicetree/bindings/clock/ti/ti,gate-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/ti/ti,gate-clock.yaml
@@ -19,7 +19,7 @@ description: |
   that is used.
 
   [1] Documentation/devicetree/bindings/clock/gpio-gate-clock.yaml
-  [2] Documentation/devicetree/bindings/clock/ti/clockdomain.txt
+  [2] Documentation/devicetree/bindings/clock/ti/ti,clockdomain.yaml
 
 properties:
   compatible:

---
base-commit: acb7500801e98639f6d8c2d796ed9f64cba83d3a
change-id: 20260610-ti-clockdomain-a27dd0fa1ad5

Best regards,
-- 
Bhargav

