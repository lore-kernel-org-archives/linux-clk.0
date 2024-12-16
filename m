Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 112582010E1
	for <linux-clk@vger.kernel.org>; Mon, 16 Dec 2024 08:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734338938; cv=none; b=AgSdw0R3sdZj3KZODCnJ6/91gQgiYZyMa8dMYxDW75XO1ISxc6WFKwwdQFICieZ/09DBQLBi/Nwonz2Q08Uo+JjaOp8Une5j5MTRpnjFIDqlL2baW8n9o2HzY0ADIcDxG87fugiYVtrgh4sOu+sJk2Pp+p8vZE0GIw7gBwKuU54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734338938; c=relaxed/simple;
	bh=43icYDitKGAJFCQcQUQh+xigsEvTJRoq6tVP0e8YBXg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KBC4dPMVNUOPxZ7TpLTamWIZ59DhfnR+zPmnxUwqokDd+fcx+tDYFxZkmBBFuQWUoYV4zLAbLs6Tj2WnxuDF1t1Zk5QE4675gBEsuIhgCrtYe6IINNYMmSbDBjUVpowcvXX27yqILrcWq/+Hk4Ya4gtaYtSLwto279dsf5trFAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=czk9nM6j; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="czk9nM6j"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-21644e6140cso35495265ad.1
        for <linux-clk@vger.kernel.org>; Mon, 16 Dec 2024 00:48:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1734338936; x=1734943736; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tTubMU2kWF4VQtI7+afjrAi0Qg8VFM9pvYCuyyQx/90=;
        b=czk9nM6jwQ7mbHLJcOt306xGlayywp+cwTu66eAkox2nv2tMeVaEFEaKt6UdzZVxN7
         zEl2heWSX/GsoA6HLLKihPPqOWDNmbG9c9b+NC8B8dPkt2EfFwI8NbpGTTK9qSA3S24I
         g4aEl9Pci3ko13gwdZY7fhFks1SZ5AV2UKKoKfRwQmfKObreF4hH0pSg4TTa1okHdNQW
         ngbDDz+xqQ5lq8I4IuKHQnN9mXe+0vx5bBQpG03M+19kHf2D7xJJ6mffIPIYFzq1BpqR
         ns/C0/wzt9x2nXLfu1j6vmOn8MGwTbEfWbpig3WaTDTNAqx5TUfez10qUL9+22oloXko
         pCsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734338936; x=1734943736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tTubMU2kWF4VQtI7+afjrAi0Qg8VFM9pvYCuyyQx/90=;
        b=mJlUVKRs8Jp2r6zh21YEKFHtQR5hQQvpTDLD7gZxUGpDJmr4TBuJjINyXBgZMXkEOa
         4T+YaqvG5m254C2nxts53Xc+ZpDQ4JY2e1NMOwFMJB28XKPJkLjsWLI0tIas/+hKXp+s
         z/p5tUQiTjowJfHGT3zRSufnpCg3lPdLxXLPotHbkLtg1Ho2km/iX5F5R7RnywHJiCsY
         U11oufhKsnMMmfQcb5MOPeF/F9D68gw3GjqJEW9rmPXB5QOv+a2U0PWc5agmBts5SceS
         l0rr2MArHCVB5MMWXb+csON0ZpQw+HPE8P3+zpa3Xt/0iTod8BOKFdDd55XcJmg3NCVL
         pL/g==
X-Forwarded-Encrypted: i=1; AJvYcCUv5yAlUfgBYrEBK2nIEkNKGKeDN79KAGLqZ4UMFVIXC/CzUycvCr+AAG4iAN+A5v92z28euj2Yx3g=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQZ93YwRSCYkR9wuNt8XHJhWlYL1cFvCoR99folr1631tUYXLe
	OeYgZQy7eBWtjYtnGtd8VUcHeH9cY/jaGLLmhI4y/BgsgQkRzkfkXuvEeXK4SPA=
X-Gm-Gg: ASbGnculmBrL0yZITDLFX/+TYZgHgl83sNLZsSg0Qi8BcUWcShNRrCCYdrSGUWDoxFX
	B7n77kFwPt70Fk/BeQ96cUMy0Vi44H0Vw7PIYjGpiks7UrbQIhcLPJ6fyREHAiNgatF5rAPbU/y
	aOa/f2qo6J0rbzMkAfCrDN2VVKiZXExxl2uosM+6ohNL3nLBtra7FBymL66aNCNkkllmWigdPyV
	aEq6b+8iMrFIlJsDjB6yo9NeESeZ12EpDnSGLh9nwnFB3js7hGt9GqLv7ih4wtjc46JN9n3DU7R
	cionnhtmk+VQLrM=
X-Google-Smtp-Source: AGHT+IHpuJTFzeEhjSiGdehFNiKlPC/zQ57iedGa+8ilj9RzYBUBHeCW2l8Z59j6jtt7ugE/4lqbMg==
X-Received: by 2002:a17:902:ec90:b0:215:75a5:f72b with SMTP id d9443c01a7336-21892aed1eemr161821665ad.53.1734338936193;
        Mon, 16 Dec 2024 00:48:56 -0800 (PST)
Received: from localhost.localdomain ([223.185.130.105])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-218a1e501d0sm37711495ad.116.2024.12.16.00.48.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 00:48:55 -0800 (PST)
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
Subject: [RFC PATCH 4/8] RISC-V: Add defines for the SBI message proxy extension
Date: Mon, 16 Dec 2024 14:18:13 +0530
Message-ID: <20241216084817.373131-5-apatel@ventanamicro.com>
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

Add defines for the new SBI message proxy extension which is part
of the SBI v3.0 specification.

Co-developed-by: Rahul Pathak <rpathak@ventanamicro.com>
Signed-off-by: Rahul Pathak <rpathak@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/sbi.h | 59 ++++++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index bc35ad750e28..18817efba430 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -35,6 +35,7 @@ enum sbi_ext_id {
 	SBI_EXT_DBCN = 0x4442434E,
 	SBI_EXT_STA = 0x535441,
 	SBI_EXT_NACL = 0x4E41434C,
+	SBI_EXT_MPXY = 0x4D505859,
 
 	/* Experimentals extensions must lie within this range */
 	SBI_EXT_EXPERIMENTAL_START = 0x08000000,
@@ -401,6 +402,64 @@ enum sbi_ext_nacl_feature {
 #define SBI_NACL_SHMEM_SRET_X(__i)		((__riscv_xlen / 8) * (__i))
 #define SBI_NACL_SHMEM_SRET_X_LAST		31
 
+enum sbi_ext_mpxy_fid {
+	SBI_EXT_MPXY_SET_SHMEM,
+	SBI_EXT_MPXY_GET_CHANNEL_IDS,
+	SBI_EXT_MPXY_READ_ATTRS,
+	SBI_EXT_MPXY_WRITE_ATTRS,
+	SBI_EXT_MPXY_SEND_MSG_WITH_RESP,
+	SBI_EXT_MPXY_SEND_MSG_NO_RESP,
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

