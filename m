Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 376C01FECA2
	for <linux-clk@vger.kernel.org>; Mon,  3 Feb 2025 08:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738572664; cv=none; b=sLlO5iHwICCaq02Ti18WiLongwp0TlQL4+4IB+nyLVKwH03glCVELybzB0v0fe6MAHcZCz3wziHa9KDyygWqW47Jed/g6Ini4kwj5a4b/IAjf6xSdd11k5Q+3XXmIwiXwuWD3rFGa6Elza7HlGPG7jBajhdzDLqBE7s2SOHigY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738572664; c=relaxed/simple;
	bh=PKCozwgCuABhJm3FGiso9S7XEa6OmbDF8ANr4JIaqWI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G23Vro93ti6/2/gB9gYlgxJ39dtjumvH9I34Y7TZJ9R4UBUPrBQyhQsQTt7EkM6psPO3LtQfRa+J2B2uTORas9zim4iKPcFjqQgIIg21mta6B7PQMnbmwFPq/N4QHTiWkdrLbN8aKsSIcINTicoh0YzikPxR/k6ZCZ6VHIFQF2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=XkLbecf4; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="XkLbecf4"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-467725245a2so38296741cf.3
        for <linux-clk@vger.kernel.org>; Mon, 03 Feb 2025 00:51:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738572661; x=1739177461; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uq5bgx7F73e7S2pMGqlkagc7SWpAwEk+Db7gTuqwgBU=;
        b=XkLbecf4xRPUphzZm9AErUDJM1oxk9IVUbqliV5/il4hwLs5PvcnduTGUlBsCR38a/
         BcHWG7XX6QE75WgCOYlJ1UmgFU9RGapQQHneIEltqp1RkIfGEtAL8MalPnEGUqJbab9l
         poN91SzCSiW7Z5LCBrNgfBNsXKqdd9mFGlDNkXUMoJVrH9KNoHZc68OkLXpC98H7EO/9
         VvWesxl45ve2eVWeEMjqWv3Zypi9ipcq6Pd2k/pIlRtsiJHx1PMlJevTnccBxoC2OmSS
         Cwq/PZqZ+In66K5OM+r2AI3h/wJNB4nlKA/4Kj1ANDJMoSx6HfBk264+BMgejAvxcRK8
         s6Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738572661; x=1739177461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uq5bgx7F73e7S2pMGqlkagc7SWpAwEk+Db7gTuqwgBU=;
        b=qvdHwnVinyJV7Iv9kWxay17U5RB3Pk0otHpObZ5F6nq/2Qg1Ol4Bn5HgP290rFVjw7
         1nWTSsiLBN9On4GGlAIh8FAUliBRPn+7L6zyl3F61ilNZXrKQg/gtYiu12zVMOx3AU8J
         L8jKYapQhwMX9OSwuwx5/Od3Hq3hU/CGJN912zkEXy8/mXx03JdRdwhqLF3DEZCMmRgA
         ac83aPb6ObZlfR99vWKgFXxAxOdA+MxsZhSzP2xLUol+kyPXTnv2gCQWTIxPPOTpW35P
         cFERTPygIQSBzvt4XvvziVrhOhDqiX1O+c/JBKOnaGG60C9Oy3dA1R5abekAWCHjrl47
         TK5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWKJ10V5sMyhC77so34JWTVwOuUb/oDmalcpynxhmnS9IVppdM++KDfrL3zp3ZyP4J1Ey/9nzDgBIY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJFH5yHAoA6TcL7YmIjQNSh6UkDMDkjoBJW62ZS7beJ53JGDSt
	jseUVkLktkKr4CQa+8NJDR7+uXGx1qQysoQ0u6sTfiWV3nw++1jPvEyLnbu37KE=
X-Gm-Gg: ASbGnctTTwBhqD3omp2MSyAwM4Ai8AHfh4C13HKx98aT7n386DKNrVUYcJmYhE8WdZg
	+w2OnvZjONHNT4KF/0ilbngvSXavIvOrRj5AnbBFuVUYBVGmhhQU4WEtTKtCcbXxKSsA5Fzc5aG
	hMK3lhXfmyVqQ/sLzC0CPtmrunAEBTtvoQ6W+oaj/iYH/gw0OJdGOGLdPCmLzQMtY/ByyzDnUvf
	Iamub0YCZZlF8HbBARUkEisMlGqD/8b4cp0boQv2o1cdhU2W4YIqUvynFb0wfdjdIkPI0gmKTbD
	XrKtuShHbpGHdM8vokXqXOA8Q5uQ9j+GQtVFU92738ge5tacjHvhTGQ=
X-Google-Smtp-Source: AGHT+IHKSWjJnml9P2k8xe3WTZy7gZVOr3y2y3l5W1mAhUBR6IAIbnAkFVzcudNqB834buJx1oU/1w==
X-Received: by 2002:ac8:7d92:0:b0:45d:8513:f29a with SMTP id d75a77b69052e-46fd09e25c1mr202526631cf.9.1738572660838;
        Mon, 03 Feb 2025 00:51:00 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46fdf0e3089sm47657911cf.46.2025.02.03.00.50.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 00:51:00 -0800 (PST)
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
Subject: [RFC PATCH v2 08/17] dt-bindings: clock: Add bindings for RISC-V RPMI clock service group
Date: Mon,  3 Feb 2025 14:18:57 +0530
Message-ID: <20250203084906.681418-9-apatel@ventanamicro.com>
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

Add device tree bindings for the clock service group defined by the
RISC-V platform management interface (RPMI) specification.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 .../bindings/clock/riscv,rpmi-clock.yaml      | 77 +++++++++++++++++++
 1 file changed, 77 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/riscv,rpmi-clock.yaml

diff --git a/Documentation/devicetree/bindings/clock/riscv,rpmi-clock.yaml b/Documentation/devicetree/bindings/clock/riscv,rpmi-clock.yaml
new file mode 100644
index 000000000000..c08491c04926
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/riscv,rpmi-clock.yaml
@@ -0,0 +1,77 @@
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
+  system clocks managed by a platform microcontroller.
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
+    oneOf:
+      - description:
+          Intended for use by the SBI implementation in machine mode or
+          software in supervisor mode.
+        const: riscv,rpmi-clock
+
+      - description:
+          Intended for use by the SBI implementation in machine mode.
+        const: riscv,rpmi-mpxy-clock
+
+  mboxes:
+    maxItems: 1
+    description:
+      Mailbox channel of the underlying RPMI transport or SBI message proxy.
+
+  riscv,sbi-mpxy-channel-id:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      The SBI MPXY channel id to be used for providing RPMI access to
+      the supervisor software. This property is mandatory when using
+      riscv,rpmi-mpxy-clock compatible string.
+
+  "#clock-cells":
+    const: 1
+    description:
+      This property is mandatory when using riscv,rpmi-clock compatible string.
+
+required:
+  - compatible
+  - mboxes
+
+additionalProperties: false
+
+examples:
+  - |
+    mpxy_mbox: sbi-mpxy-mbox {
+          compatible = "riscv,sbi-mpxy-mbox";
+          #mbox-cells = <2>;
+    };
+    rpmi-clk {
+        compatible = "riscv,rpmi-clock";
+        mboxes = <&mpxy_mbox 0x1000 0x0>;
+        #clock-cells = <1>;
+    };
+...
-- 
2.43.0

