Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1ECF1DDC07
	for <linux-clk@vger.kernel.org>; Mon, 28 Oct 2024 14:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730124445; cv=none; b=sE5kwrKxwRw/nZY0HiZP3sRctxiMfRxc5a11iHiQFzPhJsK+4g5soK6YxO5dOvEto/ibUpXRK5eQ4X1LBm2OQWTg0etx51/W6d3g3QUg2vT1q7r8JfIhS5B3Fz2/MaItt4ANnLJyKugMc7uaI+LpkqUY3R9v1iWRtjBG4mUQpj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730124445; c=relaxed/simple;
	bh=37BIVVxAvp06DoclbS8nrf/h7HI7daZAV/SbOYBjkus=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ee45DvFPkrs0PKpb3dexXLFAZWcx8SuT3/tbGkwB9LcGLTFrFRqiTTWCvMshbvJgYrOEuAORzBP6bnedmR12ZP4ch6RBa587jrfLGSG8WOWow10CNyCOeg8qxM/4K0pHpvEg1xFsELsg8zzZMMolPBcspcpPpe4axuQ39Zlg2bY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=cKW6f0KG; arc=none smtp.client-ip=209.85.208.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="cKW6f0KG"
Received: by mail-ed1-f67.google.com with SMTP id 4fb4d7f45d1cf-5c937b5169cso6743301a12.1
        for <linux-clk@vger.kernel.org>; Mon, 28 Oct 2024 07:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730124438; x=1730729238; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SI9eKYh0F26+LR3GPe1sodJ7zzCtCgj8qtPEzcqglJE=;
        b=cKW6f0KGXDvrHC7G7k/BAaAJ3jvEXC7fyAodzN1DHl64lDld9JPbwHheE4xMRuU/be
         BfCjTNjMi6GwuxqG/yY4b8ALrVa12tOP0zucc5A2lU3vba9TaIBLicuKLKAx8lUJKSEC
         PX/gZzdsI9cP6y84OYl6oODL8B69QnqF+tam8IYXDEia+kpCj/XSgGAedTIlgoXgK+kg
         l0AG0LGsMLZjPJanlobKS0U7SrssbvVRUb9P7KLZGWqT2YpJ+Qg3oYw9G4VhCHv3LX35
         HhY3JJx4gSnB2pSuMACuiMJ92IqetqXXbfDEdMosY+8lCz6PZJhyJ+CUiNos4Zqj0+LT
         2WeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730124438; x=1730729238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SI9eKYh0F26+LR3GPe1sodJ7zzCtCgj8qtPEzcqglJE=;
        b=DjQdv19vg0fLeuaZV92jGMuxM5Msghnkt6au39b6q/Or81GzZlJkiqABpemEU7wqlk
         LsYsf3AqtlBN5DIv3Z0swlD2/k6veyb2fadus1RKK/Cc+uAISoyH4sC9ezfBRxj8UnuY
         adyCtKa+jXjAJ0muVFbUKooMQBKbHQxI0To3ckpAe+lRU+2S8lyPwI0bMIV4UdwN28IM
         VKkJj+laGsGg3CHIeqWBpiKxf5V3YnDN/jYXEQ9Q4gPYfGz9tN9XkxvlZGr481nWKK2O
         DURj3RHkdQx972PKwfF3MFfTCRCJAs4wvQuyDJSrEqbLNY3EgaDx86o5Qrr2sz+fuJEM
         SDbA==
X-Forwarded-Encrypted: i=1; AJvYcCWO1R9YJ9oFwWX/hVmSsIeLH8EUsjqnBbpYPJ1iTY/3Hd8e3M88d9EHe339GT175Ez3AtZw8eK25V4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXhj4dqPe2q5vNE/c1Hejh53AoPhzsVxoFx5mBgpe7EIzJWBye
	h9WtGb1+bDXsMoZfBYGEWzTiy6MZ8L56dvS1f2m7ejgKF6q651yGPyPtFcbH86U=
X-Google-Smtp-Source: AGHT+IF5qNRgzKfi4MHhOJRZ8tqZIPrE0osHzwKattDyJF+pEfAMuUnEueh0yzfRuzZGt6IlIDK4Xg==
X-Received: by 2002:a05:6402:1ed2:b0:5c8:df99:a6ec with SMTP id 4fb4d7f45d1cf-5cbbf20f089mr7633425a12.14.1730124438052;
        Mon, 28 Oct 2024 07:07:18 -0700 (PDT)
Received: from localhost (host-79-35-211-193.retail.telecomitalia.it. [79.35.211.193])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cbb631a24dsm3186275a12.74.2024.10.28.07.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 07:07:17 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Wilczynski <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH v3 03/12] dt-bindings: pci: Add common schema for devices accessible through PCI BARs
Date: Mon, 28 Oct 2024 15:07:20 +0100
Message-ID: <2948fdf8ccf8d83f59814d0b2a85ce8dac938764.1730123575.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1730123575.git.andrea.porta@suse.com>
References: <cover.1730123575.git.andrea.porta@suse.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Common YAML schema for devices that exports internal peripherals through
PCI BARs. The BARs are exposed as simple-buses through which the
peripherals can be accessed.

This is not intended to be used as a standalone binding, but should be
included by device specific bindings.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 .../devicetree/bindings/pci/pci-ep-bus.yaml   | 58 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 59 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/pci-ep-bus.yaml

diff --git a/Documentation/devicetree/bindings/pci/pci-ep-bus.yaml b/Documentation/devicetree/bindings/pci/pci-ep-bus.yaml
new file mode 100644
index 000000000000..e532621f226b
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/pci-ep-bus.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pci/pci-ep-bus.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Common Properties for PCI MFD Endpoints with Peripherals Addressable from BARs
+
+maintainers:
+  - Andrea della Porta  <andrea.porta@suse.com>
+
+description:
+  Define a generic node representing a PCI endpoint which contains several sub-
+  peripherals. The peripherals can be accessed through one or more BARs.
+  This common schema is intended to be referenced from device tree bindings, and
+  does not represent a device tree binding by itself.
+
+properties:
+  '#address-cells':
+    const: 3
+
+  '#size-cells':
+    const: 2
+
+  ranges:
+    minItems: 1
+    maxItems: 6
+    items:
+      maxItems: 8
+      additionalItems: true
+      items:
+        - maximum: 5  # The BAR number
+        - const: 0
+        - const: 0
+
+patternProperties:
+  '^pci-ep-bus@[0-5]$':
+    type: object
+    description:
+      One node for each BAR used by peripherals contained in the PCI endpoint.
+      Each node represent a bus on which peripherals are connected.
+      This allows for some segmentation, e.g. one peripheral is accessible
+      through BAR0 and another through BAR1, and you don't want the two
+      peripherals to be able to act on the other BAR. Alternatively, when
+      different peripherals need to share BARs, you can define only one node
+      and use 'ranges' property to map all the used BARs.
+
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: simple-bus
+
+    required:
+      - compatible
+
+additionalProperties: true
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index c55d12550246..ccf123b805c8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19384,6 +19384,7 @@ RASPBERRY PI RP1 PCI DRIVER
 M:	Andrea della Porta <andrea.porta@suse.com>
 S:	Maintained
 F:	Documentation/devicetree/bindings/clock/raspberrypi,rp1-clocks.yaml
+F:	Documentation/devicetree/bindings/pci/pci-ep-bus.yaml
 F:	Documentation/devicetree/bindings/pinctrl/raspberrypi,rp1-gpio.yaml
 F:	include/dt-bindings/clock/rp1.h
 F:	include/dt-bindings/misc/rp1.h
-- 
2.35.3

