Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F49C1D88CA
	for <linux-clk@vger.kernel.org>; Sun,  1 Dec 2024 17:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733075246; cv=none; b=GZFx4m6732+jxM4/GbFexY98qHIi/oDjNaTxyp0OjGC8j6Sy/J4+xYkox0EipgwAqQ0qn3gprkeRDYFpQiqyLZgX+Hunu0stinvYRMjw5Fl6wz+f5sks8gYCdNEqEdsMBlBYO1ajxYJJdUGO2XW7RF0K4EVgwqLTsDK+VVvsmTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733075246; c=relaxed/simple;
	bh=z0V5Gl9oP95XYAidqMBjgfFtgx9xsZSr/31PbkxMc5k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gvq17RB+6agBYKQs+NIWnXarpmDcrNpxRDPl7emlWhrd2he6wqrvSzA6JpHAhHNuxlu0s5Gxldb5jVWLv1W5clIAt+b74fxZr/Sr/SdaByoI8plSLPRVotn4+LK0HtM4lLSxqSiX6+4e8GqJRh7zJY4bjc6zzffQZdUDGP/9LrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=Fxl/9jb/; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="Fxl/9jb/"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a9a0ec0a94fso464527766b.1
        for <linux-clk@vger.kernel.org>; Sun, 01 Dec 2024 09:47:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1733075242; x=1733680042; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ta60IQaIhWAnkSstQ5gFLSU/BoHgdvU4T6DFjF2nino=;
        b=Fxl/9jb/V/x99d28HE4THVGWWpQCNL+xWVb2NBugm6exIfdWYMqENc4eJcChFe+Ppk
         M+Hhc6bnGheRQM8NAknfJjqjS3DgcfieYKLRGdUVsdTOB2+oOnemBXtNSg+udDtgKkw0
         wEFg1OFt4Qr/szuFmPMY1AgBVqjG6gfkXEN9U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733075242; x=1733680042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ta60IQaIhWAnkSstQ5gFLSU/BoHgdvU4T6DFjF2nino=;
        b=j8j+krcgYTKmShKqZ6TgNAp6pwLLpH+225+HZATWEXZEIf7/M8j2pQdsqdd3XrRk+E
         Ku1Ri5x97uJeE65LGz3SasiT8XXZhnSBzxrygqN4QzqM7PKID8UIo201kHzcwQhCmmSg
         t49Lb/oRR2O+t0HGVeuHcQRNzLgxP8W2rJjBwiOsvvPK1T+xvdGsmF/xC1wFebKbqY1J
         ildt+aGHHIo2JvgqPiryqtAMU4TZkd9CZHs1qtJkBqhj+aHm7EzjfUHEAIkz7WTrmg5l
         ASt3OBUW0GjmyjeOEGG42kVcMysdUbz/176L7nx+NIR+JUkNlfa6cjNg6zvBE/fT8EI7
         ocSw==
X-Forwarded-Encrypted: i=1; AJvYcCW6Vi4jkibTPnnKO9wa0BPHJvNeWGJFZTZ2sQuH4VvwrOnQXMhBcU5VcxbX451Vt8KyTyrKnxYsNvc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBc5QKmbX3l/zbLuPYCn3O1e3848lKRhrcNyAdukqxoSWa1jmI
	MEUw/RJZmYzVS73NoA4EzWesJ+1eqwc6ClB+Hb3Uw3k7cBw458ToNIdhbylQ0FU=
X-Gm-Gg: ASbGncsyzUMrDWQ0xZU//TXAg1kLCl2d60FCv0DNsiKUUwH1AP8T2uvMUucSKISUsNW
	wEPufZeM7u2keFUXPnpyL1ZjBVPH4UYzVXfhPmR65IDNWBJU6OlTjX7D53eoqPC3lIYsY1CulBF
	EZ9BwxmddYl5ZcsxbQN8WTTWEZRXzP42YMGBOQA1euviw2KBpwE4YZpyLoLoGNKtcRhiBBuiYNB
	lqiG58c5h4dTAjWXRzcv+R+7ejWFo8v6s6lUzcnV90aC6MooOAUtvVM9/xlS8PTx5bjUQSdGh5h
	jqxq4SVFSHvZ72+9KOczlm9GwFht3Z418bMtSeSSAuIiEkd5Mr3v3HAEWO8bMaxHjh88LWGnbXo
	M09VvImaS3y9cS71v
X-Google-Smtp-Source: AGHT+IFgxSmMaUuIfgqqx9wN9WkSl2CULWn6wLzUNHeYGK/zmvXMdPbcdrCJqoIfMbNoh6JOnFaSiw==
X-Received: by 2002:a17:906:3153:b0:aa5:43ee:2ff6 with SMTP id a640c23a62f3a-aa580ee8d40mr1783857066b.1.1733075242627;
        Sun, 01 Dec 2024 09:47:22 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-54-94-193.retail.telecomitalia.it. [82.54.94.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa59990a78esm415220066b.163.2024.12.01.09.47.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Dec 2024 09:47:22 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v4 03/18] dt-bindings: clock: imx8m-anatop: define clocks/clock-names
Date: Sun,  1 Dec 2024 18:46:03 +0100
Message-ID: <20241201174639.742000-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241201174639.742000-1-dario.binacchi@amarulasolutions.com>
References: <20241201174639.742000-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define clocks and clock-names properties of the anatop device node.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

 - Added in v4

---

(no changes since v1)

 .../bindings/clock/fsl,imx8m-anatop.yaml      | 53 ++++++++++++++++++-
 1 file changed, 52 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/fsl,imx8m-anatop.yaml b/Documentation/devicetree/bindings/clock/fsl,imx8m-anatop.yaml
index bbd22e95b319..f439b0a94ce2 100644
--- a/Documentation/devicetree/bindings/clock/fsl,imx8m-anatop.yaml
+++ b/Documentation/devicetree/bindings/clock/fsl,imx8m-anatop.yaml
@@ -30,22 +30,73 @@ properties:
   interrupts:
     maxItems: 1
 
+  clocks:
+    minItems: 2
+    maxItems: 3
+
+  clock-names:
+    minItems: 2
+    maxItems: 3
+
   '#clock-cells':
     const: 1
 
 required:
   - compatible
   - reg
+  - clocks
+  - clock-names
   - '#clock-cells'
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: fsl,imx8mq-anatop
+    then:
+      properties:
+        clocks:
+          items:
+            - description: 32k osc
+            - description: 25m osc
+            - description: 27m osc
+        clock-names:
+          items:
+            - const: ckil
+            - const: osc_25m
+            - const: osc_27m
+    else:
+      properties:
+        clocks:
+          items:
+            - description: 32k osc
+            - description: 24m osc
+
+        clock-names:
+          items:
+            - const: osc_32k
+            - const: osc_24m
+
 additionalProperties: false
 
 examples:
   - |
-    anatop: clock-controller@30360000 {
+    clock-controller@30360000 {
         compatible = "fsl,imx8mn-anatop", "fsl,imx8mm-anatop";
         reg = <0x30360000 0x10000>;
         #clock-cells = <1>;
+        clocks = <&osc_32k>, <&osc_24m>;
+        clock-names = "osc_32k", "osc_24m";
+    };
+
+  - |
+    clock-controller@30360000 {
+        compatible = "fsl,imx8mq-anatop";
+        reg = <0x30360000 0x10000>;
+        #clock-cells = <1>;
+        clocks = <&ckil>, <&osc_25m>, <&osc_27m>;
+        clock-names = "ckil", "osc_25m", "osc_27m";
     };
 
 ...
-- 
2.43.0

