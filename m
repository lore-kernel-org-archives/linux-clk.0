Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F9C3253B42
	for <linux-clk@vger.kernel.org>; Mon, 28 Jul 2025 09:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753695691; cv=none; b=k1wYdyO4kZVbFGJPv+rmSoJOTaR3HGBsd3zicKm5i4DnmQl6GR6MddNMO2VqDPej9Xz+S/Ko6hwUrtGkz5QEBZhdH/YccqSbMYQbADbVY9Cyea5hwOX6Gb5YxRtN0GR9fwpXHqn389VCLqa0dxgbxobEOcnWaonONNuLvrUvhSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753695691; c=relaxed/simple;
	bh=twGbILBqHJSDdc9PqYErX7hC3c5EMu5fciFa6aeK+xs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HoFMFf7fM9Myoo49zLuXjcvI9Kh2a3NxRA5DGs/xzfVHPTJqxkRWzoZKy2efwNhnkUgQjQK9xI1tn95jbwJNWmrV5IK7zo4hcLjf8sYFIY2edckktIW6RV9enzMVvnFCZeZhEKX0lre5/nkY4YhNySHOGtwO59Y0XWTWSrGfq1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=W0nlU9kE; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="W0nlU9kE"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-31f017262d9so435418a91.1
        for <linux-clk@vger.kernel.org>; Mon, 28 Jul 2025 02:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1753695689; x=1754300489; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i7NWz24690I24vfVTDuJoYnj8j4L+1x62uPEQcGO8p0=;
        b=W0nlU9kExNdz30CAJckD+ZqxyyEB3pIjYjiliKif6s9hyCHUXJR9wcoVt/DyqT2Fkm
         5khAX+wJr//wr2VvZ8FdnSR+ktWel/NXXDi801RNjVc7/l4wP4PSaTbPe1MeVtHm5CYf
         +4yL4NKJ75fsF7//ufgB5r9oi31sor8vn2qEn4xJYEx3d5GW6gCucYfCkDt/pZW+aSYL
         38cOzQO9zULC7YH5mU6spQKFNsyuZhgLRzL+bsmctaPsyWZSNe7kIwtJDknisRqBRQIp
         TAPMB6cxitX07NyS/zLltMEIMuDvP+rPeuUP3LvlxE3mTBopVUM7wKcxm6SlNJ1t73Wm
         v6VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753695689; x=1754300489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i7NWz24690I24vfVTDuJoYnj8j4L+1x62uPEQcGO8p0=;
        b=vrsaQlc3iTS8YlFWV627Rmn6fLnXlFaFldo0Rh0rMkfyPzQRqkS8nac4DWgBD0MyrE
         QZJIc54ANF4Op2KfL0P0B0HvEKOCwljwuFNOxWNVvNNb0g8UEpS7OXZ0h4Rf1NketDAv
         f3U7/7TjK+GbV165zd/JGJ1aHVWEiIdb8Eb1GARt/r+3seaQdP3IyU55pKqjYOHZkuzX
         KB79UQZoUFkarL1yqeJxXO49jnHc1IfGff0bv6ZuzI7MFF7D6RZ3uo9eID9/4Jkua+os
         YFpq9uP5lVG4rJFWk8XIwWtHmUaUG9L9RRQG4hcPWtXELFbs0Vx7nk/x2HkB6laBswX2
         BkYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXj6j51V/X8E1TCxbRp7lHdcCN76fkX0v2b4y1mvw1Cci7i01Cs30RxrG3gUTUD/7vVVwEdJC/SHU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4pX2bfaHa2TCed6tNoQgmZIonxq4+5WkSqCps2ibuhLNYxJhv
	DfuKZZPiN0yeRkOtU1pV5GU3jz+ZxS/glIOVMSWxG5s7tmc5vkz7bk7/Nfs008qU15c=
X-Gm-Gg: ASbGncseisJOrfwBCny/bMWr0ddi2sPFoLbu+DOF7u/PP+sT8lu7zcZubK26KNshi90
	Rf31EsNBzMyH9fw8UM2VjFmT4wvlS5V91ALXeBnEeinGocpGwtfP/uAEmI0BHtk9wveJlvuDv4J
	ZOBDz1CdygCWmGshMQ7z4qO6oZmdfK/03TDICLJJGSD3z20G/jMMa1wnl/xPBTG6esUKlVzp33d
	i9wpGCIcw+ocUwJAULBdDAdbyyGsP3AdRBMoy9ABsr1xopE0knurmRDtHWIpYzi7lPmsYxgzaor
	DC+fygqdy8npIz6B8N75R92nXW37e3fp5/5epRDuaxLc4VnClN1yj2+js4YOMHdOxkqiPbysM6x
	nTplS3WZhp5II4CJe4jds4G63j2hoB8LQpWGxvKYny8/VlzDlQrritKwB+7wA
X-Google-Smtp-Source: AGHT+IGHvXUp0klG2IZgTeZspvgsTkBclEVSkU6fmBMU5iF93kVQ+B6MpF1hlObdmg0SKveb59e7Hg==
X-Received: by 2002:a17:90b:1650:b0:313:20d2:c99b with SMTP id 98e67ed59e1d1-31e7787c856mr15209245a91.9.1753695688442;
        Mon, 28 Jul 2025 02:41:28 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([122.171.19.28])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31e832fbf99sm5396230a91.1.2025.07.28.02.41.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 02:41:27 -0700 (PDT)
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
Subject: [PATCH v9 03/24] RISC-V: Add defines for the SBI message proxy extension
Date: Mon, 28 Jul 2025 15:10:11 +0530
Message-ID: <20250728094032.63545-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250728094032.63545-1-apatel@ventanamicro.com>
References: <20250728094032.63545-1-apatel@ventanamicro.com>
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
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Co-developed-by: Rahul Pathak <rpathak@ventanamicro.com>
Signed-off-by: Rahul Pathak <rpathak@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/sbi.h | 63 ++++++++++++++++++++++++++++++++++++
 include/linux/wordpart.h     |  8 +++++
 2 files changed, 71 insertions(+)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 341e74238aa0..22f6e70cd32e 100644
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
+	SBI_EXT_MPXY_GET_NOTIFICATION_EVENTS,
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
+/* Possible values of MSG_PROT_ID attribute as-per SBI v3.0 (or higher) */
+enum sbi_mpxy_msgproto_id {
+	SBI_MPXY_MSGPROTO_RPMI_ID = 0x0,
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

