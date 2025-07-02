Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 559311FC7C5
	for <linux-clk@vger.kernel.org>; Wed,  2 Jul 2025 05:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751433271; cv=none; b=rmDCj7cgGHu0Ho777VVZif6cXl9UPmrmkR7QUjcXlqndoOwySGaPZiHRyq7Xm1R/1fDT+9xRx0UW0El1zim333iME9Pa06pXssUzgmLN4oduHI17tZDo236kmN0Nb5p96RdY6egudTn49htdIhb4cFQurG4MzNyLVzZcOdHO7lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751433271; c=relaxed/simple;
	bh=WhFOZeO6QPZYot9X8PgUO7X8WeF9pMZndeU1I3waGkg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tFsu5J46XsXVjlvBMbm7HEU+hb6GzdoUd0yrGJJKmxaEnjdyAIq6TxD8js+YFAakGQfxThbwKVczYWOTZfz04XrdEJatHt6oRbGeMAeJo7BdSasm1GhO/9+/MJJYfQ/BXMeuoSF2BsC5h6tq3PMy6JDJ3tOtZQFxL4NInDExD+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=dPKRXDaZ; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="dPKRXDaZ"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-234b9dfb842so36866915ad.1
        for <linux-clk@vger.kernel.org>; Tue, 01 Jul 2025 22:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751433270; x=1752038070; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/sxHWlmZntdYALz3N2e235Pk7qD/y6rLx7JLAfVbzfY=;
        b=dPKRXDaZhZgKu3RHThxsvzEhuNVWzqs1K4jFboGj1OOq8XV9/66cN/Er9hW4z/wZsH
         06NGXZcY02ZIFLCj39EKHdljk7OrtCDdfM9KMEcoZnSMURtrz0x2jxNz6kktcmZNgK0t
         5ce7PBNDXbxOs6SRZd+zcjN7XEmXmLhKFl2UvnZItjU/VlNYna2ekVHIGyw8LJSWBZ9K
         5+VnA0UckOMl181jfKKAERqGpz6LIrWqsit0hOSrc+JL0WMVb9nQYVCcOCOEaKP8IWQp
         mkCEiZ7YKOTkfGlkM5QQexcjKJEgwONGQxOV/I7xZXZyHFATkVbOuMvYmY8KRBuhVdPq
         0D/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751433270; x=1752038070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/sxHWlmZntdYALz3N2e235Pk7qD/y6rLx7JLAfVbzfY=;
        b=no+Tc7MyF21q9G8Y6SY5kaPwuStASuYDtg0iwKJJJ2lxj2BFMFnWKRmUd8LtNR6VTQ
         3adYO73dZM90Fi4pYQP7QaglHWL9tjFXqTNnc7dQXaoHx4dRjMQzsHLapZJyaPCr/LHr
         0RNRiVW64/6024Xxi7F1H7fkLHkKtbirTADUNvj0ECgfF8qSAv+m6ZJk6lhPlaR1nAQE
         UuvVYl7FaJFk50k3JGv1aDQZl2Vyi6Sxnz0RvK6OorTAexa24FIVPfkTzyArFDngRwez
         YQy6Mu17iMQBIQweYEzFdd0LPc0hkNfz3edTBorBJB1f0AFLwd+cwYZl99FcsQthTPEH
         o2Qw==
X-Forwarded-Encrypted: i=1; AJvYcCW68rvtUuStuN7qO4gSMAB64ZCvqEm22/KeiYWdM0m7SWnldCQj1WXuCEi692EVN/PnSyCIlM6x4p8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAyGDesaBi1JgsR1MOvy7PSI8q2lT/JR6dmFQFrEMi5wWGaw96
	S7m/6zcmwurawlbI37UWcQ2RDRkBHyBglck6tioLClAPHYqBD6Kp/WLenFnMFjp9lWE=
X-Gm-Gg: ASbGnct16a15Kfd9mCPi1fe3w5ztKjhlIpCtUTWQ0dGlrZ4HpI+2wXotfhFLRmZKTpK
	l7inXcLkZSo9pZFqQj6cRqheDkxgYKuqy35l4GP7tIv8ev03m0SsyLVstEBLLDwc7eZfAfcR1Cy
	/FUqOAmudnSKyJTFTN5/z5Li0pS6l46223SlhigVo1k9549R8JBFTos96oH/STZl1Re2KQb2Cg7
	Hw6h/jCfWS0SW+iI2coi9duQ5JIPeyZjRBzQb0pzWWMb30dxreRg/iOcDWJ3dKDAAAUSY7JSApw
	QHRIKApirbbLG+k/Eyt9ou0gX7Cj3RtUuP3Y1XNq4WyimGlLnQs/j6/yNWw8F3NMpq4E5cArQhv
	9mpUXZcqjbJ5Tmgjv
X-Google-Smtp-Source: AGHT+IHMGd/9qBl/omjJ5870DXltKh0wARVvx5nQ5ubBQ6cP0FDKJQIwjqOoR2ghmUNQi63Y0l8eoA==
X-Received: by 2002:a17:902:ced1:b0:231:c9bb:60fd with SMTP id d9443c01a7336-23c6e58accdmr22920115ad.33.1751433269504;
        Tue, 01 Jul 2025 22:14:29 -0700 (PDT)
Received: from localhost.localdomain ([14.141.91.70])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c6fe31933sm4719595ad.220.2025.07.01.22.14.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 22:14:29 -0700 (PDT)
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
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v7 03/24] RISC-V: Add defines for the SBI message proxy extension
Date: Wed,  2 Jul 2025 10:43:24 +0530
Message-ID: <20250702051345.1460497-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702051345.1460497-1-apatel@ventanamicro.com>
References: <20250702051345.1460497-1-apatel@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add defines for the new SBI message proxy extension which is part
of the SBI v3.0 specification.

Reviewed-by: Atish Patra <atishp@rivosinc.com>
Co-developed-by: Rahul Pathak <rpathak@ventanamicro.com>
Signed-off-by: Rahul Pathak <rpathak@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/sbi.h | 63 ++++++++++++++++++++++++++++++++++++
 include/linux/wordpart.h     |  8 +++++
 2 files changed, 71 insertions(+)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 341e74238aa0..59a7285ff956 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -10,6 +10,7 @@
 #include <linux/types.h>
 #include <linux/cpumask.h>
 #include <linux/jump_label.h>
+#include <linux/wordpart.h>
 
 #ifdef CONFIG_RISCV_SBI
 enum sbi_ext_id {
@@ -36,6 +37,7 @@ enum sbi_ext_id {
 	SBI_EXT_STA = 0x535441,
 	SBI_EXT_NACL = 0x4E41434C,
 	SBI_EXT_FWFT = 0x46574654,
+	SBI_EXT_MPXY = 0x4D505859,
 
 	/* Experimentals extensions must lie within this range */
 	SBI_EXT_EXPERIMENTAL_START = 0x08000000,
@@ -430,6 +432,67 @@ enum sbi_fwft_feature_t {
 
 #define SBI_FWFT_SET_FLAG_LOCK			BIT(0)
 
+enum sbi_ext_mpxy_fid {
+	SBI_EXT_MPXY_GET_SHMEM_SIZE,
+	SBI_EXT_MPXY_SET_SHMEM,
+	SBI_EXT_MPXY_GET_CHANNEL_IDS,
+	SBI_EXT_MPXY_READ_ATTRS,
+	SBI_EXT_MPXY_WRITE_ATTRS,
+	SBI_EXT_MPXY_SEND_MSG_WITH_RESP,
+	SBI_EXT_MPXY_SEND_MSG_WITHOUT_RESP,
+	SBI_EXT_MPXY_GET_NOTIFICATION_EVENTS
+};
+
+enum sbi_mpxy_attribute_id {
+	/* Standard channel attributes managed by MPXY framework */
+	SBI_MPXY_ATTR_MSG_PROT_ID		= 0x00000000,
+	SBI_MPXY_ATTR_MSG_PROT_VER		= 0x00000001,
+	SBI_MPXY_ATTR_MSG_MAX_LEN		= 0x00000002,
+	SBI_MPXY_ATTR_MSG_SEND_TIMEOUT		= 0x00000003,
+	SBI_MPXY_ATTR_MSG_COMPLETION_TIMEOUT	= 0x00000004,
+	SBI_MPXY_ATTR_CHANNEL_CAPABILITY	= 0x00000005,
+	SBI_MPXY_ATTR_SSE_EVENT_ID		= 0x00000006,
+	SBI_MPXY_ATTR_MSI_CONTROL		= 0x00000007,
+	SBI_MPXY_ATTR_MSI_ADDR_LO		= 0x00000008,
+	SBI_MPXY_ATTR_MSI_ADDR_HI		= 0x00000009,
+	SBI_MPXY_ATTR_MSI_DATA			= 0x0000000A,
+	SBI_MPXY_ATTR_EVENTS_STATE_CONTROL	= 0x0000000B,
+	SBI_MPXY_ATTR_STD_ATTR_MAX_IDX,
+	/*
+	 * Message protocol specific attributes, managed by
+	 * the message protocol specification.
+	 */
+	SBI_MPXY_ATTR_MSGPROTO_ATTR_START	= 0x80000000,
+	SBI_MPXY_ATTR_MSGPROTO_ATTR_END		= 0xffffffff
+};
+
+/* Possible values of MSG_PROT_ID attribute */
+enum sbi_mpxy_msgproto_id {
+	SBI_MPXY_MSGPROTO_RPMI_ID = 0x0
+};
+
+/* RPMI message protocol specific MPXY attributes */
+enum sbi_mpxy_rpmi_attribute_id {
+	SBI_MPXY_RPMI_ATTR_SERVICEGROUP_ID = SBI_MPXY_ATTR_MSGPROTO_ATTR_START,
+	SBI_MPXY_RPMI_ATTR_SERVICEGROUP_VERSION,
+	SBI_MPXY_RPMI_ATTR_IMPL_ID,
+	SBI_MPXY_RPMI_ATTR_IMPL_VERSION,
+	SBI_MPXY_RPMI_ATTR_MAX_ID
+};
+
+/* Encoding of MSG_PROT_VER attribute */
+#define SBI_MPXY_MSG_PROT_VER_MAJOR(__ver)	upper_16_bits(__ver)
+#define SBI_MPXY_MSG_PROT_VER_MINOR(__ver)	lower_16_bits(__ver)
+#define SBI_MPXY_MSG_PROT_MKVER(__maj, __min)	make_u32_from_two_u16(__maj, __min)
+
+/* Capabilities available through CHANNEL_CAPABILITY attribute */
+#define SBI_MPXY_CHAN_CAP_MSI			BIT(0)
+#define SBI_MPXY_CHAN_CAP_SSE			BIT(1)
+#define SBI_MPXY_CHAN_CAP_EVENTS_STATE		BIT(2)
+#define SBI_MPXY_CHAN_CAP_SEND_WITH_RESP	BIT(3)
+#define SBI_MPXY_CHAN_CAP_SEND_WITHOUT_RESP	BIT(4)
+#define SBI_MPXY_CHAN_CAP_GET_NOTIFICATIONS	BIT(5)
+
 /* SBI spec version fields */
 #define SBI_SPEC_VERSION_DEFAULT	0x1
 #define SBI_SPEC_VERSION_MAJOR_SHIFT	24
diff --git a/include/linux/wordpart.h b/include/linux/wordpart.h
index 5a7b97bb7c95..ed8717730037 100644
--- a/include/linux/wordpart.h
+++ b/include/linux/wordpart.h
@@ -31,6 +31,14 @@
  */
 #define lower_16_bits(n) ((u16)((n) & 0xffff))
 
+/**
+ * make_u32_from_two_u16 - return u32 number by combining
+ * two u16 numbers.
+ * @hi: upper 16 bit number
+ * @lo: lower 16 bit number
+ */
+#define make_u32_from_two_u16(hi, lo)	(((u32)(hi) << 16) | (u32)(lo))
+
 /**
  * REPEAT_BYTE - repeat the value @x multiple times as an unsigned long value
  * @x: value to repeat
-- 
2.43.0

