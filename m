Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBEF91FFC75
	for <linux-clk@vger.kernel.org>; Mon, 16 Dec 2024 08:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734338933; cv=none; b=fvGdwv3cSeO2yGe0CqX0YGOv3pUhLdKzYgiukEsexyMTtelWeLanynCauTsox+8oxwtU+7srOO8eLhAa4oY2/Ty9228wZu5GutFwX7kohnLf27NS/f39BekGHwF1RvgAQfNuxts9zOFZb0ei6DfJ0ng3DtsypjjUB02mwUXZBx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734338933; c=relaxed/simple;
	bh=QiMGpDjHJVbEJ7WtU+aAmU5WmhVGH1iQ/fXC0sMtGgc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f+Y98jGRoWiScLM0cprVMw4mg53IzW1y0M54cLtVROh8Uw3kGzOp17OHyrfjLfls66/mfZZDJEedUL8131AJuV5dnRIImWwZmxduSqmd2v/qT46aQ1bPp0O/b6F+qRN0cNHjjjrRBHXFeERhNm+DuWA7viLDVKg3Q0a+y7Tc7kM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=ESGcP4dJ; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="ESGcP4dJ"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2163b0c09afso32613165ad.0
        for <linux-clk@vger.kernel.org>; Mon, 16 Dec 2024 00:48:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1734338931; x=1734943731; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ssg9a8o6gZjpZvchZzGUt0Qt044T+B0HdxLRYjAYuuA=;
        b=ESGcP4dJXv3ZI0kvKH/rncqICV+ot2WKiFJBT+t+y/HmIcp//K2MPOdIZvz+IjDkH9
         nPx6L7Xx6lFMTx3k58DOwfhDu5ib17GRZ+6wj5sJZYybRmC4Upmt8sGIBucwjkQi94rO
         rbuTRKL/XRkHhMPkIzK3wLJQamMISdZteztPjWci1l9TegAk4cGYIYFm1wa5PcfDST0l
         XkOej55cTgV3lLiZbd8H6VZPCOKH9F0cxDAokgiPhmm8g1wTtbR4biv2V4QSC5hxwpza
         QcG7PBycoL6Y+tJ5IIZz9fFhYbtYkbrK2RN5osqwOqDt9yJ+IYCoaCY9lLjzs4uZzwRI
         xN9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734338931; x=1734943731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ssg9a8o6gZjpZvchZzGUt0Qt044T+B0HdxLRYjAYuuA=;
        b=gbalU+BYpYX2Bi8Q4tR5YtmwVSModhkCb5IZiYVTwQHTBWdsBdL8WtB87cPIykk+U5
         w70ZzI1B0j2ZKo/F9fBWvQG+OuQsFYOGqwsIFaDAlBr/5r/xNAX2vo/5N/DtvQQO4j3M
         +Ugnr6kd2qwP7pdslTe/MQA75y+lj2O1b0G7PcqFoNhWY91g9/eDbuM0UjeYNJOfC2QN
         yiKSKf1GhckmIyMKEGS/8mS7cwZ6TNIdiamrBP8VwwSKY0uwiVIkCopq5EdZD0QuZ9ei
         A+it/XyThboAqGyavxoMAwyvrv/FFTEL+feLkdOwMfnkwtqU21yFg3AsnlysuI3+Zt2w
         VnBg==
X-Forwarded-Encrypted: i=1; AJvYcCU/d1kq/9zid3Bc3+u2r/ibmH1pc0cb8NfXl911RBC8Iy9q+81O5Y9KswEEuhFCR4rJtTNJEhD33aE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyALWxmrDE2oyRMrBS9tFtz8PKLPRpL2He5dLBwRQZ+wz4JR4mQ
	EbzSpzjNY0q7RslDR1RSLtouoWo+7ywiPtL6hwHUBLwvDcDnWBC9WR6kovVnj0LdE+UpEG4ePaO
	x
X-Gm-Gg: ASbGncvKTa3xgyfgbUdHDiOvlcJQdxIAkYcIaV1nfo5R+LYZ0K/JvrChcmzKoEmOBJy
	Wclb5dPKxlEsS9wJZs2ynBvow8vqZG2iCPz1J2fRA5wZlz4QGTR+7moqATuJJnatSj4UV5eVMOU
	6gGHSaz4AGb8auOIZFQaDaGY/ZzsqDrMkvSt5sxD050bx2P2ii4i0mbTG19xz0gpoLYe7mkF/Ps
	SsdVukpZw0AP1HFT9MBVIdJ/yEcSq9XyeuMKdovYbaYUYNgq3gGcnvN5Zq7AoADPDVzWSRd+nYC
	DMMBuH3sYXn2qr0=
X-Google-Smtp-Source: AGHT+IEjkG82UTaLNxVZ0a1jk6JfxX7g2yNmmqLUOhK1uOCG12kx8FsqZmcvvvLQulkpsVPnYWSQaw==
X-Received: by 2002:a17:902:ec89:b0:216:770e:f46 with SMTP id d9443c01a7336-21892a74611mr174024415ad.54.1734338930854;
        Mon, 16 Dec 2024 00:48:50 -0800 (PST)
Received: from localhost.localdomain ([223.185.130.105])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-218a1e501d0sm37711495ad.116.2024.12.16.00.48.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 00:48:50 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Rahul Pathak <rpathak@ventanamicro.com>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Atish Patra <atishp@atishpatra.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [RFC PATCH 3/8] dt-bindings: mailbox: Add bindings for RISC-V SBI MPXY extension
Date: Mon, 16 Dec 2024 14:18:12 +0530
Message-ID: <20241216084817.373131-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241216084817.373131-1-apatel@ventanamicro.com>
References: <20241216084817.373131-1-apatel@ventanamicro.com>
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

