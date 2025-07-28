Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7D9253B42
	for <linux-clk@vger.kernel.org>; Mon, 28 Jul 2025 09:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753695749; cv=none; b=VzO0fC7q5xoed41WJDyV3quYQS5wBgRhP90WLRfZhA7xJpBgQRJr9XHX7jlyUSUDzadxqWyDp+AA5LYxBFyZhE+MpZ3DZ663pSr2beI1gmPjxEUGhnsW2kmGFvd2W6WlBc9F4ECGagJ5LzlIgqn+FXH9NLuYPwlTeDBJ4SHKYzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753695749; c=relaxed/simple;
	bh=gqZpMXPd6DL/+kfXUibwUL8SSmPMehps7IgssTY7RG4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XlZZu1slyM1dPwv7i5QgjJBVxmKkrKJ5BWyTTsGl3ohZQ+8BrYmSkwLXYeEhJT+G38RS9m/7aWX/iKXR7G52nPg9jf0oyBhjPAl4DOZFC2ma6gcqrDLaL9maDY1pd0PpkTRFvDxh+mnfjS3yYssS0CYm8WHfZ6lGPclJorLhmEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=E6Y5UYCz; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="E6Y5UYCz"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3137c2021a0so3469775a91.3
        for <linux-clk@vger.kernel.org>; Mon, 28 Jul 2025 02:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1753695747; x=1754300547; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zMRC5c9xXUgo6eKv4jcoCHH6TENqo9cqAPQxW1Kbofo=;
        b=E6Y5UYCzp5TdNTw9k5ohUabkOSgaOQGqHbabmoP9W8SOJCwO3tlKfVR1SBT0DKepYc
         j/yts+CxP4oShUgoaeKNNWWnmc5IXx9u/5ie0hTRQEfj2OuCrx/nqrTZhk2oDpBb7I+F
         r+PEd/I12YiaIizmK8PsWW+Hr+wO88Xu9dC+nw0dHauiuQVpa9mkRdM+D/OEiDUGCDYD
         mIooCLQUSrZhhh6pIJKf/ysMBx2f+rt7BHoN80SQy1v+rY9WMO6ip6A1O6DCI7Bl5wma
         1l3n/vijVx5sSPXMWE6+xXku4d+WXCvWA3VnW15ulJO3G3NDTOKLepHzlMMC9z3sWaMM
         x5Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753695747; x=1754300547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zMRC5c9xXUgo6eKv4jcoCHH6TENqo9cqAPQxW1Kbofo=;
        b=P3bVyN8co9eBgcHiXQyoMFRuYqAwRrL4IbHny76M79IYI8puKxazQAo/3y6ImhMuI+
         YfoLwH6sauApBk+mbDAVmaWkWCZeFhptwn4I3ws+xoFz158mQFb1bHS0Sr/ET8aUWZ+V
         X9xqyUBOAYEMyTRx9D4EdUA6TSHOXxYUgJQ0AgHJ6kjkLHKJ2ZborpptRfsHR00fZyHn
         s3cksvjdTCbNlfYXVtJrLHAWLndpXeNqG3FuDLqhPpCq+SPSZJj9i06MDrf6OdHZEU7j
         N/ezGRTG5golPRJgssgE3EuZxUW+cqp9CZ7nfDf1im6I5SvCzWjdCYYHtK+7KVKJ0++1
         kCxw==
X-Forwarded-Encrypted: i=1; AJvYcCV2OT9RKA2CZ2sRP+KBzB2090qNN7eep31o7Uq2ubjRLVib6esiF8GZpKhUnApCWg6PNFQmcEDzI/4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEc8+oyiWRi0VQzzeH4fzAQH9dxXBDEsfBUcbo4qyjdHnWOZqJ
	fGMCdtUjUH6xzTOs4Ju1QGCSmrussUK6ddDACPktCRos6Yefuf57JAe8BH/jxG3EBa8=
X-Gm-Gg: ASbGncsI0GSc+8y1FnwwMZwViUaWxrYDfXVzHvHpPVYQkOx8miIwzeOl327U2lZNL3m
	lhSMrvTOMKKdSrAqKHVFs75bDyJy/Mnv2/X938mDbJYFEmV9bAUtNcrMzzHLSCDrVJTP7XD2FyI
	KT6/blQYq68HJ35VMihLXNniZAxCAdZGwnZ/PcHZH119Syu4nabK3swarsAethyOGVwJlEZU35t
	HWz3evCC5p9Oh58KiP4HRbGuMzGaSjz5qDQ6dvTF8iqaxsDSKX2MAHgvBkO24gkPyxcklpivzrz
	UgDbRcYDzdogi4NlaAcYtZznge6xJgX2bkoppMRMv4d9wGN7BgHWIW30NTk+6Yw8TzUXRBMdgCQ
	rN5XI6kDIhmbpRlFNz5hEIn9Wus+X6OENSQzrb+5c9bEjQU47hCByMNeOpqfp
X-Google-Smtp-Source: AGHT+IET1sWMZD/6AnfrHKkMC7OglTaiVF3qSrY2in0HUadzd58C0Shm9ghMuxb6ibvRVRWuWVfN2w==
X-Received: by 2002:a17:90a:d2c3:b0:31e:d643:6cb9 with SMTP id 98e67ed59e1d1-31ed6436e56mr3137835a91.1.1753695746628;
        Mon, 28 Jul 2025 02:42:26 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([122.171.19.28])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31e832fbf99sm5396230a91.1.2025.07.28.02.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 02:42:26 -0700 (PDT)
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
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v9 09/24] dt-bindings: clock: Add RPMI clock service controller bindings
Date: Mon, 28 Jul 2025 15:10:17 +0530
Message-ID: <20250728094032.63545-10-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250728094032.63545-1-apatel@ventanamicro.com>
References: <20250728094032.63545-1-apatel@ventanamicro.com>
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

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
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

