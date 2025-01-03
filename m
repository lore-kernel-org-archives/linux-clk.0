Received: from bayard.4d2.org (bayard.4d2.org [5.78.89.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED761B5EB5;
	Fri,  3 Jan 2025 22:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.78.89.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735942777; cv=none; b=jpITIcaLRZ0rd18YJIFEjrJHHEcbWJSXM60diXrTOH9NtJF2DnSQgwH3Qrd7K0aG/24kguAWj0ntGxm1KeH/NQJhcsOt4TQ/QpmeW0j8Dd+3oSf0590/SiiyXg1G/lOy1oLflVKlTxDRfkawAceswpJ7oMD1RBI5ATO3kdM3LyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735942777; c=relaxed/simple;
	bh=hJzM8qO6q7S6F2fbpuG06hDNs2vS5ySY/p5zd4IHpzY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kZDdCW/Xj/izL+kzI7fzbMi0EoFttm1wqETSY5jk5K2dyoAtOLpk7DoRCQSBq93nzrZUNx/skUh6DCmns08s+5zW4kCHQZeK5G0qne2cXqVLMXbt0h4nw7qZn/zmgckg0YOfdvAHfpiGwFNoLvMGXZdoSWMFJiPsEePHJyEMJEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=4d2.org; spf=pass smtp.mailfrom=4d2.org; dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b=PXv1HsgF; dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b=PXv1HsgF; arc=none smtp.client-ip=5.78.89.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=4d2.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=4d2.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b="PXv1HsgF";
	dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b="PXv1HsgF"
Received: from bayard.4d2.org (bayard.4d2.org [127.0.0.1])
	by bayard.4d2.org (Postfix) with ESMTP id E8814122FE21;
	Fri, 03 Jan 2025 13:58:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1735941523; bh=hJzM8qO6q7S6F2fbpuG06hDNs2vS5ySY/p5zd4IHpzY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PXv1HsgFq1xrAPUuzRqtRkmevPu0oS1b5x3Zt4mXEIIdiMzRqZNk0USXwyp7F8Hw+
	 wRhYVf3Ab0dELZ/uBlljr4Vdf5qWVRJDmvrSr0lGkUbo8Wubf8783ylhN1Za03IDAm
	 aNY9bo+RWvBU4UkKlwUuW2rBQSRQKDlgZQ8STJNMNid8FreYikaj1YUZF291eN+XON
	 OPK+pgqj3f92ylCJ6VOyHBs4j5ogvehjC8cfm2LjIX0FptOsNwjT/GQIQUY+BTsn4L
	 bBwxv55rjkTvKKY9zhPwTCLksArAUXuTFNibr70vECvbxDTLWUHwLz3ghlnxYw868R
	 t0yBHhMUsVCtQ==
X-Virus-Scanned: amavisd-new at 4d2.org
Authentication-Results: bayard.4d2.org (amavisd-new); dkim=pass (2048-bit key)
 header.d=4d2.org
Received: from bayard.4d2.org ([127.0.0.1])
 by bayard.4d2.org (bayard.4d2.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8e3M9s62nOrr; Fri,  3 Jan 2025 13:58:43 -0800 (PST)
Received: from localhost.localdomain (unknown [183.217.81.188])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: heylenay@4d2.org)
	by bayard.4d2.org (Postfix) with ESMTPSA id 2CA90122FE22;
	Fri, 03 Jan 2025 13:58:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1735941523; bh=hJzM8qO6q7S6F2fbpuG06hDNs2vS5ySY/p5zd4IHpzY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PXv1HsgFq1xrAPUuzRqtRkmevPu0oS1b5x3Zt4mXEIIdiMzRqZNk0USXwyp7F8Hw+
	 wRhYVf3Ab0dELZ/uBlljr4Vdf5qWVRJDmvrSr0lGkUbo8Wubf8783ylhN1Za03IDAm
	 aNY9bo+RWvBU4UkKlwUuW2rBQSRQKDlgZQ8STJNMNid8FreYikaj1YUZF291eN+XON
	 OPK+pgqj3f92ylCJ6VOyHBs4j5ogvehjC8cfm2LjIX0FptOsNwjT/GQIQUY+BTsn4L
	 bBwxv55rjkTvKKY9zhPwTCLksArAUXuTFNibr70vECvbxDTLWUHwLz3ghlnxYw868R
	 t0yBHhMUsVCtQ==
From: Haylen Chu <heylenay@4d2.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Haylen Chu <heylenay@outlook.com>,
	Yixun Lan <dlan@gentoo.org>
Cc: linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Inochi Amaoto <inochiama@outlook.com>,
	Chen Wang <unicornxdotw@foxmail.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
	Haylen Chu <heylenay@4d2.org>
Subject: [PATCH v4 2/4] dt-bindings: soc: spacemit: Add spacemit,k1-syscon
Date: Fri,  3 Jan 2025 21:56:35 +0000
Message-ID: <20250103215636.19967-4-heylenay@4d2.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250103215636.19967-2-heylenay@4d2.org>
References: <20250103215636.19967-2-heylenay@4d2.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add documentation to describe Spacemit K1 system controller registers.

Signed-off-by: Haylen Chu <heylenay@4d2.org>
---
 .../soc/spacemit/spacemit,k1-syscon.yaml      | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml

diff --git a/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml b/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
new file mode 100644
index 000000000000..79c4a74ff30e
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/spacemit/spacemit,k1-syscon.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Spacemit K1 SoC System Controller
+
+maintainers:
+  - Haylen Chu <heylenay@4d2.org>
+
+description:
+  The Spacemit K1 SoC system controller provides access to shared register files
+  for related SoC modules, such as clock controller and reset controller.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - spacemit,k1-apbc-syscon
+          - spacemit,k1-apbs-syscon
+          - spacemit,k1-apmu-syscon
+          - spacemit,k1-mpmu-syscon
+      - const: syscon
+      - const: simple-mfd
+
+  reg:
+    maxItems: 1
+
+  clock-controller:
+    $ref: /schemas/clock/spacemit,k1-ccu.yaml#
+    type: object
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    system-controller@d4050000 {
+        compatible = "spacemit,k1-mpmu-syscon", "syscon", "simple-mfd";
+        reg = <0xd4050000 0x209c>;
+
+        clock-controller {
+            compatible = "spacemit,k1-ccu-mpmu";
+            clocks = <&osc_32k>, <&vctcxo_1m>, <&vctcxo_3m>, <&vctcxo_24m>;
+            clock-names = "osc", "vctcxo_1m", "vctcxo_3m", "vctcxo_24m";
+            #clock-cells = <1>;
+        };
+    };
-- 
2.47.1

