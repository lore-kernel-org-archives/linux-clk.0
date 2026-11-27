Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=119.15.109.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795764770;
	b=ylagko+SLlUlEeQglDByAZU9ZIXXubohCdh6scJA5blC+usLlcJF5VYO3YNdi/jZFPX2
	 C4FPgzkFbpwr+KdiC610V2M8Sp/s4a6DjRaIZLOzXVnr7xBPRzv6GCpWOE6tPrKSkYu2P
	 uzhMPyeXz3sd4awLdbVY3GGW8HZd7EUmp4o71q3C+KJn2VKWFwZhv7Owdr2BZbmSERGsn
	 Vj2w0wa2uV/Kz4Z5RMLAWfdRD+e5HZhCH8l7TIYAXcZ2dFKUMWLho/3uLklv/k2lgD7jV
	 RBPmUgcqSiNmn0PLx24z15D2kX2Y99htm525lZHiWkh1f+GZWpzan/3KZ2v5GGdWKXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795764770;
	h=DMARC-Filter:Received:DKIM-Signature:X-GPT-Reason:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LMyaIeOekCuLTnuJbssjNi7FJvFc27BdHLPchlDN+WM=;
	b=l/nDed1iEeAQhmGTzABLfDMOjdP3MHMXFTlXck+PL4zGgNvadxZR0W0uM82KdYEHpwR0
	 nAPgCIlgr4kKZABpk/KyKq79yfV/Gubq+OFYnzHkRjpA6QEVPz8XdMQWBui8ZWf+EvCEC
	 JdCLpk0Z0ccKC2Y0ET9LBAVLuvOow+zUNLqn/mTElX2gNBrmulLqKi+Hv9JNPY3aKNN/G
	 EFsqpAuxzuhpKFqWrmqmLFRFGQm5Bub0QQXNuLOx4grr8Mt/W2ge7g9vqMSK5C3ZtjMBG
	 dTnTqn33Zm4iyi6BWnOySAULasGq+D39tZo/rKJcsGcV0Ms1xFJsKaUx8nn8ey4sADQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=d-silva.org;
	spf=pass smtp.mailfrom=d-silva.org;
	dkim=pass header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b="GOd/YsQ7";
	arc=none smtp.remote-ip=119.15.109.137
Received: from www.nmnhosting.com (watt.d-silva.org [119.15.109.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B9C2606A323;
	Fri, 27 Nov 2026 07:32:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B9C2606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=d-silva.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d-silva.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=GOd/YsQ7
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id DFF8F4C95E;
	Fri, 27 Nov 2026 18:32:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795764760;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LMyaIeOekCuLTnuJbssjNi7FJvFc27BdHLPchlDN+WM=;
	b=GOd/YsQ7g2Eh7I/IaPFht+veXWMqVOeBfO1wRSeo593m8hrdm/xfrchf8eDOJBfYPTsCwq
	cJ85On97rPPpN91jfilUvl/2AOxiJxy5U4I29IZuaQxCHXLd3JI2NxnfURkouw2ZZchoBJ
	82hvGYNClayPrfDHJGpEX4tPugHQYgxy7wqtFgMmM/u6cAjZUPxPBQaF4prJCgkUj4hM0n
	O+clUUCDvS9wKd3V7QO8JzF149ynMTV1oZFd0yXgCxgoAcBA4jpZy9eMSs8Lal36FORDp6
	og5OUJhMJ8qYU4o5CpmsymSl6lK6Hu1PYmTuhx7uaUUaAc2i+WnMUi0u4dCTnw==
X-GPT-Reason: legitimate; the message is a technical patch submission
	for a Linux kernel/device tree project which perfectly matches
	the personal mailbox (alastair@d-silva.org) and the sender's identity;
	the subject line and content describe a specific hardware binding
	(Allwinner A733 USB 2.0 PHY) consistent with a developer's workflow;
	the From and Return-Path domains align with the recipient's domain,
	and the URL (devicetree.org) is a standard, relevant domain for
	this type of technical contribution.
From: Alastair D'Silva <alastair@d-silva.org>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-usb@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alastair D'Silva <alastair@d-silva.org>
Subject: [PATCH 01/11] dt-bindings: phy: allwinner,sun60i-a733-u2phy: Add Allwinner A733 USB 2.0 PHY
Date: Fri, 27 Nov 2026 18:32:21 +1100
Message-ID: <20261127073231.1776847-2-alastair@d-silva.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127073231.1776847-1-alastair@d-silva.org>
References: <20261127073231.1776847-1-alastair@d-silva.org>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add DT binding schema for the Allwinner A733 USB 2.0 PHY.

Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---
 .../phy/allwinner,sun60i-a733-u2phy.yaml      | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/allwinner,sun60i-a733-u2phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/allwinner,sun60i-a733-u2phy.yaml b/Documentation/devicetree/bindings/phy/allwinner,sun60i-a733-u2phy.yaml
new file mode 100644
index 000000000000..7291311d3c4d
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/allwinner,sun60i-a733-u2phy.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/allwinner,sun60i-a733-u2phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner A733 USB 2.0 PHY
+
+maintainers:
+  - Alastair D'Silva <alastair@d-silva.org>
+
+properties:
+  compatible:
+    const: allwinner,sun60i-a733-u2phy
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: OTG bus clock
+      - description: USB subsystem AHB clock
+
+  clock-names:
+    items:
+      - const: bus
+      - const: ahb
+
+  resets:
+    maxItems: 1
+
+  "#phy-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - resets
+  - "#phy-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/allwinner,sun60i-a733-ccu.h>
+    #include <dt-bindings/reset/allwinner,sun60i-a733-ccu.h>
+
+    phy@6b00000 {
+        compatible = "allwinner,sun60i-a733-u2phy";
+        reg = <0x06b00000 0x800>;
+        clocks = <&ccu CLK_BUS_OTG>,
+                 <&ccu CLK_AHB_USB_SYS>;
+        clock-names = "bus", "ahb";
+        resets = <&ccu RST_BUS_OTG>;
+        #phy-cells = <0>;
+    };
-- 
2.53.0

