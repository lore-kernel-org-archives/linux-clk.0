Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C418C2288D6
	for <linux-clk@vger.kernel.org>; Thu, 29 May 2025 13:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748526564; cv=none; b=Na/sAp9tl4DQCsk5FqlIv85uo2c9h/JqoTAJ4VJBm34Mi1q+A8ocJuaKNZp3ppZKteyji3WBbytYty959cMJOlkNVVApP5ejq/gdia/cjsJQ1piNWnKB0MSpHLMRdEpfgANIbraHnYg47pK7n9EeoMgtotZ62xHN6uxGSeTaMPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748526564; c=relaxed/simple;
	bh=1k00ZPSbe+u73O93XUJQSZ9BJLlOaPaki/m1ZdOztYg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T2djrGpl9W4wuPY8nF+6veKhAq61WyQQL4GbWM5iVcmKZ3NH16ga2AOQrmEd2CLo8iYBJ1QcmyXNAghBkVHtLIChmH5BL7x31it56xf180xtlYbj6rg/L26Sw1BvYUp+Rwl6TbphNU1mgJ0O1MRAXAQ+OfAEDsDnLhJTTWl2VeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=eRUhU3n1; arc=none smtp.client-ip=209.85.208.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="eRUhU3n1"
Received: by mail-ed1-f65.google.com with SMTP id 4fb4d7f45d1cf-601f278369bso1809515a12.1
        for <linux-clk@vger.kernel.org>; Thu, 29 May 2025 06:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748526560; x=1749131360; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VGboxmMcozIYFpgNSd3yUXiFLJRnkvYuern9jhJu7Ss=;
        b=eRUhU3n1obw2wLldNl8V8LjL6b7shuYSWgtr2ZoHBuF8M2myD2ahbufKSJzDJyZpLx
         0Bh9AnX133tq2cZo/+SNITnc1XbGqrNaksRNYscHces1yPXQOP24zSQaq+p8HFnj1T0b
         8FmXG36pCqVg+CRWwO+aFBdZLF+01S70lqVbYOBeW3MzO7nANjBeUa5QZkNXLcE1T0O4
         Qlo1ml5ZYah1Bc2KYFNLr49WZM+RCi1EyoOngUE2N5GXGaccD71rEnADSS7qIBSChGsZ
         EiDwn4wfddbAlY7NmgwgPJXBtld/briZYh2cc+EEiGVWFEwatdS4NfvOLtp7XEZsYqyX
         tI9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748526560; x=1749131360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VGboxmMcozIYFpgNSd3yUXiFLJRnkvYuern9jhJu7Ss=;
        b=aH9rYyd3zY2UTursbb7SvlMWlPLZFtmwguc51R/q3C0+SLyf/zUbMAeYLCG9bKEAMj
         TGGpWATRAKqZJ+pnncGBlqAjsEDH9Bh8l6XasgPoJ0fU95NiLXD1QhCEUWT50kCiiGVT
         SEpzgabh6bu4A4ALEDsaK54i7PBiIJIcOayFqAGOO5H3zZKbxQLIgP/2cUQHQsgMJAdy
         65qi3icOCGkE3uL6ARvEtXiQxqLUsjPviUfMK8LKAKqnfk2U1GD/SN/RjKWyfSmcONc6
         X3hfGLBFLBXarxk1J/aAO460oLuDPTfZj4Cj/GzVaPjKTaiOoCjOW3AtMbd8O+RWPr2u
         iDbw==
X-Forwarded-Encrypted: i=1; AJvYcCXhiaLDZ2g0hNzApNpvsZy8y/6WSnhP8hwa0FZR6mq4pENTRVaDnG4u9J5XUHs0/LRF8VM3ASdeWQI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzquIb4cUNqgmtXBBGeAjhBeuvzhuGwfmhO6eJrgeDT2UjVYNgt
	kcxONthQWliwESpZJF4gwO6i8ItyrpPfftbfVqewDqbuX4K6HS5iYnhA4EsT5p5bnfo=
X-Gm-Gg: ASbGncvmG2MRILLxXqAxdA63cfCfeDMH+p52NPgZSr5XLcrRMV+EEn2nZQ9z/ruzdVC
	wySfT2G3L76wRqdC+y9iMqbsqfX6hhYznaBQ74hyfwV+hdy2E9+EAerA17b2H8ojljTZz9p/6sB
	nRFNC+DXZN1MIkviqBgegv1jsl03RF2AK5GAyTSROnSx0RdQwWxhmVsFHmsgyL0/xrnEj1ZQQn1
	tduBIOqVqoE3CkpbiJ8VcaCR1c/LARydt94TMEgaxmUbJBYcVe064w5BDJgeGPJeY/I3pBdPzzq
	LjplNizPa6B5sfa+kddVEstb1DdoUy7mxC3XS25uByLyzzbnpAqP4q6Rz0ob7ol1vocFhFYN+Od
	Tcp7KbrJoQgkGW2XfTo7Okg==
X-Google-Smtp-Source: AGHT+IGKuD+Tth0pJp0gfXI32E+DNNRd4baj31Ji1jfSwplm5ayN10H7Ij1j9C7dYd4j0K2Z/6B/hg==
X-Received: by 2002:a17:907:94d1:b0:ad8:8eb7:1c79 with SMTP id a640c23a62f3a-ad8a1fcd810mr569011466b.39.1748526559822;
        Thu, 29 May 2025 06:49:19 -0700 (PDT)
Received: from localhost (host-87-21-228-106.retail.telecomitalia.it. [87.21.228.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d82d74csm146445466b.45.2025.05.29.06.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 06:49:19 -0700 (PDT)
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
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Phil Elwell <phil@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	kernel-list@raspberrypi.com,
	Matthias Brugger <mbrugger@suse.com>
Subject: [PATCH v12 03/13] dt-bindings: misc: Add device specific bindings for RaspberryPi RP1
Date: Thu, 29 May 2025 15:50:40 +0200
Message-ID: <20250529135052.28398-3-andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1748526284.git.andrea.porta@suse.com>
References: <cover.1748526284.git.andrea.porta@suse.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The RP1 is a MFD that exposes its peripherals through PCI BARs. This
schema is intended as minimal support for the clock generator and
gpio controller peripherals which are accessible through BAR1.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 .../devicetree/bindings/misc/pci1de4,1.yaml   | 137 ++++++++++++++++++
 1 file changed, 137 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/pci1de4,1.yaml

diff --git a/Documentation/devicetree/bindings/misc/pci1de4,1.yaml b/Documentation/devicetree/bindings/misc/pci1de4,1.yaml
new file mode 100644
index 000000000000..2f9a7a554ed8
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/pci1de4,1.yaml
@@ -0,0 +1,137 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/misc/pci1de4,1.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RaspberryPi RP1 MFD PCI device
+
+maintainers:
+  - A. della Porta <andrea.porta@suse.com>
+
+description:
+  The RaspberryPi RP1 is a PCI multi function device containing
+  peripherals ranging from Ethernet to USB controller, I2C, SPI
+  and others.
+  The peripherals are accessed by addressing the PCI BAR1 region.
+
+allOf:
+  - $ref: /schemas/pci/pci-ep-bus.yaml
+
+properties:
+  compatible:
+    additionalItems: true
+    maxItems: 3
+    items:
+      - const: pci1de4,1
+
+  '#interrupt-cells':
+    const: 2
+    description: |
+      Specifies respectively the interrupt number and flags as defined
+      in include/dt-bindings/interrupt-controller/irq.h.
+      Since all interrupts are active high, only IRQ_TYPE_LEVEL_HIGH
+      and IRQ_TYPE_EDGE_RISING can be specified as type flags.
+      The supported values for the interrupt number are:
+        - IO BANK0: 0
+        - IO BANK1: 1
+        - IO BANK2: 2
+        - AUDIO IN: 3
+        - AUDIO OUT: 4
+        - PWM0: 5
+        - ETH: 6
+        - I2C0: 7
+        - I2C1: 8
+        - I2C2: 9
+        - I2C3: 10
+        - I2C4: 11
+        - I2C5: 12
+        - I2C6: 13
+        - I2S0: 14
+        - I2S1: 15
+        - I2S2: 16
+        - SDIO0: 17
+        - SDIO1: 18
+        - SPI0: 19
+        - SPI1: 20
+        - SPI2: 21
+        - SPI3: 22
+        - SPI4: 23
+        - SPI5: 24
+        - UART0: 25
+        - TIMER0: 26
+        - TIMER1: 27
+        - TIMER2: 28
+        - TIMER3: 29
+        - USB HOST0: 30
+        - USB HOST0-0: 31
+        - USB HOST0-1: 32
+        - USB HOST0-2: 33
+        - USB HOST0-3: 34
+        - USB HOST1: 35
+        - USB HOST1-0: 36
+        - USB HOST1-1: 37
+        - USB HOST1-2: 38
+        - USB HOST1-3: 39
+        - DMA: 40
+        - PWM1: 41
+        - UART1: 42
+        - UART2: 43
+        - UART3: 44
+        - UART4: 45
+        - UART5: 46
+        - MIPI0: 47
+        - MIPI1: 48
+        - VIDEO OUT: 49
+        - PIO0: 50
+        - PIO1: 51
+        - ADC FIFO: 52
+        - PCIE OUT: 53
+        - SPI6: 54
+        - SPI7: 55
+        - SPI8: 56
+        - PROC MISC: 57
+        - SYSCFG: 58
+        - CLOCKS DEFAULT: 59
+        - VBUSCTRL: 60
+
+  interrupt-controller: true
+
+unevaluatedProperties: false
+
+required:
+  - compatible
+  - '#interrupt-cells'
+  - interrupt-controller
+  - pci-ep-bus@1
+
+examples:
+  - |
+    pci {
+        #address-cells = <3>;
+        #size-cells = <2>;
+
+        rp1@0,0 {
+            compatible = "pci1de4,1";
+            ranges = <0x01 0x00 0x00000000  0x82010000 0x00 0x00  0x00 0x400000>;
+            #address-cells = <3>;
+            #size-cells = <2>;
+            interrupt-controller;
+            #interrupt-cells = <2>;
+
+            pci_ep_bus: pci-ep-bus@1 {
+                compatible = "simple-bus";
+                ranges = <0x00 0x40000000  0x01 0x00 0x00000000  0x00 0x00400000>;
+                dma-ranges = <0x10 0x00000000  0x43000000 0x10 0x00000000  0x10 0x00000000>;
+                #address-cells = <2>;
+                #size-cells = <2>;
+
+                rp1_clocks: clocks@40018000 {
+                    compatible = "raspberrypi,rp1-clocks";
+                    reg = <0x00 0x40018000 0x0 0x10038>;
+                    #clock-cells = <1>;
+                    clocks = <&clk_rp1_xosc>;
+                };
+            };
+        };
+    };
-- 
2.35.3

