Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F2A201015
	for <linux-clk@vger.kernel.org>; Mon,  2 Dec 2024 11:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733138351; cv=none; b=GoXg7Om/+Q8AOUnq2umE8M3mOmNIi5ttCQFzhGVe9xDWLspmo7n1VaiMQMIbXZiZZSe1MgQlHERS7VCJnSJI+E30JFbLIGtWubVeVsjZ7BNHMjssGLif0iJu1x0uKJdXNsvD8ZbLgaVQTgAMcMiy3g3PMfhnFCUvfYKCZ78hGF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733138351; c=relaxed/simple;
	bh=RVKJ2oRWHMrW1QipPXt9E0s5o3XtCNiiEPGP5S48oLA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=On8YLnmbe/4owSq8MMNfo/9doyyWaNbhuNSZyzqdfx+PnfkEsspLOGXOUMQdK6ZWyW5iwBbmjIzU2PvrgFqcVVW5uJpDeTGuUH1X3Obo4ZxgReBOEqUsmNCj2b+Z/5irKE4+GjzV9ASVfNZwC1C584jkqmnj1y2GbKdmuKNDhj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=a3/vs8wR; arc=none smtp.client-ip=209.85.218.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="a3/vs8wR"
Received: by mail-ej1-f65.google.com with SMTP id a640c23a62f3a-aa52a5641f8so593246466b.3
        for <linux-clk@vger.kernel.org>; Mon, 02 Dec 2024 03:19:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733138347; x=1733743147; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ls8B2JToXYGAXb9LS74sJQCwE0xP16NyZq/5IJDDE8w=;
        b=a3/vs8wR7HBYzCI+RNcukSLY1ACKGXiHSYCq3ckbIwg0ch9b3e/IzcwfEAMljUwUbb
         0XeV7fxFuBrAXiwFa9enTT5wsNd9k6ci5LNFxW6TXIaSdbpvO/cHgiQbTqmfLGYCnZir
         L3BPIc1ovOpvmoPQKRtnd3pWZzStT5P7H1dinJUMUrOhU2xRpg0TL0C/61ryZgM6WhqV
         CBtKev6Em50jiWb/2kpSksyAZAOJd/RWYx7qAoUwO/OGGWMFgeo+HPvcqyPKyO2PxRsv
         pB9bpY+b7TsNflO1xxnA/iQxSuzoVcSMn4OkrSnE3i3uqVbOhnbqdJPJ2740cKsZYUv0
         CHvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733138347; x=1733743147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ls8B2JToXYGAXb9LS74sJQCwE0xP16NyZq/5IJDDE8w=;
        b=OMuyzbEmtqm+mcyeJjGIHcZ9+0KLCoMfwAKcrLAVsprdenDx6H/83m7ROwOkL5oNao
         aR2j1VnXeU0W5xTXaxOlRWty1u0DURIIueRKrqZTXdxsHkQA29g5o0RP6wVGMDuIrdma
         ya3r1nVjCSxmI/KhrppUZ8GQvKQqfaCsDHZ4q++JQd/aFJdVGcZDUsxvcUvGa5bMuMbU
         IsxhHWXuuZKlzFB6J57PF2ZIeFTsMHYvyIbloWIa0YPPI421/FOxveaWafsL4v+OUxDN
         9VI6mEGmqR9TFVOr8vLT+gFfZSWM768/NPe91TCLS3bEOuVAvwBcI7xuHmlRoXrjZfF4
         /njA==
X-Forwarded-Encrypted: i=1; AJvYcCXSABzm/vTxad3p+NawLhrzMwXpo5bexpRXcdpHTaur28zH/wxlx9zXcvRJZG/tTmDM99ACcGMCSUk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9otayiYlievcSVqS1S8lALAD+EwST0QkOGR9OToDxtDsE2k40
	taHdysZADkjIGQnQMq+6piVTD/y4GfdrYAN2bUkCVFUifin49pzzbqmKeWrmi2U=
X-Gm-Gg: ASbGnct5RSAnZ6yE4avt/zrR6mYyqaTbMnTfrNP2YkZBTWzMnBQNC3RqqEXqCC8+Pbo
	cCOA5AGrX14zN40G5/BMR2E7cdRRxx/tET2R7y6wsIzqG4/1e/5Mb4pzIoZeDBdyBnznjMv1vE3
	q1pSKMfnII+L9MKFUfvqgYf2q74ghd1C6cjpY/rR15l9adDCUUTkh4ExC2Bs5XRekykNEBfC735
	2pyeroWcxaoEhiV4sd9EN55b8csfEGwlgDfAeLzIJSl2/UwMf+HDntNW89QOZBPdjDtaa6oese7
	m9zLhLzvh/gfgQBB+ujn
X-Google-Smtp-Source: AGHT+IE+vlGfUKHoK+eOYKOTrYHlnwW0nDaadMqJJdAIeLKTsd6hO7F+g3x5C2yLKyLrt7SMSma6wA==
X-Received: by 2002:a17:906:32cc:b0:aa5:4982:abc8 with SMTP id a640c23a62f3a-aa580f1defbmr1772837366b.22.1733138346719;
        Mon, 02 Dec 2024 03:19:06 -0800 (PST)
Received: from localhost (host-87-20-211-251.retail.telecomitalia.it. [87.20.211.251])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5997ffc67sm498126966b.89.2024.12.02.03.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 03:19:06 -0800 (PST)
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
Subject: [PATCH v5 03/10] dt-bindings: pci: Add common schema for devices accessible through PCI BARs
Date: Mon,  2 Dec 2024 12:19:27 +0100
Message-ID: <92fe1c6eb3ae1e7e7c151423568be2d13f19b55a.1733136811.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1733136811.git.andrea.porta@suse.com>
References: <cover.1733136811.git.andrea.porta@suse.com>
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
index 000000000000..33479a5b40c6
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/pci-ep-bus.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pci/pci-ep-bus.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Common Properties for PCI MFD EP with Peripherals Addressable from BARs
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
index a547e863807c..ceed86755da4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19578,6 +19578,7 @@ RASPBERRY PI RP1 PCI DRIVER
 M:	Andrea della Porta <andrea.porta@suse.com>
 S:	Maintained
 F:	Documentation/devicetree/bindings/clock/raspberrypi,rp1-clocks.yaml
+F:	Documentation/devicetree/bindings/pci/pci-ep-bus.yaml
 F:	Documentation/devicetree/bindings/pinctrl/raspberrypi,rp1-gpio.yaml
 F:	include/dt-bindings/clock/rp1.h
 F:	include/dt-bindings/misc/rp1.h
-- 
2.35.3

