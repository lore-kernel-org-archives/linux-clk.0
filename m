Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UbNmbWdZ"
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F552E0;
	Sun, 19 Nov 2023 13:24:28 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5435336ab0bso5470307a12.1;
        Sun, 19 Nov 2023 13:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700429066; x=1701033866; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W5AoIs+Bdzh/tLCRglqGhx6SkCLVORYxH3ooAEqDulU=;
        b=UbNmbWdZ5/HDnXL8BLR3I6EJmZvYTvRDBZ8YEV2sPCerADCndj2KI8lgUsjHGNui5E
         JuhIC4BHXaYm3JYAbpse2wKzcuqFwZEVeCK+p+cv6xPzScQdlTORhyh5xWoOjQ4aVJwf
         PIiB/CIIfNAsEmWRhf5iwOUvVUhmJ5ratxpHSfRCZVtLB0Ya1AqyWAZqzO27WQRN/bt4
         pndvpoH/vfJ8v5GCDoDZnqPyTml5zypwDGwXTuaFEx0DGrQVmiwFSIvzdQQpWaT9kkvy
         kc5b2Gttt55Q4c/6T/SYWNG7p2w2qPHZZrwFwljM/G+wSVwePnAQsLvAOAzEuiiblAlt
         /PzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700429066; x=1701033866;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W5AoIs+Bdzh/tLCRglqGhx6SkCLVORYxH3ooAEqDulU=;
        b=tLcRPxeAq9RKnmxhjGPQa+STlvV8GMH7eGvOjTsbXT0YhQvXE8Fqh3Mz2JCRQ/AuEs
         +X68PWyXjMKLudDFxLz7Sd374bxupufmXGpOMxV9W9Q14scbU8lKcBGRVb1a3MJoBV8b
         oA2Hoyt7GJvldRTGSsAeiAP4GhB6K1mnpyjTQxB+3Z0DyMo+WyZOvmOjZqyDmkKgU60k
         l6HRSLDnfuPx3bbLGIpkFK2ZIcDm5KVh1PJv/T0xntA/Lfd0kFcJ3t90lNKLHQ5hwolX
         ZghCEi1mD6C4FRSAlwONZRgXbazm/4uoxWcd79mqd0H0KsRMTUJNLx537POygoxepOOU
         NTOw==
X-Gm-Message-State: AOJu0YwKVc5ZDW7rfg26cADn2bzdSFkhEpoGNRhVmhpiOgpPjGcAlhsE
	8yMgQ+xilZoOVgKnv46R2xY=
X-Google-Smtp-Source: AGHT+IFajiBloEjzAJqHhZtom0mUOzVwl1XuhnJGi5vMvt9BGAY/DoINKNGYdo4x5DnyARNgwq8GLQ==
X-Received: by 2002:a17:906:c03:b0:9e2:bbc4:16cb with SMTP id s3-20020a1709060c0300b009e2bbc416cbmr4094055ejf.49.1700429066271;
        Sun, 19 Nov 2023 13:24:26 -0800 (PST)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id u19-20020a1709063b9300b009e5db336137sm3193340ejf.196.2023.11.19.13.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 13:24:25 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Jianhui Zhao <zhaojh329@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	James Liao <jamesjj.liao@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH V2] dt-bindings: arm: mediatek: move ethsys controller & convert to DT schema
Date: Sun, 19 Nov 2023 22:24:16 +0100
Message-Id: <20231119212416.2682-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Rafał Miłecki <rafal@milecki.pl>

DT schema helps validating DTS files. Binding was moved to clock/ as
this hardware is a clock provider. Example required a small fix for
"reg" value (1 address cell + 1 size cell).

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
Reviewed-by: Rob Herring <robh@kernel.org>
---
V2: Move binding to clock/ dir and document that in commit body

 .../bindings/arm/mediatek/mediatek,ethsys.txt | 29 ----------
 .../bindings/clock/mediatek,ethsys.yaml       | 54 +++++++++++++++++++
 2 files changed, 54 insertions(+), 29 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,ethsys.txt
 create mode 100644 Documentation/devicetree/bindings/clock/mediatek,ethsys.yaml

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,ethsys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,ethsys.txt
deleted file mode 100644
index eccd4b706a78..000000000000
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,ethsys.txt
+++ /dev/null
@@ -1,29 +0,0 @@
-Mediatek ethsys controller
-============================
-
-The Mediatek ethsys controller provides various clocks to the system.
-
-Required Properties:
-
-- compatible: Should be:
-	- "mediatek,mt2701-ethsys", "syscon"
-	- "mediatek,mt7622-ethsys", "syscon"
-	- "mediatek,mt7623-ethsys", "mediatek,mt2701-ethsys", "syscon"
-	- "mediatek,mt7629-ethsys", "syscon"
-	- "mediatek,mt7981-ethsys", "syscon"
-	- "mediatek,mt7986-ethsys", "syscon"
-- #clock-cells: Must be 1
-- #reset-cells: Must be 1
-
-The ethsys controller uses the common clk binding from
-Documentation/devicetree/bindings/clock/clock-bindings.txt
-The available clocks are defined in dt-bindings/clock/mt*-clk.h.
-
-Example:
-
-ethsys: clock-controller@1b000000 {
-	compatible = "mediatek,mt2701-ethsys", "syscon";
-	reg = <0 0x1b000000 0 0x1000>;
-	#clock-cells = <1>;
-	#reset-cells = <1>;
-};
diff --git a/Documentation/devicetree/bindings/clock/mediatek,ethsys.yaml b/Documentation/devicetree/bindings/clock/mediatek,ethsys.yaml
new file mode 100644
index 000000000000..94d42c864777
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/mediatek,ethsys.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/mediatek,ethsys.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek ethsys controller
+
+description:
+  The available clocks are defined in dt-bindings/clock/mt*-clk.h.
+
+maintainers:
+  - James Liao <jamesjj.liao@mediatek.com>
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - mediatek,mt2701-ethsys
+              - mediatek,mt7622-ethsys
+              - mediatek,mt7629-ethsys
+              - mediatek,mt7981-ethsys
+              - mediatek,mt7986-ethsys
+          - const: syscon
+      - items:
+          - const: mediatek,mt7623-ethsys
+          - const: mediatek,mt2701-ethsys
+          - const: syscon
+
+  reg:
+    maxItems: 1
+
+  "#clock-cells":
+    const: 1
+
+  "#reset-cells":
+    const: 1
+
+required:
+  - reg
+  - "#clock-cells"
+  - "#reset-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    clock-controller@1b000000 {
+        compatible = "mediatek,mt2701-ethsys", "syscon";
+        reg = <0x1b000000 0x1000>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+    };
-- 
2.35.3

