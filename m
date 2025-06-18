Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13F12E4241
	for <linux-clk@vger.kernel.org>; Wed, 18 Jun 2025 12:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750248916; cv=none; b=WV0/Lm+44PcwImVXWzWoTX6864+DDukaULSUZMtfmLX6fI9C3hTW1ja403l5IQuswiPWu00cEXP9xpVTFL/hfmT72f6tpV+y/JcrhrHL8+UuXQ4EWUznKAdKn/CISIWD9sDKOzbLXCTcZ5Hq9vPuSR6YgZGQ+mcctyh7CcD8LOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750248916; c=relaxed/simple;
	bh=psnTedHrRclNzYfKOxzNdzEC/lgie9/9OjOQXPUJ9ek=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=muiOjLSki/fORlHvFp9nxIIkkBUO9j4lMjFeIe8KQShiiU8JXrz6EIdpituNMeMx/5t07aDcCR0imvUXZLIqh+nlfYntwpRLwfJMBjYA8NnSxzsJOn4zYB+rXCBHAdcINIazxfm/peZbZpr26O4yOFjjuOa+vleeLcXQc3OVhmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=LYmhLDPo; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="LYmhLDPo"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-748c3afd0dbso1788703b3a.0
        for <linux-clk@vger.kernel.org>; Wed, 18 Jun 2025 05:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750248914; x=1750853714; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UM/HZQdb2lcK8V7OkC2GVlA2nnGt1f60vmRpDyo8E4k=;
        b=LYmhLDPofo6qxx7KvJQRfuxNHsONrkWruyoGMTAL3uvEtvjPSHgleHaylDMPtjnfGN
         rp8SPHeofSmbeHOBP9E2YQN1Waz8KntRGrdXXSxtys4c/NuEdJFs+IAV+Cra+RZFFqji
         MkoaBvPw7erHc+iHECO9UdyNcpNWBf7wysKwtbnOE9Uk52lKqKcb4a0b7negPY5UCSLd
         7dTc7zIMxBNKaNGxNCc75iw5Df03PzOwtqw5V855iRkPspPV0Kb/t73d7WJ/fbAupUeq
         g3VKxGaa5ed5ObIxmcDy616pV/DvGSGnPXX3DoYUwdMgJR9hZskZTwByPUlnHZikcIzu
         fJzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750248914; x=1750853714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UM/HZQdb2lcK8V7OkC2GVlA2nnGt1f60vmRpDyo8E4k=;
        b=I1DsyzH1kG08gyGOuBakWiFszApKQ5QSCGiYLcS/QR51onkZY2aWfN+Nn/KjJwouCp
         janHomYe6pzIWPUGlXi/waT25NVUnwCwr64ehPuuWPr+tbRgOgpI4DOVYGuEEyjZcdwU
         x/r9pv8yNuGH1TfQXOZ12MtMSxd51ZtTsUAxWqG9v1BnQY2TtrPl2CW09AkujJQ7nIae
         XTurS3iQAAehZewB3xrKttKtwqAu3UWJPRtgYxbdrylK6JXRrjZ4xgj4kdVVLpnRSO7G
         UQBLDkkiDwaSFGUWOqisF19MrYfkj16B4M6UHF6YUbkTFYS7Jj2Q8yNbTnlvHYhxm2au
         sGbA==
X-Forwarded-Encrypted: i=1; AJvYcCWSNVCzeaNGVD2u5vpov4ivmHcL8S7YPlAT9EISeybF/Cim/CDdLfWO2lJG2t5Z0VJzwnQwHM9XcXI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrfngyKgIl2z9SIOxYrd+Eidit4BbC99OVg3sTWdi3RRPGvz4H
	2c0osLhnvkmCLJ8N4BmvIyGTobwLmONZPKoKOUIsDj69XWQ2V/jd6FVQzm8ILlSnuW4=
X-Gm-Gg: ASbGnctUk9DvQuIJeRfBpriEzRV6oxeosk5K+es4ZUEUIwT0Lq6ZkilS+ttZkNOd4nY
	ikuZ/fKINEo1CUIHeYSM0yndcFY0VEN6KYYzr6kDP6DeWuXwT38ioMfO7osb2JZXz+qk7H29x2b
	GKg+gi1h6eVOihBS/tIcFQB+DeheTIHerCfRhgXCuhWibFo6LGXWhiwwGRGikV2loZLTgMWtJDE
	7JxksGLP8ejUNV1BDnSp31pUhcbUaTPxvZrKqyauXEHPEhFTUA7olYZ+Piy1jrVwh7y4Bxj5RJL
	avkIIagobqUHuM00iA4UutkMoT3/8WfJXpWjyuVTPJWNzsVTmmkUQjKtRWmnmXKDdmGeOzbdJtD
	9iZcZ8zAO1cGWcoux6A==
X-Google-Smtp-Source: AGHT+IGpDJao2qZOumFSvvfbkzlCDWzk3wE0Q5eIberU12DIM26VmJ5PFPyH0X+lTLfK2UXnDjT87g==
X-Received: by 2002:a05:6a20:9e48:b0:220:eef:e8f0 with SMTP id adf61e73a8af0-2200eefeademr41789637.23.1750248913920;
        Wed, 18 Jun 2025 05:15:13 -0700 (PDT)
Received: from localhost.localdomain ([122.171.23.44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900d7e0asm11201177b3a.174.2025.06.18.05.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 05:15:13 -0700 (PDT)
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
Subject: [PATCH v6 07/23] dt-bindings: clock: Add RPMI clock service message proxy bindings
Date: Wed, 18 Jun 2025 17:43:42 +0530
Message-ID: <20250618121358.503781-8-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250618121358.503781-1-apatel@ventanamicro.com>
References: <20250618121358.503781-1-apatel@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device tree bindings for the RPMI clock service group based
message proxy implemented by the SBI implementation (machine mode
firmware or hypervisor).

The RPMI clock service group is defined by the RISC-V platform
management interface (RPMI) specification.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 .../bindings/clock/riscv,rpmi-mpxy-clock.yaml | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/riscv,rpmi-mpxy-clock.yaml

diff --git a/Documentation/devicetree/bindings/clock/riscv,rpmi-mpxy-clock.yaml b/Documentation/devicetree/bindings/clock/riscv,rpmi-mpxy-clock.yaml
new file mode 100644
index 000000000000..70ffc88d0110
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/riscv,rpmi-mpxy-clock.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/riscv,rpmi-mpxy-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RISC-V RPMI clock service group based message proxy
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
+  system clocks managed by a platform microcontroller. The SBI implementation
+  (machine mode firmware or hypervisor) can implement an SBI MPXY channel
+  to allow RPMI clock service group access to the supervisor software.
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
+    const: riscv,rpmi-mpxy-clock
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
+    clock-controller {
+        compatible = "riscv,rpmi-mpxy-clock";
+        mboxes = <&rpmi_shmem_mbox 0x8>;
+        riscv,sbi-mpxy-channel-id = <0x1000>;
+    };
+...
-- 
2.43.0

