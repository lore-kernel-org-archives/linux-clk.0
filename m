Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C8444CACB
	for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 18:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784918608; cv=none; b=Gq+r7klAbPS17mRY9ScupyL2w19sDgRzpb8TkH7wkUVZkfhBjaJhuEVdRjdsGFwWwqP1H9qVx7w4AXn1l6gSxDyca2fqGpPFH8ySKCjK4kfVq3QNDbUWqQyhUVqA2e9mThYcRET4NPAe/W/FVMgojq3Z12+YXWb+108w50ap3LU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784918608; c=relaxed/simple;
	bh=S3Q/+d2FsBlN/P12XJtwUtJEKsGGawcHMg9yNFW2tL4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T2wo7/2umOiPquXT9b7XPC7jRKahk56qKinn2l0bNL1EPAkapkhA6qnom53K8DAdYvnD6T3Htl1uJBu4V+2fBpdfFf2727iBjCzetzOIeWed2+fidrlz9+bEkFThPsgbvx6FtiqcVjsRtqKF+p6JlRMho4OiCrEq2aFVSh2RZiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZMGS2RdJ; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZMGS2RdJ"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49553515a8bso8893725e9.1
        for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 11:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784918596; x=1785523396; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=crj6kaAmoeOOOLVaGiQbQt/QdMV68EZw3l9HAE3uANU=;
        b=ZMGS2RdJ0GtqRkA211F+SMByk3aayyin9mlCmoGtbusutxbss4XSPX+o46CA8rqO7v
         v0vdGlCH+E2k9EHIh6hbQox9D+UDAbbTcH0wj6ULkxr9n/I60DFJE70SxFFgHLrVeObS
         5jfQDkakgHGEdhmk5v8mxmjqrzxOqfI9Db7QqqEB8iroXWEKwceowkgIvUVKUgdYYYoF
         End0LE7JK+zhYFMxYUPHQY6Qn5cz1eKTG5SUF7bG28Hxv6Z4wjIKRjkEBv4f2I4hEmO4
         KrhwJvANOi+UzjeSrFqoRo3usX5/8aIExYkoBg/KORA3fXA0T8qolVURRlpTLcYlxfQE
         7Zxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784918596; x=1785523396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=crj6kaAmoeOOOLVaGiQbQt/QdMV68EZw3l9HAE3uANU=;
        b=B/n6c3oRq45l82uOzSrHRl3q+6TY/H2uEISHDBcnPWSb8oHB28e4AvEkHFKAyHy2wA
         XLDJeEhOZmNnSeR4g2FxEANImJbsmEAdX21a+EoCIzOkrpR2RgsPg1G8Al03Kt5A2P2V
         3vciwg0oauVsIo7Hq4pi/uz5hqG9ZuDe/LU3YNAJHTA+6djer+67hIU5MdBQVfnlj+e7
         blWkRA2qR9fIIXlgbKvCADCJ+8w5P9iemnUBGKafYCqx8l5hxY6TiIUbc/1vslhQ3ttz
         6fvfM5MzBy95oAmZrENITfsCMaSqhhst+RelFr4gBVXfw+d0P0xLHsqNoDHVzAOVCnpP
         MCwg==
X-Forwarded-Encrypted: i=1; AHgh+RqByeauLe198mBTTzg0n5cBIT8KijGAgdGk1L35osIGdWpYGgoHiT+dhAG8EZMVxHX6RjUW7Zn+WU8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxu+ak+0cVMXzeUuvrn2IgwdQx8CELpWZffav4gYUmiRMojfctX
	BCDXFgvsg7pDB7YbSdb6UW3QsCewO7SKCElrA8ZMRR8lMjOh0DtVKh3b
X-Gm-Gg: AR+sD116dHiLHA2U8GGaHj4iij7+Q6mmX/t3C/SGx79Mf1s9jc+0OMUGcEOzKeZN/ju
	QKOzWv/pqQR+ipc92kikIoH4FLh8RiWzpoJdOTe9LzldHX19CiJuZ4SD9djJckAQ6+VKgPmwgGF
	e7lY37mKS8pkbWQ/0s4mEax6hXI6R1BGsNDHm/bD0ufj7a+MwGLxkfxZ5LTl3ATP300lyxySKU+
	fTpyVFkMo7wP0v9ukbEjXhi40mjgW1586isP/LkFnkO7OAeG0y23V5JZ+T+18r3neStzXONp5/2
	KYRgYllnTF5LBWcmMYWFazJZ4lj97+SBDKlbctjLPoskwqREsuMcXsfPkLZcw0mpYpmUgAPV9oG
	uxkRhKt+imkcsdi+LxgDrixu26LTbHjCyE1Xcq8mN4DzJHbw4PoPG7GBeRXk0iIwHeJz9csXkkh
	IezBrT9JAqXkQbsMgWloOjXYIE7c4Q+ryuGM/BlXNUIQIH5q/iPF/pWAGKCHYm2tUz
X-Received: by 2002:a05:600c:198d:b0:493:c773:c3f4 with SMTP id 5b1f17b1804b1-49573cffcdcmr98305755e9.22.1784918595771;
        Fri, 24 Jul 2026 11:43:15 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-3-249-180.retail.telecomitalia.it. [87.3.249.180])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47f85bd850asm25701300f8f.15.2026.07.24.11.43.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 11:43:15 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: clock: airoha: Add PHY binding for Serdes port
Date: Fri, 24 Jul 2026 20:43:01 +0200
Message-ID: <20260724184304.192962-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260724184304.192962-1-ansuelsmth@gmail.com>
References: <20260724184304.192962-1-ansuelsmth@gmail.com>
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
---
 .../bindings/clock/airoha,en7523-scu.yaml     | 24 ++++++++++++++++---
 include/dt-bindings/soc/airoha,scu-ssr.h      | 11 +++++++++
 2 files changed, 32 insertions(+), 3 deletions(-)
 create mode 100644 include/dt-bindings/soc/airoha,scu-ssr.h

diff --git a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
index eb24a5687639..fc37786ac7ed 100644
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
@@ -65,12 +72,23 @@ allOf:
         reg:
           minItems: 2
 
+        '#phy-cells': false
+
+  - if:
+      properties:
+        compatible:
+          const: econet,en751221-scu
+    then:
+      properties:
+        reg:
+          maxItems: 1
+
+        '#phy-cells': false
+
   - if:
       properties:
         compatible:
-          enum:
-            - airoha,en7581-scu
-            - econet,en751221-scu
+          const: airoha,en7581-scu
     then:
       properties:
         reg:
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

