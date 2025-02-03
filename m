Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D9F1FCCE3
	for <linux-clk@vger.kernel.org>; Mon,  3 Feb 2025 08:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738572605; cv=none; b=UlFTbLXOXufdgUDU7FmswEAHkXh66TFWplPHr06jyCKUXGj9uHns93hFuU3QDpAcMvxV8JM2n9kgWLy3HbO00QAYQLnkjYcw/xiBXR6jBnP862+43Z5SnkQeEElL0kTrUeKnK7UzaslzZXtPFJY1v8vYVmJme+zXlqX0OwIUQ2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738572605; c=relaxed/simple;
	bh=QiMGpDjHJVbEJ7WtU+aAmU5WmhVGH1iQ/fXC0sMtGgc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fSWhEcZj+22K6pImuJD3ZLwB1XOyDytnnwRhSe8XcMH/vPGR8odTwPkw8oJ1MkORvApY37mYl9v89ChdY6KAzWICl6xP6oOBv1mBzlsTmQboUGonTqf09P2qqVOKTZZ2wzfZwauaw59d4l0CXJzGjNyvnqeXsNAAGi+K8bzqGd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=HEKQwqUg; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="HEKQwqUg"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-467b086e0easo17815201cf.1
        for <linux-clk@vger.kernel.org>; Mon, 03 Feb 2025 00:50:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738572602; x=1739177402; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ssg9a8o6gZjpZvchZzGUt0Qt044T+B0HdxLRYjAYuuA=;
        b=HEKQwqUgZdXjfzfNgrR+BXnA5UxePw+MHAYyIwDuBdXZyLIwl0OyTQFJ4OOdBGLmDG
         2pdwNm8izip6EBPh40HaU/Pr8QlcH+z9NSPf+im5LeLPeuB2nYqWaMyEd7Ws6iLAoWaH
         UE3XGhKsg1LIFN3ZsWUOdwoUH4I7zKywNXN+V02eb4gUbr+r25lgbuC1m12OHcAsE4dv
         B1K5NyUFhpmCvFUhQNzS6VkI96lVTgX/sHvQPLPColhfBJMu72cYDJ/rSO2HfTWoMm/r
         PU8f9zTEKQVrjDgAJ+NP8taHuMF6DqjXChDSBV8x5YxW/KW8lFy/YHIRuLdQ/owRKEP+
         Czwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738572602; x=1739177402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ssg9a8o6gZjpZvchZzGUt0Qt044T+B0HdxLRYjAYuuA=;
        b=gbBRW6CiCmxHwoTQL33b67S4dcd17xxvYW6kmHNvZjaoikXUzdEaJz4UC3v7wQrHV6
         HFQmgFI/cYjKco0hV427g8ExWlC4JHeLyYsemcaBT/GrkOTIIzjV5YXuKhK6ScEYXiPl
         MmTkEjP1xMZlS/1JWiwH2LfMJX3m8IIl7AOdYmTplBuQFYN4PImcwppOuTC2/XAJAray
         z+6rnAXX1Xw8tHLJVfxmcOnDWR9SgjqqrufQfXUbS83Wm0RXzz8kOqY2vXwh4wnjiKnB
         9g41hkQoq2F+s7HVvlX2cDDFmg7kJDXVUA9u4S8xXnPm0mvAa5seodjSiGpjW4BDEUa2
         w4uw==
X-Forwarded-Encrypted: i=1; AJvYcCVWOEjEQlyvLwn8P8bxRBU3la1niVH/OToh9PjdpjlYnhEkPp36hXfZiuGntZMobOTzWcC7RQ442bA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGLmL5/N+Ag8gcTVJfTgkUJbfCv7i+g4Eu7GvpKnu8sZw8j/j5
	HL6RfJH+u/VKOUuh/26Ll10sm/rmIOQTX65UrHaDyITgDN+oz8/lQ0Xavoa5LXQ=
X-Gm-Gg: ASbGncvcntL6gS7MdzviNEOgR2IB8ji6FdUtJIlaUq4g7vG+iU/cjKhxA+jig/5FtHj
	sJ+1MW2VwowMYWDKEmQE2DzEL3LikryTBVMdFEaZmwSbHGRecJ1v/gZwqMi3mEE/Fb4F2VYfQ4m
	YARIu7z6o2kjofwJn8U4cwQ0hqsF2MZ/1M0SAjdzUhlNEHaPa/KJRLtSdo5uoM2K5noZJdj+Cy0
	bvlNXHEjd+0GsnTpDdbpGf1jXVlmeqC+YaVXM8MV07qU3UeXtBCCv9HHK7ZVFmqlKKFsyBqyXHY
	zSnW0BqvW0waRyfrtBacSoWTIvdvwH28anKu7W98VWsZc4t8AcLHBVE=
X-Google-Smtp-Source: AGHT+IEumBd7wOc/wh3jyz0afWhLZy8y7yKZMAluEJD5UqFuCGfrMInxfJFsvFE/QBEyK9tHDtTWWw==
X-Received: by 2002:a05:622a:5108:b0:46f:cc36:d51e with SMTP id d75a77b69052e-46fd0b68b70mr329868001cf.35.1738572602314;
        Mon, 03 Feb 2025 00:50:02 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46fdf0e3089sm47657911cf.46.2025.02.03.00.49.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 00:50:01 -0800 (PST)
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
	Atish Patra <atishp@atishpatra.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [RFC PATCH v2 03/17] dt-bindings: mailbox: Add bindings for RISC-V SBI MPXY extension
Date: Mon,  3 Feb 2025 14:18:52 +0530
Message-ID: <20250203084906.681418-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250203084906.681418-1-apatel@ventanamicro.com>
References: <20250203084906.681418-1-apatel@ventanamicro.com>
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
 .../bindings/mailbox/riscv,sbi-mpxy-mbox.yaml | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/riscv,sbi-mpxy-mbox.yaml

diff --git a/Documentation/devicetree/bindings/mailbox/riscv,sbi-mpxy-mbox.yaml b/Documentation/devicetree/bindings/mailbox/riscv,sbi-mpxy-mbox.yaml
new file mode 100644
index 000000000000..8a05e089b710
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/riscv,sbi-mpxy-mbox.yaml
@@ -0,0 +1,54 @@
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
+  $nodename:
+    const: sbi-mpxy-mbox
+
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
+    sbi-mpxy-mbox {
+          compatible = "riscv,sbi-mpxy-mbox";
+          #mbox-cells = <2>;
+    };
-- 
2.43.0

