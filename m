Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36AE1DDC21
	for <linux-clk@vger.kernel.org>; Sun, 25 May 2025 08:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748162875; cv=none; b=kIIIq+4/scrzM1bsfTs6SwAPeUyAQYduY3X3Yfw5dFOOfMEzAXM2fTlBR2z0rj6q7AFIUTw+JD/is8eX6PSk0NyM3DCJY8ZjLzo3UcNB1oiLKZffyCQJBsR23eShfHQ8DxcsXaIAYLaZtMWXMM6W1G5Iw05+nwiobRZ3YGqG8uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748162875; c=relaxed/simple;
	bh=AfloaQsqNQYLyX5RmcBGspt+Vq12jXRiVwlGREexJFM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XGUeXPa+gtH6B/ZESFh9zXJW80lAkCP3PFeOLTZq5m4ar7z5RDW+FBN4j09rvDrw781e6uVW2e4/3EoXEpK1axMbc2KEnPr06L/ZKMHjCov5xV3H9EqlsuH7Ecte7xFAie5ADIIShi6cUydtJ4KS+deA68+FZOj4yygchkdwACg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=FPRoSdwJ; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="FPRoSdwJ"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b0db0b6a677so906768a12.2
        for <linux-clk@vger.kernel.org>; Sun, 25 May 2025 01:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1748162872; x=1748767672; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wrq/ed0KxjpyuTfPVgQBHoRGk1JS2/KTrIUQ+VEc4ns=;
        b=FPRoSdwJ5XmYbM3lteFR72flPqhLCYTPAYGuzqinZYsPoJ5yu0PjkRKf3gVY350CqY
         oepAhdrteeTJxtYk2aPK4Qc065e7isKL7qIfqpIDEr/JqNXt64Id4JAxGU6UPx+3QqeU
         m+XbHrV4sL2jLG/G6nL6z03hG/2IoQhdG/YOBJmlC28GI7H5pDGkhMFFNighqgodi+fx
         puR1GXPjrx82vJVtAoDV4FhRIUPwyygOkOBDESjOtkHo9ZQHdE7FreUJ9QC+wBVp1yTq
         ZdgUQNrOz3gM/BPRFHSe12JIgVUqMI8MzujYcTgkYoEWPsRruBKaM7Hsgh/Nc9ciyjcL
         xMPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748162872; x=1748767672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wrq/ed0KxjpyuTfPVgQBHoRGk1JS2/KTrIUQ+VEc4ns=;
        b=PLvyIWan4EDwpr/VQN8+Vb/pdTwQWMyxTL0fR8JV6b/3edC8YOyvUmTdBaIEekXnaD
         01rJTYzhmBPZ0qXEgOPwoKDWYW6Budo2yHwEg8kPa/2cXC8PVcq/x8ZkKDPpuMeaXNQZ
         0QcRP0nIhoP9N5NpKoG0VTn5cZYFFLqkGsPordtdQeUWvSfKaePAibpX9/fFJJB2O6Nb
         VsFkgFnbS08eERUyDPzuYS6ayXOBdpfUVotr5aPuurGnBPsFhENeGP+0E3BDN142sb0T
         s9LwRmcmYrBsNeePMZAX287/mU2KCU6TmWbclbgmCDLu8J4U3pcsQQng0Sfrs59E8RhY
         AP7g==
X-Forwarded-Encrypted: i=1; AJvYcCWedT1oj83KK03II7wfqHqtVxGsypp1yHXPt+bxvqn22Smycy+J9kXhit7mV0wmIMfX+JWFVM6ZrO8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYR/Z8EK1U5mW1GCw9Yxuu9z6+lhAIVWNnLrULu6Ee0CP2JCOk
	X/vwmGe6vZXTjEmLpxEeMeOX1X5nxsADGQFAxMd4qz+OWqwx8XhePvzhynCFXxptaEk=
X-Gm-Gg: ASbGncuYcKZQVCQ8kXtHlCKAK4kUH/ZoymWYvanhSaBkBu+qJSjWaQbdrxjI3zGsbao
	f47l42yC0KJa1ae5zDJV+ssZgTClJnCdIB2DuslnwK7frfa99QhtNNMd9a4nAzaYBxw4Lxkuvms
	CHzcH9/eLrIOJtL1+x0oebaBe5F3slvgZrwGZ2k1P4PQqD/8mpdPfl6xONGgyHV9x/ViVGZwfTq
	llHoIZtfLUFfiD3CG6Vk9O6xyYgQncYofIg76oDftWUfOqXiwoOZh2Q86O1NGVDoA1yWkNlha6D
	MpGINyZuuzinBuQL5rBL50vAuttYEB25pF6dl9Q13zBkUbyomfYDQlllhVCn514kM51GmKbL0/1
	+0OtTY/Y9
X-Google-Smtp-Source: AGHT+IHKLRkxyGfdlCk8+5+RKFhUy+GVM25vCTnqPcFz4//nByaA4NGGAXm8aCo5Q9FTRRl96NH+BA==
X-Received: by 2002:a05:6a20:2d1f:b0:1ee:e24d:8fe3 with SMTP id adf61e73a8af0-2188c23fd7amr7909301637.10.1748162871787;
        Sun, 25 May 2025 01:47:51 -0700 (PDT)
Received: from localhost.localdomain ([122.171.22.180])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eaf6dd83sm15250627a12.18.2025.05.25.01.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 01:47:51 -0700 (PDT)
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
Subject: [PATCH v4 03/23] dt-bindings: mailbox: Add bindings for RISC-V SBI MPXY extension
Date: Sun, 25 May 2025 14:16:50 +0530
Message-ID: <20250525084710.1665648-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250525084710.1665648-1-apatel@ventanamicro.com>
References: <20250525084710.1665648-1-apatel@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device tree bindings for the RISC-V SBI Message Proxy (MPXY)
extension as a mailbox controller.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 .../bindings/mailbox/riscv,sbi-mpxy-mbox.yaml | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/riscv,sbi-mpxy-mbox.yaml

diff --git a/Documentation/devicetree/bindings/mailbox/riscv,sbi-mpxy-mbox.yaml b/Documentation/devicetree/bindings/mailbox/riscv,sbi-mpxy-mbox.yaml
new file mode 100644
index 000000000000..ad4c135e0510
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/riscv,sbi-mpxy-mbox.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mailbox/riscv,sbi-mpxy-mbox.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RISC-V SBI Message Proxy (MPXY) extension based mailbox
+
+maintainers:
+  - Anup Patel <anup@brainfault.org>
+
+description: |
+  The RISC-V SBI Message Proxy (MPXY) extension [1] allows supervisor
+  software to send messages through the SBI implementation (M-mode
+  firmware or HS-mode hypervisor). The underlying message protocol
+  and message format used by the supervisor software could be some
+  other standard protocol compatible with the SBI MPXY extension
+  (such as RISC-V Platform Management Interface (RPMI) [2]).
+
+  ===========================================
+  References
+  ===========================================
+
+  [1] RISC-V Supervisor Binary Interface (SBI)
+      https://github.com/riscv-non-isa/riscv-sbi-doc/releases
+
+  [2] RISC-V Platform Management Interface (RPMI)
+      https://github.com/riscv-non-isa/riscv-rpmi/releases
+
+properties:
+  compatible:
+    const: riscv,sbi-mpxy-mbox
+
+  "#mbox-cells":
+    const: 2
+    description:
+      The first cell specifies channel_id of the SBI MPXY channel,
+      the second cell specifies MSG_PROT_ID of the SBI MPXY channel
+
+required:
+  - compatible
+  - "#mbox-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    mailbox {
+          compatible = "riscv,sbi-mpxy-mbox";
+          #mbox-cells = <2>;
+    };
-- 
2.43.0

