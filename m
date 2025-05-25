Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 279781E493C
	for <linux-clk@vger.kernel.org>; Sun, 25 May 2025 08:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748162881; cv=none; b=K8qr4Lcn6BRa5I4Xxq3S6D1Kgdt5VKDoQ9tcNo701c04jk3bFDbKnZ65DO31rmMy/i5axYAls4+LRDJo+noS6k7r/Xy6i9Eh6R1COYaXqO7dJzotEHBsHBrYEvXcvrjLifvj8NDfTZUZxZQU7a3KI/te1HjBlsRlibe5XrhpXyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748162881; c=relaxed/simple;
	bh=fKLluswzTa56gHUFwQvXEf5D8fw4b1KiETn3nSG7kY0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ImwEQLJ6yIm7JygkiSEGWSD6jdWhomIVz5Db4zBnV2X2KD84lgGfaR+Tuc1iMB2sEcdywIBqrbjfjqWBSOcPEhuKJbq5mn8EtoGGNYv3iNCo0qfPsfkUX0VrWJsiXFYXgVNFGhj2tZlsQRXtXjQDnmE3XJu++ZOauoL7j+1lKiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=lm/tPMDp; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="lm/tPMDp"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7376dd56f8fso1321285b3a.2
        for <linux-clk@vger.kernel.org>; Sun, 25 May 2025 01:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1748162879; x=1748767679; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NxTPUwSNoQG9w3qR3LtIgBXvV+xInFFIHYJOltRLchg=;
        b=lm/tPMDpG3OWf/uwB+oJWLyWWuWVt5P2sytGLN4Rb7N4T7J8jpjd0Hwd967GoiUc8y
         aAYLeg7bgPTL5zm9k2rWTO+wDOodH3QfB1h1ZHcBMsAKW+kYR0cg14Dcjjy9Mc2v79un
         ZVFxD8Y4A1jx8Wo0W0D2ZAeQTXQ1LIaYD4pDS3yEgzMzHb43PBWSVNb5J5JUCw3sSrfM
         l71zCRSjhxlqU7z1in3JYr3MeaI3iiRaKMXKAPZw9zCg/T0MGHqaeIUGeH8HZRb1YXHH
         flDCJI2zLgT1MFgJkiIBr7t9UHttPq+Lc8ZmL9QFCqsmvUrXqU7Bigi+ObZRzAXB5hNv
         wjNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748162879; x=1748767679;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NxTPUwSNoQG9w3qR3LtIgBXvV+xInFFIHYJOltRLchg=;
        b=IxDcfnoWZvk3CcSmp8w6n5KHM8W+xmlvluUpiZno/h8yQZ2U7TZ1tWvFxtpWBwlvG/
         bJcPAjg/uHBCuBUEHXYpTF6DxzKv2ITi2bSxDT8vV+bZZ/5HbQnuZxU9IIChbY8wX4Bs
         pr7SuHthf/nN4Oop+8h6GwaVjHVPtIEYlqwVvbb016sqeg0qvn/yc7BQhXXrAb0FwYkb
         iH/yK16vbetgIX6cN+ZtaxxOAQXUPnVwJM+KTu4D/2/Pmk7BtogaonQH5DXV/Bb8gh/4
         /leqz/as54C5uZH6HdPyTqzUKUXhPW9mtwd62NCfKZCV4ice6JRbbFrXlbbknEjFGuss
         GZJg==
X-Forwarded-Encrypted: i=1; AJvYcCUbqRGxqetHSmyrcHR+gfltlBm3Wk2/85qeSyXIutfsQwKMD0Wk5C0DWIM4SYFVzUQI/ENQwwBMy80=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEV/+jU9gyMTFuRYYsjd1VKNJVhFAMW7Z7NuhmSWuA4iXRvNY/
	ZhRe3moXiB1ffNUoVlEXyQAuaHo+S3J0ECaMAq5TQbUKIe0YG4TtTo1aWxlQYrtVVqA=
X-Gm-Gg: ASbGncs2MqN3hWeH33f7wt8dm87hHqV3lwT/xmUljKNIvPxpuGUR0cKYxFuBsDbALsn
	ytNgflnjzzMqUtrxo+oYf/CFbJLmgiTwz3pGczte26eCP46lrZ5o48kKhuy2R84MGNLWWcMy8rs
	DV5M2F0BN29j7ylfBM9GHiN4SIKPgsQjeWq5MCW2ipRncPVBCLhhEiEILQZlFGVz5WH8i0r/tf8
	Vvl2gVijrVqig/tq2baXs73HRpoz298rgJHPNvcL8urBIM+01yqdGjO8o98aiq1NaydwR84pi3O
	0QMWqn2U/Au4zGs/1bgOMJW1z7vwEwAa9TzeJJYcmu1HE/AFeTOpXGOHZyfeJTE94BrWrykXMc4
	+LT/KLUoeHKfE66orx6Q=
X-Google-Smtp-Source: AGHT+IF6mcaEZWbA8iyluK8Fs5wPoJKNdBvm0onkyLBbi40FMwWBFWDsb1yc8bl3vzyCm+t/IpfIvQ==
X-Received: by 2002:a05:6a21:338b:b0:1f5:8e39:9470 with SMTP id adf61e73a8af0-2188c35309dmr9030985637.31.1748162879217;
        Sun, 25 May 2025 01:47:59 -0700 (PDT)
Received: from localhost.localdomain ([122.171.22.180])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eaf6dd83sm15250627a12.18.2025.05.25.01.47.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 01:47:58 -0700 (PDT)
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
Subject: [PATCH v4 04/23] RISC-V: Add defines for the SBI message proxy extension
Date: Sun, 25 May 2025 14:16:51 +0530
Message-ID: <20250525084710.1665648-5-apatel@ventanamicro.com>
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

Add defines for the new SBI message proxy extension which is part
of the SBI v3.0 specification.

Co-developed-by: Rahul Pathak <rpathak@ventanamicro.com>
Signed-off-by: Rahul Pathak <rpathak@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/sbi.h | 60 ++++++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 4dd6aafb8468..d295c26a7c26 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -35,6 +35,7 @@ enum sbi_ext_id {
 	SBI_EXT_DBCN = 0x4442434E,
 	SBI_EXT_STA = 0x535441,
 	SBI_EXT_NACL = 0x4E41434C,
+	SBI_EXT_MPXY = 0x4D505859,
 
 	/* Experimentals extensions must lie within this range */
 	SBI_EXT_EXPERIMENTAL_START = 0x08000000,
@@ -402,6 +403,65 @@ enum sbi_ext_nacl_feature {
 #define SBI_NACL_SHMEM_SRET_X(__i)		((__riscv_xlen / 8) * (__i))
 #define SBI_NACL_SHMEM_SRET_X_LAST		31
 
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
+/* Possible values of MSG_PROT_ID attribute */
+enum sbi_mpxy_msgproto_id {
+	SBI_MPXY_MSGPROTO_RPMI_ID = 0x0,
+};
+
+/** RPMI message protocol specific MPXY attributes */
+enum sbi_mpxy_rpmi_attribute_id {
+	SBI_MPXY_RPMI_ATTR_SERVICEGROUP_ID = SBI_MPXY_ATTR_MSGPROTO_ATTR_START,
+	SBI_MPXY_RPMI_ATTR_SERVICEGROUP_VERSION,
+	SBI_MPXY_RPMI_ATTR_MAX_ID,
+};
+
+/* Encoding of MSG_PROT_VER attribute */
+#define SBI_MPXY_MSG_PROT_VER_MAJOR(__ver)	(((__ver) >> 16) & 0xffff)
+#define SBI_MPXY_MSG_PROT_VER_MINOR(__ver)	((__ver) & 0xffff)
+#define SBI_MPXY_MSG_PROT_MKVER(__maj, __min)	(((__maj) << 16) | (__min))
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
-- 
2.43.0

