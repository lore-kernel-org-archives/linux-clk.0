Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=119.15.109.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795764798;
	b=cd/ScFyDYoHPV7WTEhW5n0tba2GeSu5s2W2ScSVo+nelB+2O8sWA2rva5INNlONFIlaf
	 bEz/puDoHXizlLA3bpB6OJKaoZ3xHb5cZL4WkzPiZkryXBz0aQr32kZxjQeENl0Pzx79y
	 2iZO6FY+zaQXPPe0V4Qugpn6Q6/8VwHW1Kn60i/kpq7ivrFqtZHdWn/vUy1oSaPndCx98
	 CDdjSjbUrZ+FJecZLYIaVrMqvPy//iC4o6FXotFBydx2zOFbCPbusIZl8X7+WdZW1LPXC
	 HmAIjNsRXFjHls6WcEC9eK5f8CTBv8pL3fMxeXTW061YvD5kx0kGc5n8LU2LhoxvXBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795764798;
	h=DMARC-Filter:Received:DKIM-Signature:X-GPT-Reason:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=C+bJ9BBOPuWSSh0Gw46vWQDy5ZamIjfZNZHevfz3nu0=;
	b=aRmSYNX8dLu29UVTPUq+cfRnDzts2SY1h6voQwD6fpYS/C+mK7VyqHmHZrW62zhe5+tY
	 QXPXhLl56Laa4aqTvabUgsOnCTkXZ42GP62NuCV+BmnjyatT+BuqSkpyzHpKs67YrdFvp
	 LFAmsyPBZKZaIAlh3ycobeizG60+CzmcTmqo84ItmBoOtmW06n8K20DkcPId0o/cbeWGo
	 ZWyrEioFuc9q6pSnaeYlMqsTNXQwOLtBZRS0V+7EqNrmgRjMA/ZKsC48C5foETDavl13Q
	 7daOx71Jfs0Uof5C1X7urtgWxORVuAkqdAEc2LzCDYN1lrnN+vBfJ2RH4POW0Se+C1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=d-silva.org;
	spf=pass smtp.mailfrom=d-silva.org;
	dkim=pass header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=qcaOcjvi;
	arc=none smtp.remote-ip=119.15.109.137
Received: from www.nmnhosting.com (watt.d-silva.org [119.15.109.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F367E606A327;
	Fri, 27 Nov 2026 07:33:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F367E606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=d-silva.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d-silva.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=qcaOcjvi
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id 113F84C95E;
	Fri, 27 Nov 2026 18:33:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795764790;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C+bJ9BBOPuWSSh0Gw46vWQDy5ZamIjfZNZHevfz3nu0=;
	b=qcaOcjvi3dVUx8TonrumqBdoAqrxorkeLAlM4pXhNlRbcECVxHrN91BRIFBEpwX4kEqxkd
	mf9WiwW3E17DwbYjDSMQYn9mw0VrVYS19eErp6uV9BO6xWNPrbUk6EFi5vm/QR8vNMpAz8
	yhSvSpOJ1U8Rw41uQOixLo/RbX4Z3qTLNCl6LSyuIixkFRxDRmfxM6IFaMb67A7dUGPCUB
	tQHMV/QHF624NTFe2i2d8IC3aUicfu3n7p/kL4Oqq6kOPqQbhZjwehU1/bqGwV3tKkx8b5
	JV9TgPrnngW8FIaed19oRaElksuPmeC0Y7e+08U4MGKmkdbwlc8tjA/tqscetw==
X-GPT-Reason: The email is classified as legitimate personal/professional
	correspondence. The mailbox (alastair@d-silva.org) perfectly matches
	the sender identity (alastair@d-silva.org), and the content is
	a technical patch submission for a Linux kernel-related project
	(dt-bindings). The message lacks any urgency, fear tactics, or marketing
	content, and the URL domain (devicetree.org) is consistent with
	the technical nature of the subject line.
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
Subject: [PATCH 05/11] dt-bindings: usb: allwinner,sun60i-a733-dwc3: Add Allwinner A733 DWC3
Date: Fri, 27 Nov 2026 18:32:25 +1100
Message-ID: <20261127073231.1776847-6-alastair@d-silva.org>
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

Add DT binding schema for the Allwinner A733 DWC3 USB 3.0 controller.

Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---
 .../usb/allwinner,sun60i-a733-dwc3.yaml       | 103 ++++++++++++++++++
 1 file changed, 103 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/allwinner,sun60i-a733-dwc3.yaml

diff --git a/Documentation/devicetree/bindings/usb/allwinner,sun60i-a733-dwc3.yaml b/Documentation/devicetree/bindings/usb/allwinner,sun60i-a733-dwc3.yaml
new file mode 100644
index 000000000000..012247ba0ac2
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/allwinner,sun60i-a733-dwc3.yaml
@@ -0,0 +1,103 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/allwinner,sun60i-a733-dwc3.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner A733 SuperSpeed DWC3 USB Controller
+
+maintainers:
+  - Alastair D'Silva <alastair@d-silva.org>
+
+allOf:
+  - $ref: snps,dwc3-common.yaml#
+
+properties:
+  compatible:
+    const: allwinner,sun60i-a733-dwc3
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: USB2 bus clock
+      - description: USB2 main function reference clock
+      - description: USB2 suspend clock
+      - description: USB subsystem AHB clock
+      - description: USB3 UTMI clock
+      - description: USB2 PIPE clock
+      - description: USB2 system clock
+
+  clock-names:
+    items:
+      - const: bus_early
+      - const: ref
+      - const: suspend
+      - const: ahb
+      - const: utmi
+      - const: pipe
+      - const: sys
+
+  resets:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  phys:
+    items:
+      - description: USB 2.0 PHY
+      - description: USB 3.0 ComboPHY
+
+  phy-names:
+    items:
+      - const: usb2-phy
+      - const: usb3-phy
+
+  vbus-supply:
+    description: Regulator supplying VBUS in host mode.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - resets
+  - power-domains
+  - phys
+  - phy-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/allwinner,sun60i-a733-ccu.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/phy/phy.h>
+    #include <dt-bindings/power/allwinner,sun60i-a733-pck-600.h>
+    #include <dt-bindings/reset/allwinner,sun60i-a733-ccu.h>
+
+    usb@6a00000 {
+        compatible = "allwinner,sun60i-a733-dwc3";
+        reg = <0x06a00000 0x100000>;
+        interrupts = <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH 0>;
+        clocks = <&ccu CLK_BUS_USB2>,
+                 <&ccu CLK_USB2_MF>,
+                 <&ccu CLK_USB2_SUSPEND>,
+                 <&ccu CLK_AHB_USB_SYS>,
+                 <&ccu CLK_USB2_U3_UTMI>,
+                 <&ccu CLK_USB2_U2_PIPE>,
+                 <&ccu CLK_USB2_SYS>;
+        clock-names = "bus_early", "ref", "suspend",
+                      "ahb", "utmi", "pipe", "sys";
+        resets = <&ccu RST_BUS_USB2>;
+        power-domains = <&pck600 PD_USB2>;
+        phys = <&u2phy>, <&combophy0 PHY_TYPE_USB3>;
+        phy-names = "usb2-phy", "usb3-phy";
+        dr_mode = "host";
+    };
-- 
2.53.0

