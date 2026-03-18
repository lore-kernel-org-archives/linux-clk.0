Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27097346E40;
	Wed, 18 Mar 2026 17:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773855838; cv=none; b=soxbP1bO29GPk6oUN/E1zSPAknXRbVL4HgBLvKmSyQJCeNAs3RFhr6w7HZ4dWok8bjczY43vIJfWx9/YoS0Qk9vldv+BhIiR7ReBqKHBKdjEWR3Oe4wRh94CBqDxHTivW5id8xmurIjdCtZFEF+SAS8+qJTtu1PQd0l0d2MNLV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773855838; c=relaxed/simple;
	bh=SKqsviwo7A+gRl+aMrQwi20LwNBzCIOen4gxdDOVVEE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qQpzehiTkesVDUcaDTZ6II/DzOkOEXp2V1i7YS1jdP7+RfZNJbxtgHQrTHkwTAHeePysOxj86g/n1D3Ci6BFDHQcH4ouwT9pInjBqLWQiBVr7MFb8OVXAeQPVVayyyvctVZue7nGNdtFYtE/qDH64oOkgZo5hEqpdzuXRhm8IWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q8lftdfx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q8lftdfx"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C871FC2BCB3;
	Wed, 18 Mar 2026 17:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773855837;
	bh=SKqsviwo7A+gRl+aMrQwi20LwNBzCIOen4gxdDOVVEE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=q8lftdfxc3thx0Yp0eAVTNaPJgWVeglv+2vDzJRSJnhP5thiXRNp+m6HBmnHvzu/O
	 0ZA6Ax3VLfr/+n0lbhxSTrD4MSezAmEFKhIPY97rS99XLk+KKWJLC8pA/sFxDlPRmY
	 SykHnzgTsKwijexMIc8x4Ji7kLa69W2H7YKBoTBvXasZIKBdTOcYurzduobF2YHrMm
	 Xg2jDSpc9fqjoSNAcn6EE9aeof+Bi7H+iLnEnqr4HBwzCPS1AhKfDqiPwWeyKe7AcW
	 aXF28bjh/6TV6Btir1w01lQC5DGJba9BG1zjBLrgj14cbdzxArutH+qhCww/u27KuR
	 xATM7MtFPkqdA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9EA510775F9;
	Wed, 18 Mar 2026 17:43:57 +0000 (UTC)
From: Vyacheslav Yurkov via B4 Relay <devnull+V.Yurkov.EXT.bruker.com@kernel.org>
Date: Wed, 18 Mar 2026 17:43:40 +0000
Subject: [PATCH 2/2] dt-bindings: Add clock guard DT description
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260318-feature-clock-guard-v1-2-6137cb4084b7@bruker.com>
References: <20260318-feature-clock-guard-v1-0-6137cb4084b7@bruker.com>
In-Reply-To: <20260318-feature-clock-guard-v1-0-6137cb4084b7@bruker.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, Vyacheslav Yurkov <uvv.mail@gmail.com>, 
 Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773855836; l=2408;
 i=V.Yurkov.EXT@bruker.com; s=20260318; h=from:subject:message-id;
 bh=nftM24g/uBu7svtXQ2MG9cVaqhavKUW1WxRDBq2fT/8=;
 b=X2/vy2XIiAWf10c3i4jfNnsT3rbtNRB5XzDMQ6dTUyDDEVRFiKnKtPk2VM1XG5imdC/j6VpsM
 ZWx52GXBR50C/jUU9qkf7h6U6EbGe+uhJ6GJ+vgvqvQTIzlOIf9Gnf+
X-Developer-Key: i=V.Yurkov.EXT@bruker.com; a=ed25519;
 pk=snJmgYVOKlp7aQtK9tWnEI7QTYxpPpJJvxdVsnxA7Fk=
X-Endpoint-Received: by B4 Relay for V.Yurkov.EXT@bruker.com/20260318 with
 auth_id=686
X-Original-From: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
Reply-To: V.Yurkov.EXT@bruker.com

From: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>

Describe device tree binding for virtual clock controller guard.

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
Signed-off-by: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
---
 .../bindings/clock/clock-controller-guard.yaml     | 79 ++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/clock-controller-guard.yaml b/Documentation/devicetree/bindings/clock/clock-controller-guard.yaml
new file mode 100644
index 000000000000..71c2d80de1f0
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/clock-controller-guard.yaml
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/clock/clock-controller-guard.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Clock Controller Guard
+
+maintainers:
+  - Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
+
+description: |
+  Clock controller that guards upstream clocks and/or GPIO
+  signals and exposes them as a single clock output.
+
+properties:
+  compatible:
+    const: clock-controller-guard
+
+  "#clock-cells":
+    const: 1
+
+  clocks:
+    description: Input clocks that will be guarded.
+    minItems: 0
+
+  clock-names: Input clock names.
+    minItems: 0
+
+  clock-output-names:
+    description: Names of the clock provided by this controller.
+    minItems: 1
+    items:
+      type: string
+
+  gpios:
+    description: |
+      GPIOs used to control or guard the clocks.
+    minItems: 0
+    maxItems: 32
+
+  gpio-names:
+    description: Names corresponding to each GPIO.
+    minItems: 0
+    maxItems: 32
+
+    items:
+      type: string
+
+required:
+  - compatible
+  - "#clock-cells"
+anyOf:
+  - required:
+      - clocks
+  - required:
+      - gpios
+dependencies:
+  gpio-names: [gpios]
+  clock-names: [clocks]
+
+additionalProperties: false
+
+examples:
+  - |
+    clkctrl: clock-controller {
+        compatible = "clock-controller-guard";
+        #clock-cells = <1>;
+
+        clocks = <&clk0 0>, <&pll 0>;
+
+        gpios = <&gpio0 4 GPIO_ACTIVE_HIGH>,
+                <&gpio0 5 GPIO_ACTIVE_HIGH>,
+                <&gpio1 2 GPIO_ACTIVE_LOW>;
+
+        gpio-names = "gpio0", "gpio1", "gpio2";
+
+        clock-output-names = "clkout0";
+    };

-- 
2.34.1


