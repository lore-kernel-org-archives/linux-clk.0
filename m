Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968C3202C3D
	for <linux-clk@vger.kernel.org>; Thu,  5 Dec 2024 11:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733397593; cv=none; b=mj3M2RwCXvso/Udzz+SrJHbFV47JVT5UGx3/mPNrA3uJPwf5puMc3PYhhaqRUIX29KLEim62nlhmd1ZnnhCcocsAAh/e6FkgNGWRr59o202jP3VbNrI4IjErZn5qCagygF4Yxo6VfZgyUvKiMmNLfboyypdinYhkQqQXVffGYoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733397593; c=relaxed/simple;
	bh=tD42VlJ7PTzIYUr1JF29OIvvFzjhry4keUPg+5EL/88=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a2E0fVg7roiTJ6LnzEHPU2OZeTtoEXOoPd6vO3RY50HkjYxW4v3Qt+kihty02GhQX7Db99kEWSztbn5xPaJTZl2i2K5+FflRp1/Zk7swQl1mmE7BdFkgUpFvrDvyEOr05UdU9IlZ1wWAEgJfBvNMnig32jHc5uk8pbK224r6Igs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=l/vgVJpc; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="l/vgVJpc"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-aa530a94c0eso155579266b.2
        for <linux-clk@vger.kernel.org>; Thu, 05 Dec 2024 03:19:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1733397590; x=1734002390; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JiY/U6wqtKU6IpvnYGmb6LinIE6E3Eav1zsujKOZRDc=;
        b=l/vgVJpcmaGKzzZJ0nBEJAQCV0BIx4/t04W3TnZqrqUQPQhU25sA0dNxhRkjk0oJzS
         +y/MEtSKEwJirqiQULSwCC+PEP6sBOvPtp1eRXrN/qQk6ANE++l1jNK3qg0FVL7Z5U86
         qHpOdlAKR2H9HR1crswi1EcaifirUaWT4R4JY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733397590; x=1734002390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JiY/U6wqtKU6IpvnYGmb6LinIE6E3Eav1zsujKOZRDc=;
        b=RDbPJjP3rauduClePYhb4HlEx6sLRptFKj78QybcOPisgIAUXLHbdpiSN8t6/Rp/WQ
         Em5oBJlbVy5ZgZLXQfDT6A1MAHkvAsPjGcCaoU+aiA1DSxdlrALOrqlj+7kIoHq1EnVv
         wD6xrdOBChA9zzmhfHhTTLOX8zLK3gEvw7agVSTRgTP0DzrjM5AMKftip/uMEB5Arj2q
         WwAQazPPIkiyBnegpJiMl0Wl3gJo0FYeuyQqzuaaRbtJXpvLVsg7JrRhjUKEKRuLMteK
         +AYOtVZQlWW9F72U6pG1Yp2nZJcHixswdA3IjZOtbJ/yQirkjKXHqAcRKQOFMJezRldY
         Jumg==
X-Forwarded-Encrypted: i=1; AJvYcCW1g9Nv6+PVpZG5ZaIsqP7Pnk7c2oZ1El08LfuAHplC2Nq+BbBSfeMQTv9FMiNamV2DUknV4eLwWH0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyndE2rMcKxFrqACuk9xNPdZ/DHtzgVIcf/dS4uegZd/gYeVBKh
	OinbLwtzrlrm2R8xizBEBHf+40mbUu1AxVrfCtdL7OaeZ7CVCToxS6Itqy/00Q4=
X-Gm-Gg: ASbGncv5ilEyVajYKY05A5BtuQBhRciwZD49EecXbzGfHLQ2ZUnsF4quwjMO+Z5d0lq
	vYk45BMo/sCTzCsYkon+ywYt2PBMsqxTR4XXmJlPJT1AHahrdOVpzW1md7KEyJ5ROnkpKWwQYFj
	fksb76dNf3yFHJWNr/Zagdu/EDJ1xv0LyGxOjH4kxGnld7vChCn07frrOYaqi/dmI5y2XT+BiOB
	abXY5uLgaJhjrKtujhIdMxlfKQLO2Q5C5jPkoYQw8Qs6LovdnxHWzOmBAuSxSZO9U8M9V4a9IQk
	6koCZwXo6Zn88r6J3aeqrEeOwtZU6ufqg5zXv6e9hOfVRQ==
X-Google-Smtp-Source: AGHT+IGIry/HdfnXsGul2UAgCCUzoUgqWIlhMfl2Bt3RhnIZpkxjsd0JhMpVzy2Qc3h9grs6M8D/Og==
X-Received: by 2002:a17:906:328d:b0:aa5:46e7:4baa with SMTP id a640c23a62f3a-aa5f7cc1bb2mr781689466b.7.1733397590083;
        Thu, 05 Dec 2024 03:19:50 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2001:b07:6474:ebbf:61a1:9bc8:52c6:3c2d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625eedcd0sm77505266b.87.2024.12.05.03.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 03:19:49 -0800 (PST)
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
Subject: [PATCH v5 05/20] dt-bindings: clock: imx8m-anatop: define clocks/clock-names
Date: Thu,  5 Dec 2024 12:17:40 +0100
Message-ID: <20241205111939.1796244-6-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241205111939.1796244-1-dario.binacchi@amarulasolutions.com>
References: <20241205111939.1796244-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define clocks and clock-names properties of the anatop device node.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v4)

Changes in v4:
- New

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

