Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F584C9003
	for <linux-clk@vger.kernel.org>; Mon, 11 May 2026 18:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778525469; cv=none; b=fzFD27M8mSTJGvj8mJPEUz67NzD5HSHm8WWXsbCwpEQV9qNsn4k0Ns2M0c4rPXqbBJgOwJY9NIzV1TKDscUn/pbER+Z5UmKLXT4f7EWOD48r2wspNjKRChD3LGoEFTGECn8EApyI/OFiTyGG5/RaOYSu4cqZHOiuWw5AmmHH26A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778525469; c=relaxed/simple;
	bh=L8qSGL7/R0cKnVz8Ctv0uV4rXSfX+m9YTi5M5pJ9WS4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e4ePDdlI/gEXKDZve/jAMlePHXMlHgM3v56lUXpTxzeMqeFDrnyfO11+OfPj2Q/L4QNy05E43q0Rn/MJfIazHXbFs1IhVsY0Wev5aqk1BjJcoVBWhxdHQ0OP90sMw/VrBk5g2BDdrVXUcjapV2v7UD5O+KQWbubyAkYL9GHCyNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wppg+EpM; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wppg+EpM"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488a14c31eeso32552205e9.0
        for <linux-clk@vger.kernel.org>; Mon, 11 May 2026 11:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778525466; x=1779130266; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LMjDPGDJ+8xslo2jimMn/IGPGbD0V+wq+ySKoQFnLIE=;
        b=Wppg+EpMpINu+lnhR4ET1GHIseBJKvpjE1Y0ron5Lu4tUfBE4MM6673SqBCAJLkKPT
         9vxTuffieziEhwRvWvmKWYj3n5A1N6aw5MlqmzftKk7t0G5ZoyKqt1POqPkIev5eWQyr
         7i155bC7JD29tF/WamggHcPqDY4VKpU8SrIS9BeooQA0BXvJNR50o3Zij6T+pJAwDZpM
         veUZaseS2NAZdAnDcYwOtILYT3oXsvBRFIK4jsxR+bjuSZx1w7FbAvVDFMHXx5Ph4UTq
         zXj5hNsvFq4K8hAOKxEJIlZokofB88ydAHj05/k1Xf5Fy/Zp0VdnwIrlDQhX/pMVb8aJ
         4evg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778525466; x=1779130266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LMjDPGDJ+8xslo2jimMn/IGPGbD0V+wq+ySKoQFnLIE=;
        b=LFQD0MidjNRosWKkUi3oomUnqXV8w2YDmtZg1lhxp2WV5nSnS7YXYC0jqrUF4qQYN8
         Ghf3ax89qG0glMirR7/Ue3IuwAA6HZAIhOIOy+uLHPLFgXthAuD5khAdCjdLEPr2pcyh
         M+G0WnTDQr9tgMtwJUfO+5OQjYElnxLzmNbuwNCqHruYyt2TMdPdQd5+/Wdwo7+8xq5o
         S1RvWpBCG454EKJryNjj2hKHUABf56FMhqMjAXwOlmEck9jYgowQc81Z0h4OPmtC0QiB
         5ImfgZYxQFlyP+bx/DQtVPYO6rZRX95nGNqAORLMjL2TGbChxEZ8U9ecVtNA2wwkC/jt
         WBhA==
X-Forwarded-Encrypted: i=1; AFNElJ+akGcD04ReLQWV4r8P/hGa3zYuJobgdd39+m87k6IpqssxFpLKekPlDgLZcv7sHx3R3RaspHC26Lg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxaQ/WtWumjqWigXTg2UV+VQ+sSbH0BOSoXcIvo8eH/n9uIjKz3
	2Ak29VAx5FmfzdfmMvSLFJNzm8i4vow30EDup7BQDvLmULmg8sb2W213
X-Gm-Gg: Acq92OGWeEYC/hPQgI9nr+TEkdbGY4hgQbLfFq0E3eQ5sveRTSWW7f5SV9xKAB05YCG
	w4vx8U2VdofDcCJ63WL8b1zQ+ojYi3O3/wUiW1CafNkf//C1TRG1PHRs513Xeace/rn+nL87Q1M
	7SfbAkHvmZc/Kp0apZHNdmA7eN+2xQ3HLfE9XSDV32/Rn4I14uhqIGdQkhNTymQXYEq3HvkjDCE
	fb9DQPsltpWL2X8OXeiUi9bCIadq6CfAevHApXa+iNjrVYws0BeHNyg+2dfWS5bKsQc4lGJ7LUG
	bcHReK2Css1PAfFi35N2mCUuRJI4QoXvzBPPUOgv2ix2tC3TZUomvGwGrKQsIQw+lpRKWpQN1PL
	oQ6uFHgX2Zj0R/MdI56cmJqM3FfjVnzHKvnLkz05lLULQ0P2jFgKn82NwkzFIWIPKQdvQ/JAOfx
	uyZFYLl+g1bUExOUgt2i6cz59sZln62vhAssj8Gcr2r2buIo0vYLszwJfz3pt8Z3Ffg8j35zt6F
	3EXHnumQVR5pnLIwgEeGrN5xacwT1jx81Wf1Q==
X-Received: by 2002:a05:600c:4355:b0:48e:85b4:ac7b with SMTP id 5b1f17b1804b1-48e85b4ad2dmr36220615e9.18.1778525465458;
        Mon, 11 May 2026 11:51:05 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:e687:6094:b849:9886])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e8f3cf0cdsm854775e9.2.2026.05.11.11.51.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 11:51:05 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Magnus Damm <magnus.damm@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [RFC PATCH 1/9] dt-bindings: clock: renesas,cpg-mssr: Support RZ/T2H system controllers
Date: Mon, 11 May 2026 19:50:50 +0100
Message-ID: <20260511185058.1926869-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260511185058.1926869-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260511185058.1926869-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The RZ/T2H SoC features system controller blocks for low-power management
and access control that reside within the CPG/MSSR address space. To
properly represent these hardware modules, allow them to be defined as
child nodes of the CPG/MSSR controller.

Update the CPG/MSSR binding to support child nodes by adding
system-controller child nodes using a patternProperty, requiring a reg
property and a renesas,sys-block property to identify the controller
instance.

Restrict these new properties to the RZ/T2H SoC to ensure existing
bindings for other Renesas SoCs remain unaffected.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../bindings/clock/renesas,cpg-mssr.yaml      | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml
index 655154534c0f..ec13fcaf763e 100644
--- a/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml
+++ b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml
@@ -99,6 +99,41 @@ properties:
       the datasheet.
     const: 1
 
+  '#address-cells':
+    description:
+      Required for the RZ/T2H SoC to define the address space for child
+      system-controller nodes.
+    const: 2
+
+  '#size-cells':
+    description:
+      Required for the RZ/T2H SoC to define the size of the register
+      blocks for child system-controller nodes.
+    const: 2
+
+  ranges:
+    description:
+      Required for the RZ/T2H SoC to provide 1:1 address translation
+      from the child system-controller nodes to the CPU address space.
+
+patternProperties:
+  "^system-controller@[0-9a-f]+$":
+    type: object
+    description:
+      System controller child nodes representing sub-blocks for
+      Low Power Management (LPM) and Access Control.
+    properties:
+      reg:
+        maxItems: 1
+      renesas,sys-block:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: Index of the system controller instance.
+        enum: [0, 1]
+    required:
+      - reg
+      - renesas,sys-block
+    additionalProperties: false
+
 required:
   - compatible
   - reg
@@ -126,6 +161,10 @@ allOf:
       properties:
         reg:
           maxItems: 1
+        '#address-cells': false
+        '#size-cells': false
+      patternProperties:
+        "^system-controller@[0-9a-f]+$": false
   - if:
       not:
         properties:
-- 
2.54.0

