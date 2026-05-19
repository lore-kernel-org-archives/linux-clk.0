Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E233ED5A3
	for <linux-clk@vger.kernel.org>; Tue, 19 May 2026 22:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779228515; cv=none; b=iWhj2kiirih27XazGlNhDy4oByXIUHtzVdA12vPt/jwWbTGolFwQXc95X1q000locqtLIR8EJhP8ivoEc0HAEXmXdoYvUdwNOjW7UToGsTDjWfimSm84cui2Rm9fqi+QmkEhyuIn0MdzQdw3ZGT9CWCWMwtxW2OF4m09fJBNzgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779228515; c=relaxed/simple;
	bh=/cWkT/5cDwRr+Z/YzDvHLC9i7Z75yeCUvsJcM9mi1FE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nz86OH/Eyqt2CiPzEMrK8VqXEH6gTfmF1KV3tkmnRNt87MMuGYGebz2LNWT+tTVM7jTF+ZTE/l4Bm52H/XfRokoI2hNF1DE85gw6auY/0zwqsoEVSTgVxuGNDvt7Q+30KCo6/NieciggmJXzg7gA4gYCF5OmLqtX4C8JdGDmuE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nK2Qb20w; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nK2Qb20w"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48a3e9862f0so23874835e9.1
        for <linux-clk@vger.kernel.org>; Tue, 19 May 2026 15:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779228511; x=1779833311; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lV7W1ei2FqWvKC5DxEE00R5KzZQXh+DIYHlxBEzj0kw=;
        b=nK2Qb20wmXS86VdmkkbmR0cuBtw5DT3hsYcxcqS2iaZt+kFDZ/Q+blkLBIS5S9WhyT
         UuxPTsnLCbuyA5+93JcOFVp2sJ0xqAyQ9AtjFeHO9oW2jFhu1Z9zV194TFi0xSmALHrx
         Ux8JP8XKm34z5AmuDdQmvuvUkLxM0PutQTeSxIb1d74rw1zrpjNb5/O1SvyCIJ+q5AuF
         /WhznC+6p4I3AJi3rsfP6tj/RqQ5hTvpBkOwrej/Jg1u/W2r6sJNYyBIM/4CI1EnG33b
         odFCPleMVefQui51ySaN3fHDfbdCm4Nhg/9tvZQAjusoMj9XuB7gE0pFtutjJQBYZ5cE
         7rmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779228511; x=1779833311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lV7W1ei2FqWvKC5DxEE00R5KzZQXh+DIYHlxBEzj0kw=;
        b=P03rCTYXmjXaNZ1Feb/srYwE/lZvDBXeGGjIrYl9FNohb6XxPDZnJMzh7XqzUQo/lu
         TceKqoirJ4L60OGmpHuY4XJNt0zdRzfkkZlPiWagkLm2F19H26uzjxOPPmebeGZ/1wPK
         KqvipaXJayccz9S4PifYl4osjZvxbYZ+7MS548QSuLa2WlB5aJVxuhVVum434/PAziFB
         YsSTsePGot7KEq/ETJH1j067pDWXI36R/f3Cw6b+CsC7m4ELkmMOIwBqrJW3gobNXR7K
         ecwUeqKDgM1RZtGJb+g8CKmtTxf0bF9t/XWQopx7YQqv0z91RP6Au4wNRjd7S8dhNhHD
         /rqA==
X-Forwarded-Encrypted: i=1; AFNElJ9wGQkI7dxOKjv4vmFPCEse6wNjW9hDzvgzHCXgu2UO5pKZHIb7is7eJlawkQD+rJSXesd0zZOPyN0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzPVoyLYns1v2inG2sTqZtafeSuvV+O40Pu8sNzroE+vIKCeY/
	zEyWp23O8ve07I7U6A77qid7UoA+hOZN8iKqkSXg+YiOq2nogVP3PTdQ
X-Gm-Gg: Acq92OFjrNnx0hCHVvq8Z6EfU0a7UTt0IhYb0er3Q9hYV31U09swpypWNYkrWOOffoo
	xJt2S9lJ6WnVr2Sao8jSsILvC7WMTtCcfs39MD1Cx2+AXTmn7sPXtcfeCpfLfqiWOPlLaESErL1
	4PXZnO9FUo43mkKkxN+o7IbcHo9ULsLQWPKhnr6wdrFHTk7nNK9gNJZDyzLYPGVRNw5nbOM99lL
	5xsCZmEw9eLBg/4FOxuH/T9oIO3jN6TNMdpHuNT8aK3Ga0OTtA2/lCRDmofbQ5Gm4FkgP0VebPA
	9QhKObE6Hl6bUzdgQgLZWLh+1cJV/BlW0onIq+0hli1TFQAw7UI2dxeb5LcqO1hMgyuCo3iAlG3
	P93gcALnbtMGRvcE1VE3CToA5MLvGLUc0Z2yMFv8mATT+2AxMLU6QM36XQ955E92x2qj67/thRl
	ysOe3oTEHU3EBzKlJrPRxgX8IpUYNx2ejMfQrUKaJV4Vugf4Cm1VXy5IoO3qe7zOiDBuInzNQ=
X-Received: by 2002:a05:600c:4851:b0:48a:79d8:a8d6 with SMTP id 5b1f17b1804b1-48feea99dc7mr173268915e9.7.1779228510595;
        Tue, 19 May 2026 15:08:30 -0700 (PDT)
Received: from Ansuel-XPS24 (host-82-55-252-101.retail.telecomitalia.it. [82.55.252.101])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48febe585absm118304005e9.19.2026.05.19.15.08.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 15:08:29 -0700 (PDT)
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
Subject: [PATCH v7 3/6] dt-bindings: phy: Add documentation for Airoha AN7581 USB PHY
Date: Wed, 20 May 2026 00:08:08 +0200
Message-ID: <20260519220813.28468-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260519220813.28468-1-ansuelsmth@gmail.com>
References: <20260519220813.28468-1-ansuelsmth@gmail.com>
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

