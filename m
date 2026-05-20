Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D913EF642
	for <linux-clk@vger.kernel.org>; Wed, 20 May 2026 15:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779289776; cv=none; b=SjGfsznv/JbreBPHwYMGf0PvC3jRWE/wG0Y00c0ijfbAsTIZLmtk6cx/zRPOFlPRqlv3SK2BYzF/ZoUSnfifaUacyhGVOJ8XakmZaq+iMqfIR4q7dlO73T/fAjwVHtx9mvpUd6TaE5nqnlAQqnTrTfd5VN4awLot0dVVzHLNAPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779289776; c=relaxed/simple;
	bh=/cWkT/5cDwRr+Z/YzDvHLC9i7Z75yeCUvsJcM9mi1FE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XAqZyYdPmPp71jOsHhax6+18qnugsR8dtD73MpAlDsa3FZBTaYgLE99lvXnq0H+DtfCqh2rGCnQJZZpy23kNsSy0fAa33/KyFn2jpHRLSMZCiQes/fW5AcJYjt/pWv/CJKXBgo2D5YvU1ymZFj1uqbMFBAZ1I14ZJNwt9ZQgXEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fLhbP1uu; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fLhbP1uu"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-44c350a5b87so3089651f8f.3
        for <linux-clk@vger.kernel.org>; Wed, 20 May 2026 08:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779289773; x=1779894573; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lV7W1ei2FqWvKC5DxEE00R5KzZQXh+DIYHlxBEzj0kw=;
        b=fLhbP1uuHTWyzWj6Ds1mvrVg0NMVd9GnjbPwngQpFLtEeUf2T6hB210hHYNFF5nuVk
         e7PNbw7Lfmy6EbK0zWIl5zFX1A4irIsU1UiD6SvyHKNxkVzvIK70xqrg9PS/yNHJDqoL
         uZ1w/HisP3e6PKex/VXXUNraNRp7OWisidTGWRFqsqRA65zxIkZkPfhW7DwdDsi0tnQw
         MLs47n9uiFDPVBfr1x/w8JVPe1l/gQS4Xyaybsx2hWweVKyPMGbb6xR4B52+nT33+Fyo
         sy2BG9Rfi2WW+mUXqrWz/GdfcD+pJrBOcfp/gFDudKd9NsB8pY0V87FuaheOIBvt4MaF
         q29w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779289773; x=1779894573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lV7W1ei2FqWvKC5DxEE00R5KzZQXh+DIYHlxBEzj0kw=;
        b=jAcZRoaj7XVzIxB6uxaJIXh1ICIGAyBISLShze0vVYuGnMs7yRTnFzr0ioG4S7kBz2
         3V4bTWX0HrLay2ZwC5JUvgrOVnldqae7QuK0PjXzy3vydO41VAkRxooR1PVdeEInkZRZ
         HxAfrgerZeTFdWSv8F7VGJ+d/V0yMHfKOAmPmxqXi020FpEQ0p0zc2qudNvI9wWYztcm
         saZQ3GayAx4f15Qm/OdpJ2ENV0H7ZW/iHOZfnoz1cWAamE05BFKriwk6HBWn3qMq04yk
         /2HVY7kOQARsop0NVj1ObcNX7puqCf0RrWMKJwlrTAWAQPr/nurTOk3ke3xJBpVC85Gu
         VISg==
X-Forwarded-Encrypted: i=1; AFNElJ/eWNBrOVYeJU5Xj3uZi65lGsb5WEA3yzzQ8rxtbeo0w1/RAAitqZqAZhjU+vXfWWd94lLQQZQDZm0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKnwVauH0Qs68xCpJgnrvq4kwI4IoCOItFH/rEC3Wu728fWATP
	bXGSsbRchY4N/seH9t4IzV7da0SF8Hp4RwPuYExtExQqencN5SoWAjxb
X-Gm-Gg: Acq92OEsJ7A89k3dTIObZeKiYq9d0dUkZqUWza6133r1Gc0dejo1eEP0v2Xo24hgBSq
	75b9ppH52OhJ23lzaaKVZoEZCHpogAvJiJr55adW8PO1GJPoaBh//QIs/S6TJSc2//LzKf/80It
	xvZD3nK9OHH/BG+zhBJ5DULPYqA2QuWjtio0Xw31HbSTTmbv0YpAWCYy9R3DcB5zRPVJtKpoBJN
	na8923nW1/l0m565kxUcOMHQZNBJwgCJoW7jCtn+Ef5pIlpZWI6kXdD/4z2LjI/2GGdSecIGryM
	BKFw2I0lsHt7cgfxBYK4yiWJU+huGnqxGH7yVHDh8jj13QkPnJmvwK4E49SzdZhrJvKD9gL4PSG
	E5ZqIGhCXjkZlt3yJa2F3yCocEW/UiVLoXDjG2JQTS5qxx2TrebjcVIXn2E7LS5h3dzw9UsYUYc
	+/IfnmF8peuxK9LRFHyPlAh3AULoI98MU8t15ecDnamma/dIpatNJCEM73ReUkmwNbgbjgIU50P
	A==
X-Received: by 2002:a05:6000:25c1:b0:43c:fb48:6856 with SMTP id ffacd0b85a97d-45e5c5af3c9mr45932958f8f.13.1779289772363;
        Wed, 20 May 2026 08:09:32 -0700 (PDT)
Received: from Ansuel-XPS24 (host-79-22-5-99.retail.telecomitalia.it. [79.22.5.99])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-45d9ec39806sm53639804f8f.9.2026.05.20.08.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 08:09:31 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org
Subject: [PATCH v8 2/5] dt-bindings: phy: Add documentation for Airoha AN7581 USB PHY
Date: Wed, 20 May 2026 17:09:07 +0200
Message-ID: <20260520150912.11614-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260520150912.11614-1-ansuelsmth@gmail.com>
References: <20260520150912.11614-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add documentation for Airoha AN7581 USB PHY that describe the USB PHY
for the USB controller.

Airoha AN7581 SoC support a maximum of 2 USB port. The USB 2.0 mode is
always supported. The USB 3.0 mode is optional and depends on the Serdes
mode currently configured on the system for the relevant USB port.

To correctly calibrate, the USB 2.0 port require correct value in
"airoha,usb2-monitor-clk-sel" property. Both the 2 USB 2.0 port permit
selecting one of the 4 monitor clock for calibration (internal clock not
exposed to the system) but each port have only one of the 4 actually
connected in HW hence the correct value needs to be specified in DT
based on board and the physical port. Normally it's monitor clock 1 for
USB1 and monitor clock 2 for USB2.

To correctly setup the Serdes mode attached to the USB 3.0 mode, a phys
property is required with the phandle pointing to the correct Serdes port
provided by the SCU node.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/phy/airoha,an7581-usb-phy.yaml   | 62 +++++++++++++++++++
 MAINTAINERS                                   |  6 ++
 2 files changed, 68 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml b/Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
new file mode 100644
index 000000000000..f561cf2a8103
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/airoha,an7581-usb-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AN7581 SoC USB PHY
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+description: >
+  The Airoha AN7581 SoC USB PHY describes the USB PHY for the USB controller.
+
+  Airoha AN7581 SoC support a maximum of 2 USB port. The USB 2.0 mode is
+  always supported. The USB 3.0 mode is optional and depends on the Serdes
+  mode currently configured on the system for the relevant USB port.
+
+properties:
+  compatible:
+    const: airoha,an7581-usb-phy
+
+  reg:
+    maxItems: 1
+
+  airoha,usb2-monitor-clk-sel:
+    description: Describe what oscillator across the available 4
+      should be selected for USB 2.0 Slew Rate calibration.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1, 2, 3]
+
+  phys:
+    items:
+      - description: phandle to Serdes PHY
+
+  '#phy-cells':
+    description: The cell contains the mode, PHY_TYPE_USB2 or PHY_TYPE_USB3,
+      as defined in dt-bindings/phy/phy.h.
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - airoha,usb2-monitor-clk-sel
+  - '#phy-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/soc/airoha,scu-ssr.h>
+
+    phy@1fac0000 {
+        compatible = "airoha,an7581-usb-phy";
+        reg = <0x1fac0000 0x10000>;
+
+        airoha,usb2-monitor-clk-sel = <1>;
+        phys = <&scu AIROHA_SCU_SERDES_USB1>;
+
+        #phy-cells = <1>;
+    };
+
diff --git a/MAINTAINERS b/MAINTAINERS
index 21c0ef0b9ce5..932044785a39 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -771,6 +771,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/spi/airoha,en7581-snand.yaml
 F:	drivers/spi/spi-airoha-snfi.c
 
+AIROHA USB PHY DRIVER
+M:	Christian Marangi <ansuelsmth@gmail.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
+
 AIRSPY MEDIA DRIVER
 L:	linux-media@vger.kernel.org
 S:	Orphan
-- 
2.53.0

