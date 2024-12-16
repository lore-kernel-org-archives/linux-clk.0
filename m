Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78FB8202C26
	for <linux-clk@vger.kernel.org>; Mon, 16 Dec 2024 08:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734338954; cv=none; b=UzccLBumuRjQUGg8eRxDdfhIefc7YGySpKF16YVuQHcRiNCb5wXlwaYpG10zLaycZh3sH8e2JvOVZoVTUTjvcZTofv/dvspMMxj0DlvU6aicSlYD0ZwBA61gyCGknTkzcKZbvEecXHTS4o2LhEI+oPL+PFRBwsXZivPsFRBba9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734338954; c=relaxed/simple;
	bh=9KAfNFXRr4/c7x9cdy5cq58RiwlnEO0rVAtxnjEBwcA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G8s+KVORN2J+9YSHK5XAd5Ggt08mIv3FHu3+H3bIND0cAXUQ80rd1ktJPaSxLp/0kaB0EZasK4NHFG/rpWK0fobmGe9rR636HWyPSLD2F1VnIB/lns5dIJwaqxT1a7QODPokHvosxc8hdHZmeYFNe6i1fXVOETOHlX7VY3FeH8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=VXEkZRrc; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="VXEkZRrc"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-21649a7bcdcso34973995ad.1
        for <linux-clk@vger.kernel.org>; Mon, 16 Dec 2024 00:49:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1734338953; x=1734943753; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VTD9xjQhkwZ+fm306dP2P3Gi4nTgLSlKokzAF6+8eeg=;
        b=VXEkZRrcA6Vk6vvyxlSw7CtRP7ACofA1vdIS59c9E8a0pmnf7yK0DxjV3MOcYkaSJL
         TibRvET79nrzSXe/bK4xq+Sb7skQWeeIvRdeqkIaY8Fv2ux4LIVVGNzwM7vMDQhqePYs
         YSY/q57WSF068ojxPjxboCClwQnnGwzlCFBhkuGgF0MBeDqODSK49Zua+iqMIMTxB2Hi
         7jy6POQZ1j6pLRJ3hwq4m0vn0VGVAXYw0V+76l6iLt0U3ilX8M4m8+ASkF5u2wAJGTdv
         an2HQ5CTl/xHgcrOMuNT291gyGAR7QNHRDJpTo4bbfYKcXAtPQTbuxOIm1w6j23qq/AV
         B4/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734338953; x=1734943753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VTD9xjQhkwZ+fm306dP2P3Gi4nTgLSlKokzAF6+8eeg=;
        b=lRUFdTH7zc1d4cST1ry+laf44S/PMjKcm9/XLimPMC+2WhIwYo5Jl2PJRaeTiGdEOq
         YWBGpwWjtVvswlREWYQwnjFicYd8CBNSsUYXubZJK9kr3GrHnn2KdOUIFVFKn6+KZHNQ
         oZi1/tO5BRliD/LXSo9G/mOfVCWSgE3959DtYvpi3saIF2MoSSLjfv8eJWlf7qn57IxK
         WgoDh2tOBRm5//vJFHB9TolUKPs3GCicS73Kah6DCVBtHDOkvfOJ19MO7xHKFOp0wtfK
         CqVMCpYMtnrSQQ5mv30TDWEVvOdB8Jjd9Oc9ZEtXwBT9glmPeUFtVMCljpsSk59EXMFI
         BGYA==
X-Forwarded-Encrypted: i=1; AJvYcCXVFAMeoGS/j4ha5XjCpWTvSh2YhOnSGSPde8dL90BgqUVWhxEwGmR+wkHJbkaJVtlHnXFN+mhMgAE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxJDtTHfJtofSpL2Tbh5v+zcK+sqPpXuVSInocwJZrpW9jyOCn
	LLbHLqSioisFJbcqjhCSkHr8Q+DGv3Gst3wswq7srGRKdU4i8uPoRBcY1mL23cA=
X-Gm-Gg: ASbGncvpy0C+CFTLWJm5ciA0eTAKqLqynjg+q4HHs/XIXk0oWdoy0AcvdAoRSP9zw6t
	w5Keyn0+6CtW59wlL0ACo7h//1WrlIwaapDnXqN7JyD1sHihfUo+BT7yPQLdD6enFqUZDb9p6CJ
	FIeO8PdywvTQegZX8shX2FSEoyKEPMCHT5keA/c8yntG2umA0qyxWKU+t4VJ1Dlg19T2NXaHCDo
	roZzzTiaSJwvekGEq+2dduG7tkiKMnASV82WAqTwNr2QQIXQXfAYxC+dbX7Aq3hpMXF2Zyy8FJB
	aHWHF/+luMZEBmg=
X-Google-Smtp-Source: AGHT+IFZAXk9i2QTSa1ARsAF//7P/a/eyeUKUtrq2KyDoH6hHl6V/6vbY1bhBC88LnxU0+wlfpf9Tg==
X-Received: by 2002:a17:902:db0f:b0:212:fa3:f627 with SMTP id d9443c01a7336-218929b78admr165235345ad.16.1734338952799;
        Mon, 16 Dec 2024 00:49:12 -0800 (PST)
Received: from localhost.localdomain ([223.185.130.105])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-218a1e501d0sm37711495ad.116.2024.12.16.00.49.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 00:49:12 -0800 (PST)
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
Subject: [RFC PATCH 7/8] dt-bindings: clock: Add bindings for RISC-V RPMI clock service group
Date: Mon, 16 Dec 2024 14:18:16 +0530
Message-ID: <20241216084817.373131-8-apatel@ventanamicro.com>
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

Add device tree bindings for the clock service group defined by the
RISC-V platform management interface (RPMI) specification.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 .../bindings/clock/riscv,rpmi-clock.yaml      | 78 +++++++++++++++++++
 1 file changed, 78 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/riscv,rpmi-clock.yaml

diff --git a/Documentation/devicetree/bindings/clock/riscv,rpmi-clock.yaml b/Documentation/devicetree/bindings/clock/riscv,rpmi-clock.yaml
new file mode 100644
index 000000000000..9dd98e390708
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/riscv,rpmi-clock.yaml
@@ -0,0 +1,78 @@
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
+    minItems: 1
+    maxItems: 1
+    description: |
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

