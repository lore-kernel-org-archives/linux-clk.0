Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6A722AE5E
	for <linux-clk@vger.kernel.org>; Wed, 11 Jun 2025 06:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749622992; cv=none; b=eEbtgzdewO+ruBX8LR+/BhIjoQG5L7QmbQnjq5sdEQq7O5u/ZqHXB2eTqvpZWegv6Cl9nbemJL0sZ4c2rrAC3+mHRxYBgN5anU3GmSzSbpPiJULlOhRYiOo5ZiF06PFluJT5BywMIpbfZdwljgqRucetkSjNvcoCguggRtZIC+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749622992; c=relaxed/simple;
	bh=kRcGg70RKkFO1mUlmdFiMNEl7ognGFDZDE0zZUh7mcs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A8t/sixUNzC96hcuZpaYVt73YaV2GitY/yW4y0QnxRNUeuhhEHSHheC4WTcRHVlVs1Zu7nf+EA2zp/YHarXNvl+1qf8cRaAOFGhcH3A/LPbc4wrBW+TeglHp2+189e/Ru9U0zIuI+bfiYj9kS0mDyEsboorVP4PLLDw27gcXIBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=lJFyikr6; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="lJFyikr6"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-236377f00easo20616915ad.1
        for <linux-clk@vger.kernel.org>; Tue, 10 Jun 2025 23:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749622990; x=1750227790; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1hhJCf0S1HrMwLYRdGRFvzVPJDaWXTpl7/BKK1v8w+s=;
        b=lJFyikr6XZdt9Fflty257mmsUfydvK77z41XCZLbndlglaIU9i449+NjcO5t++mzFU
         jMX4QsCfg1lNEeFcxHS4slntMBWW66j7HgMtORsbyuQ1zXOrsckaR2S7K42gT5LrSA76
         UpEorSsLKiDLjOX6JDRyG8hTnvmBHkPcHn6UdUQlhdZihnqAj4MyONwcpm/TJKIKRZuB
         +5MfnSrVX9fDjBleMlwt2EDb4FYgIAkFhpDYogpNo58K4hzp3M/4KW5xnfiuxhwWBcx8
         ByQCF8Z1aLl1NYzXu4mHLaf7/6cVc8IRF8GtrAosNB39+jpc64Xi90ni0A0/4qb1mJaE
         whvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749622990; x=1750227790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1hhJCf0S1HrMwLYRdGRFvzVPJDaWXTpl7/BKK1v8w+s=;
        b=U24/r+68cuIc+UPAN2jwBzxy7zdAsDizeDvu0PqczycTOFtUe3r4FhOOa4eTE+y+n+
         kyl/bhHEGSNO4V70uSe0JNjx7pUmvYi/hH22CCMVHYa0doRAu4k14+CiMzONvQzx9JY+
         GpaEhSKzrWoeZ9o1rABPRVXJdQQBF5Y8LVNLT10znwV9KstBIotl6NsYvTyNkqBK8r/8
         66fkGODpHfrx/7uA/RXLGPxghaREPOVfo8ZFCwZsDJunAhwiWFCWwdps7CX7jW3SC84R
         8QxPglc7oijOla0lLrtgGU5OiqEVgzb6Dp6BjLj4dip7FTsFgzrSNjqW8vdOFBv/bb+w
         fCnA==
X-Forwarded-Encrypted: i=1; AJvYcCVVOlp0z/JVqXt2xu2Mmo0sgHjvd9BCAboQDlNFy464hLkkxuf6JrfO04vEmbYJjXw+O7J9vYJth3o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzL4Pjpujl6aJIw6FsbRFcaMe/C3QI4WTCalqU22y/+cQgltwtm
	K6+5r2JaCMBwMXSORcGgkNzwMioUMglaGV9lg1S38UJk0yr9FYo9Ha3u3ZPsro/u6Lw=
X-Gm-Gg: ASbGncvv8CmdHiwGCKj9SjXPGV/OsG6xFFEISi8wrPpI0znF+te5nRiNGgVPnILXwOG
	U/Mql7iJgugaasBYKiz8ixov+lijZVQRMrI5Fi343lJa6kJXGoBLpk7IV0pY/RbCOuiVYbk/Umt
	etiWg97Vm8pNG7AU8PyvNRtQ0ZOzz+l6KQpLFUe8bxseGqqQExjIdnezKp0OYVqcurlXr+NS7AB
	ui1SojwNG1MxiJbd3Jgu8esBqA0MuRBAkgMZn+fLKDZmWYxmeZJk9IBmeXZSUm7YnT8G1F4JuO8
	6NUM8DT+NfMnqIU20tDhRuLuk0O4g7prbhSXE61GsP5fsKcbOc9StPiM9Gz3wnveqnOHXGtdlKo
	n3UqkKv6ymJI7HmwwtHD9G8WLPw==
X-Google-Smtp-Source: AGHT+IGYvPF8a0ieyfCcXWkb9basvXu1C61BkUa+573NYbGt/torEkQigxWEXo3WPB2gMuuh/gndlw==
X-Received: by 2002:a17:902:ccc8:b0:234:8eeb:d809 with SMTP id d9443c01a7336-236426b57a5mr26776185ad.43.1749622990453;
        Tue, 10 Jun 2025 23:23:10 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603092677sm79976295ad.64.2025.06.10.23.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 23:23:09 -0700 (PDT)
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
Subject: [PATCH v5 02/23] dt-bindings: mailbox: Add bindings for RISC-V SBI MPXY extension
Date: Wed, 11 Jun 2025 11:52:17 +0530
Message-ID: <20250611062238.636753-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250611062238.636753-1-apatel@ventanamicro.com>
References: <20250611062238.636753-1-apatel@ventanamicro.com>
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
index 000000000000..061437a0b45a
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
+  [1] RISC-V Supervisor Binary Interface (SBI) v3.0 (or higher)
+      https://github.com/riscv-non-isa/riscv-sbi-doc/releases
+
+  [2] RISC-V Platform Management Interface (RPMI) v1.0 (or higher)
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

