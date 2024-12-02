Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 665C32010F6
	for <linux-clk@vger.kernel.org>; Mon,  2 Dec 2024 11:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733138352; cv=none; b=NJJ0caVGh0YxVFIjQJ571ZAf2QdZ78k14OKUzGN6x7SF/2ywNU/OemrlBFIKAqPLqS+lgiS7jbVf33iEmNk3tGcsMXu2ET0OmPoM4CJ4GuqjheRI/Oogg3SfEf5bMKWHvQEDB4lIm+pSu3Bm2yd1oaoFVbZVwBN2pePhKk+Rq9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733138352; c=relaxed/simple;
	bh=6Rdi6vtMmdQpclQGGOGTd/k9+1jkc+Nh6HkWNbsa9gA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZDogPUuWId1TXfkOXmUuQkCYEXy1lRMU1/FkbycaEVWY9SEnVjvSFofJyMHW/VPtOqJtr73ojkI+i8NRCvZNbVePOXxoeYpzb11hj9milaLPZW8rkzbABN+Hnq4XbCFUQ0Oy7WjCgrXMAIAXyhqlW7LNdpsCLU4E15nEggHdpJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=CbKCHH6t; arc=none smtp.client-ip=209.85.218.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="CbKCHH6t"
Received: by mail-ej1-f67.google.com with SMTP id a640c23a62f3a-aa549d9dffdso675451766b.2
        for <linux-clk@vger.kernel.org>; Mon, 02 Dec 2024 03:19:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733138348; x=1733743148; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=loQrYUxNweXqAyZ1T5b/kRAgnD6/0M++W+eoOapwQak=;
        b=CbKCHH6tCfWvvZpwCibjdmEr/wuhf6IDut5RqGZTHvSmF5Pk4thxXDyopLYw3nytxR
         ErVVXxbD0W1lMSFLPE7IlPJKa93HAL6kDg7vFd2JXK1s5gpaXxB/nGPug8Xs6Y6pkout
         xSKUcZxOdhWd7U3DTKfy3T3QUT4wDNzp2tpArpQg04i47aLaduCEmbeDXRgOjyPxG8Ze
         S5V7SGPcFumf7y7gri5YQCVVdAY22hMgaUVN3/Xum7flkQMK8rnTzFOCFc66MkU7J8Rw
         Mzk/RdVNoM7T5zkKI3FB9TUqEPhmB+4IKGngWLjZH2jZLWXXxLWntSIDt69LpDEv2PaE
         tcCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733138348; x=1733743148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=loQrYUxNweXqAyZ1T5b/kRAgnD6/0M++W+eoOapwQak=;
        b=viaLJJaZU4CDClRCg6ve1hfJmeihRP3gYrsb6wrmFDyPXKGBc9OcSuk6D+uXsyY/3o
         T5qEPhHRjVh7h8LQSmzWjUcnRW1Z42Om4Mt6tF58ZPJL9egKDa5cRLWB3LUtwo3BEVsC
         EGP7XtZyN9zz+Xd2IE610a4fftIp19DYbyZ0bOSbDHJINqhQfFTvVggaBHN3LzXSRboI
         XEEcrqSqoFh8OoBmidK+sTKcYEgmgLE0UMa2o5OWdtH2y4HKfF2r1nlgiZ5Oi5nTBe5t
         zSpagl1yRk1LzJQJCWHCsbBNv02xxwlAVPUkm4S2h2sKWElCE5tIvK04K1tOgdllUKhp
         SXKA==
X-Forwarded-Encrypted: i=1; AJvYcCUeCyvadFMqv40Dj1mtISh3fzv4/LpBrpKJZ4ppbuBWstOB06aKIeL2B59nH27iQh3nt9k1Mtv+Ceo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw761Nngjt3syzrq8Jso6zskCy094i1ZIWYQ8Od1Vt9CRBO3GBm
	pcaLLqHUXIh42/+xejRZEzNCEJ6LNXQzyHzl2lXWtWloCJtUpr5I6O8Waa3arKs=
X-Gm-Gg: ASbGnctpZvm/Hpst4DcjV4kYsQisC1NzL+aHmGgy8JsWSO3RzbOMXv41KOJXCBcs41P
	ZKqFiPI+YJbeu2BwCkgr5MBXGCIgZyL6hQkY+YDC/f8nfZ2omLa/uULVoNS9Fxi7oD/t2DcIeuu
	XjSqtkWXN2q53DdcU8LKGfyZSrYvqabrfpPzbe1BKZZ6/ACddQj0T2hRLKCqpLA5lmg8GQo6gcE
	pASrglBLNNo0wKzPQ9MWgqa5PDcVPt3JMIY/DnZ5nOt6/VlUoaVrKjlpRByvVFYVPVlTZM2/tH9
	VomkdwqvR32/xQ44dW+Q
X-Google-Smtp-Source: AGHT+IHaMO/Y8CrT5Mz8+G51hTZ3C+GNozU6Gp6b679Vc5uJseM64hrcEXJ4+2CIlMnmRdcAGAynUQ==
X-Received: by 2002:a17:906:2192:b0:aa5:2855:7817 with SMTP id a640c23a62f3a-aa580f72e6fmr1623926366b.35.1733138347771;
        Mon, 02 Dec 2024 03:19:07 -0800 (PST)
Received: from localhost (host-87-20-211-251.retail.telecomitalia.it. [87.20.211.251])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5996ddbfbsm498998666b.51.2024.12.02.03.19.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 03:19:07 -0800 (PST)
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
Subject: [PATCH v5 04/10] dt-bindings: misc: Add device specific bindings for RaspberryPi RP1
Date: Mon,  2 Dec 2024 12:19:28 +0100
Message-ID: <99c23bd584d7b1b998d2cafb7807e0650db73f20.1733136811.git.andrea.porta@suse.com>
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

The RP1 is a MFD that exposes its peripherals through PCI BARs. This
schema is intended as minimal support for the clock generator and
gpio controller peripherals which are accessible through BAR1.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 .../devicetree/bindings/misc/pci1de4,1.yaml   | 73 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 74 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/pci1de4,1.yaml

diff --git a/Documentation/devicetree/bindings/misc/pci1de4,1.yaml b/Documentation/devicetree/bindings/misc/pci1de4,1.yaml
new file mode 100644
index 000000000000..5171a949eda5
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/pci1de4,1.yaml
@@ -0,0 +1,73 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/misc/pci1de4,1.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RaspberryPi RP1 MFD PCI device
+
+maintainers:
+  - Andrea della Porta <andrea.porta@suse.com>
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
+    description:
+      Specifies respectively the interrupt number and flags as defined
+      in include/dt-bindings/interrupt-controller/irq.h.
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
diff --git a/MAINTAINERS b/MAINTAINERS
index ceed86755da4..4bc77e3fa80d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19578,6 +19578,7 @@ RASPBERRY PI RP1 PCI DRIVER
 M:	Andrea della Porta <andrea.porta@suse.com>
 S:	Maintained
 F:	Documentation/devicetree/bindings/clock/raspberrypi,rp1-clocks.yaml
+F:	Documentation/devicetree/bindings/misc/pci1de4,1.yaml
 F:	Documentation/devicetree/bindings/pci/pci-ep-bus.yaml
 F:	Documentation/devicetree/bindings/pinctrl/raspberrypi,rp1-gpio.yaml
 F:	include/dt-bindings/clock/rp1.h
-- 
2.35.3

