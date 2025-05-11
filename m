Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F2A25742B
	for <linux-clk@vger.kernel.org>; Sun, 11 May 2025 13:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746970884; cv=none; b=om7+ItyQ/wg2s0Y3Y49jqTsU6FeR3ZIenUtYk2L7K29YX7Um7j0z0joAW9Zq/iAtk6PR/Sm1uAhG842EdXzLjYXouViECcFBy9bCXqVnEUHI2hr+UXosC5mOii6T/gVEPOIphZH5sB81Rcp5aBVfwjH/WK68385oSdlYlPhRz5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746970884; c=relaxed/simple;
	bh=Q274OnfG3podIQmVKmeGWN09V8KF3qj8jlwfrCOnBJY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J58Ku4DaceNMKWANm8QfexqFj1XqH9LNkyw11tA9+HZyxHQt3rhQiX63z3gocn3Ihc3/4TanzLi2U4vQTB2p+tRj+HXTT2KZPbH+3eNKhUDNz26FN6u1QNAh6R2weWeOVw4B7UatIeHqmcY45UvdG7BKig2g2UbMIPX4SoWbvYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=I79657+L; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="I79657+L"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-22e7e5bce38so40456585ad.1
        for <linux-clk@vger.kernel.org>; Sun, 11 May 2025 06:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1746970881; x=1747575681; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cYmzV5+laFQZlY1OUMxuPLa7G32W7v4o4U3ZvBmHKpM=;
        b=I79657+L7FHHckxaYP7Ok+1u7fp79kSOVZWXujF2d9aqYHbeQptoKvyhYXJHmnqXvp
         6xPKJu4KFB+Ts7sH8dncOnfl+Vr7eW1RxY5uNEs8NnX7sUd0IW6//Q20ugUXo+nM/vkP
         TQyc8Sc/D/ESOfjxUhoNq0qnxuNL3kAlFxFBP78aARbA55eEAlpQ1MT+7u73Ffi2ViVT
         RIdyJglRPzCG7I1/GAtO3UMm80TTGG9LkP9BiJzisghnNQcj5pZuKYo69jmH7+bP6H+P
         +G75rx/DGTap8AE0UzOEOZjCzBgt2FBxiYumlGcFc48J7BgV5sXyspNhNjfuB8ua+n6v
         I0eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746970881; x=1747575681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cYmzV5+laFQZlY1OUMxuPLa7G32W7v4o4U3ZvBmHKpM=;
        b=M6fdZHXRAzwETu97eac35swl1lO7uYqaLGbkoM/GjVGO5CWyXUVPP9ShsmCig3cT0Q
         b1kSmc1MZS0uw16oZPrnRbWVP2MrL0cTB7smDGIMEDFGiOMlqO34vwmDz3mXwehgwEHb
         VJOKLK5y5wWRHfTcB49us4ULd7OTDZyh28UtJmbUuwutL6JumgiOFm/JHzXZNCiv08Vr
         n+pIK8h+lYXgZ00NEJJ10Igl7767K2GSasXHwFTmI9TMlgdSEluiNeGiZHwMferViEWJ
         tjwGOxjyYCLpQGyIqL2glpeXq8uSQ/qP+kCEtfkrztuRjz5iihcZl7QSJEwn5PV3hnkH
         WChw==
X-Forwarded-Encrypted: i=1; AJvYcCWWKkM0eTTcyrwuV2oJWYt2oIUd5UE5XR1DWedRYFlGDeDEc98udMjT4GrC+oz2xRezz6oXp/iwAOQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKI8S7QnGDWrU7Bi2DPHu7dkwdCNZNn2TKMl90awuyA1e4A4Qy
	V+OCljjSEDlC4uyW56WV09dtpszbeD1eU1e63BTDdxvrYxHIPksQuXLi+jF5NPM=
X-Gm-Gg: ASbGncvsbz8jDLFe7M31CQG2RCf8zubZpUsERS9WkJUQ7Qh+tIiWTfj4/vm6sXaPmBl
	+B+RRJhXepaunDSGaeHXPEspU68ZxwMQKOigT5VjKsptRfnTmkAEmefiyEtT71k8hfMoTB7oIWP
	hmFNSMROnWkutW6vGlDvHEcN9pA4U82hFZQrCIwE2v3fSWDGjNUqlPXZIP7Sv0RR2VA6xQfBvaP
	MVdH3Ofks3S4kPEqlqCviLqUEFQDM0xQ+8mnzzbK7PgEEIszOiNZW9+cQOev5P7Gk41s8PJ+Nhl
	KcCxIybb9FBAvXgef9qIsG61esM4ufzh4nbeMTgSmV1TSW4/uCjUlSCb/I0VvrD8gHsWnnuweqy
	SAqsw2BljSjSI/fYfUp6CgcqU
X-Google-Smtp-Source: AGHT+IEfaxgrqbXpWtZS2d6T+EevRdeE0WEhWEel3ocGJ+bMO5Ii2RhRjdLhMu2s/pa8PLRyJHchMQ==
X-Received: by 2002:a17:902:ea01:b0:224:10a2:cad5 with SMTP id d9443c01a7336-22fc8aff172mr172444685ad.10.1746970880653;
        Sun, 11 May 2025 06:41:20 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([122.171.17.86])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc754785bsm46665805ad.20.2025.05.11.06.41.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 06:41:20 -0700 (PDT)
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
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v3 09/23] dt-bindings: clock: Add RPMI clock service controller bindings
Date: Sun, 11 May 2025 19:09:25 +0530
Message-ID: <20250511133939.801777-10-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250511133939.801777-1-apatel@ventanamicro.com>
References: <20250511133939.801777-1-apatel@ventanamicro.com>
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
---
 .../bindings/clock/riscv,rpmi-clock.yaml      | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/riscv,rpmi-clock.yaml

diff --git a/Documentation/devicetree/bindings/clock/riscv,rpmi-clock.yaml b/Documentation/devicetree/bindings/clock/riscv,rpmi-clock.yaml
new file mode 100644
index 000000000000..9c672a38595a
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/riscv,rpmi-clock.yaml
@@ -0,0 +1,61 @@
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
+  [1] RISC-V Platform Management Interface (RPMI)
+      https://github.com/riscv-non-isa/riscv-rpmi/releases
+
+  [2] RISC-V Supervisor Binary Interface (SBI)
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

