Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 359CD261581
	for <linux-clk@vger.kernel.org>; Mon, 18 Aug 2025 04:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755490300; cv=none; b=qnV9FScyAwSzm77d1kUD28Du4IptdL0gwRF/5LGhOFF+veJgrGjqOTnCpmXps8GInmKzvo4dhG+zWBEfDC7uLq1PBEaD73LrOOV6ByFe522mOjah4aJX8CuSl2vpmtEu7qkMECc1ImPn0lkaC5x1KwlB8qZzgv/xTyVgAmZMNyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755490300; c=relaxed/simple;
	bh=sbelvMc++opfxCsxTvRuuhoDW5jErxOHLIiEYhi1zkg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s0AfHFmQCxuF+c84lKC0upnMVEnVuRH/wXdozb5xVWEuJp4NIHD5yErtLzd1ZwaUEXwYwHi08S+bYbvoJlB7CLl9QfxMEThjR65yu/0OJhZ8tAzsbrIhN7NUabmaZvnfcvpdt4ABBiO1Cg0AxJIbhgiroREd1GoxYJdNJ/WO+XQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=ERXBJMcl; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="ERXBJMcl"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-321cf75482fso4175694a91.0
        for <linux-clk@vger.kernel.org>; Sun, 17 Aug 2025 21:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1755490298; x=1756095098; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a9cEkN+1nA6DRTpT1SF2rNqhyyXGV6gcs+oqiG40Gi8=;
        b=ERXBJMclsE4chFS0m76s5q7wvD+1Eunmjup2+QRL2wRs7WDMhNxZ1eUJbUWErokQPi
         1nNfHl6M1TQs8RkJvpQSW3EdGkz4Rzx0YQLetgM8abFL50F5ZNTNWYPiLEJiHMdjaYow
         2dmAxem/KAHk/nBdEo82Kg3avNXvboEYuq38zNSeR+4q5Z02XjDfSwgBH5iL+FlnfLZM
         4CkXVJK+SZPR9Onal7N5GTNp0zRgG7HZUEPuyKKBirMU7YSs18NE6T7zLHevYUEPLhco
         jTOBM5rDOmKi26QRfAku0nqaQFPTn6898v/LxN/ktj50lTwNy/+OhsLBQnRQLHqzn31T
         VlgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755490298; x=1756095098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a9cEkN+1nA6DRTpT1SF2rNqhyyXGV6gcs+oqiG40Gi8=;
        b=b+jiN0acQM7J3tlYR5Mm6qIPbbyQMJ3/VT27AxsrrtoMv6n7bkTuBnhTt0kTmme1yf
         YWhdoeIn8zzUw/CymdszK3mPgIU6hNQc30+MeXmZY8OwYugIGcUXt6GWQeUS7uhtesXr
         IaSrXAqZwtNnS9yCsfw6z6+v7hT5YrumKg88GSpswkYCYbsbwySNKIiXFxSo4y/RJMeo
         kbNK8I5Rv74TtY45ju3ONheFjxXAzg6bT9CCOfUZ/vqvR1lFn/b0gQuoPyByW4EeIvbS
         4otkHv6mn8fpNuU/6IbhuPpjLsUl5J7liJMCgrXXCuk/PrZ3/d54xc09KAmWEl0wCtR0
         Z7TQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFzPTYPnMqij+ps4AynXsaXj2PlLvACjoF2whn4mYNWZcGATw33cnf6FzPwRskq7XbOaiuIZRJrcY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbRWUECxniSC4tLICLHaxxRjnW9zWBCaHvSHiMfbI+rFDiEzp9
	qx+NRgPhLHE0rGfHhNLzWhn9RreaNNiHiDiyEDslCmR+HiIsR3qJeyjt+im8mX//pCQ=
X-Gm-Gg: ASbGnct9A/QJx4+OtP6kFkstBUD++klEk8xlqm6yrojz3I8pxH/H70EkHd2/mvHsEkg
	xE8/aFAEhL7U7CN7MlDOyGX92tgIFNQYkHnVFuc1CyM7LZAasSNnWDfbRhU+ABU+TAeoQmnhVk0
	IJ8OxBy1+3/8AC3u4EDbwGCYeHSb5p8uazctre4pzN0FvTnNR6G87ybzqtq5HI0xYEq2c1jqYFn
	6skUF6Bo+t0Ol3FHfT7u7haUxbEV2oAeg9AqJMIYyOWnCBXrjXTgIPVbMn+tquk8k6Wbpg/QGsQ
	pIBXmahNm1QvizV9hrGe9UFi0SpYFKRPhxupy0CYFg/+8GtvLRdgQDhJL3m0dwEwQXHO4M2obzn
	5FyLWGiWCDS5MNPmnkVxteg4PimLtqq0+IS23qGGxO1T3wH+PA2N4H3vS6GHNfW0P
X-Google-Smtp-Source: AGHT+IFtbujOl+Pcx84ey4TUZu9YiGYdI2B8x59/rDGP8fO39Jouq7TSzRgIg0yzVLZAS0ibf52XRQ==
X-Received: by 2002:a17:90b:28d0:b0:321:90c0:bc62 with SMTP id 98e67ed59e1d1-323402f2115mr13772005a91.5.1755490298256;
        Sun, 17 Aug 2025 21:11:38 -0700 (PDT)
Received: from localhost.localdomain ([122.171.17.53])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32343c70356sm6560972a91.25.2025.08.17.21.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 21:11:37 -0700 (PDT)
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
	Alexandre Ghiti <alex@ghiti.fr>,
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
	linux-acpi@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v10 11/24] dt-bindings: Add RPMI system MSI message proxy bindings
Date: Mon, 18 Aug 2025 09:39:07 +0530
Message-ID: <20250818040920.272664-12-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250818040920.272664-1-apatel@ventanamicro.com>
References: <20250818040920.272664-1-apatel@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device tree bindings for the RPMI system MSI service group
based message proxy implemented by the SBI implementation (machine
mode firmware or hypervisor).

The RPMI system MSI service group is defined by the RISC-V
platform management interface (RPMI) specification.

Reviewed-by: Atish Patra <atishp@rivosinc.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 .../riscv,rpmi-mpxy-system-msi.yaml           | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-mpxy-system-msi.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-mpxy-system-msi.yaml b/Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-mpxy-system-msi.yaml
new file mode 100644
index 000000000000..1991f5c7446a
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-mpxy-system-msi.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/riscv,rpmi-mpxy-system-msi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RISC-V RPMI system MSI service group based message proxy
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
+  The RPMI specification [1] defines system MSI service group which
+  allow application processors to receive MSIs upon system events
+  such as P2A doorbell, graceful shutdown/reboot request, CPU hotplug
+  event, memory hotplug event, etc from the platform microcontroller.
+  The SBI implementation (machine mode firmware or hypervisor) can
+  implement an SBI MPXY channel to allow RPMI system MSI service
+  group access to the supervisor software.
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
+      Intended for use by the SBI implementation.
+    const: riscv,rpmi-mpxy-system-msi
+
+  mboxes:
+    maxItems: 1
+    description:
+      Mailbox channel of the underlying RPMI transport.
+
+  riscv,sbi-mpxy-channel-id:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      The SBI MPXY channel id to be used for providing RPMI access to
+      the supervisor software.
+
+required:
+  - compatible
+  - mboxes
+  - riscv,sbi-mpxy-channel-id
+
+additionalProperties: false
+
+examples:
+  - |
+    interrupt-controller {
+        compatible = "riscv,rpmi-mpxy-system-msi";
+        mboxes = <&rpmi_shmem_mbox 0x2>;
+        riscv,sbi-mpxy-channel-id = <0x2000>;
+    };
+...
-- 
2.43.0

