Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B271E8333
	for <linux-clk@vger.kernel.org>; Sun, 25 May 2025 08:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748162938; cv=none; b=GgIoau6T2EGAbTPFqt7WZn1Dxh8QhMFuTFgUfdOSTcmY4Stjmn/eFODxLln8Bd8pnku3ik+/tn8MOBQCDNO7hobzjXWr+NXL9SLlsezV+D8FBsrDHYo30mfDM3jxZ4cb4kHP2nmHJBmyq3u1ilO3g7gKut6gacQW9FzXWt6ByuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748162938; c=relaxed/simple;
	bh=NxBFGj+cri1SvClLb1edobZ1wrGwRBkx4SOQ21bAQOo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SlJ4Ul38fmIrN+6fHT3vidQ2aGpZGv5NPep7vBhyFt7OnY9VaMsqJfG9JepnxW8YCHxbjIFKGgU67xXwjWDOXLW303b14A3Gh13rCuDoytwCbfinkjKeNBWU1VQ+bzJ3IGkYrpEGvJ7oY6e8mLpjaU/Mr+4TK8oK6SqoPUWfBXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=feqzxes+; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="feqzxes+"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-742c9563fafso824951b3a.0
        for <linux-clk@vger.kernel.org>; Sun, 25 May 2025 01:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1748162936; x=1748767736; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GNEVmZiv/q5DSw1yW2Dhni3TymNMhn7fmeMDnXK+LxM=;
        b=feqzxes+LuBQwf9b3rFUw7zGeO078jhBRY49tmUPu6zx4hkpUcRwr/nZ3F9uMIAfbg
         WpO80rakgTJ9LWn6UqjjQtLWt/hiKXLeKjkwAy5g5IigVTFtn5/B/b4BL0t/YjlfCmqA
         lrAuX0KTJaPTk9Etd5gYHtsE1V4Uniu9gOE8E/11r86VMZBRFtq4p9RksIr5NJ1r4ryM
         ZPZJeSzbSMWyFaa5Dxg/DnmbOpngXEJpR4dT4mEDz45ke8xC8jRjcWRtlTbd59gQptjf
         TyOx7Dyi9LxeDgkH8F6pbGN8a+9Gz9UXTgRq72lvJ5P65sXxWYZDASsf2iuC7VGl74xz
         Ok6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748162936; x=1748767736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GNEVmZiv/q5DSw1yW2Dhni3TymNMhn7fmeMDnXK+LxM=;
        b=Dh+W55jzMnXrBBGRMQg8pX9YUSYa76f36nrTcBypqgF20MgcoCWkRo3y1y47mPD+7Q
         C+4F5YFDbL9uS224/xELByoOO5ROLfOyRkDWQxnpRm/TUgu0yy/bEAclpPjjyqQhEfGG
         zdc3k6giVV+ej/1p38ok5k+P7WbiZtV1Wmwf0BGn5h5SsrfzRZeV7lH34Ty2okNpl1ui
         FZvDWjgcUq+NNkr/mRXm5K0r479iqpX2I4VOCT8QWNhK9y5t7oqHLY7uo5OkHutYizBr
         qRhrzT+i0ARJ630IxMjrTTK/TBZwp4B47QjY+oh90/QEh8fKEz553yrTxHoneG9+wmaj
         o06Q==
X-Forwarded-Encrypted: i=1; AJvYcCW6DnaEBUWM0Std8HBu5JJ4tu3+jcQA9QtdLw6sgjh/Djxk4fFw6ZOjKWOyp8xPdmFfDWJ9GHS2XWI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yygoi4RN5bmQsFGN4ATmSM1C5WzQfz/SX5NCZg9hQGts05b6S2q
	tyuSNY8uf2aSe4nFrFs9LJDXGlE01Mufu9S+kS6D/2C3Th/AcJroQbUlgA4qOihE1es=
X-Gm-Gg: ASbGncvU7MWP+wUgMCpMWyBbu3fFnyMpC6E/EGwB99Reu4gVrD7L1rEb3rKH7+3Etpt
	GK8Zp3edmRpOBZHIsosBOVoGF5wTp5s5XT13W4rOgzNndyF9iFsAWkeOQJg9NzLtm2GmCDoZpEL
	k8jL9OV0yWSnJWu9XFPB5uwGMH/pxnXQpyPfxpo2wbVVXmS2R4MKR+QCFUdGBrGRGHDRPmcfdsl
	7MjsbBAwQmqkAY4jb4fzxaeJHpTKbfjBj0oBMHbsN1ybwFzKtPAudeLQF5wEwLtp1Ae19kfKhaU
	sY8fZJQecDyrVbTRcdcEqLuAhr8M+bvdfsFqK1K/ZSwtjjzjfVyQrZ+Tb0XOqJhyMxm6EhnXBWx
	17OgVZ0dg
X-Google-Smtp-Source: AGHT+IEiTXrjYcEqxEmC6dICJ+WKkYuwNtth0DfdUxY1SK4VyNZrGaohTDwGZlxxDYkeIS2os+CWiA==
X-Received: by 2002:a05:6a20:d486:b0:216:67e:bf09 with SMTP id adf61e73a8af0-2188c29943emr8460905637.22.1748162936519;
        Sun, 25 May 2025 01:48:56 -0700 (PDT)
Received: from localhost.localdomain ([122.171.22.180])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eaf6dd83sm15250627a12.18.2025.05.25.01.48.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 01:48:56 -0700 (PDT)
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
Subject: [PATCH v4 11/23] dt-bindings: Add RPMI system MSI message proxy bindings
Date: Sun, 25 May 2025 14:16:58 +0530
Message-ID: <20250525084710.1665648-12-apatel@ventanamicro.com>
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

Add device tree bindings for the RPMI system MSI service group
based message proxy implemented by the SBI implementation (machine
mode firmware or hypervisor).

The RPMI system MSI service group is defined by the RISC-V
platform management interface (RPMI) specification.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 .../riscv,rpmi-mpxy-system-msi.yaml           | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-mpxy-system-msi.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-mpxy-system-msi.yaml b/Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-mpxy-system-msi.yaml
new file mode 100644
index 000000000000..26dd13731350
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
+  The SBI implementation machine mode firmware or hypervisor) can
+  implement an SBI MPXY channel to allow RPMI system MSI service
+  group access to the supervisor software.
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

