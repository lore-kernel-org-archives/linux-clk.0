Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFCD7262FD3
	for <linux-clk@vger.kernel.org>; Mon, 18 Aug 2025 04:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755490285; cv=none; b=mY0wNTU/5yojXD9fQE9mqw35ViXzMeXaWmlI3zvrsNRVyKJAFA8L9bYXDDhCOm2VH9Kp2n2GGWxiD+tsCUBnTcxG9jo2/xlzD4tIG9tKsFbicCGviQVyKFcF0qaDZmPPWOgVaery1p9CpMlMlvtZH1kmQyIly6/E12tZsn2GoZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755490285; c=relaxed/simple;
	bh=gqZpMXPd6DL/+kfXUibwUL8SSmPMehps7IgssTY7RG4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DYZ4Gb7TeEZaQ4oo6yoss1fbEaDe6EgRgteWaMx3eaNBvB0J+SyIIBEBAuc4x95qBu5s0WV1WPStWiDOz2KGWleYploWTagS1GpJy/tuZ1qL2Q4QjGFllj250X12lr+u8lshIQnsYQTzSb6qz7tdJc0KN4URS0Yqls8s+QTWGTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=H+Nk7L+e; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="H+Nk7L+e"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b472fd93ad1so1446317a12.0
        for <linux-clk@vger.kernel.org>; Sun, 17 Aug 2025 21:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1755490282; x=1756095082; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zMRC5c9xXUgo6eKv4jcoCHH6TENqo9cqAPQxW1Kbofo=;
        b=H+Nk7L+efF8m2lrCt/Ho1n/pSQasXvNVn+SehJrrfZ7YJP0hDvMEa6bXigGlfI9qPk
         p/Q0lUa1JrKxvSC4Qu9fs31uoXGBiTlKyfIL0ENWm0dGhSSO+cv2ucdfudOl/payrQ6O
         sofAfu/h3mqB9+YXD10TCmZMkP4hEt4kqU87sCw2NNZpTXzz6tgRYHPHdZ4xp3mdgi1V
         zOQrAJJfZFxkYW+IVHdp6Nxw5cxKF/DRfPV3XxVi2/kjhXDGJWqT1VkvVk9Zmrc/3iHm
         EDDO+2f9Z3z8txPBYEnkHNPxA8z7A4uRP+a718Y6LtmiqO9cy46nxqgzqT/8RRG/4T9m
         lang==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755490282; x=1756095082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zMRC5c9xXUgo6eKv4jcoCHH6TENqo9cqAPQxW1Kbofo=;
        b=a4ngT4t38mLhZtF/TgfY8Is+ROK0TjZYsf5aM96aWGA0H+ElAeZGnstSnYXCn201bi
         Iv/on5iEjW1WZu5GnBtP8iqPgdOpV4p+XSnZ2+gYdr5GlLs4LiWwvnjbXZWg+LMDFatw
         fSyl4LPJodmEHOoCU9qc2SS6ztLudY8HtDuTntazP7UQXN0LsFiCGnAbsyrrgqSI9Trp
         zDmrmzgpGfktv/xgfRNaSxjAz2kKBqSL/ZphHpj/+OWr9P7N1jfVb9F/BQBNBmD7Tyx8
         63oUoQjNVCR9K3H4fNDqOtv3Klr8J7loKhvRs4m6B0p6KDkHUvm4zikkKxzNFW0kGpvl
         BN9g==
X-Forwarded-Encrypted: i=1; AJvYcCXK4H/g1j5T3qIS3HAdTnHZ4SxBUHRd5ogbJsJZxR7nGhZ0ZcKkAkskCrmNFI5W/p8Cvy3prMxR2bE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZpzFIAlO+RrOc0C4SI3ttAcIngk98EDd3egWvMxWkl7H7B58K
	DwdTn8qu8t5wA7YSC/eOLSSpk8LFDs3lk0Yzx/gmf6HbaWRervwgrKV4oUCkJN1kKcc=
X-Gm-Gg: ASbGnctoE70M+Rsaut2lNbjk/MxQmGYBYxwCz2Xm/KEVHw2gr2BM4TTzy1adkyCh8rR
	fdrZBRjCtZfX/I9e4EysKJloGDoM8rDdTT8XzAZcO5MnPXQ2CHHSEWbD+RBcbSRvRtyqeKPlrO5
	qKDOop7/KsUOJs1ynvnWbWPY58UUa5Msd2S/XG+tyy5xZj8ri9rdbkgtNlptTQQUQJZnWpCetMn
	xiqOuqo2CQFy1Ba+76vuknbiRsPbABW3bj1hgsD1eKj2ghNxY14Pb7TuEYHZiYcN9llpKmWB5UU
	iqOq4TT0gC6cG/YobhVVTvlio0Y8ShvYZqqPCRxTuuvLEKwlqUQ/iV+HglPSNTTMtYPDayAJYsa
	ppKfvQSduu9fZD+rMQv+4ZqMi4VuthFP1pZ2H0ckEB2esWHHTmzqO4A==
X-Google-Smtp-Source: AGHT+IHP6UbREeetpnCWOLmWDeaEVguVbF9ClSYn1V6am/aKBqluAMuYoaNtdrC+UjrhiXEkm5ie1w==
X-Received: by 2002:a17:90b:180d:b0:315:c77b:37d6 with SMTP id 98e67ed59e1d1-3234dc7ba5fmr10093522a91.23.1755490282031;
        Sun, 17 Aug 2025 21:11:22 -0700 (PDT)
Received: from localhost.localdomain ([122.171.17.53])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32343c70356sm6560972a91.25.2025.08.17.21.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 21:11:21 -0700 (PDT)
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
Subject: [PATCH v10 09/24] dt-bindings: clock: Add RPMI clock service controller bindings
Date: Mon, 18 Aug 2025 09:39:05 +0530
Message-ID: <20250818040920.272664-10-apatel@ventanamicro.com>
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

