Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EAF4228CA5
	for <linux-clk@vger.kernel.org>; Wed, 11 Jun 2025 06:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749623057; cv=none; b=MCP1fIxA21B2LTN1mz2A0vcMuI5DZsBZWapEny6O7boAhSPeD9f8qy/d8bBI1qbJkjiUgH8ORfAkru7XWc9Q1PBjen6oKGrX5RfakZ5VwQ6Qxoc2r5T0p1wPcgRGXRbzwV2k9vwHXj460vZGDoc1ImpV3qJkyaOJj84YfOV2WME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749623057; c=relaxed/simple;
	bh=kiEk/ZTgWEHqlvZDH0biu08pH7LpqLelaz9eTEzcvxg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c/8kGhcA/pCYdaA0C80Mo3RGhvdVMbkl9/uh8Q0KAieGzR3IfUj38uU/waQ4rvglj0715gmbSQCbgp2ebZ2MSJCCe6Ueio0ftA/yHKwk4Hqcc+RLF49CHCn1dgzrN9Z8Ji/Uw5oiOURJ82NLxpIPN4E3bOsCSTIt4aC69aMy3hQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=DVR3TOYQ; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="DVR3TOYQ"
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-3ddd2710d14so41190935ab.2
        for <linux-clk@vger.kernel.org>; Tue, 10 Jun 2025 23:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749623054; x=1750227854; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qbog2jwuTz9DCLB0jUubllQdhYVAN+AQfO1Y2vWOezM=;
        b=DVR3TOYQhdcJYw9usWX/Rev2dyLQR3nEhKFdc2wYUZSrvs+R33KfKdraSxlJeFxInR
         5bb+4zHpgPkBAoygDaI/NhZsMYOMGanjFMF1afIa09wHoQCauhM5Ss8LiK7gGbPb+vEK
         mBuSoft/9kTbzR1wKgQIe8GLJrvcmeE1sopERyzsS66rCj+ul3rna8GHsG2gd+t9Z4zy
         ZKTv15phRVyDtuxXYnFCounk1EXlW4uE3qLpa9mkijrjYSAROb13MZ160xk4bSlD4ype
         ibQBs7a7BA4hpt+oJT/0PBijJFU75F40bt4a7PQWmRooIPUpuDhsLIeqlufN6vskw2OE
         a9qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749623054; x=1750227854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qbog2jwuTz9DCLB0jUubllQdhYVAN+AQfO1Y2vWOezM=;
        b=ZDFxIxeM+eUxz/iUFMD7kUKWOKOWY2m7eXRK+NCyKiYQeXDLTRXS0Q8g32xkeXl3Im
         pLBNiaA7tw/QSubNAHRaAynE2u9WAMZu4wN2ta/Wj+2sKRj/7JPEAIrWzDPHyTEji+0y
         b1p9Il5USAHGyWRQrSh9d4Y5rzR17ywRlFGMsQFAvwQveg0qhqDbFRreGBtt1EHkIVmI
         X9hF1SSLhIaes9tnOshG8ImDZDUAbpTXwauL9dLj4Bywy4keawcyvDnaHNcuOZCJBjce
         UaoyLWiAUHg7yw2dHCrGP5Sr1vgMdNwpbqUeuqTw6BV8tPyc+8CprhSKQvjkWM27Rr2H
         C5wg==
X-Forwarded-Encrypted: i=1; AJvYcCVcPMzohhHEODexQdt4HU2iUjEnlD8uKq6U3BvWNkQewsB9TC3HaqkXHXZquEDiDKjBbmwC27ERJ6o=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzDHCviwGsPkbRQiinSjcSZodMlA+SnPV/DmcNFaKyZ8voKEqf
	bq1rf9777MOsF8ZQos0w1sZO0BCwFdDCQdgOyXvUseNqdUUQkDOQRTaj13aKiJOiS7vlCNqYOl4
	IMO92iHA=
X-Gm-Gg: ASbGncsZHbYHqwMRV5GKIgCbykvk6bDt7zwUHtEX5Qf1BQAN/VSzATQdpGzA7P08Sxf
	yfAZYrI54WW+9WbiJ4q8iNdLzU7QWoaPTXBer6hztC323+h7RzpxH/FxBxcuHJ14aZAPINgWp/t
	14tAHs/81GKyikOc3KWTqszzNdQlpfH5YCGqrt3e+0BMc7CBke3/qYRMqYWAgEgc88JtOSvY2nE
	URprn9b/uS66RQhZE9xIigHIuSovivq+k3/rzKu82mJMRMMRj0z19pPKD6p//TfgrqxtH0YnQLC
	unLO0RoeY/e3lI0p3J5f36Zfi99PUn+U4RJU1UJ4OMYixitt4bi4lBcttHjZF44qx/9Fi7gudTm
	AQKvy7+Bjo61rcwCtrZLpIvr4XXBybboFUFcR
X-Google-Smtp-Source: AGHT+IGE45Nw6cMjQHpSv5lLGxPQof36xcySb3y/f0xaMoClmIInPuw4tRKfvCta688qmeWHkxBrmg==
X-Received: by 2002:a17:902:d2c6:b0:234:db06:ac0 with SMTP id d9443c01a7336-23641b16ccbmr26600515ad.45.1749623043547;
        Tue, 10 Jun 2025 23:24:03 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603092677sm79976295ad.64.2025.06.10.23.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 23:24:03 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Len Brown <lenb@kernel.org>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Rahul Pathak <rpathak@ventanamicro.com>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Atish Patra <atish.patra@linux.dev>,
	Andrew Jones <ajones@ventanamicro.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 08/23] dt-bindings: clock: Add RPMI clock service controller bindings
Date: Wed, 11 Jun 2025 11:52:23 +0530
Message-ID: <20250611062238.636753-9-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250611062238.636753-1-apatel@ventanamicro.com>
References: <20250611062238.636753-1-apatel@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device tree bindings for the RPMI clock service group based
controller for the supervisor software.

The RPMI clock service group is defined by the RISC-V platform
management interface (RPMI) specification.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/clock/riscv,rpmi-clock.yaml      | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/riscv,rpmi-clock.yaml

diff --git a/Documentation/devicetree/bindings/clock/riscv,rpmi-clock.yaml b/Documentation/devicetree/bindings/clock/riscv,rpmi-clock.yaml
new file mode 100644
index 000000000000..5d62bf8215c8
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/riscv,rpmi-clock.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/riscv,rpmi-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RISC-V RPMI clock service group based clock controller
+
+maintainers:
+  - Anup Patel <anup@brainfault.org>
+
+description: |
+  The RISC-V Platform Management Interface (RPMI) [1] defines a
+  messaging protocol which is modular and extensible. The supervisor
+  software can send/receive RPMI messages via SBI MPXY extension [2]
+  or some dedicated supervisor-mode RPMI transport.
+
+  The RPMI specification [1] defines clock service group for accessing
+  system clocks managed by a platform microcontroller. The supervisor
+  software can access RPMI clock service group via SBI MPXY channel or
+  some dedicated supervisor-mode RPMI transport.
+
+  ===========================================
+  References
+  ===========================================
+
+  [1] RISC-V Platform Management Interface (RPMI) v1.0 (or higher)
+      https://github.com/riscv-non-isa/riscv-rpmi/releases
+
+  [2] RISC-V Supervisor Binary Interface (SBI) v3.0 (or higher)
+      https://github.com/riscv-non-isa/riscv-sbi-doc/releases
+
+properties:
+  compatible:
+    description:
+      Intended for use by the supervisor software.
+    const: riscv,rpmi-clock
+
+  mboxes:
+    maxItems: 1
+    description:
+      Mailbox channel of the underlying RPMI transport or SBI message proxy channel.
+
+  "#clock-cells":
+    const: 1
+    description:
+      Platform specific CLOCK_ID as defined by the RISC-V Platform Management
+      Interface (RPMI) specification.
+
+required:
+  - compatible
+  - mboxes
+  - "#clock-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    clock-controller {
+        compatible = "riscv,rpmi-clock";
+        mboxes = <&mpxy_mbox 0x1000 0x0>;
+        #clock-cells = <1>;
+    };
+...
-- 
2.43.0

